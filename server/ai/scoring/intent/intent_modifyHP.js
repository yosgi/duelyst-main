const _ = require('underscore');
const CardIntent = require('../../card_intent/card_intent');
const CardIntentType = require('../../card_intent/card_intent_type');
const CardPhaseType = require('../../card_intent/card_phase_type');
const CardTargetType = require('../../card_intent/card_target_type');
const ScoreForModifyHP = require('../base/modify_hp');
const willUnitSurviveCard = require('../utils/utils_willUnitSurviveCard');

/**
 * Returns the score for the damage dealt to a target card by a card.
 * @param {Card} card
 * @param {Object} intent
 * @param {Card} targetCard
 * @returns {Number}
 * @static
 * @public
 */
const getScoreForModifyHPFromCardWithIntentToCard = function (card, intent, targetCard) {
  let score = 0;
  if (targetCard != null) {
    const amount = intent.amount || 0;
    const rebase = intent.amountIsRebase || false;
    if (card.getIsSameTeamAs(targetCard)) {
      // add score for ModifyHPing cards
      score += ScoreForModifyHP(card, targetCard, amount, rebase);
    } else {
      // subtract score for enemy ModifyHPing cards
      score -= ScoreForModifyHP(card, targetCard, amount, rebase);
    }
  }
  return score;
};

/**
 * Returns the modify mana score for cards in hand
 * @param {Card} card
 * @param {Vec2} targetPosition
 * @param {Array} [cardIntents=null] forced card intents (won't use card's own card intents)
 * @returns {Number}
 * @static
 * @public
 */
const ScoreForIntentModifyHP = function (card, targetPosition, cardIntents) {
  let score = 0;
  const cardId = card.getBaseCardId();
  const validIntents = cardIntents != null ? CardIntent.filterIntentsByIntentType(cardIntents, CardIntentType.ModifyHP) : CardIntent.getIntentsByIntentType(cardId, CardIntentType.ModifyHP);

  _.each(validIntents, (intent) => {
    const cards = CardIntent.getCardsTargetedByCardWithIntent(card, intent, targetPosition);
    for (let i = 0, il = cards.length; i < il; i++) {
      if (willUnitSurviveCard(cards[i], card)) {
        score += getScoreForModifyHPFromCardWithIntentToCard(card, intent, cards[i]);
      }
    }
  });

  return score;
};

module.exports = ScoreForIntentModifyHP;
