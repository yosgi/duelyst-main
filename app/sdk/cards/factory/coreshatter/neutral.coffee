# do not add this file to a package
# it is specifically parsed by the package generation script

_ = require 'underscore'
moment = require 'moment'

Logger = require 'app/common/logger'

CONFIG = require('app/common/config')
RSX = require('app/data/resources')

Card = require 'app/sdk/cards/card'
Cards = require 'app/sdk/cards/cardsLookupComplete'
CardType = require 'app/sdk/cards/cardType'
Factions = require 'app/sdk/cards/factionsLookup'
FactionFactory = require 'app/sdk/cards/factionFactory'
Races = require 'app/sdk/cards/racesLookup'
Rarity = require 'app/sdk/cards/rarityLookup'
Unit = require 'app/sdk/entities/unit'
CardSet = require 'app/sdk/cards/cardSetLookup'
Artifact = require 'app/sdk/artifacts/artifact'

SpellFilterType = require 'app/sdk/spells/spellFilterType'
SpellHealYourGeneral = require 'app/sdk/spells/spellHealYourGeneral'

Modifier = require 'app/sdk/modifiers/modifier'
ModifierEnemySpellWatchHealMyGeneral = require 'app/sdk/modifiers/modifierEnemySpellWatchHealMyGeneral'
ModifierFirstBlood = require 'app/sdk/modifiers/modifierFirstBlood'
ModifierReplaceWatchApplyModifiersToReplaced = require 'app/sdk/modifiers/modifierReplaceWatchApplyModifiersToReplaced'
ModifierManaCostChange = require 'app/sdk/modifiers/modifierManaCostChange'
ModifierDyingWishDamageGeneral = require 'app/sdk/modifiers/modifierDyingWishDamageGeneral'
ModifierStartsInHand = require 'app/sdk/modifiers/modifierStartsInHand'
ModifierAirdrop = require 'app/sdk/modifiers/modifierAirdrop'
ModifierIntensifyDamageNearby = require 'app/sdk/modifiers/modifierIntensifyDamageNearby'
ModifierReplaceWatchShuffleCardIntoDeck = require 'app/sdk/modifiers/modifierReplaceWatchShuffleCardIntoDeck'
ModifierEndTurnWatchAnyPlayerPullRandomUnits = require 'app/sdk/modifiers/modifierEndTurnWatchAnyPlayerPullRandomUnits'
ModifierOpponentSummonWatchSummonMinionInFront = require 'app/sdk/modifiers/modifierOpponentSummonWatchSummonMinionInFront'
ModifierProvoke = require 'app/sdk/modifiers/modifierProvoke'
ModifierEndTurnWatchGainLastSpellPlayedThisTurn = require 'app/sdk/modifiers/modifierEndTurnWatchGainLastSpellPlayedThisTurn'
ModifierOnSummonFromHandApplyEmblems = require 'app/sdk/modifiers/modifierOnSummonFromHandApplyEmblems'
ModifierSummonWatchBurnOpponentCards = require 'app/sdk/modifiers/modifierSummonWatchBurnOpponentCards'
ModifierKillWatchAndSurviveScarzig = require 'app/sdk/modifiers/modifierKillWatchAndSurviveScarzig'
ModifierForcefield = require 'app/sdk/modifiers/modifierForcefield'
ModifierFateSingleton = require 'app/sdk/modifiers/modifierFateSingleton'
ModifierCannotBeReplaced = require 'app/sdk/modifiers/modifierCannotBeReplaced'
ModifierToken = require 'app/sdk/modifiers/modifierToken'
ModifierTokenCreator = require 'app/sdk/modifiers/modifierTokenCreator'
ModifierTranscendance = require 'app/sdk/modifiers/modifierTranscendance'
ModifierMyAttackWatchApplyModifiersToAllies = require 'app/sdk/modifiers/modifierMyAttackWatchApplyModifiersToAllies'
ModifierOpeningGambit = require 'app/sdk/modifiers/modifierOpeningGambit'
ModifierOpeningGambitTransformHandIntoLegendaries = require 'app/sdk/modifiers/modifierOpeningGambitTransformHandIntoLegendaries'
ModifierEndTurnWatchAnyPlayerHsuku = require 'app/sdk/modifiers/modifierEndTurnWatchAnyPlayerHsuku'
ModifierIntensify = require 'app/sdk/modifiers/modifierIntensify'
ModifierCounterIntensify = require 'app/sdk/modifiers/modifierCounterIntensify'
ModifierCannotBeRemovedFromHand = require 'app/sdk/modifiers/modifierCannotBeRemovedFromHand'
ModifierQuestBuffNeutral = require 'app/sdk/modifiers/modifierQuestBuffNeutral'

PlayerModifierEmblemSummonWatchSingletonQuest = require 'app/sdk/playerModifiers/playerModifierEmblemSummonWatchSingletonQuest'

i18next = require 'i18next'
if i18next.t() is undefined
  i18next.t = (text) ->
    return text

class CardFactory_CoreshatterSet_Neutral

  ###*
   * Returns a card that matches the identifier.
   * @param {Number|String} identifier
   * @param {GameSession} gameSession
   * @returns {Card}
   ###
  @cardForIdentifier: (identifier,gameSession) ->
    card = null

    if (identifier == Cards.Neutral.Singleton)
      card = new Unit(gameSession)
      card.factionId = Factions.Neutral
      card.setCardSetId(CardSet.Coreshatter)
      card.name = "王座流浪者"
      card.setDescription("审判：牌组中没有重复的牌。\n目标：你的仆从拥有+1/+1。")
      card.atk = 6
      card.maxHP = 6
      card.manaCost = 6
      card.rarityId = Rarity.Mythron
      buffContextObject = ModifierQuestBuffNeutral.createContextObjectWithAttributeBuffs(1,1)
      buffContextObject.appliedName = "流浪者"
      emblemModifier = PlayerModifierEmblemSummonWatchSingletonQuest.createContextObject([buffContextObject])
      emblemModifier.appliedName = "王座之路"
      emblemModifier.appliedDescription = "你的仆从拥有+1/+1。"
      card.setInherentModifiersContextObjects([
        ModifierStartsInHand.createContextObject(),
        ModifierCannotBeReplaced.createContextObject(),
        ModifierOnSummonFromHandApplyEmblems.createContextObject([emblemModifier], true, false),
        ModifierFateSingleton.createContextObject(),
        ModifierCannotBeRemovedFromHand.createContextObject()
      ])
      card.setFXResource(["FX.Cards.Neutral.Purgatos"])
      card.setBoundingBoxWidth(85)
      card.setBoundingBoxHeight(115)
      card.setBaseSoundResource(
        apply : RSX.sfx_ui_booster_packexplode.audio
        walk : RSX.sfx_singe2.audio
        attack : RSX.sfx_neutral_dancingblades_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_dancingblades_hit.audio
        attackDamage : RSX.sfx_neutral_golemdragonbone_impact.audio
        death : RSX.sfx_neutral_golemdragonbone_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralSingletonBreathing.name
        idle : RSX.neutralSingletonIdle.name
        walk : RSX.neutralSingletonRun.name
        attack : RSX.neutralSingletonAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.2
        damage : RSX.neutralSingletonHit.name
        death : RSX.neutralSingletonDeath.name
      )

    if (identifier == Cards.Neutral.DuplicatorShuffler)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Neutral
      card.name = "多重镜像"
      card.setDescription("开场触发: 将三个友方仆从复制随机放入你的地块。")
      card.atk = 2
      card.maxHP = 1
      card.manaCost = 1
      card.rarityId = Rarity.Common
      card.setFollowups([
        {
          id: Cards.Spell.SpellDuplicator
          spellFilterType: SpellFilterType.AllyDirect
          canTargetGeneral: false
          _private: {
            followupSourcePattern: CONFIG.PATTERN_WHOLE_BOARD
          }
        }
      ])
      card.addKeywordClassToInclude(ModifierOpeningGambit)
      card.setFXResource(["FX.Cards.Neutral.ProphetWhitePalm"])
      card.setBoundingBoxWidth(55)
      card.setBoundingBoxHeight(115)
      card.setBaseSoundResource(
        apply : RSX.sfx_neutral_ubo_attack_swing.audio
        walk : RSX.sfx_neutral_ubo_attack_swing.audio
        attack : RSX.sfx_neutral_prophetofthewhite_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_prophetofthewhite_hit.audio
        attackDamage : RSX.sfx_neutral_prophetofthewhite_impact.audio
        death : RSX.sfx_neutral_prophetofthewhite_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralMirrormancerBreathing.name
        idle : RSX.neutralMirrormancerIdle.name
        walk : RSX.neutralMirrormancerRun.name
        attack : RSX.neutralMirrormancerAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.0
        damage : RSX.neutralMirrormancerHit.name
        death : RSX.neutralMirrormancerDeath.name
      )

    if (identifier == Cards.Neutral.AerOwlblade)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Neutral
      card.name = "普里德贝克气体"
      card.setDescription("每当你的对手施法时，为你的英雄恢复1点生命值。")
      card.atk = 3
      card.maxHP = 4
      card.manaCost = 3
      card.rarityId = Rarity.Common
      card.setInherentModifiersContextObjects([
        ModifierEnemySpellWatchHealMyGeneral.createContextObject(1)
      ])
      card.setFXResource(["FX.Cards.Neutral.WindStopper"])
      card.setBaseSoundResource(
        apply : RSX.sfx_unit_deploy.audio
        walk : RSX.sfx_singe2.audio
        attack : RSX.sfx_neutral_shieldoracle_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_shieldoracle_hit.audio
        attackDamage : RSX.sfx_neutral_shieldoracle_attack_impact.audio
        death : RSX.sfx_neutral_shieldoracle_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralAerBreathing.name
        idle : RSX.neutralAerIdle.name
        walk : RSX.neutralAerRun.name
        attack : RSX.neutralAerAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 0.6
        damage : RSX.neutralAerHit.name
        death : RSX.neutralAerDeath.name
      )

    if (identifier == Cards.Neutral.BigRush)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Neutral
      card.name = "萨贝阿尔法"
      card.setDescription("Rush")
      card.atk = 5
      card.maxHP = 5
      card.manaCost = 7
      card.rarityId = Rarity.Common
      card.setInherentModifiersContextObjects([ModifierFirstBlood.createContextObject()])
      card.setFXResource(["FX.Cards.Neutral.FirstSwordofAkrane"])
      card.setBaseSoundResource(
        apply : RSX.sfx_unit_deploy_3.audio
        walk : RSX.sfx_singe2.audio
        attack : RSX.sfx_f1_sunriser_attack_swing.audio
        receiveDamage : RSX.sfx_f1_sunriser_hit_noimpact.audio
        attackDamage : RSX.sfx_f1_sunriser_attack_impact.audio
        death : RSX.sfx_neutral_dancingblades_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralElderSaberspineBreathing.name
        idle : RSX.neutralElderSaberspineIdle.name
        walk : RSX.neutralElderSaberspineRun.name
        attack : RSX.neutralElderSaberspineAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 0.9
        damage : RSX.neutralElderSaberspineHit.name
        death : RSX.neutralElderSaberspineDeath.name
      )

    if (identifier == Cards.Neutral.MoonlightSorcerer)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Neutral
      card.name = "阿尔金逃亡者"
      card.setDescription("在你施法的任何回合结束时，将最近施法的复制放入你的动作栏。")
      card.atk = 2
      card.maxHP = 5
      card.manaCost = 5
      card.rarityId = Rarity.Legendary
      card.raceId = Races.Arcanyst
      card.setInherentModifiersContextObjects([
        ModifierEndTurnWatchGainLastSpellPlayedThisTurn.createContextObject()
      ])
      card.setFXResource(["FX.Cards.Neutral.Necroseer"])
      card.setBaseSoundResource(
        apply : RSX.sfx_unit_deploy.audio
        walk : RSX.sfx_singe2.audio
        attack : RSX.sfx_neutral_bloodtearalchemist_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_bloodtearalchemist_hit.audio
        attackDamage : RSX.sfx_neutral_bloodtearalchemist_attack_impact.audio
        death : RSX.sfx_neutral_bloodtearalchemist_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralMoonlitSorcBreathing.name
        idle : RSX.neutralMoonlitSorcIdle.name
        walk : RSX.neutralMoonlitSorcRun.name
        attack : RSX.neutralMoonlitSorcAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 0.3
        damage : RSX.neutralMoonlitSorcHit.name
        death : RSX.neutralMoonlitSorcDeath.name
      )

    if (identifier == Cards.Neutral.ValueMcDownside)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Neutral
      card.name = "塞尔苏尔"
      card.setDescription("遗愿：对你的英雄造成4点伤害。")
      card.atk = 4
      card.maxHP = 5
      card.manaCost = 3
      card.rarityId = Rarity.Rare
      damageGeneral = ModifierDyingWishDamageGeneral.createContextObject()
      damageGeneral.damageAmount = 4
      card.setInherentModifiersContextObjects([
        damageGeneral
      ])
      card.setFXResource(["FX.Cards.Neutral.AlterRexx"])
      card.setBoundingBoxWidth(85)
      card.setBoundingBoxHeight(90)
      card.setBaseSoundResource(
        apply : RSX.sfx_summonlegendary.audio
        walk : RSX.sfx_neutral_ladylocke_attack_impact.audio
        attack : RSX.sfx_neutral_wingsofparadise_attack_swing.audio
        receiveDamage : RSX.sfx_f1_oserix_hit.audio
        attackDamage : RSX.sfx_f1_oserix_attack_impact.audio
        death : RSX.sfx_neutral_sunelemental_attack_swing.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralOverpowererBreathing.name
        idle : RSX.neutralOverpowererIdle.name
        walk : RSX.neutralOverpowererRun.name
        attack : RSX.neutralOverpowererAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.2
        damage : RSX.neutralOverpowererHit.name
        death : RSX.neutralOverpowererDeath.name
      )

    if (identifier == Cards.Neutral.BiggestGiantGolem)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Neutral
      card.name = "世核魔像"
      card.atk = 25
      card.maxHP = 25
      card.manaCost = 9
      card.rarityId = Rarity.Common
      card.raceId = Races.Golem
      card.setFXResource(["FX.Cards.Neutral.WhistlingBlade"])
      card.setBoundingBoxWidth(90)
      card.setBoundingBoxHeight(100)
      card.setBaseSoundResource(
        apply : RSX.sfx_unit_deploy.audio
        walk : RSX.sfx_unit_physical_4.audio
        attack : RSX.sfx_f6_waterelemental_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_golemdragonbone_hit.audio
        attackDamage : RSX.sfx_neutral_golemdragonbone_impact.audio
        death : RSX.sfx_neutral_golemdragonbone_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralMoltenGolemBreathing.name
        idle : RSX.neutralMoltenGolemIdle.name
        walk : RSX.neutralMoltenGolemRun.name
        attack : RSX.neutralMoltenGolemAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 0.5
        damage : RSX.neutralMoltenGolemHit.name
        death : RSX.neutralMoltenGolemDeath.name
      )

    if (identifier == Cards.Neutral.BlueblackProngbok)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Neutral
      card.name = "发音"
      card.setDescription("可能会移动额外的空间。")
      card.atk = 2
      card.maxHP = 5
      card.manaCost = 3
      card.rarityId = Rarity.Common
      speedBuffContextObject = Modifier.createContextObjectOnBoard()
      speedBuffContextObject.attributeBuffs = {"speed": 3}
      speedBuffContextObject.attributeBuffsAbsolute = ["speed"]
      card.setInherentModifiersContextObjects([
        speedBuffContextObject
      ])
      card.setFXResource(["FX.Cards.Neutral.Feralu"])
      card.setBoundingBoxWidth(95)
      card.setBoundingBoxHeight(95)
      card.setBaseSoundResource(
        apply : RSX.sfx_unit_deploy_2.audio
        walk : RSX.sfx_unit_physical_4.audio
        attack : RSX.sfx_neutral_golemdragonbone_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_golemdragonbone_hit.audio
        attackDamage : RSX.sfx_neutral_golemdragonbone_impact.audio
        death : RSX.sfx_neutral_golemdragonbone_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralProngbokBreathing.name
        idle : RSX.neutralProngbokIdle.name
        walk : RSX.neutralProngbokRun.name
        attack : RSX.neutralProngbokAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 0.5
        damage : RSX.neutralProngbokHit.name
        death : RSX.neutralProngbokDeath.name
      )

    if (identifier == Cards.Neutral.VoidExploder)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Neutral
      card.name = "步枪行者"
      card.setDescription("空投\n强化：对周围的一切造成1点伤害。")
      card.atk = 3
      card.maxHP = 3
      card.manaCost = 4
      card.rarityId = Rarity.Rare
      card.setInherentModifiersContextObjects([
        ModifierAirdrop.createContextObject(),
        ModifierIntensifyDamageNearby.createContextObject(1),
        ModifierCounterIntensify.createContextObject()
      ])
      card.setFXResource(["FX.Cards.Neutral.Chakkram"])
      card.setBaseSoundResource(
        apply : RSX.sfx_neutral_prophetofthewhite_hit.audio
        walk : RSX.sfx_neutral_firestarter_impact.audio
        attack :  RSX.sfx_neutral_firestarter_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_firestarter_hit.audio
        attackDamage : RSX.sfx_neutral_firestarter_impact.audio
        death : RSX.sfx_neutral_alcuinloremaster_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralVoidExploderBreathing.name
        idle : RSX.neutralVoidExploderIdle.name
        walk : RSX.neutralVoidExploderRun.name
        attack : RSX.neutralVoidExploderAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.5
        damage : RSX.neutralVoidExploderHit.name
        death : RSX.neutralVoidExploderDeath.name
      )

    if (identifier == Cards.Neutral.FrizzlingMystic)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Neutral
      card.name = "米斯蒂克私语"
      card.setDescription("开场触发: 对敌人造成2点伤害，或者对己方的随从或英雄恢复2点生命值。")
      card.atk = 3
      card.maxHP = 3
      card.manaCost = 4
      card.rarityId = Rarity.Common
      card.setFollowups([
        {
          id: Cards.Spell.SpellDamageOrHeal
          damageOrHealAmount: 2
          spellFilterType: SpellFilterType.NeutralDirect
          canTargetGeneral: true
        }
      ])
      card.addKeywordClassToInclude(ModifierOpeningGambit)
      card.setFXResource(["FX.Cards.Neutral.AstralCrusader"])
      card.setBoundingBoxWidth(60)
      card.setBoundingBoxHeight(95)
      card.setBaseSoundResource(
        apply : RSX.sfx_summonlegendary.audio
        walk : RSX.sfx_neutral_sai_attack_impact.audio
        attack : RSX.sfx_neutral_sai_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_gro_hit.audio
        attackDamage : RSX.sfx_neutral_sai_attack_impact.audio
        death : RSX.sfx_neutral_yun_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralFrizzingMysticBreathing.name
        idle : RSX.neutralFrizzingMysticIdle.name
        walk : RSX.neutralFrizzingMysticRun.name
        attack : RSX.neutralFrizzingMysticAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.2
        damage : RSX.neutralFrizzingMysticHit.name
        death : RSX.neutralFrizzingMysticDeath.name
      )

    if (identifier == Cards.Neutral.ArarasShuffler)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Neutral
      card.name = "阿拉拉斯先知"
      card.setDescription("每当你更换一张牌时，都要将一个璀璨宝石放入你的牌组中。")
      card.atk = 1
      card.maxHP = 3
      card.manaCost = 2
      card.rarityId = Rarity.Rare
      card.raceId = Races.Arcanyst
      card.setInherentModifiersContextObjects([
        ModifierReplaceWatchShuffleCardIntoDeck.createContextObject({id: Cards.Spell.BrilliantPlume}, 1)
      ])
      card.setFXResource(["FX.Cards.Neutral.AlterRexx"])
      card.setBoundingBoxWidth(85)
      card.setBoundingBoxHeight(90)
      card.setBaseSoundResource(
        apply : RSX.sfx_summonlegendary.audio
        walk : RSX.sfx_neutral_ladylocke_attack_impact.audio
        attack : RSX.sfx_neutral_wingsofparadise_attack_swing.audio
        receiveDamage : RSX.sfx_f1_oserix_hit.audio
        attackDamage : RSX.sfx_f1_oserix_attack_impact.audio
        death : RSX.sfx_neutral_sunelemental_attack_swing.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralArarasBreathing.name
        idle : RSX.neutralArarasIdle.name
        walk : RSX.neutralArarasRun.name
        attack : RSX.neutralArarasAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.2
        damage : RSX.neutralArarasHit.name
        death : RSX.neutralArarasDeath.name
      )

    if (identifier == Cards.Spell.BrilliantPlume)
      card = new SpellHealYourGeneral(gameSession)
      card.factionId = Factions.Neutral
      card.id = Cards.Spell.BrilliantPlume
      card.setCardSetId(CardSet.Coreshatter)
      card.setIsHiddenInCollection(true)
      card.name = "璀璨宝石"
      card.setDescription("恢复随从1点生命值。\n制作一张卡片。")
      card.spellFilterType = SpellFilterType.AllyIndirect
      card.radius = CONFIG.WHOLE_BOARD_RADIUS
      card.canTargetGeneral = true
      card.healModifier = 1
      card.manaCost = 0
      card.rarityId = Rarity.TokenUnit
      card.drawCardsPostPlay = 1
      card.setFXResource(["FX.Cards.Spell.BrilliantPlume"])
      card.setBaseAnimResource(
        idle : RSX.iconBrilliantPlumeIdle.name
        active : RSX.iconBrilliantPlumeActive.name
      )
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_forcebarrier.audio
      )

    if (identifier == Cards.Neutral.Graboctopus)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Neutral
      card.name = "北极星"
      card.setDescription("空投，兵力场\n在两名玩家回合结束时，给这个仆从随机物品。")
      card.atk = 4
      card.maxHP = 4
      card.manaCost = 6
      card.rarityId = Rarity.Epic
      card.setInherentModifiersContextObjects([
        ModifierForcefield.createContextObject(),
        ModifierAirdrop.createContextObject(),
        ModifierEndTurnWatchAnyPlayerPullRandomUnits.createContextObject()
      ])
      card.setFXResource(["FX.Cards.Neutral.Paddo"])
      card.setBoundingBoxWidth(85)
      card.setBoundingBoxHeight(90)
      card.setBaseSoundResource(
        apply : RSX.sfx_summonlegendary.audio
        walk : RSX.sfx_neutral_earthwalker_death.audio
        attack : RSX.sfx_neutral_grimrock_attack_swing.audio
        receiveDamage : RSX.sfx_f5_unstableleviathan_hit.audio
        attackDamage : RSX.sfx_f5_unstableleviathan_attack_impact.audio
        death : RSX.sfx_f5_unstableleviathan_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralBlackHoleBreathing.name
        idle : RSX.neutralBlackHoleIdle.name
        walk : RSX.neutralBlackHoleRun.name
        attack : RSX.neutralBlackHoleAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.6
        damage : RSX.neutralBlackHoleHit.name
        death : RSX.neutralBlackHoleDeath.name
      )

    if (identifier == Cards.Neutral.SuperDoxx)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Neutral
      card.name = "奇普卡"
      card.setDescription("每当你的对手召唤一个随从时，召唤一个前面有普罗沃的2/1普卡。")
      card.atk = 3
      card.maxHP = 6
      card.manaCost = 5
      card.rarityId = Rarity.Epic
      card.setInherentModifiersContextObjects([
        ModifierOpponentSummonWatchSummonMinionInFront.createContextObject({id: Cards.Neutral.Doxx})
      ])
      card.addKeywordClassToInclude(ModifierProvoke)
      card.addKeywordClassToInclude(ModifierTokenCreator)
      card.setFXResource(["FX.Cards.Neutral.EXun"])
      card.setBaseSoundResource(
        apply : RSX.sfx_summonlegendary.audio
        walk : RSX.sfx_neutral_arakiheadhunter_hit.audio
        attack : RSX.sfx_neutral_beastsaberspinetiger_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_beastsaberspinetiger_hit.audio
        attackDamage : RSX.sfx_neutral_beastsaberspinetiger_attack_impact.audio
        death : RSX.sfx_neutral_beastsaberspinetiger_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralSuperDoxxBreathing.name
        idle : RSX.neutralSuperDoxxIdle.name
        walk : RSX.neutralSuperDoxxRun.name
        attack : RSX.neutralSuperDoxxAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.2
        damage : RSX.neutralSuperDoxxHit.name
        death : RSX.neutralSuperDoxxDeath.name
      )

    if (identifier == Cards.Neutral.Doxx)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Neutral
      card.name = "普卡"
      card.setDescription("Provoke")
      card.atk = 2
      card.maxHP = 1
      card.manaCost = 1
      card.rarityId = Rarity.TokenUnit
      card.setIsHiddenInCollection(true)
      card.setInherentModifiersContextObjects([
        ModifierProvoke.createContextObject()
      ])
      card.addKeywordClassToInclude(ModifierToken)
      card.setFXResource(["FX.Cards.Neutral.Spelljammer"])
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_diretidefrenzy.audio
        walk : RSX.sfx_singe2.audio
        attack : RSX.sfx_f6_waterelemental_attack_swing.audio
        receiveDamage : RSX.sfx_f6_waterelemental_hit.audio
        attackDamage : RSX.sfx_neutral_fog_attack_impact.audio
        death : RSX.sfx_neutral_fog_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralDoxxBreathing.name
        idle : RSX.neutralDoxxIdle.name
        walk : RSX.neutralDoxxRun.name
        attack : RSX.neutralDoxxAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.2
        damage : RSX.neutralDoxxHit.name
        death : RSX.neutralDoxxDeath.name
      )

    if (identifier == Cards.Neutral.IncindyDindy)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Neutral
      card.name = "爆燃"
      card.setDescription("每当你召唤一个随从时，燃烧对手的牌组中的三张牌。")
      card.atk = 7
      card.maxHP = 7
      card.manaCost = 7
      card.rarityId = Rarity.Legendary
      card.setInherentModifiersContextObjects([
        ModifierSummonWatchBurnOpponentCards.createContextObject(3)
      ])
      card.setFXResource(["FX.Cards.Neutral.TheScientist"])
      card.setBoundingBoxWidth(70)
      card.setBoundingBoxHeight(105)
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_fractalreplication.audio
        walk : RSX.sfx_unit_run_magical_3.audio
        attack : RSX.sfx_neutral_prophetofthewhite_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_alcuinloremaster_hit.audio
        attackDamage : RSX.sfx_neutral_alcuinloremaster_attack_impact.audio
        death : RSX.sfx_neutral_alcuinloremaster_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralIncindyBreathing.name
        idle : RSX.neutralIncindyIdle.name
        walk : RSX.neutralIncindyRun.name
        attack : RSX.neutralIncindyAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.2
        damage : RSX.neutralIncindyHit.name
        death : RSX.neutralIncindyDeath.name
      )

    if (identifier == Cards.Neutral.Scarzig)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Neutral
      card.name = "恐惧"
      card.setDescription("如果这个仆从消灭了一个敌人并存活下来，那么无论在哪里，友好的斯卡泽都会变身为羽毛骑士。")
      card.atk = 1
      card.maxHP = 2
      card.manaCost = 3
      card.rarityId = Rarity.Legendary
      card.setInherentModifiersContextObjects([
        ModifierKillWatchAndSurviveScarzig.createContextObject()
      ])
      card.addKeywordClassToInclude(ModifierTokenCreator)
      card.setFXResource(["FX.Cards.Neutral.PlanarScout"])
      card.setBoundingBoxWidth(65)
      card.setBoundingBoxHeight(40)
      card.setBaseSoundResource(
        apply : RSX.sfx_unit_deploy_3.audio
        walk : RSX.sfx_singe2.audio
        attack : RSX.sfx_neutral_beastphasehound_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_beastphasehound_hit.audio
        attackDamage : RSX.sfx_neutral_beastphasehound_attack_impact.audio
        death : RSX.sfx_neutral_beastphasehound_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralScarzigBreathing.name
        idle : RSX.neutralScarzigIdle.name
        walk : RSX.neutralScarzigRun.name
        attack : RSX.neutralScarzigAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 0.4
        damage : RSX.neutralScarzigHit.name
        death : RSX.neutralScarzigDeath.name
      )

    if (identifier == Cards.Neutral.BigScarzig)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Neutral
      card.name = "羽毛骑士"
      card.setDescription("速度\n无论这个随从攻击什么时候，给其他友方仆从+1/+1。")
      card.atk = 4
      card.maxHP = 8
      card.manaCost = 3
      card.rarityId = Rarity.TokenUnit
      card.setIsHiddenInCollection(true)
      buffContextObject = Modifier.createContextObjectWithAttributeBuffs(1,1)
      buffContextObject.appliedName = "斯卡泽的指挥部"
      card.setInherentModifiersContextObjects([
        ModifierTranscendance.createContextObject(),
        ModifierMyAttackWatchApplyModifiersToAllies.createContextObject([buffContextObject], false)
      ])
      card.addKeywordClassToInclude(ModifierToken)
      card.setFXResource(["FX.Cards.Neutral.WhistlingBlade"])
      card.setBoundingBoxWidth(90)
      card.setBoundingBoxHeight(100)
      card.setBaseSoundResource(
        apply : RSX.sfx_unit_deploy.audio
        walk : RSX.sfx_unit_physical_4.audio
        attack : RSX.sfx_f6_waterelemental_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_golemdragonbone_hit.audio
        attackDamage : RSX.sfx_neutral_golemdragonbone_impact.audio
        death : RSX.sfx_neutral_golemdragonbone_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralSuperScarzigBreathing.name
        idle : RSX.neutralSuperScarzigIdle.name
        walk : RSX.neutralSuperScarzigRun.name
        attack : RSX.neutralSuperScarzigAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 0.5
        damage : RSX.neutralSuperScarzigHit.name
        death : RSX.neutralSuperScarzigDeath.name
      )

    if (identifier == Cards.Neutral.PennyPacker)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Neutral
      card.name = "招摇的奥博"
      card.setDescription("开发触发: 将你的动作栏中的牌转换为随机的棱柱形传奇牌")
      card.atk = 3
      card.maxHP = 4
      card.manaCost = 3
      card.rarityId = Rarity.Legendary
      card.setInherentModifiersContextObjects([
        ModifierOpeningGambitTransformHandIntoLegendaries.createContextObject()
      ])
      card.setFXResource(["FX.Cards.Neutral.GolemVanquisher"])
      card.setBoundingBoxWidth(45)
      card.setBoundingBoxHeight(80)
      card.setBaseSoundResource(
        apply : RSX.sfx_summonlegendary.audio
        walk : RSX.sfx_singe2.audio
        attack : RSX.sfx_f1_oserix_attack_swing.audio
        receiveDamage : RSX.sfx_f1_oserix_hit.audio
        attackDamage : RSX.sfx_f1_oserix_attack_impact.audio
        death : RSX.sfx_f1_oserix_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralGoldloverBreathing.name
        idle : RSX.neutralGoldloverIdle.name
        walk : RSX.neutralGoldloverRun.name
        attack : RSX.neutralGoldloverAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 0.5
        damage : RSX.neutralGoldloverHit.name
        death : RSX.neutralGoldloverDeath.name
      )

    if (identifier == Cards.Neutral.Hsuku)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Neutral
      card.name = "许库"
      card.setDescription("在任何玩家的回合结束时，给他们的一个仆从和一个随机的buff和关键字（不包括许库）。")
      card.atk = 2
      card.maxHP = 6
      card.manaCost = 4
      card.rarityId = Rarity.Epic
      hsukuModifier = ModifierEndTurnWatchAnyPlayerHsuku.createContextObject("许库Buff")
      card.setInherentModifiersContextObjects([
        hsukuModifier
      ])
      card.setFXResource(["FX.Cards.Neutral.ArchonSpellbinder"])
      card.setBoundingBoxWidth(55)
      card.setBoundingBoxHeight(85)
      card.setBaseSoundResource(
        apply : RSX.sfx_summonlegendary.audio
        walk : RSX.sfx_singe2.audio
        attack : RSX.sfx_neutral_archonspellbinder_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_archonspellbinder_hit.audio
        attackDamage : RSX.sfx_neutral_archonspellbinder_attack_impact.audio
        death : RSX.sfx_neutral_archonspellbinder_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.neutralHsukuBreathing.name
        idle : RSX.neutralHsukuIdle.name
        walk : RSX.neutralHsukuRun.name
        attack : RSX.neutralHsukuAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.2
        damage : RSX.neutralHsukuHit.name
        death : RSX.neutralHsukuDeath.name
      )

    return card

module.exports = CardFactory_CoreshatterSet_Neutral
