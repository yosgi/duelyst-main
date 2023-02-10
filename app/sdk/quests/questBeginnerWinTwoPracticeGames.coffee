QuestBeginner = require './questBeginner'
QuestType = require './questTypeLookup'
UtilsGameSession = require 'app/common/utils/utils_game_session'
GameType = require 'app/sdk/gameType'
Logger = require 'app/common/logger'
i18next = require 'i18next'

class QuestBeginnerWinTwoPracticeGames extends QuestBeginner
  @Identifier: 9909

  constructor:()->
    super(QuestBeginnerWinTwoPracticeGames.Identifier,i18next.t("quests.quest_beginner_win_practice_games_title_plural",{count:2}),[QuestType.Beginner],@.goldReward)
    @params["completionProgress"] = 2

  _progressForGameDataForPlayerId:(gameData,playerId)->
    for player in gameData.players
      playerSetupData = UtilsGameSession.getPlayerSetupDataForPlayerId(gameData, player.playerId)
      Logger.module("Quests").debug "QuestBeginnerWinTwoPracticeGames checking #{player.playerId} game type #{playerSetupData.gameType} winner: #{player.isWinner}"
      if player.playerId == playerId and player.isWinner and gameData.gameType == GameType.SinglePlayer
        return 1
    return 0

  getDescription:()->
    return i18next.t("quests.quest_beginner_win_practice_games_description_plural",{count:@params["completionProgress"]})

module.exports = QuestBeginnerWinTwoPracticeGames
