CONFIG = require 'app/common/config'
UtilsGameSession = require 'app/common/utils/utils_game_session'
UtilsPosition = require 'app/common/utils/utils_position'
ModifierReplaceWatch = require './modifierReplaceWatch'
CardType = require 'app/sdk/cards/cardType'
PlayCardSilentlyAction = require 'app/sdk/actions/playCardSilentlyAction'
PlayCardAction = require 'app/sdk/actions/playCardAction'

class ModifierReplaceWatchSpawnEntity extends ModifierReplaceWatch

  type:"ModifierReplaceWatchSpawnEntity"
  @type:"ModifierReplaceWatchSpawnEntity"

  @description: "Whenever you replace a card, summon %X"

  cardDataOrIndexToSpawn: null

  fxResource: ["FX.Modifiers.ModifierOpeningGambit", "FX.Modifiers.ModifierGenericSpawn"]

  @createContextObject: (cardDataOrIndexToSpawn, spawnDescription = "", spawnCount=1, spawnPattern=CONFIG.PATTERN_1x1, spawnSilently=true,options) ->
    contextObject = super(options)
    contextObject.cardDataOrIndexToSpawn = cardDataOrIndexToSpawn
    contextObject.spawnDescription = spawnDescription
    contextObject.spawnCount = spawnCount
    contextObject.spawnPattern = spawnPattern
    contextObject.spawnSilently = spawnSilently
    return contextObject

  @getDescription: (modifierContextObject) ->
    if modifierContextObject
      replaceText = ""
      if UtilsPosition.getArraysOfPositionsAreEqual(modifierContextObject.spawnPattern, CONFIG.PATTERN_1x1)
        replaceText = "a "+modifierContextObject.spawnDescription+" in its place"
      else if modifierContextObject.spawnCount == 1
        replaceText = "a "+modifierContextObject.spawnDescription+" nearby"
      else if modifierContextObject.spawnCount == 8
        replaceText = ""+modifierContextObject.spawnDescription+"s in all nearby spaces"
      else
        replaceText = ""+modifierContextObject.spawnDescription+"s into "+modifierContextObject.spawnCount+" nearby spaces"
      return @description.replace /%X/, replaceText
    else
      return @description

  onReplaceWatch: () ->
    super()

    if @getGameSession().getIsRunningAsAuthoritative()
      card = @getGameSession().getExistingCardFromIndexOrCachedCardFromData(@cardDataOrIndexToSpawn)
      spawnLocations = []
      validSpawnLocations = UtilsGameSession.getSmartSpawnPositionsFromPattern(@getGameSession(), @getCard().getPosition(), @spawnPattern, card)
      for i in [0...@spawnCount]
        if validSpawnLocations.length > 0
          spawnLocations.push(validSpawnLocations.splice(@getGameSession().getRandomIntegerForExecution(validSpawnLocations.length), 1)[0])

      for position in spawnLocations
        if !@spawnSilently
          playCardAction = new PlayCardAction(@getGameSession(), @getCard().getOwnerId(), position.x, position.y, @cardDataOrIndexToSpawn)
        else
          playCardAction = new PlayCardSilentlyAction(@getGameSession(), @getCard().getOwnerId(), position.x, position.y, @cardDataOrIndexToSpawn)
        playCardAction.setSource(@getCard())
        @getGameSession().executeAction(playCardAction)

module.exports = ModifierReplaceWatchSpawnEntity
