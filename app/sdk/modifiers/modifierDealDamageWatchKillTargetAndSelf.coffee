EVENTS = require 'app/common/event_types'
Modifier = require './modifier'
AttackAction = require 'app/sdk/actions/attackAction'
CardType = require 'app/sdk/cards/cardType'
ModifierDealDamageWatch = require './modifierDealDamageWatch'
KillAction = require 'app/sdk/actions/killAction'

class ModifierDealDamageWatchKillTargetAndSelf extends ModifierDealDamageWatch

  type:"ModifierDealDamageWatchKillTargetAndSelf"
  @type:"ModifierDealDamageWatchKillTargetAndSelf"

  @modifierName:"Clumsy Assassin"
  @description:"Whenever this unit deals damage to an enemy minion, destroy itself and the enemy minion"

  fxResource: ["FX.Modifiers.ModifierDealDamageWatch", "FX.Modifiers.ModifierGenericKill"]

  onEvent: (event) ->
    super(event)

    if @_private.listeningToEvents
      if event.type == EVENTS.entities_involved_in_attack
        @onEntitiesInvolvedInAttack(event)

  getIsActionRelevant: (a) ->
    # kill the target as long as it isn't a general
    return super(a) and !(a.getTarget()?.getIsGeneral())

  onDealDamage: (action) ->
    target = action.getTarget()

    # kill target
    killAction = new KillAction(@getGameSession())
    killAction.setOwnerId(@getCard().getOwnerId())
    killAction.setSource(@getCard())
    killAction.setTarget(target)
    @getGameSession().executeAction(killAction)

    # kill self
    killAction = new KillAction(@getGameSession())
    killAction.setOwnerId(@getCard().getOwnerId())
    killAction.setSource(@getCard())
    killAction.setTarget(@getCard())
    @getGameSession().executeAction(killAction)

  onEntitiesInvolvedInAttack: (actionEvent) ->
    a = actionEvent.action
    if @getIsActive() and @getIsActionRelevant(a)
      # kill target
      killAction = new KillAction(@getGameSession())
      killAction.setOwnerId(@getCard().getOwnerId())
      killAction.setSource(@getCard())
      killAction.setTarget(target)
      actionEvent.actions.push(killAction)

      # kill self
      killAction = new KillAction(@getGameSession())
      killAction.setOwnerId(@getCard().getOwnerId())
      killAction.setSource(@getCard())
      killAction.setTarget(@getCard())
      actionEvent.actions.push(killAction)

module.exports = ModifierDealDamageWatchKillTargetAndSelf
