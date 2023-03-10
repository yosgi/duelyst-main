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
SpellIntensifyIncreasingDominance = require 'app/sdk/spells/spellIntensifyIncreasingDominance'
SpellBuffAttributeByOtherAttribute = require 'app/sdk/spells/spellBuffAttributeByOtherAttribute'
SpellResilience = require 'app/sdk/spells/spellResilience'
SpellRally = require 'app/sdk/spells/spellRally'
SpellChargeIntoBattle = require 'app/sdk/spells/spellChargeIntoBattle'
SpellOnceMoreWithProvoke = require 'app/sdk/spells/spellOnceMoreWithProvoke'

Modifier = require 'app/sdk/modifiers/modifier'
ModifierBandingFlying = require 'app/sdk/modifiers/modifierBandingFlying'
ModifierProvoke = require 'app/sdk/modifiers/modifierProvoke'
ModifierIntensifyOneManArmy = require 'app/sdk/modifiers/modifierIntensifyOneManArmy'
ModifierFriendsguard = require 'app/sdk/modifiers/modifierFriendsguard'
ModifierMyGeneralAttackWatchSpawnRandomEntityFromDeck = require 'app/sdk/modifiers/modifierMyGeneralAttackWatchSpawnRandomEntityFromDeck'
ModifierStartsInHand = require 'app/sdk/modifiers/modifierStartsInHand'
ModifierTranscendance = require 'app/sdk/modifiers/modifierTranscendance'
ModifierInvulnerable = require 'app/sdk/modifiers/modifierInvulnerable'
ModifierCardControlledPlayerModifiers = require 'app/sdk/modifiers/modifierCardControlledPlayerModifiers'
ModifierBanding = require 'app/sdk/modifiers/modifierBanding'
ModifierStartTurnWatchImmolateDamagedMinions = require 'app/sdk/modifiers/modifierStartTurnWatchImmolateDamagedMinions'
ModifierOnSummonFromHandApplyEmblems = require 'app/sdk/modifiers/modifierOnSummonFromHandApplyEmblems'
ModifierTokenCreator = require 'app/sdk/modifiers/modifierTokenCreator'
ModifierFateLyonarSmallMinionQuest = require 'app/sdk/modifiers/modifierFateLyonarSmallMinionQuest'
ModifierCannotBeReplaced = require 'app/sdk/modifiers/modifierCannotBeReplaced'
ModifierIntensify = require 'app/sdk/modifiers/modifierIntensify'
ModifierFlying = require 'app/sdk/modifiers/modifierFlying'
ModifierOpeningGambit = require 'app/sdk/modifiers/modifierOpeningGambit'
ModifierCounterIntensify = require 'app/sdk/modifiers/modifierCounterIntensify'
ModifierCannotBeRemovedFromHand = require 'app/sdk/modifiers/modifierCannotBeRemovedFromHand'

PlayerModifierEmblemEndTurnWatchLyonarSmallMinionQuest = require 'app/sdk/playerModifiers/playerModifierEmblemEndTurnWatchLyonarSmallMinionQuest'

i18next = require 'i18next'
if i18next.t() is undefined
  i18next.t = (text) ->
    return text

class CardFactory_CoreshatterSet_Faction1

  ###*
   * Returns a card that matches the identifier.
   * @param {Number|String} identifier
   * @param {GameSession} gameSession
   * @returns {Card}
   ###
  @cardForIdentifier: (identifier,gameSession) ->
    card = null

    if (identifier == Cards.Faction1.RightfulHeir)
      card = new Unit(gameSession)
      card.factionId = Factions.Faction1
      card.setCardSetId(CardSet.Coreshatter)
      card.name = "大将军"
      card.setDescription("审判：召唤12名随从，攻击次数不超过1次。\n目标：在回合结束时提升其他友方随从.")
      card.atk = 5
      card.maxHP = 5
      card.manaCost = 5
      card.rarityId = Rarity.Mythron
      emblemModifier = PlayerModifierEmblemEndTurnWatchLyonarSmallMinionQuest.createContextObject()
      emblemModifier.appliedName = "大将军"
      emblemModifier.appliedDescription = "你的回合结束时，将大将军以外的友军随从转化为多花费1法力的势力随从."
      card.setInherentModifiersContextObjects([
        ModifierStartsInHand.createContextObject(),
        ModifierCannotBeReplaced.createContextObject(),
        ModifierOnSummonFromHandApplyEmblems.createContextObject([emblemModifier], true, false),
        ModifierFateLyonarSmallMinionQuest.createContextObject(12),
        ModifierCannotBeRemovedFromHand.createContextObject()
      ])
      card.setFXResource(["FX.Cards.Neutral.TwilightMage"])
      card.setBoundingBoxWidth(50)
      card.setBoundingBoxHeight(75)
      card.setBaseSoundResource(
        apply : RSX.sfx_ui_booster_packexplode.audio
        walk : RSX.sfx_singe2.audio
        attack : RSX.sfx_f2_jadeogre_attack_swing.audio
        receiveDamage : RSX.sfx_f3_dunecaster_hit.audio
        attackDamage : RSX.sfx_f3_dunecaster_impact.audio
        death : RSX.sfx_f3_dunecaster_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f1RightfulHeirBreathing.name
        idle : RSX.f1RightfulHeirIdle.name
        walk : RSX.f1RightfulHeirRun.name
        attack : RSX.f1RightfulHeirAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.3
        damage : RSX.f1RightfulHeirHit.name
        death : RSX.f1RightfulHeirDeath.name
      )

    if (identifier == Cards.Spell.IncreasingDominance)
      card = new SpellIntensifyIncreasingDominance(gameSession)
      card.factionId = Factions.Faction1
      card.setCardSetId(CardSet.Coreshatter)
      card.id = Cards.Spell.IncreasingDominance
      card.name = "鼓舞"
      card.setDescription("强化：给予友方单位+2生命值.")
      card.manaCost = 2
      card.rarityId = Rarity.Common
      card.modifierAppliedName = "改善"
      card.spellFilterType = SpellFilterType.None
      card.addKeywordClassToInclude(ModifierIntensify)
      card.setInherentModifiersContextObjects([ModifierCounterIntensify.createContextObject()])
      card.setFXResource(["FX.Cards.Spell.Bolster"])
      card.setBaseAnimResource(
        idle: RSX.iconIncreasingDominanceIdle.name
        active: RSX.iconIncreasingDominanceActive.name
      )
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_kineticequilibrium.audio
      )

    if (identifier == Cards.Faction1.OneManArmy)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction1
      card.name = "燃烧军团"
      card.setDescription("强化：将1个怨气放入准备栏。把这个仆从的复制品塞进你的牌组。")
      card.atk = 3
      card.maxHP = 2
      card.manaCost = 3
      card.rarityId = Rarity.Common
      card.setInherentModifiersContextObjects([
        ModifierIntensifyOneManArmy.createContextObject(),
        ModifierCounterIntensify.createContextObject()
      ])
      card.addKeywordClassToInclude(ModifierTokenCreator)
      card.setFXResource(["FX.Cards.Faction1.SilverguardSquire"])
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_immolation_b.audio
        walk : RSX.sfx_singe2.audio
        attack : RSX.sfx_f1silverguardsquire_attack_swing.audio
        receiveDamage : RSX.sfx_f1silverguardsquire_hit.audio
        attackDamage : RSX.sfx_f1silverguardsquire_attack_impact.audio
        death : RSX.sfx_f1silverguardsquire_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f1KaiserGladiatorBreathing.name
        idle : RSX.f1KaiserGladiatorIdle.name
        walk : RSX.f1KaiserGladiatorRun.name
        attack : RSX.f1KaiserGladiatorAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 0.6
        damage : RSX.f1KaiserGladiatorHit.name
        death : RSX.f1KaiserGladiatorDeath.name
      )

    if (identifier == Cards.Faction1.CatapultGryphon)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction1
      card.name = "鹰头狮飞行"
      card.setDescription("狂热: 飞翔")
      card.atk = 5
      card.maxHP = 3
      card.manaCost = 3
      card.rarityId = Rarity.Rare
      card.setInherentModifiersContextObjects([
        ModifierBandingFlying.createContextObject()
      ])
      card.addKeywordClassToInclude(ModifierFlying)
      card.setFXResource(["FX.Cards.Neutral.WingsOfParadise"])
      card.setBaseSoundResource(
        apply : RSX.sfx_neutral_ubo_attack_swing.audio
        walk : RSX.sfx_neutral_ubo_attack_swing.audio
        attack : RSX.sfx_neutral_wingsofparadise_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_wingsofparadise_hit.audio
        attackDamage : RSX.sfx_neutral_wingsofparadise_attack_impact.audio
        death : RSX.sfx_neutral_wingsofparadise_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f1GryphinoxBreathing.name
        idle : RSX.f1GryphinoxIdle.name
        walk : RSX.f1GryphinoxRun.name
        attack : RSX.f1GryphinoxAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.2
        damage : RSX.f1GryphinoxHit.name
        death : RSX.f1GryphinoxDeath.name
      )

    if (identifier == Cards.Spell.DivinestBonderest)
      card = new SpellBuffAttributeByOtherAttribute(gameSession)
      card.factionId = Factions.Faction1
      card.setCardSetId(CardSet.Coreshatter)
      card.id = Cards.Spell.DivinestBonderest
      card.name = "神圣礼仪"
      card.setDescription("给予所有友方随从与自身生命值相等的攻击。")
      card.manaCost = 6
      card.rarityId = Rarity.Rare
      card.spellFilterType = SpellFilterType.AllyIndirect
      card.radius = CONFIG.WHOLE_BOARD_RADIUS
      card.attributeTarget = "atk"
      card.attributeSource = "hp"
      card.appliedName = "意志力"
      card.appliedDescription = "获得攻击提升等于生命值"
      card.setFXResource(["FX.Cards.Spell.DivineLiturgy"])
      card.setBaseSoundResource(
        apply : RSX.sfx_f6_voiceofthewind_attack_impact.audio
      )
      card.setBaseAnimResource(
        idle : RSX.iconDivinestBondIdle.name
        active : RSX.iconDivinestBondActive.name
      )

    if (identifier == Cards.Spell.Resilience)
      card = new SpellResilience(gameSession)
      card.factionId = Factions.Faction1
      card.setCardSetId(CardSet.Coreshatter)
      card.id = Cards.Spell.Resilience
      card.name = "生命泉"
      card.setDescription("完全治愈一个友好的仆从，然后从你的牌组中抽取一个副本。")
      card.manaCost = 1
      card.rarityId = Rarity.Common
      card.spellFilterType = SpellFilterType.AllyDirect
      card.canTargetGeneral = false
      card.setFXResource(["FX.Cards.Spell.Lifestream"])
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_fountainofyouth.audio
      )
      card.setBaseAnimResource(
        idle : RSX.iconLifestreamIdle.name
        active : RSX.iconLifestreamActive.name
      )

    if (identifier == Cards.Faction1.Friendsguard)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction1
      card.name = "风崖保护器"
      card.setDescription("挑衅\n当一个友好的温克利夫警长死亡时，将这个仆从转变为温克利夫警员")
      card.atk = 5
      card.maxHP = 5  
      card.manaCost = 5
      card.rarityId = Rarity.Epic
      card.setInherentModifiersContextObjects([
        ModifierProvoke.createContextObject(),
        ModifierFriendsguard.createContextObject({id: Cards.Faction1.FriendFighter})
      ])
      card.setFXResource(["FX.Cards.Neutral.GoldenJusticar"])
      card.setBoundingBoxWidth(105)
      card.setBoundingBoxHeight(100)
      card.setBaseSoundResource(
        apply : RSX.sfx_unit_deploy_3.audio
        walk : RSX.sfx_neutral_earthwalker_death.audio
        attack : RSX.sfx_f5_vindicator_attack_impact.audio
        receiveDamage : RSX.sfx_neutral_grimrock_hit.audio
        attackDamage : RSX.sfx_neutral_grimrock_attack_impact.audio
        death : RSX.sfx_neutral_grimrock_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f1FriendsGuardBreathing.name
        idle : RSX.f1FriendsGuardIdle.name
        walk : RSX.f1FriendsGuardRun.name
        attack : RSX.f1FriendsGuardAttack.name
        attackReleaseDelay: 0.0 
        attackDelay: 0.8
        damage : RSX.f1FriendsGuardHit.name
        death : RSX.f1FriendsGuardDeath.name
      )

    if (identifier == Cards.Faction1.FriendFighter)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction1
      card.name = "温克利夫警长"
      card.setDescription("宣告: 从你的甲板上召唤一个5/5 激怒的温克利夫保护者")
      card.atk = 2
      card.maxHP = 2
      card.manaCost = 4
      card.rarityId = Rarity.Common
      card.setFollowups([
        {
          id: Cards.Spell.FollowupSpawnEntityFromDeck
        }
      ])
      card.addKeywordClassToInclude(ModifierOpeningGambit)
      card.addKeywordClassToInclude(ModifierProvoke)
      card.setFXResource(["FX.Cards.Faction1.RadiantDragoon"])
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_immolation_b.audio
        walk : RSX.sfx_neutral_arcanelimiter_attack_impact.audio
        attack : RSX.sfx_neutral_rook_attack_swing.audio
        receiveDamage : RSX.sfx_f2_kaidoassassin_hit.audio
        attackDamage : RSX.sfx_neutral_rook_attack_impact.audio
        death : RSX.sfx_neutral_windstopper_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f1BaastChampionBreathing.name
        idle : RSX.f1BaastChampionIdle.name
        walk : RSX.f1BaastChampionRun.name
        attack : RSX.f1BaastChampionAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.2
        damage : RSX.f1BaastChampionHit.name
        death : RSX.f1BaastChampionDeath.name
      )

    if (identifier == Cards.Spell.Rally)
      card = new SpellRally(gameSession)
      card.factionId = Factions.Faction1
      card.setCardSetId(CardSet.Coreshatter)
      card.id = Cards.Spell.Rally
      card.name = "行军命令"
      card.setDescription("在你的英雄+2/+2的正前方和后方给予友好的随从。如果他们有狂热，他们就不能被敌人的法术所针对.")
      card.manaCost = 2
      card.rarityId = Rarity.Rare
      card.buffName = "Marching Command"
      card.spellFilterType = SpellFilterType.None
      card.canTargetGeneral = false
      card.addKeywordClassToInclude(ModifierBanding)
      card.setFXResource(["FX.Cards.Spell.MarchingOrders"])
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_forcebarrier.audio
      )
      card.setBaseAnimResource(
        idle : RSX.iconRallyIdle.name
        active : RSX.iconRallyActive.name
      )

    if (identifier == Cards.Artifact.TwoHander)
      card = new Artifact(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction1
      card.id = Cards.Artifact.TwoHander
      card.name = "辐射"
      card.setDescription("你的英雄有+3攻击。\n当你的将军攻击时，从附近的甲板上召唤一个3法力的仆从.")
      card.manaCost = 6
      card.rarityId = Rarity.Epic
      card.durability = 3
      card.setTargetModifiersContextObjects([
        Modifier.createContextObjectWithAttributeBuffs(3,undefined),
        ModifierMyGeneralAttackWatchSpawnRandomEntityFromDeck.createContextObject(3,true,1)
      ])
      card.setFXResource(["FX.Cards.Artifact.SunstoneBracers"])
      card.setBaseAnimResource(
        idle: RSX.iconIronBannerIdle.name
        active: RSX.iconIronBannerActive.name
      )
      card.setBaseSoundResource(
        apply : RSX.sfx_victory_crest.audio
      )

    if (identifier == Cards.Spell.ChargeIntoBattle)
      card = new SpellChargeIntoBattle(gameSession)
      card.factionId = Factions.Faction1
      card.setCardSetId(CardSet.Coreshatter)
      card.id = Cards.Spell.ChargeIntoBattle
      card.name = "瞻仰"
      card.setDescription("将迅捷交给你英雄身后的一个友好随从。")
      card.manaCost = 5
      card.rarityId = Rarity.Epic
      card.spellFilterType = SpellFilterType.AllyDirect
      card.canTargetGeneral = false
      celerityObject = ModifierTranscendance.createContextObject()
      card.setTargetModifiersContextObjects([
        celerityObject
      ])
      card.addKeywordClassToInclude(ModifierTranscendance)
      card.setFXResource(["FX.Cards.Spell.Lionize"])
      card.setBaseSoundResource(
        apply : RSX.sfx_neutral_arakiheadhunter_attack_swing.audio
      )
      card.setBaseAnimResource(
        idle : RSX.iconChargeIntoBattleIdle.name
        active : RSX.iconChargeIntoBattleActive.name
      )

    if (identifier == Cards.Faction1.Invincibuddy)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction1
      card.name = "上帝之手"
      card.setDescription("你的英雄无敌，但无法移动或攻击。")
      card.atk = 7
      card.maxHP = 9
      card.manaCost = 7
      card.rarityId = Rarity.Legendary
      card.setInherentModifiersContextObjects([
        ModifierCardControlledPlayerModifiers.createContextObjectOnBoardToTargetOwnPlayer([ModifierInvulnerable.createContextObject()])
      ])
      card.addKeywordClassToInclude(ModifierInvulnerable)
      card.setBoundingBoxWidth(100)
      card.setBoundingBoxHeight(60)
      card.setFXResource(["FX.Cards.Neutral.BlisteringSkorn"])
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_icepillar_melt.audio
        walk : RSX.sfx_neutral_primordialgazer_death.audio
        attack : RSX.sfx_neutral_pandora_attack_impact.audio
        receiveDamage : RSX.sfx_neutral_makantorwarbeast_hit.audio
        attackDamage : RSX.sfx_neutral_makantorwarbeast_attack_impact.audio
        death : RSX.sfx_neutral_makantorwarbeast_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f1InvincibuddyBreathing.name
        idle : RSX.f1InvincibuddyIdle.name
        walk : RSX.f1InvincibuddyRun.name
        attack : RSX.f1InvincibuddyAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 1.2
        damage : RSX.f1InvincibuddyHit.name
        death : RSX.f1InvincibuddyDeath.name
      )

    if (identifier == Cards.Faction1.SuntideExpert)
      card = new Unit(gameSession)
      card.setCardSetId(CardSet.Coreshatter)
      card.factionId = Factions.Faction1
      card.name = "战争驱魔师"
      card.setDescription("挑衅：\n在你的回合开始时，神圣献祭你受伤的随从.")
      card.atk = 3
      card.maxHP = 8
      card.manaCost = 5
      card.rarityId = Rarity.Legendary
      card.setInherentModifiersContextObjects([
        ModifierProvoke.createContextObject(),
        ModifierStartTurnWatchImmolateDamagedMinions.createContextObject()
      ])
      card.setFXResource(["FX.Cards.Neutral.Grailmaster"])
      card.setBoundingBoxWidth(100)
      card.setBoundingBoxHeight(105)
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_diretidefrenzy.audio
        walk : RSX.sfx_neutral_sai_attack_impact.audio
        attack : RSX.sfx_neutral_spiritscribe_attack_swing.audio
        receiveDamage : RSX.sfx_neutral_spiritscribe_hit.audio
        attackDamage : RSX.sfx_neutral_spiritscribe_impact.audio
        death : RSX.sfx_neutral_spiritscribe_death.audio
      )
      card.setBaseAnimResource(
        breathing : RSX.f1LeovoyantBreathing.name
        idle : RSX.f1LeovoyantIdle.name
        walk : RSX.f1LeovoyantRun.name
        attack : RSX.f1LeovoyantAttack.name
        attackReleaseDelay: 0.0
        attackDelay: 0.9
        damage : RSX.f1LeovoyantHit.name
        death : RSX.f1LeovoyantDeath.name
      )

    if (identifier == Cards.Spell.OnceMoreWithProvoke)
      card = new SpellOnceMoreWithProvoke(gameSession)
      card.factionId = Factions.Faction1
      card.setCardSetId(CardSet.Coreshatter)
      card.id = Cards.Spell.OnceMoreWithProvoke
      card.name = "阿玛辛誓言"
      card.setDescription("在你的英雄周围召唤所有在本场比赛中死亡的随从。")
      card.manaCost = 9
      card.rarityId = Rarity.Legendary
      card.addKeywordClassToInclude(ModifierProvoke)
      card.setFXResource(["FX.Cards.Spell.AmaranthineVow"])
      card.setBaseSoundResource(
        apply : RSX.sfx_spell_sunbloom.audio
      )
      card.setBaseAnimResource(
        idle : RSX.iconOnceMoreIdle.name
        active : RSX.iconOnceMoreActive.name
      )

    return card

module.exports = CardFactory_CoreshatterSet_Faction1
