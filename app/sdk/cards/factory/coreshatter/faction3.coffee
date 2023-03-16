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
SpellIntensifySpawnEntitiesNearGeneral = require 'app/sdk/spells/spellIntensifySpawnEntitiesNearGeneral'
SpellApplyModifiers = require 'app/sdk/spells/spellApplyModifiers'
SpellSummoningStones = require 'app/sdk/spells/spellSummoningStones'
SpellDrawArtifact = require 'app/sdk/spells/spellDrawArtifact'
SpellThoughtExchange = require 'app/sdk/spells/spellThoughtExchange'
SpellMetalworking = require 'app/sdk/spells/spellMetalworking'

Modifier = require 'app/sdk/modifiers/modifier'
ModifierOpeningGambit = require 'app/sdk/modifiers/modifierOpeningGambit'
ModifierStartOpponentsTurnWatchRemoveEntity = require 'app/sdk/modifiers/modifierStartOpponentsTurnWatchRemoveEntity'
ModifierEnemyCannotCastBBS = require 'app/sdk/modifiers/modifierEnemyCannotCastBBS'
ModifierStartTurnWatchRestoreChargeToArtifacts = require 'app/sdk/modifiers/modifierStartTurnWatchRestoreChargeToArtifacts'
ModifierIntensifyBuffSelf = require 'app/sdk/modifiers/modifierIntensifyBuffSelf'
ModifierIntensifyDamageEnemyGeneral = require 'app/sdk/modifiers/modifierIntensifyDamageEnemyGeneral'
ModifierFlying = require 'app/sdk/modifiers/modifierFlying'
ModifierStartsInHand = require 'app/sdk/modifiers/modifierStartsInHand'
ModifierForcefield = require 'app/sdk/modifiers/modifierForcefield'
ModifierFirstBlood = require 'app/sdk/modifiers/modifierFirstBlood'
ModifierBlastAttackStrong = require 'app/sdk/modifiers/modifierBlastAttackStrong'
ModifierMyAttackWatchScarabBlast = require 'app/sdk/modifiers/modifierMyAttackWatchScarabBlast'
ModifierEquipFriendlyArtifactWatchGainAttackEqualToCost = require 'app/sdk/modifiers/modifierEquipFriendlyArtifactWatchGainAttackEqualToCost'
ModifierOnSummonFromHandApplyEmblems = require 'app/sdk/modifiers/modifierOnSummonFromHandApplyEmblems'
ModifierDyingWishGoldenGuide = require 'app/sdk/modifiers/modifierDyingWishGoldenGuide'
ModifierToken = require 'app/sdk/modifiers/modifierToken'
ModifierTokenCreator = require 'app/sdk/modifiers/modifierTokenCreator'
ModifierFateVetruvianMovementQuest = require 'app/sdk/modifiers/modifierFateVetruvianMovementQuest'
ModifierCannotBeReplaced = require 'app/sdk/modifiers/modifierCannotBeReplaced'
ModifierIntensify = require 'app/sdk/modifiers/modifierIntensify'
ModifierCounterIntensify = require 'app/sdk/modifiers/modifierCounterIntensify'
ModifierCannotBeRemovedFromHand = require 'app/sdk/modifiers/modifierCannotBeRemovedFromHand'

PlayerModifierEmblemSituationalVetQuestFrenzy = require 'app/sdk/playerModifiers/playerModifierEmblemSituationalVetQuestFrenzy'
PlayerModifierEmblemSituationalVetQuestFlying = require 'app/sdk/playerModifiers/playerModifierEmblemSituationalVetQuestFlying'
PlayerModifierEmblemSituationalVetQuestCelerity = require 'app/sdk/playerModifiers/playerModifierEmblemSituationalVetQuestCelerity'

i18next = require 'i18next'
if i18next.t() is undefined
  i18next.t = (text) ->
    return text

class CardFactory_CoreshatterSet_Faction3

  ###*
   * Returns a card that matches the identifier.
   * @param {Number|String} identifier
   * @param {GameSession} gameSession
   * @returns {Card}
   ###
  @cardForIdentifier: (identifier,gameSession) ->
    card = null

    if (identifier == Cards.Faction3.KeeperOfAges)
      card = new Unit(gameSession)
      card.factionId = Factions.Faction3
      card.setCardSetId(CardSet.Coreshatter)
      card.name = "不朽星辰的信念"
      card.setDescription("试炼：英雄带着装备好的神器到达战场的另一边。\n目标：每个装备的神器都会给你的英雄一层提升。")
      card.atk = 3
      card.maxHP = 3
      card.manaCost = 6
      card.rarityId = Rarity.Mythron
      emblemModifier1 = PlayerModifierEmblemSituationalVetQuestFrenzy.createContextObject(1)
      emblemModifier1.appliedName = "战胜永恒"
      emblemModifier1.appliedDescription = "每件装备的神器都会给你的英雄一个提升等级：狂热、飞翔、敏捷。"
      emblemModifier2 = PlayerModifierEmblemSituationalVetQuestFlying.createContextObject(2)
      emblemModifier2.isHiddenToUI = true
      emblemModifier3 = PlayerModifierEmblemSituationalVetQuestCelerity.createContextObject(3)
      emblemModifier3.isHiddenToUI = true
      card.setInherentModifiersContextObjects([
        ModifierStartsInHand.createContextObject(),
        ModifierCannotBeReplaced.createContextObject(),
        ModifierFateVetruvianMovementQuest.createContextObject(),
        ModifierOnSummonFromHandApplyEmblems.createContextObject([emblemModifier1, emblemModifier2, emblemModifier3], true, false),
        ModifierCannotBeRemovedFromHand.createContextObject()
      ])
      card.setFXResource(["FX.Cards.Neutral.SwornDefender"])
      card.setBoundingBoxWidth(70)
      card.setBoundingBoxHeight(85)
      card.setBaseSoundResource(
        apply : RSX.sfx_ui_booster_packexplode.audio
        walk : RSX.sfx_singe2.audio
        attack : RSX.sfx_neutral_sunseer_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_sunseer_hit.audio
        attackDamage : RSX.sfx_neutral_sunseer_attack_impact.audio
        death : RSX.sfx_neutral_sunseer_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f3KeeperAgesBreathing.name
        idle : RSX.f3KeeperAgesIdle.name
        walk : RSX.f3KeeperAgesRun.name
        attack : RSX.f3KeeperAgesAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 0.25
        damage : RSX.f3KeeperAgesHit.name
        death : RSX.f3KeeperAgesDeath.name
      )

    if (identifier == Cards.Faction3.WindGiver)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction3
      card.name = "奥布赖德"
      card.setDescription("开局策略：将附近的一个友军仆从送回你的行动栏。")
      card.addKeywordClassToInclude(ModifierOpeningGambit)
      card.atk = 2
      card.maxHP = 2
      card.manaCost = 2
      card.rarityId = Rarity.Common
      card.setFollowups([
        {
          id: Cards.Spell.IceCage
          spellFilterType: SpellFilterType.AllyDirect
          _private: {
            followupSourcePattern: CONFIG.PATTERN_3x3
          }
        }
      ])
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
        breathing : RSX.f3WindgiverBreathing.name
        idle : RSX.f3WindgiverIdle.name
        walk : RSX.f3WindgiverRun.name
        attack : RSX.f3WindgiverAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.2
        damage : RSX.f3WindgiverHit.name
        death : RSX.f3WindgiverDeath.name
      )

    if (identifier == Cards.Spell.IncreasingWinds)
      card = new SpellIntensifySpawnEntitiesNearGeneral(gameSession)
      card.factionId = Factions.Faction3
      card.setCardSetId(CardSet.Coreshatter)
      card.id = Cards.Spell.IncreasingWinds
      card.name = "安姆布卢姆布"
      card.setDescription("强化：在你的英雄附近召唤2名风之Dervishes。")
      card.manaCost = 5
      card.rarityId = Rarity.Common
      card.spellFilterType = SpellFilterType.None
      card.numberToSummon = 2
      card.cardDataOrIndexToSpawn = {id: Cards.Faction3.Dervish}
      card.addKeywordClassToInclude(ModifierTokenCreator)
      card.addKeywordClassToInclude(ModifierIntensify)
      card.setInherentModifiersContextObjects([ModifierCounterIntensify.createContextObject()])
      card.setFXResource(["FX.Cards.Spell.Accumulonimbus"])
      card.setBaseAnimResource(
        idle: RSX.iconIncreasingWindsIdle.name
        active: RSX.iconIncreasingWindsActive.name
      )
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_entropicdecay.audio
      )

    if (identifier == Cards.Spell.GoneWithTheWind)
      card = new SpellApplyModifiers(gameSession)
      card.factionId = Factions.Faction3
      card.setCardSetId(CardSet.Coreshatter)
      card.id = Cards.Spell.GoneWithTheWind
      card.name = "枯萎"
      card.setDescription("一个敌人的随从在你下一个回合开始时消失。")
      card.manaCost = 3
      card.rarityId = Rarity.Rare
      removeEntityContextObject = ModifierStartOpponentsTurnWatchRemoveEntity.createContextObject()
      removeEntityContextObject.appliedName = "凋零"
      removeEntityContextObject.appliedDescription = "轮到你时消失。"
      removeEntityContextObject.isRemovable = false
      card.setTargetModifiersContextObjects([
        removeEntityContextObject
      ])
      card.spellFilterType = SpellFilterType.EnemyDirect
      card.canTargetGeneral = false
      card.setFXResource(["FX.Cards.Spell.Wither"])
      card.setBaseSoundResource(
        apply : RSX.sfx_f6_icebeetle_death.audio
      )
      card.setBaseAnimResource(
        idle : RSX.iconGoneWithTheWindIdle.name
        active : RSX.iconGoneWithTheWindActive.name
      )

    if (identifier == Cards.Spell.SummoningStones)
      card = new SpellSummoningStones(gameSession)
      card.factionId = Factions.Faction3
      card.setCardSetId(CardSet.Coreshatter)
      card.id = Cards.Spell.SummoningStones
      card.name = "制造结界"
      card.setDescription("从你的地板上随机召唤一个欧贝莱克。")
      card.manaCost = 9
      card.rarityId = Rarity.Legendary
      card.spellFilterType = SpellFilterType.None
      card.setFXResource(["FX.Cards.Spell.CircleOfFabrication"])
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_manavortex.audio
      )
      card.setBaseAnimResource(
        idle : RSX.iconSummoningStonesIdle.name
        active : RSX.iconSummoningStonesActive.name
      )

    if (identifier == Cards.Faction3.CoughingGus)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction3
      card.name = "五号诺比克"
      card.setDescription("敌人的英雄不能施法。")
      card.atk = 4
      card.maxHP = 8
      card.manaCost = 5
      card.rarityId = Rarity.Epic
      card.setInherentModifiersContextObjects([ModifierEnemyCannotCastBBS.createContextObject()])
      card.setFXResource(["FX.Cards.Neutral.SunElemental"])
      card.setBoundingBoxWidth(50)
      card.setBoundingBoxHeight(90)
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_blindscorch.audio
        walk : RSX.sfx_neutral_sunelemental_impact.audio
        attack : RSX.sfx_neutral_sunelemental_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_sunelemental_hit.audio
        attackDamage : RSX.sfx_neutral_sunelemental_impact.audio
        death : RSX.sfx_neutral_sunelemental_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f3SakkakBreathing.name
        idle : RSX.f3SakkakIdle.name
        walk : RSX.f3SakkakRun.name
        attack : RSX.f3SakkakAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.0
        damage : RSX.f3SakkakHit.name
        death : RSX.f3SakkakDeath.name
      )

    if (identifier == Cards.Artifact.RepairSword)
      card = new Artifact(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction3
      card.id = Cards.Artifact.RepairSword
      card.name = "奥布拉托"
      card.setDescription("你的英雄获得+1攻击。\n在回合开始时，以1的耐久性修复所有装备。")
      card.manaCost = 2
      card.rarityId = Rarity.Epic
      card.durability = 3
      card.setTargetModifiersContextObjects([
        Modifier.createContextObjectWithAttributeBuffs(1,undefined),
        ModifierStartTurnWatchRestoreChargeToArtifacts.createContextObject()
      ])
      card.setFXResource(["FX.Cards.Artifact.Winterblade"])
      card.setBaseAnimResource(
        idle: RSX.iconRepairStaffIdle.name
        active: RSX.iconRepairStaffActive.name
      )
      card.setBaseSoundResource(
        apply : RSX.sfx_victory_crest.audio
      )

    if (identifier == Cards.Faction3.CursedDervish)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction3
      card.name = "尘埃制造者"
      card.raceId = Races.Dervish
      card.setDescription("强化：对敌方英雄造成1点伤害，这个随从获得+1点生命值。")
      card.atk = 2
      card.maxHP = 1
      card.manaCost = 2
      card.rarityId = Rarity.Common
      card.setInherentModifiersContextObjects([
        ModifierIntensifyDamageEnemyGeneral.createContextObject(1),
        ModifierIntensifyBuffSelf.createContextObject(0, 1, "Borrowed Time"),
        ModifierCounterIntensify.createContextObject()
      ])
      card.setBoundingBoxWidth(100)
      card.setBoundingBoxHeight(80)
      card.setFXResource(["FX.Cards.Neutral.WhiteWidow"])
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_icepillar_melt.audio
        walk : RSX.sfx_neutral_primordialgazer_death.audio
        attack : RSX.sfx_f6_seismicelemental_attack_impact.audio
        receiveDamage : RSX.sfx_neutral_golembloodshard_hit.audio
        attackDamage : RSX.sfx_f2lanternfox_death.audio
        death : RSX.sfx_f2lanternfox_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f3CursedDervishBreathing.name
        idle : RSX.f3CursedDervishIdle.name
        walk : RSX.f3CursedDervishRun.name
        attack : RSX.f3CursedDervishAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.2
        damage : RSX.f3CursedDervishHit.name
        death : RSX.f3CursedDervishDeath.name
      )

    if (identifier == Cards.Spell.GrabAThing)
      card = new SpellDrawArtifact(gameSession)
      card.factionId = Factions.Faction3
      card.setCardSetId(CardSet.Coreshatter)
      card.id = Cards.Spell.GrabAThing
      card.name = "工艺铸造厂"
      card.setDescription("从你的牌组中获取工艺品。")
      card.manaCost = 1
      card.rarityId = Rarity.Common
      card.spellFilterType = SpellFilterType.None
      card.setFXResource(["FX.Cards.Spell.PlanarFoundry"])
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_forcebarrier.audio
      )
      card.setBaseAnimResource(
        idle : RSX.iconGabArtifactIdle.name
        active : RSX.iconGabArtifactActive.name
      )

    if (identifier == Cards.Spell.ThoughtExchange)
      card = new SpellThoughtExchange(gameSession)
      card.factionId = Factions.Faction3
      card.setCardSetId(CardSet.Coreshatter)
      card.id = Cards.Spell.ThoughtExchange
      card.name = "联合仲裁"
      card.setDescription("给你的对手一个仆从，以较少的攻击控制附近的敌人小仆从。")
      card.manaCost = 4
      card.rarityId = Rarity.Epic
      card.spellFilterType = SpellFilterType.AllyDirect
      card.canTargetGeneral = false
      card.setFXResource(["FX.Cards.Spell.SynapticArbitrage"])
      card.setBaseAnimResource(
        idle: RSX.iconThoughtExchangeIdle.name
        active: RSX.iconThoughtExchangeActive.name
      )
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_icepillar.audio
      )

    if (identifier == Cards.Spell.Metalworking)
      card = new SpellMetalworking(gameSession)
      card.factionId = Factions.Faction3
      card.setCardSetId(CardSet.Coreshatter)
      card.id = Cards.Spell.Metalworking
      card.name = "金属熔化"
      card.setDescription("装备一个在游戏中被摧毁的友方神器。")
      card.manaCost = 2
      card.rarityId = Rarity.Rare
      card.spellFilterType = SpellFilterType.None
      card.setFXResource(["FX.Cards.Spell.Metalmeld"])
      card.setBaseAnimResource(
        idle: RSX.iconMetalmeldIdle.name
        active: RSX.iconMetalmeldActive.name
      )
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_darktransformation.audio
      )

    if (identifier == Cards.Faction3.GoldenGuide)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction3
      card.name = "汗乌姆卡"
      card.raceId = Races.Dervish
      card.setDescription("飞翔，狂奔：\n一个随机的友方的苦行僧消失了，在它的位置召唤了一个汗乌姆卡。")
      card.atk = 3
      card.maxHP = 3
      card.manaCost = 5
      card.rarityId = Rarity.Legendary
      card.setInherentModifiersContextObjects([
        ModifierFirstBlood.createContextObject(),
        ModifierFlying.createContextObject(),
        ModifierDyingWishGoldenGuide.createContextObject()
      ])
      card.setFXResource(["FX.Cards.Neutral.Fireblazer"])
      card.setBaseSoundResource(
        apply : RSX.sfx_unit_deploy_3.audio
        walk : RSX.sfx_singe2.audio
        attack : RSX.sfx_neutral_hailstonehowler_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_hailstonehowler_hit.audio
        attackDamage : RSX.sfx_neutral_hailstonehowler_attack_impact.audio
        death : RSX.sfx_neutral_hailstonehowler_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f3GoldenGuideBreathing.name
        idle : RSX.f3GoldenGuideIdle.name
        walk : RSX.f3GoldenGuideRun.name
        attack : RSX.f3GoldenGuideAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 0.6
        damage : RSX.f3GoldenGuideHit.name
        death : RSX.f3GoldenGuideDeath.name
      )

    if (identifier == Cards.Faction3.ScarabPulverizer)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction3
      card.name = "圣甲虫"
      card.setDescription("爆炸\n当这个仆从爆炸时，在这些空间里用飞行和冲刺召唤出1/1的红柱石。")
      card.atk = 5
      card.maxHP = 7
      card.manaCost = 6
      card.rarityId = Rarity.Legendary
      card.setInherentModifiersContextObjects([
        ModifierBlastAttackStrong.createContextObject(),
        ModifierMyAttackWatchScarabBlast.createContextObject()
      ])
      card.addKeywordClassToInclude(ModifierFirstBlood)
      card.addKeywordClassToInclude(ModifierFlying)
      card.addKeywordClassToInclude(ModifierTokenCreator)
      card.setFXResource(["FX.Cards.Neutral.Serpenti"])
      card.setBoundingBoxWidth(105)
      card.setBoundingBoxHeight(80)
      card.setBaseSoundResource(
        apply : RSX.sfx_unit_deploy.audio
        walk : RSX.sfx_singe2.audio
        attack : RSX.sfx_neutral_serpenti_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_serpenti_hit.audio
        attackDamage : RSX.sfx_neutral_serpenti_attack_impact.audio
        death : RSX.sfx_neutral_serpenti_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f3ScarabPulverizerBreathing.name
        idle : RSX.f3ScarabPulverizerIdle.name
        walk : RSX.f3ScarabPulverizerRun.name
        attack : RSX.f3ScarabPulverizerAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 0.3
        damage : RSX.f3ScarabPulverizerHit.name
        death : RSX.f3ScarabPulverizerDeath.name
      )

    if (identifier == Cards.Faction3.Scarab)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction3
      card.name = "红柱石"
      card.setDescription("飞行\n滑行")
      card.atk = 1
      card.maxHP = 1
      card.manaCost = 1
      card.rarityId = Rarity.TokenUnit
      card.setIsHiddenInCollection(true)
      card.setInherentModifiersContextObjects([
        ModifierFlying.createContextObject(),
        ModifierFirstBlood.createContextObject()
      ])
      card.addKeywordClassToInclude(ModifierToken)
      card.setFXResource(["FX.Cards.Neutral.BlackLocust"])
      card.setBaseSoundResource(
        apply : RSX.sfx_summonlegendary.audio
        walk : RSX.sfx_neutral_zurael_death.audio
        attack : RSX.sfx_neutral_stormatha_attack_swing.audio
        receiveDamage :  RSX.sfx_neutral_stormatha_hit.audio
        attackDamage : RSX.sfx_neutral_stormatha_attack_impact.audio
        death : RSX.sfx_neutral_stormatha_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f3MiniScarabBreathing.name
        idle : RSX.f3MiniScarabIdle.name
        walk : RSX.f3MiniScarabRun.name
        attack : RSX.f3MiniScarabAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.2
        damage : RSX.f3MiniScarabHit.name
        death : RSX.f3MiniScarabDeath.name
      )

    if (identifier == Cards.Faction3.StaffWielder)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction3
      card.name = "原子克林格"
      card.setDescription("每当你装备一件神器时，这个随从获得的+攻击等于该神器的费用。")
      card.atk = 1
      card.maxHP = 5
      card.manaCost = 3
      card.rarityId = Rarity.Rare
      buffName = "原子化"
      card.setInherentModifiersContextObjects([ModifierEquipFriendlyArtifactWatchGainAttackEqualToCost.createContextObject(buffName)])
      card.setFXResource(["FX.Cards.Neutral.ArakiHeadhunter"])
      card.setBaseSoundResource(
        apply : RSX.sfx_neutral_fog_attack_swing.audio
        walk : RSX.sfx_neutral_earthwalker_death.audio
        attack : RSX.sfx_neutral_arakiheadhunter_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_arakiheadhunter_hit.audio
        attackDamage : RSX.sfx_neutral_arakiheadhunter_impact.audio
        death : RSX.sfx_neutral_arakiheadhunter_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f3StaffWielderBreathing.name
        idle : RSX.f3StaffWielderIdle.name
        walk : RSX.f3StaffWielderRun.name
        attack : RSX.f3StaffWielderAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.2
        damage : RSX.f3StaffWielderHit.name
        death : RSX.f3StaffWielderDeath.name
      )

    return card

module.exports = CardFactory_CoreshatterSet_Faction3
