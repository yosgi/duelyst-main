CONFIG = require 'app/common/config'
UtilsGameSession = require 'app/common/utils/utils_game_session'
ModifierDyingWish =   require './modifierDyingWish'
PlayCardSilentlyAction = require 'app/sdk/actions/playCardSilentlyAction'
Races = require 'app/sdk/cards/racesLookup'
GameFormat = require 'app/sdk/gameFormat'
_ = require 'underscore'

class ModifierDyingWishSpawnTribal extends ModifierDyingWish

  type:"ModifierDyingWishSpawnTribal"
  @type:"ModifierDyingWishSpawnTribal"

  @description: "Summon a random Tribal nearby"

  fxResource: ["FX.Modifiers.ModifierDyingWish", "FX.Modifiers.ModifierGenericSpawn"]

  onDyingWish: () ->
    super()

    if @getGameSession().getIsRunningAsAuthoritative()
      tribalCards = []
      for race in _.filter(_.chain(Races).values().uniq().value(), (val) -> return val != Races.Neutral)
        if @getGameSession().getGameFormat() is GameFormat.Standard
          tribalCards = tribalCards.concat(@getGameSession().getCardCaches().getIsLegacy(false).getRace(race).getIsToken(false).getIsHiddenInCollection(false).getIsPrismatic(false).getIsSkinned(false).getCards())
        else
          tribalCards = tribalCards.concat(@getGameSession().getCardCaches().getRace(race).getIsToken(false).getIsHiddenInCollection(false).getIsPrismatic(false).getIsSkinned(false).getCards())
      if tribalCards.length > 0
        tribalCard = tribalCards[@getGameSession().getRandomIntegerForExecution(tribalCards.length)]
        cardData = tribalCard.createNewCardData()
        card = @getGameSession().getExistingCardFromIndexOrCreateCardFromData(cardData)
        spawnLocations = []
        validSpawnLocations = UtilsGameSession.getSmartSpawnPositionsFromPattern(@getGameSession(), @getCard().getPosition(), CONFIG.PATTERN_3x3, card)
        if validSpawnLocations.length > 0
          spawnLocations.push(validSpawnLocations.splice(@getGameSession().getRandomIntegerForExecution(validSpawnLocations.length), 1)[0])

        for position in spawnLocations
          playCardAction = new PlayCardSilentlyAction(@getGameSession(), @getCard().getOwnerId(), position.x, position.y, card)
          playCardAction.setSource(@getCard())
          @getGameSession().executeAction(playCardAction)

module.exports = ModifierDyingWishSpawnTribal
