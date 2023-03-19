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

Modifier = require 'app/sdk/modifiers/modifier'
ModifierDyingWishApplyModifiersToGenerals = require 'app/sdk/modifiers/modifierDyingWishApplyModifiersToGenerals'
ModifierStartTurnWatchDamageMyGeneral = require 'app/sdk/modifiers/modifierStartTurnWatchDamageMyGeneral'
ModifierOpeningGambit = require 'app/sdk/modifiers/modifierOpeningGambit'
ModifierDyingWishReduceManaCostOfDyingWish = require 'app/sdk/modifiers/modifierDyingWishReduceManaCostOfDyingWish'
ModifierStackingShadows = require 'app/sdk/modifiers/modifierStackingShadows'
ModifierIntensifyBuffSelf = require 'app/sdk/modifiers/modifierIntensifyBuffSelf'
ModifierOpeningGambitMoveEnemyGeneralForward = require 'app/sdk/modifiers/modifierOpeningGambitMoveEnemyGeneralForward'
ModifierSynergizeSpawnEntityFromDeck = require 'app/sdk/modifiers/modifierSynergizeSpawnEntityFromDeck'
ModifierStartsInHand = require 'app/sdk/modifiers/modifierStartsInHand'
ModifierStackingShadowsBonusDamageEqualNumberTiles = require 'app/sdk/modifiers/modifierStackingShadowsBonusDamageEqualNumberTiles'
ModifierOnSummonFromHandApplyEmblems = require 'app/sdk/modifiers/modifierOnSummonFromHandApplyEmblems'
ModifierFlying = require 'app/sdk/modifiers/modifierFlying'
ModifierFirstBlood = require 'app/sdk/modifiers/modifierFirstBlood'
ModifierProvoke = require 'app/sdk/modifiers/modifierProvoke'
ModifierMyAttackMinionWatchKillTargetSummonThisOnSpace = require 'app/sdk/modifiers/modifierMyAttackMinionWatchKillTargetSummonThisOnSpace'
ModifierFateAbyssianDyingQuest = require 'app/sdk/modifiers/modifierFateAbyssianDyingQuest'
ModifierFrenzy = require 'app/sdk/modifiers/modifierFrenzy'
ModifierCannotBeReplaced = require 'app/sdk/modifiers/modifierCannotBeReplaced'
ModifierIntensify = require 'app/sdk/modifiers/modifierIntensify'
ModifierCounterIntensify = require 'app/sdk/modifiers/modifierCounterIntensify'
ModifierCannotBeRemovedFromHand = require 'app/sdk/modifiers/modifierCannotBeRemovedFromHand'
ModifierQuestBuffAbyssian = require 'app/sdk/modifiers/modifierQuestBuffAbyssian'

PlayerModifierEmblemSummonWatchAbyssUndyingQuest = require 'app/sdk/playerModifiers/playerModifierEmblemSummonWatchAbyssUndyingQuest'

Spell = require 'app/sdk/spells/spell'
SpellEvilXerox = require 'app/sdk/spells/spellEvilXerox'
SpellFilterType = require 'app/sdk/spells/spellFilterType'
SpellFillHandFromOpponentsDeck = require 'app/sdk/spells/spellFillHandFromOpponentsDeck'
SpellTickleTendril = require 'app/sdk/spells/spellTickleTendril'
SpellTwoForMe = require 'app/sdk/spells/spellTwoForMe'
SpellIntensifyShadowBlossom = require 'app/sdk/spells/spellIntensifyShadowBlossom'
SpellDrawCardsIfHaveFriendlyTiles = require 'app/sdk/spells/spellDrawCardsIfHaveFriendlyTiles'

i18next = require 'i18next'
if i18next.t() is undefined
  i18next.t = (text) ->
    return text

class CardFactory_CoreshatterSet_Faction4

  ###*
   * Returns a card that matches the identifier.
   * @param {Number|String} identifier
   * @param {GameSession} gameSession
   * @returns {Card}
   ###
  @cardForIdentifier: (identifier,gameSession) ->
    card = null

    if (identifier == Cards.Faction4.DemonOfEternity)
      card = new Unit(gameSession)
      card.factionId = Factions.Faction4
      card.setCardSetId(CardSet.Coreshatter)
      card.name = "辅爵查奥"
      card.setDescription("审判：施法6次，摧毁一名友军仆从。\n目标：每当一个友好的随从死亡时，在一个随机的空间重新召唤它。")
      card.atk = 6
      card.maxHP = 1
      card.manaCost = 6
      card.rarityId = Rarity.Mythron
      dyingWishModifier = ModifierQuestBuffAbyssian.createContextObject()
      dyingWishModifier.appliedName = "永不放弃的意志"
      dyingWishModifier.appliedDescription = "每当这个随从死亡时，在一个随机的空间重新召唤它。"
      emblemModifier = PlayerModifierEmblemSummonWatchAbyssUndyingQuest.createContextObject([dyingWishModifier])
      emblemModifier.appliedName = "枢密院院长令"
      emblemModifier.appliedDescription = "每当一个友好的随从死亡时，在随机空间重新召唤它。"
      card.setInherentModifiersContextObjects([
        ModifierStartsInHand.createContextObject(),
        ModifierCannotBeReplaced.createContextObject(),
        ModifierOnSummonFromHandApplyEmblems.createContextObject([emblemModifier], true, false),
        ModifierFateAbyssianDyingQuest.createContextObject(6),
        ModifierCannotBeRemovedFromHand.createContextObject()
      ])
      card.setFXResource(["FX.Cards.Faction4.HuntingHorror"])
      card.setBoundingBoxWidth(85)
      card.setBoundingBoxHeight(90)
      card.setBaseSoundResource(
        apply : RSX.sfx_summonlegendary.audio
        walk : RSX.sfx_singe2.audio
        attack : RSX.sfx_f1ironcliffeguardian_attack_swing.audio
        receiveDamage : RSX.sfx_f1ironcliffeguardian_hit.audio
        attackDamage : RSX.sfx_f1ironcliffeguardian_attack_impact.audio
        death : RSX.sfx_f1ironcliffeguardian_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f4DemonEternityBreathing.name
        idle : RSX.f4DemonEternityIdle.name
        walk : RSX.f4DemonEternityRun.name
        attack : RSX.f4DemonEternityAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 0.8
        damage : RSX.f4DemonEternityHit.name
        death : RSX.f4DemonEternityDeath.name
      )

    if (identifier == Cards.Faction4.CurseMonger)
      card = new Unit(gameSession)
      card.factionId = Factions.Faction4
      card.setCardSetId(CardSet.Coreshatter)
      card.name = "赫克斯克劳"
      card.setDescription("垂死的愿望：敌人英雄获得，“在你回合开始时，受到1点伤害。”")
      card.atk = 7
      card.maxHP = 2
      card.manaCost = 5
      card.rarityId = Rarity.Legendary
      damageSelf = ModifierStartTurnWatchDamageMyGeneral.createContextObject(1)
      damageSelf.appliedName = "诅咒"
      damageSelf.appliedDescription = "在你的回合开始时，你的英雄受到1点伤害。"
      card.setInherentModifiersContextObjects([ModifierDyingWishApplyModifiersToGenerals.createContextObject([damageSelf],false,true)])
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
        breathing : RSX.f4FallenAspectBreathing.name
        idle : RSX.f4FallenAspectIdle.name
        walk : RSX.f4FallenAspectRun.name
        attack : RSX.f4FallenAspectAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 0.3
        damage : RSX.f4FallenAspectHit.name
        death : RSX.f4FallenAspectDeath.name
      )

    if (identifier == Cards.Artifact.WraithlingAmulet)
      card = new Artifact(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction4
      card.id = Cards.Artifact.WraithlingAmulet
      card.name = "赖特"
      card.setDescription("友方的幽灵有+2/+2。")
      card.manaCost = 4
      card.rarityId = Rarity.Epic
      card.durability = 3
      attackBuffContextObject = Modifier.createContextObjectWithAttributeBuffs(2,2)
      attackBuffContextObject.appliedName = "米克的王冠"
      wraithlingId = [
        Cards.Faction4.Wraithling
      ]
      card.setTargetModifiersContextObjects([
        Modifier.createContextObjectWithAuraForAllAllies([attackBuffContextObject], null, wraithlingId, null, "米克的王冠")
      ])
      card.setFXResource(["FX.Cards.Artifact.Mindlathe"])
      card.setBaseAnimResource(
        idle: RSX.iconWraithRingIdle.name
        active: RSX.iconWraithRingActive.name
      )
      card.setBaseSoundResource(
        apply : RSX.sfx_victory_crest.audio
      )

    if (identifier == Cards.Faction4.DyingWishReducer)
      card = new Unit(gameSession)
      card.factionId = Factions.Faction4
      card.setCardSetId(CardSet.Coreshatter)
      card.name = "腐尸收容器"
      card.setDescription("垂死之愿：在你的牌堆和动作栏中使用垂死之愿望降低所有小杂役的法力-1。")
      card.atk = 1
      card.maxHP = 1
      card.manaCost = 2
      card.rarityId = Rarity.Epic
      card.setInherentModifiersContextObjects([ModifierDyingWishReduceManaCostOfDyingWish.createContextObject(1)])
      card.setFXResource(["FX.Cards.Neutral.SilvertongueCorsair"])
      card.setBaseSoundResource(
        apply : RSX.sfx_unit_deploy_3.audio
        walk : RSX.sfx_singe2.audio
        attack : RSX.sfx_f2_kaidoassassin_attack_swing.audio
        receiveDamage : RSX.sfx_f1elyxstormblade_hit.audio
        attackDamage : RSX.sfx_f1elyxstormblade_attack_impact.audio
        death : RSX.sfx_f6_icedryad_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f4PlagueDoctorBreathing.name
        idle : RSX.f4PlagueDoctorIdle.name
        walk : RSX.f4PlagueDoctorRun.name
        attack : RSX.f4PlagueDoctorAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 0.4
        damage : RSX.f4PlagueDoctorHit.name
        death : RSX.f4PlagueDoctorDeath.name
      )

    if (identifier == Cards.Spell.ShadowBlossom)
      card = new SpellIntensifyShadowBlossom(gameSession)
      card.factionId = Factions.Faction4
      card.setCardSetId(CardSet.Coreshatter)
      card.id = Cards.Spell.ShadowBlossom
      card.name = "痛苦勇气"
      card.setDescription("强化：将1个随机空格转换为阴影爬行，优先分配敌人小杂役的空格。")
      card.manaCost = 1
      card.rarityId = Rarity.Common
      card.spellFilterType = SpellFilterType.None
      card.spawnCount = 1
      card.addKeywordClassToInclude(ModifierStackingShadows)
      card.addKeywordClassToInclude(ModifierIntensify)
      card.setInherentModifiersContextObjects([ModifierCounterIntensify.createContextObject()])
      card.setFXResource(["FX.Cards.Spell.PainfulPluck"])
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_disintegrate.audio
      )
      card.setBaseAnimResource(
        idle : RSX.iconShadowBlossomIdle.name
        active : RSX.iconShadowBlossomActive.name
      )

    if (identifier == Cards.Spell.Triggered)
      card = new SpellDrawCardsIfHaveFriendlyTiles(gameSession)
      card.factionId = Factions.Faction4
      card.setCardSetId(CardSet.Coreshatter)
      card.id = Cards.Spell.Triggered
      card.name = "深度屈服"
      card.setDescription("如果你有三张或三张以上的阴影爬行，抽两张牌。")
      card.manaCost = 2
      card.rarityId = Rarity.Rare
      card.spellFilterType = SpellFilterType.None
      card.numCardsToDraw = 2
      card.numTilesRequired = 3
      card.tileId = Cards.Tile.Shadow
      card.addKeywordClassToInclude(ModifierStackingShadows)
      card.setFXResource(["FX.Cards.Spell.YieldingDepths"])
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_immolation_a.audio
      )
      card.setBaseAnimResource(
        idle : RSX.iconPerilousFootingIdle.name
        active : RSX.iconPerilousFootingActive.name
      )

    if (identifier == Cards.Faction4.CreepDemon)
      card = new Unit(gameSession)
      card.factionId = Factions.Faction4
      card.setCardSetId(CardSet.Coreshatter)
      card.name = "深渊托恩托"
      card.setDescription("挑衅\n你的暗影潜行造成的伤害等于己方暗影潜行的数量。")
      card.atk = 6
      card.maxHP = 6
      card.manaCost = 6
      card.rarityId = Rarity.Legendary
      auraContextObject = Modifier.createContextObjectWithAuraForAllAllies([ModifierStackingShadowsBonusDamageEqualNumberTiles.createContextObject()], null, [Cards.Tile.Shadow])
      auraContextObject.auraFilterByCardType = CardType.Tile
      card.setInherentModifiersContextObjects([
        ModifierProvoke.createContextObject(),
        auraContextObject
      ])
      card.addKeywordClassToInclude(ModifierStackingShadows)
      card.setFXResource(["FX.Cards.Neutral.LightningBeetle"])
      card.setBoundingBoxWidth(85)
      card.setBoundingBoxHeight(65)
      card.setBaseSoundResource(
        apply : RSX.sfx_unit_deploy_3.audio
        walk : RSX.sfx_singe2.audio
        attack : RSX.sfx_neutral_stormatha_attack_swing.audio
        receiveDamage :  RSX.sfx_neutral_stormatha_hit.audio
        attackDamage : RSX.sfx_neutral_stormatha_attack_impact.audio
        death : RSX.sfx_neutral_stormatha_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f4CreepDemonBreathing.name
        idle : RSX.f4CreepDemonIdle.name
        walk : RSX.f4CreepDemonRun.name
        attack : RSX.f4CreepDemonAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.2
        damage : RSX.f4CreepDemonHit.name
        death : RSX.f4CreepDemonDeath.name
      )

    if (identifier == Cards.Spell.GateToDudesHouse)
      card = new SpellFillHandFromOpponentsDeck(gameSession)
      card.factionId = Factions.Faction4
      card.setCardSetId(CardSet.Coreshatter)
      card.id = Cards.Spell.GateToDudesHouse
      card.name = "深渊仪式"
      card.setDescription("从对手的牌组中抽出牌来填满你的动作栏。")
      card.manaCost = 6
      card.rarityId = Rarity.Epic
      card.setFXResource(["FX.Cards.Spell.UnfathomableRite"])
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_manavortex.audio
      )
      card.setBaseAnimResource(
        idle : RSX.iconGateOthervaultIdle.name
        active : RSX.iconGateOthervaultActive.name
      )

    if (identifier == Cards.Spell.TickleTendril)
      card = new SpellTickleTendril(gameSession)
      card.factionId = Factions.Faction4
      card.setCardSetId(CardSet.Coreshatter)
      card.id = Cards.Spell.TickleTendril
      card.name = "咀嚼"
      card.setDescription("为每一个友方的暗影潜行从敌方随从那里偷取生命值（但不超过其生命值）。")
      card.manaCost = 3
      card.rarityId = Rarity.Rare
      card.spellFilterType = SpellFilterType.EnemyDirect
      card.canTargetGeneral = false
      card.setFXResource(["FX.Cards.Spell.Munch"])
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_voidpulse02.audio
      )
      card.setBaseAnimResource(
        idle : RSX.iconMunchIdle.name
        active : RSX.iconMunchActive.name
      )

    if (identifier == Cards.Faction4.ShadowBrute)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction4
      card.name = "碎骨魔"
      card.setDescription("强化：这个爪牙获得+5攻击。")
      card.atk = 0
      card.maxHP = 3
      card.manaCost = 3
      card.rarityId = Rarity.Common
      card.setInherentModifiersContextObjects([
        ModifierIntensifyBuffSelf.createContextObject(5, 0, "阴暗力量"),
        ModifierCounterIntensify.createContextObject()
      ])
      card.setFXResource(["FX.Cards.Neutral.SilhoutteTracer"])
      card.setBaseSoundResource(
        apply : RSX.sfx_unit_deploy_3.audio
        walk : RSX.sfx_singe2.audio
        attack : RSX.sfx_f3_dunecaster_attack_swing.audio
        receiveDamage : RSX.sfx_f3_dunecaster_hit.audio
        attackDamage : RSX.sfx_f3_dunecaster_impact.audio
        death : RSX.sfx_f3_dunecaster_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f4UnderworldBruteBreathing.name
        idle : RSX.f4UnderworldBruteIdle.name
        walk : RSX.f4UnderworldBruteRun.name
        attack : RSX.f4UnderworldBruteAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 0.6
        damage : RSX.f4UnderworldBruteHit.name
        death : RSX.f4UnderworldBruteDeath.name
      )

    if (identifier == Cards.Faction4.WhistlingHarvester)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction4
      card.name = "裂纹松土机"
      card.setDescription("疯狂\n甘比特：将敌人英雄向前传送一个空间。")
      card.atk = 4
      card.maxHP = 3
      card.manaCost = 3
      card.rarityId = Rarity.Common
      card.setInherentModifiersContextObjects([
        ModifierOpeningGambitMoveEnemyGeneralForward.createContextObject(),
        ModifierFrenzy.createContextObject()
      ])
      card.setFXResource(["FX.Cards.Neutral.FrostboneNaga"])
      card.setBoundingBoxWidth(50)
      card.setBoundingBoxHeight(85)
      card.setBaseSoundResource(
        apply : RSX.sfx_unit_deploy_2.audio
        walk : RSX.sfx_singe2.audio
        attack : RSX.sfx_f4_siren_attack_swing.audio
        receiveDamage : RSX.sfx_f4_siren_hit.audio
        attackDamage : RSX.sfx_f6_ancientgrove_attack_impact.audio
        death : RSX.sfx_f4_siren_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f4WhistlingHarvesterBreathing.name
        idle : RSX.f4WhistlingHarvesterIdle.name
        walk : RSX.f4WhistlingHarvesterRun.name
        attack : RSX.f4WhistlingHarvesterAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 0.5
        damage : RSX.f4WhistlingHarvesterHit.name
        death : RSX.f4WhistlingHarvesterDeath.name
      )

    if (identifier == Cards.Faction4.MiniMinion)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction4
      card.name = "绞刑架"
      card.setDescription("每当这个攻击敌人的随从时，摧毁那个随从并在那个空间召唤一个绞刑架。")
      card.atk = 1
      card.maxHP = 2
      card.manaCost = 2
      card.rarityId = Rarity.Rare
      card.setInherentModifiersContextObjects([
        ModifierMyAttackMinionWatchKillTargetSummonThisOnSpace.createContextObject()
      ])
      card.setFXResource(["FX.Cards.Neutral.Fog"])
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_diretidefrenzy.audio
        walk : RSX.sfx_neutral_valehunter_attack_impact.audio
        attack : RSX.sfx_neutral_fog_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_fog_hit.audio
        attackDamage : RSX.sfx_neutral_fog_attack_impact.audio
        death : RSX.sfx_neutral_fog_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f4MiniMinionBreathing.name
        idle : RSX.f4MiniMinionIdle.name
        walk : RSX.f4MiniMinionRun.name
        attack : RSX.f4MiniMinionAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.2
        damage : RSX.f4MiniMinionHit.name
        death : RSX.f4MiniMinionDeath.name
      )

    if (identifier == Cards.Spell.TwoForMe)
      card = new SpellTwoForMe(gameSession)
      card.factionId = Factions.Faction4
      card.setCardSetId(CardSet.Coreshatter)
      card.id = Cards.Spell.TwoForMe
      card.name = "恶魔转换"
      card.setDescription("从对手的牌组中抽取一个随从。它获得+1/+1。")
      card.manaCost = 1
      card.rarityId = Rarity.Common
      card.spellFilterType = SpellFilterType.None
      card.buffName = "恶魔劝说"
      card.setFXResource(["FX.Cards.Spell.DemonicConversion"])
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_voidpulse02.audio
      )
      card.setBaseAnimResource(
        idle : RSX.iconDarkPersuasionIdle.name
        active : RSX.iconDarkPersuasionActive.name
      )

    if (identifier == Cards.Spell.EvilXerox)
      card = new SpellEvilXerox(gameSession)
      card.factionId = Factions.Faction4
      card.setCardSetId(CardSet.Coreshatter)
      card.id = Cards.Spell.EvilXerox
      card.name = "释放邪恶"
      card.setDescription("召唤一个你的对手最近从他们的行动栏中召唤的随从复制。它获得了冲刺和飞行。")
      card.manaCost = 8
      card.rarityId = Rarity.Legendary
      card.spellFilterType = SpellFilterType.SpawnSource
      card.addKeywordClassToInclude(ModifierFirstBlood)
      card.addKeywordClassToInclude(ModifierFlying)
      card.setFXResource(["FX.Cards.Spell.UnleashTheEvil"])
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_flashreincarnation.audio
      )
      card.setBaseAnimResource(
        idle : RSX.iconEvilXeroxIdle.name
        active : RSX.iconEvilXeroxActive.name
      )

    return card

module.exports = CardFactory_CoreshatterSet_Faction4
