local gt = this.getroottable();
gt.Const.AI <- {
	VerboseMode = true,
	BenchmarkMode = false,
	PathfindingDebugMode = false,
	SecretSpectatorMode = false,
	NoRetreatMode = false,
	NoDefendMode = false,
	ParallelizationMode = true,
	AllottedTimePerEvaluationRun = 0.005,
	HeatRange = 5,
	Agent = {
		ID = {
			Player = "agent.player",
			CharmedPlayer = "agent.charmed_player",
			Idle = "agent.idle",
			Zombie = "agent.zombie",
			ZombieBodyguard = "agent.zombie.bodyguard",
			SkeletonMelee = "agent.skeleton.melee",
			SkeletonPriest = "agent.skeleton.priest",
			SkeletonLich = "agent.skeleton.lich",
			MirrorImage = "agent.mirror_image",
			FlyingSkull = "agent.flying_skull",
			Direwolf = "agent.direwolf",
			Hyena = "agent.hyena",
			Lindwurm = "agent.lindwurm",
			Unhold = "agent.unhold",
			Schrat = "agent.schrat",
			Spider = "agent.spider",
			Serpent = "agent.serpent",
			Alp = "agent.alp",
			AlpShadow = "agent.alp_shadow",
			Hexe = "agent.hexe",
			Vampire = "agent.vampire",
			Ghost = "agent.ghost",
			Ghoul = "agent.ghoul",
			Kraken = "agent.kraken",
			KrakenTentacle = "agent.kraken_tentacle",
			TricksterGod = "agent.trickster_god",
			Necromancer = "agent.necromancer",
			Golem = "agent.golem",
			OrcYoung = "agent.orc.young",
			OrcSkirmisher = "agent.orc.skirmisher",
			OrcBerserker = "agent.orc.berserker",
			OrcWarrior = "agent.orc.warrior",
			OrcWarlord = "agent.orc.warlord",
			BanditRanged = "agent.bandit.ranged",
			BanditMelee = "agent.bandit.melee",
			BarbarianMelee = "agent.barbarian.melee",
			BarbarianDrummer = "agent.barbarian.drummer",
			BarbarianBeastmaster = "agent.barbarian.beastmaster",
			BountyHunter = "agent.bounty_hunter",
			BountyHunterRanged = "agent.bounty_hunter_ranged",
			MilitiaRanged = "agent.militia.ranged",
			MilitiaMelee = "agent.militia.melee",
			MilitaryMelee = "agent.military.melee",
			MilitaryRanged = "agent.military.ranged",
			MilitaryEngineer = "agent.military.engineer",
			CaravanMelee = "agent.caravan.melee",
			Wardog = "agent.wardog",
			Assassin = "agent.assassin",
			GoblinMelee = "goblin.melee",
			GoblinRanged = "goblin.ranged",
			GoblinShaman = "goblin.shaman",
			GoblinLeader = "goblin.leader",
			GoblinWolfrider = "goblin.wolfrider",
			LegendStollwurm = "agent.legend_stollwurm",
			LegendWhiteWarwolf = "agent.legend_whitewarwolf",
			LegendWhiteDirewolf = "agent.legend_whitewolf",
			LegendDemonAlp = "agent.legend_demonalp",
			LegendRedbackSpider = "agent.legend_redback",
			LegendSkinGhoul = "agent.legend_skin_ghoul",
			LegendBanditRabble = "agent.legend_bandit_rabble",
			LegendBanshee = "agent.legend_banshee",
			LegendDemonHound = "agent.legend_demon_hound",
			LegendVampireLord = "agent.legend_vampire_lord",
			LegendButcher = "agent.legend_butcher",
			Bear = "agent.bear",
			Boar = "agent.boar"
		},
		Intentions = {
			IsDefendingPosition = false,
			IsEngaging = false,
			IsHiding = false,
			IsRecuperating = false,
			IsChangingWeapons = false,
			IsKnockingBack = false,
			Target = null,
			APToReachTarget = 0,
			TargetTile = null,
			IntermediateTargetTile = null
		},
		Orders = {
			IsEngaging = false,
			IsDefending = false,
			IsRetreating = false
		},
		ConsiderBehaviorsCutoff = 0.25,
		ActionDelay = 900,
		MinorActionDelay = 400,
		NewTurnDelay = 800,
		NewTurnDelayWithFasterMovement = 200,
		NewEvaluationDelay = 800,
		CameraAdditionalDelay = 400,
		DefaultOpponentTTL = 9000,
		DefaultAllyTTL = 3,
		GuessOpponentNewPositionMaxDistance = 3,
		LuckyGuessPositionMaxDistance = 1,
		LastAlienLimit = 3,
		MaxFleeAttemptsPerTurn = 2,
		ChanceToHaveProtectBehavior = 10
	},
	Properties = {
		BehaviorMult = [],
		TargetPriorityHitchanceMult = 0.5,
		TargetPriorityHitpointsMult = 0.3,
		TargetPriorityRandomMult = 0.0,
		TargetPriorityDamageMult = 0.2,
		TargetPriorityFleeingMult = 0.6,
		TargetPriorityHittingAlliesMult = 0.1,
		TargetPriorityFinishTreshhold = 1.25,
		TargetPriorityFinishOpponentMult = 3.0,
		TargetPriorityFinishArmorMult = 1.5,
		TargetPriorityCounterSkillsMult = 0.5,
		TargetPriorityArmorMult = 1.0,
		TargetPriorityDebilitatedMult = 1.0,
		TargetPriorityMoraleMult = 0.0,
		TargetPriorityBraveryMult = 0.0,
		TargetPriorityAoEMult = 1.0,
		OverallMagnetismMult = 1.0,
		OverallDefensivenessMult = 1.0,
		OverallFormationMult = 1.0,
		OverallHideMult = 0.0,
		EngageWhenAlreadyEngagedMult = 0.25,
		EngageTargetMultipleOpponentsMult = 1.0,
		EngageOnGoodTerrainBonusMult = 1.0,
		EngageOnBadTerrainPenaltyMult = 1.0,
		EngageAgainstSpearwallMult = 1.33,
		EngageAgainstSpearwallWithShieldwallMult = 0.75,
		EngageTargetArmedWithRangedWeaponMult = 1.33,
		EngageTargetAlreadyBeingEngagedMult = 1.0,
		EngageLockDownTargetMult = 1.0,
		EngageFlankingMult = 1.0,
		EngageRangeMin = 1,
		EngageRangeMax = 1,
		EngageRangeIdeal = 1,
		EngageTileLimit = 0,
		EngageEnemiesInLinePreference = 1,
		EngageHeatCostMult = 1.0,
		EngageDangerTolerance = 0,
		PreferWait = false,
		PreferCarefulEngage = true,
		IgnoreTargetValueOnEngage = false,
		IsRangedUnit = false,
		DontEngage = false
	},
	Behavior = {
		ID = {
			None = 0,
			Idle = 1,
			Flee = 2,
			Roam = 3,
			Defend = 4,
			KeepSafe = 5,
			Protect = 6,
			EngageMelee = 7,
			EngageRanged = 8,
			Darkflight = 9,
			AttackDefault = 10,
			AttackBow = 11,
			SplitShield = 12,
			Split = 13,
			Swing = 14,
			Thresh = 15,
			CrushArmor = 16,
			Puncture = 17,
			Lash = 18,
			Decapitate = 19,
			KnockOut = 20,
			Terror = 21,
			Shieldwall = 22,
			Spearwall = 23,
			KnockBack = 24,
			Riposte = 25,
			Rotation = 26,
			SwitchToMelee = 27,
			SwitchToRanged = 28,
			SwitchToShield = 29,
			CommandUndead = 30,
			RaiseUndead = 31,
			GruesomeFeast = 32,
			Hook = 33,
			Hide = 34,
			Charge = 35,
			Warcry = 36,
			LineBreaker = 37,
			Reload = 38,
			Retreat = 39,
			RetreatAlways = 40,
			BreakFree = 41,
			ThrowNet = 42,
			Root = 43,
			SwarmOfInsects = 44,
			BoostMorale = 45,
			Disengage = 46,
			Rally = 47,
			Recover = 48,
			PossessUndead = 49,
			Reap = 50,
			Horror = 51,
			Miasma = 52,
			SwallowWhole = 53,
			MoveTail = 54,
			Nightmare = 55,
			Charm = 56,
			Hex = 57,
			PickupWeapon = 58,
			Drag = 59,
			MoveTentacle = 60,
			UsePotion = 61,
			GrantNightVision = 62,
			WakeUpAlly = 63,
			Sleep = 64,
			Adrenaline = 65,
			BoostStamina = 66,
			AlwaysUse = 67,
			Teleport = 68,
			Indomitable = 69,
			AlpTeleport = 70,
			Deathblow = 71,
			Gash = 72,
			ThrowBomb = 73,
			Mortar = 74,
			Merge = 75,
			Distract = 76,
			AttackHandgonne = 77,
			MirrorImage = 78,
			FlyingSkulls = 79,
			LightningStorm = 80,
			Wither = 81,
			Explode = 82,
			MoveToMerge = 83,
			Howl = 84,
			SpawnShadow = 85,
			COUNT = 86
		},
		Name = [
			"None",
			"Idle",
			"Flee",
			"Roam",
			"Defend",
			"KeepSafe",
			"Protect",
			"Engage.Melee",
			"Engage.Ranged",
			"Darkflight",
			"Attack.Default",
			"Attack.Bow",
			"Attack.SplitShield",
			"Attack.Split",
			"Attack.Swing",
			"Attack.Thresh",
			"Attack.CrushArmor",
			"Attack.Puncture",
			"Attack.Lash",
			"Attack.Decapitate",
			"Attack.KnockOut",
			"Attack.Terror",
			"Defend.Shieldwall",
			"Defend.Spearwall",
			"Defend.Knockback",
			"Defend.Riposte",
			"Defend.Rotation",
			"SwitchTo.Melee",
			"SwitchTo.Ranged",
			"SwitchTo.Shield",
			"CommandUndead",
			"RaiseUndead",
			"GruesomeFeast",
			"Hook",
			"Hide",
			"Charge",
			"Warcry",
			"LineBreaker",
			"Reload",
			"Retreat",
			"RetreatAlways",
			"BreakFree",
			"Attack.ThrowNet",
			"Defend.Root",
			"Defend.SwarmOfInsects",
			"BoostMorale",
			"Disengage",
			"Rally",
			"Recover",
			"PossessUndead",
			"Attack.Reap",
			"Horror",
			"Miasma",
			"SwallowWhole",
			"MoveTail",
			"Nightmare",
			"Charm",
			"Hex",
			"Pickup.Weapon",
			"Drag",
			"MoveTentacle",
			"UsePotion",
			"GrantNightVision",
			"WakeUpAlly",
			"Sleep",
			"Adrenaline",
			"BoostStamina",
			"AlwaysUse",
			"Teleport",
			"Defend.Indomitable",
			"AlpTeleport",
			"Attack.Deathblow",
			"Attack.Gash",
			"ThrowBomb",
			"Mortar",
			"Merge",
			"Distract",
			"Attack.Handgonne",
			"MirrorImage",
			"FlyingSkulls",
			"LightningStorm",
			"Wither",
			"Explode",
			"MoveToMerge",
			"Howl",
			"SpawnShadow",
		],
		Order = {
			Retreat = 2,
			RetreatAlways = 2,
			Flee = 3,
			Roam = 3,
			Charge = 4,
			Drag = 4,
			BreakFree = 5,
			Protect = 9,
			Adrenaline = 9,
			EngageMelee = 10,
			EngageRanged = 11,
			MoveToMerge = 11,
			Darkflight = 12,
			MoveTail = 12,
			MoveTentacle = 12,
			Hide = 16,
			ThrowNet = 20,
			AttackDefault = 20,
			AttackBow = 21,
			AttackHandgonne = 21,
			Mortar = 21,
			Reload = 22,
			SplitShield = 22,
			Split = 23,
			Swing = 24,
			Reap = 24,
			CrushArmor = 25,
			Decapitate = 26,
			KnockOut = 27,
			Distract = 28,
			Thresh = 28,
			Puncture = 28,
			Lash = 28,
			Deathblow = 28,
			Gash = 28,
			Defend = 29,
			Shieldwall = 30,
			Indomitable = 30,
			Spearwall = 31,
			KnockBack = 32,
			Hook = 33,
			SwitchToMelee = 34,
			SwitchToRanged = 35,
			SwitchToShield = 35,
			PickupWeapon = 35,
			LineBreaker = 36,
			Riposte = 37,
			Rotation = 38,
			Disengage = 38,
			Root = 39,
			Horror = 39,
			Sleep = 39,
			Miasma = 39,
			Nightmare = 39,
			SwarmOfInsects = 39,
			BoostMorale = 39,
			Charm = 39,
			Hex = 39,
			Teleport = 39,
			Explode = 39,
			SpawnShadow = 39,
			SwallowWhole = 50,
			Terror = 50,
			Howl = 50,
			CommandUndead = 50,
			RaiseUndead = 50,
			PossessUndead = 50,
			GruesomeFeast = 50,
			Warcry = 50,
			Rally = 50,
			Recover = 50,
			UsePotion = 50,
			ThrowBomb = 50,
			GrantNightVision = 50,
			WakeUpAlly = 50,
			BoostStamina = 50,
			AlpTeleport = 50,
			MirrorImage = 50,
			FlyingSkulls = 50,
			LightningStorm = 50,
			Wither = 50,
			KeepSafe = 100,
			AlwaysUse = 100,
			Merge = 100,
			Idle = 1000
		},
		Score = {
			Zero = 0,
			AlpTeleport = 0,
			Idle = 1,
			Roam = 10,
			Adrenaline = 30,
			Riposte = 40,
			Recuperate = 50,
			Shieldwall = 50,
			Indomitable = 50,
			WakeUpAlly = 50,
			Warcry = 50,
			Distract = 50,
			SwarmOfInsects = 60,
			Disengage = 60,
			Howl = 60,
			CrushArmor = 80,
			SplitShield = 80,
			Defend = 90,
			ThrowNet = 90,
			SwitchToMelee = 100,
			SwitchToRanged = 100,
			SwitchToShield = 100,
			BreakFree = 100,
			ThrowBomb = 100,
			Explode = 100,
			BoostStamina = 100,
			BoostMorale = 100,
			Engage = 100,
			KnockOut = 100,
			Reload = 100,
			EngageRanged = 120,
			Hide = 120,
			LineBreaker = 120,
			Puncture = 120,
			Attack = 130,
			Lash = 130,
			Root = 130,
			Rally = 130,
			KnockBack = 150,
			Hook = 150,
			Decapitate = 150,
			Gash = 150,
			Recover = 150,
			Terror = 150,
			Sleep = 160,
			Deathblow = 180,
			Spearwall = 180,
			SwallowWhole = 200,
			Wither = 200,
			Rotation = 200,
			MoveTentacle = 200,
			Hex = 250,
			PossessUndead = 250,
			UsePotion = 250,
			Miasma = 250,
			Horror = 250,
			Charm = 300,
			MoveTail = 300,
			KeepSafe = 350,
			RaiseUndead = 350,
			Darkflight = 350,
			Split = 400,
			Swing = 400,
			Reap = 400,
			Thresh = 400,
			Mortar = 500,
			GruesomeFeast = 500,
			GrantNightVision = 500,
			Nightmare = 750,
			PickupWeapon = 1000,
			MoveToMerge = 2000,
			LightningStorm = 2000,
			MirrorImage = 2000,
			FlyingSkulls = 2000,
			Retreat = 2000,
			Protect = 2000,
			Drag = 2000,
			SpawnShadow = 2000,
			Teleport = 4000,
			AlwaysUse = 4000,
			Merge = 4000,
			Flee = 9000,
			IdleOnPlayerRetreat = 9000
		},
		IdleFinishTurnDelay = 0,
		AttackWhenAlmostDeadMult = 100.0,
		AttackRangedMaxAlliesAdjacent = 3,
		AttackRangedChancePOW = 1.9,
		AttackRangedScoreCutoff = 0.2,
		AttackRangedHitBystandersMult = 0.75,
		AttackDangerBonus = 5,
		AttackBadTerrainMult = 1.15,
		AttackLineOfFireBlockedMult = 0.5,
		AttackTargetNearlyDeadMult = 2.5,
		AttackAfterSwitchWeaponMult = 2.0,
		AttackDangerMult = 1.5,
		ZoneOfControlAPPenalty = 20,
		IgnoreDangerMinZones = 2,
		MinDangerHitpointsPct = 0.2,
		GlobalHitchanceValueMult = 1.1,
		LikelyPlayerBaitMult = 0.33,
		RoamChance = 50,
		RoamMaxRange = 6,
		RoamMaxAttempts = 4,
		FleeMaxAttemptsPerDirection = 4,
		RetreatMinAllyRatio = 0.35,
		RetreatFleeingMult = 2.0,
		RetreatAtMapBorderMult = 10.0,
		RetreatSoftMaxAttempts = 16,
		RetreatHardMaxAttempts = 64,
		EngageMaxAttempts = 18,
		EngageMaxDistance = 10,
		EngageLastAttemptDistance = 4,
		EngageOutOfRangePenalty = 3,
		EngageNotVisiblePenalty = 2,
		EngageBadTerrainPenalty = 4,
		EngageBadTerrainEffectPenalty = 12,
		EngageFleeingTargetPenalty = 8,
		EngageMultipleOpponentsPenalty = 2,
		EngageIntoZocWithReachWeaponPenalty = 6,
		EngageNextToAllyBonus = 2,
		EngageCoverWithReachWeaponMult = 1.0,
		EngageSpearwallTargetPenalty = 8,
		EngageRangedTargetBonus = 6,
		EngageTerrainLevelBonus = 9,
		EngageLockOpponentBonus = 5,
		EngageReachAndAttackBonus = 4,
		EngageTVValueMult = 0.5,
		EngageAlreadyEngagedPenaltyMult = 1.25,
		EngageIgnoreZoneChance = 33,
		EngageOnLevelDifferenceMult = 1.25,
		EngageOnBadTerrainMult = 0.85,
		EngageOnTerrainAdvantage = 1.33,
		EngageWhenAlreadyEngagedSafeMult = 3.0,
		EngageWhenAlreadyEngagedDefenseMult = 0.5,
		EngageWhenAlreadyEngagedHPMult = 1.0,
		EngageAllyOpponentToAllyDistance = 5.0,
		EngageInertiaMaxMult = 1.5,
		EngageInertiaMult = 1.15,
		EngageLastAttemptMult = 0.5,
		EngageLockdownMult = 1.1,
		EngageRangedTargetMult = 1.1,
		EngageTargetMultipleOpponentsMult = 1.1,
		EngageAllyVsOpponentMult = 0.5,
		EngageMovingTargetLongDistanceMult = 0.9,
		EngageLevelDisadvantagePenalty = 3,
		EngageLevelDisadvantageMult = 0.9,
		EngageAvoidDisadvantageBonus = 2,
		EngageNotIdealRangePenalty = 12,
		EngageAllyFormationMaxDistance = 3.0,
		EngageFormationBonus = 8.0,
		EngageTargetValueMult = 20.0,
		EngageLineTargetValueMult = 10.0,
		EngageWhenAlreadyInRangeMult = 0.1,
		EngageEndTurnHiddenBonus = 4,
		EngageWithSkillBonus = 8,
		EngageWithSkillNextTimeBonus = 4,
		EngageWithSkillMult = 1.25,
		EngageWithSkillToDisengagePOW = 1.1,
		EngageStunnedTargetWithSkillPenalty = 1,
		EngageMeleeProtectPriorityTargetMult = 1.75,
		EngageWaitWithPolearmMult = 0.33,
		EngageDistancePenaltyMult = 1.0,
		EngageAndAttackMult = 1.25,
		EngageMinHeatDistance = 5,
		EngageHeatCost = 10,
		EngageBestValueMult = 2.0,
		EngageWithNoWeaponMult = 0.5,
		RangedEngageAbsoluteMaxRange = 20,
		RangedEngageDefaultMaxRange = 6,
		RangedEngageMaxAttempts = 64,
		RangedEngageFilterMaxAttempts = 128,
		RangedEngageMaxDangerDist = 12,
		RangedEngageKeepMinTurnsAway = 1.0,
		RangedEngageMinDangerHitpointsPct = 0.25,
		RangedEngageDangerMult = 4.0,
		RangedEngageIgnoreDangerMinZones = 2,
		RangedEngageZoneOfControlCost = 2,
		RangedEngageLevelDifferenceMult = 6.0,
		RangedEngageOkayTV = 6,
		RangedEngageImproveTVByAtleast = 3,
		RangedEngageGreatTV = 10,
		RangedEngageTVTotalScoreMult = 0.15,
		RangedEngageMinQueryRadius = 8,
		RangedEngageMinQueryRadiusInDanger = 4,
		RangedEngageImprovePosNearbyMult = 3.0,
		RangedEngageTargetBlockedPenalty = 20,
		RangedEngageGeneralDirectionMult = 0.25,
		RangedEngageTargetInRangeMult = 0.8,
		RangedEngageTileHiddenBonus = 2,
		RangedEngageTileNotVisibleBonus = 2,
		RangedEngageGetClearLineOfFireMult = 2.0,
		RangedEngageDistanceToTargetMult = 1.0,
		RangedEngageNearAllyScore = 3,
		RangedEngageCoverBonus = 2,
		RangedEngageTakeCoverMult = 1.5,
		RangedEngageAttackNotMoveMult = 1.25,
		RangedEngageLessPerTileMult = 0.05,
		RangedEngageAggroPosMult = 12.0,
		RangedEngageAggroPosBonusMult = 9.0,
		RangedEngageNoPointPositioning = -10,
		RangedEngageNegativeTileEffectBonus = 8,
		RangedEngageBlockedByAllyMult = 0.5,
		RangedEngageBlockedMult = 0.5,
		RangedEngageCoverMult = 1.25,
		RangedEngageTargetScoreMult = 10.0,
		RangedEngageInRangeOfPolearmBonus = -6.0,
		RangedEngageLevelAdvantageMult = 1.0,
		RangedEngageNegativeEffecAtStop = 4,
		DefendInertiaMult = 1.1,
		DefendInertiaMaxMult = 1.5,
		DefendMaxEngagedAlliesRatio = 0.05,
		DefendMaxAttempts = 32,
		DefendMaxSearchRange = 5,
		DefendTerrainValueMult = 0.75,
		DefendTerrainMinTV = 0,
		DefendMaxOpponentToAllyDistance = 4.0,
		DefendOpponentImportanceMult = 1.0,
		DefendAlreadyDoneMult = 0.25,
		DefendAvoidBadTerrainMult = 1.05,
		DefendOnBadTerrainMult = 0.8,
		DefendOnBadTerrainPenalty = 4,
		DefendImportantAllyPosMult = 4.0,
		DefendUseRangedWeaponMult = 0.5,
		DefendRangedWeaponDanger = 8,
		DefendSeekCoverMult = 1.0,
		DefendAtPalisadeBonus = 1.0,
		DefendAvoidTileEffectPenalty = 4,
		ProtectAllyAttractionBonus = 2.0,
		ProtectAllyDirectionMult = 10.0,
		ProtectAllyAPCostMult = 0.5,
		ProtectAllyEngagedBonus = 8.0,
		ProtectAllyAlreadyHasCover = 2.0,
		ProtectAllyTileEffectPenalty = 4.0,
		HideInertiaMult = 1.1,
		HideInertiaMaxMult = 1.3,
		HideMaxAttempts = 16,
		HideAlreadyDoneMult = 0.25,
		HideMaxSearchRange = 10,
		HideTerrainValueMult = 0.2,
		HideMaxOpponentToAllyDistance = 5.0,
		HideOpponentImportanceMult = 0.5,
		HideBreakBecauseOpponentCloseMult = 0.33,
		CrushArmorBetterTargetPct = 1.2,
		CrushArmorBetterTargetMult = 0.9,
		KnockBackMinTVDifference = 6,
		KnockBackKnockDownCliffValue = 30,
		KnockBackKnockDownMinTurnsToGetBack = 1.0,
		KnockBackForPositionMinHitpointsPct = 0.33,
		KnockBackForPositionMult = 0.75,
		KnockBackKnockDownCliffMult = 1.0,
		KnockBackKnockDownToKillMult = 2.5,
		KnockBackShieldBashMult = 1.15,
		KnockBackStaggerMult = 1.25,
		KnockBackAsOpenerMult = 2.0,
		KnockBackIntoAlliesMult = 1.1,
		KnockBackDisruptMult = 1.0,
		KnockBackIsolateMult = 1.5,
		KnockBackChainAttacksMult = 1.25,
		KnockBackIntoTileEffectMult = 1.25,
		KnockBackAvoidMistakeMult = 0.75,
		KnockBackStunnedTargetMult = 0.5,
		KnockBackBetterTargetPct = 2.0,
		KnockBackEngageBetterTargetMult = 1.15,
		KnockBackToRemoveCounterSkillMult = 1.1,
		KnockBackToProtectAllyMult = 1.0,
		KnockBackProtectAllyLockedMult = 1.33,
		KnockBackSpearwallMult = 1.15,
		KnockBackToChargeIntoAgainMult = 1.0,
		KnockBackMinOpponentsInMelee = 2,
		KnockBackIsolateMult = 1.1,
		KnockBackAvoidTileEffectMult = 1.1,
		ShieldwallMinOverwhelmCount = 2,
		ShieldwallOpponentsInMeleeMult = 1.2,
		ShieldwallOpponentToAllyMinRatio = 0.5,
		ShieldwallOpponentToAllyRatioMult = 0.33,
		ShieldwallInBadPositionMult = 2.5,
		ShieldwallAgainstSpearwallMult = 15.0,
		ShieldwallMaxOpponentToAllyDistance = 5,
		ShieldwallOpponentInReachTurns = 1.0,
		ShieldwallRangedOpponentMaxDist = 7,
		ShieldwallDefendPositionMult = 1.5,
		ShieldwallTVImprovementPrefered = 8,
		ShieldwallHeavilyWoundedMult = 0.33,
		ShieldwallLowPriorityMult = 0.5,
		ShieldwallInMeleeWithFlailMult = 0.9,
		ShieldwallAdjacentBonus = 0.5,
		ShieldwallOverwhelmMult = 1.3,
		ShieldwallNoOpponentsInMeleeMult = 0.75,
		ShieldwallMinTargetPrefValue = 0.25,
		ShieldwallPrefEngageGoodTargetMult = 0.25,
		ShieldwallMinAllyOpponentRatio = 0.35,
		ShieldwallMeleeOpponentsBase = 1.1,
		ShieldwallRangedOpponentsBase = 1.1,
		ShieldwallInMeleeWithRangedUnitMult = 0.5,
		ShieldwallWithThrowingWeaponMult = 0.5,
		RiposteInBadPositionMult = 1.1,
		RiposteOpponentsInMeleeMult = 2.0,
		RiposteWithShieldwallMult = 1.25,
		RiposteOverwhelmMult = 1.2,
		RiposteDefendPositionMult = 1.1,
		RiposteManyOtherTargetsMult = 0.75,
		KnockoutPriorityMult = 1.35,
		KnockoutFleeingMult = 0.33,
		KnockoutDistractedMult = 0.8,
		KnockoutTargetWithQuickHandsMult = 0.9,
		KnockoutSetupDeathblowMult = 1.33,
		KnockOutEngageBetterTargetMult = 1.15,
		KnockoutProtectPriorityTargetMult = 1.1,
		KnockoutAlliesToTakeAdvantageMult = 1.1,
		KnockoutDisarmMult = 1.33,
		DistractPriorityMult = 1.15,
		DistractInitiativeMult = 1.15,
		DistractBerserkMult = 1.1,
		DistractYetToActMult = 1.1,
		DistractSurroundedTargetMult = 0.9,
		DistractSurroundedMult = 1.1,
		DistractVSShieldwallMult = 0.75,
		DistractVSTaunterMult = 0.9,
		DistractPreferInjuryMult = 0.5,
		DistractAsEliteMult = 0.5,
		SplitShieldDefenseMult = 1.0,
		SplitShieldDamageValueMult = 1.15,
		SplitShieldAlternativeTargetValuePct = 0.9,
		SplitShieldAlternativeTargetMult = 0.1,
		SplitShieldAlliesAlsoEngagedMult = 1.35,
		SplitShieldDestroyBonusMult = 1.25,
		SplitShieldNotFirstActionMult = 0.75,
		SwitchToRangedMaxDangerDist = 4,
		SwitchToRangedMinDangerHitpointsPct = 0,
		SwitchToRangedIgnoreDangerMinZones = 1,
		SwitchToRangedZoneOfControlCost = 4,
		SwitchToRangedKeepMinTurnsAway = 1.0,
		SwitchToRangedAtNightMult = 0.5,
		SwitchToMeleeAtNightMult = 2.0,
		SwitchToCurrentlyUnarmedMult = 20.0,
		SwitchWeaponBecauseDisarmedMult = 2.0,
		SwitchToBeingKitedMult = 0.75,
		HowlMaxMoraleRatio = 2.5,
		HowlMinAlliesInRange = 1,
		SwitchToCounterDisarm = 3.0,
		DarkflightMeleeHitpointsMult = 0.2,
		DarkflightStayOnTileBonus = 2.5,
		DarkflightRangedTargetMult = 1.1,
		DarkflightHitpointsScoreMult = 4.0,
		DarkflightZoneOfControlMult = 0.5,
		DarkflightInertiaMult = 0.33,
		DarkflightMaxInertia = 2,
		DarkflightBadTerrainMult = 0.9,
		DarkflightDangerDestMult = 1.5,
		DarkflightDangerScoreMult = 0.5,
		DarkflightMultipleOpponentsMult = 0.9,
		DarkflightTileBlockedBonus = 0.5,
		DarkflightTacticalValueMult = 0.3,
		DarkflightTerrainLevelMult = 1.1,
		DarkflightTerrainLevelBonus = 2,
		DarkflightRangedTargetBonus = 3.0,
		DarkflightScaleByDistMaxMult = 2.0,
		DarkflightFleeingBonus = 2,
		DarkflightHatredForArmorMult = 0.1,
		DarkflightHatredForMeleeDefenseMult = 0.1,
		DarkflightQuickhandsMult = 0.9,
		DarkflightDangerMult = 3.0,
		MoveTailNearHeadMult = 100.0,
		MoveTailAlreadyEngagedMult = 0.5,
		MoveTailMaxDistanceToHead = 1,
		MoveTailCurrentTileBonus = 0.1,
		CommandUndeadRefreshMult = 0.33,
		CommandUndeadEngagedMult = 0.5,
		CommandUndeadTargetsInRangeMult = 1.0,
		CommandUndeadHitpointsMult = 1.0,
		CommandUndeadDangerMult = 0.33,
		CommandUndeadMinScoreMult = 0.2,
		RaiseUndeadMaxAttempts = 16,
		RaiseUndeadMaxDistance = 99,
		RaiseUndeadMagnitudeMaxRange = 5,
		RaiseUndeadOpponentValue = 2,
		RaiseUndeadDistToMeValue = 2,
		RaiseUndeadMoveToBadTerrainPenalty = 4,
		RaiseUndeadLowDangerPenalty = 2,
		RaiseUndeadHighDangerPenalty = 5,
		RaiseUndeadStrengthMult = 0.75,
		RaiseUndeadMaxDanger = 3.0,
		RaiseUndeadOnBadTerrainPenalty = 2,
		RaiseUndeadNearEnemyValue = 1,
		RaiseUndeadNearEnemyNearMeValue = 4,
		RaiseUndeadNearFreeEnemyValue = 3,
		RaiseUndeadNearFreeEnemyNearMeValue = 8,
		RaiseUndeadLockIntoNegativeEffect = 3,
		RaiseUndeadAllyZocBonus = 2,
		RaiseUndeadNoWeaponMult = 0.66,
		PossessUndeadZOCMult = 1.5,
		PossessUndeadXPMult = 0.75,
		PossessUndeadInRangeMult = 2.0,
		PossessUndeadHelpMeMult = 2.0,
		PossessUndeadMaxAttempts = 32,
		PossessUndeadMaxDistance = 16,
		PossessUndeadMagnitudeMaxRange = 5,
		PossessUndeadOpponentValue = 2,
		PossessUndeadDistToMeValue = 2,
		PossessUndeadMoveToBadTerrainPenalty = 4,
		PossessUndeadLowDangerPenalty = 2,
		PossessUndeadHighDangerPenalty = 5,
		PossessUndeadStrengthMult = 0.75,
		PossessUndeadMaxDanger = 3.0,
		PossessUndeadOnBadTerrainPenalty = 2,
		PossessUndeadNoWeaponMult = 0.66,
		PossessUndeadStillToActMult = 1.5,
		KeepSafeMaxRange = 6,
		KeepSafeMaxAttempts = 32,
		KeepSafeDangerMult = 4.0,
		KeepSafeOpponentsMult = 1.0,
		KeepSafeOverwhelmMult = 1.33,
		KeepSafeOpponentsMaxDist = 5.0,
		KeepSafeAlliesMaxDist = 5.0,
		KeepSafeHidingPlaceBonus = 6,
		KeepSafeMinDistAgainstRanged = 9.0,
		KeepSafeFromRangedDangerMult = 1.5,
		TerrorSpearwallMult = 2.0,
		TerrorShieldwallMult = 1.5,
		TerrorRiposteMult = 1.5,
		TerrorMeleeBonus = 1.25,
		TerrorZoCMult = 1.2,
		TerrorInMeleeWithMe = 2.0,
		TerrorCanReachMe = 1.5,
		GruesomeFeastMaxDistance = 60,
		GruesomeFeastMaxAttempts = 16,
		GruesomeFeastMagnitudeMaxRange = 5,
		GruesomeFeastOpponentValue = 2,
		GruesomeFeastLowDangerPenalty = 2,
		GruesomeFeastHighDangerPenalty = 5,
		GruesomeFeastMaxDanger = 5.0,
		GruesomeFeastDangerPenaltyMult = 0.1,
		GruesomeFeastLeaveZOC = -15.0,
		GruesomeFeastLeaveZOCMult = 0.09,
		GruesomeFeastDistanceMult = 1.0,
		GruesomeFeastWaitPenalty = 2,
		GruesomeFeastSpearwallPenalty = 1.0,
		WarcryDistanceMult = 1.0,
		WarCryInMeleeMult = 0.5,
		LineBreakerBetterTargetMult = 1.1,
		LineBreakerIdleAlliesMin = 1,
		LineBreakerIdleAlliesMaxDistance = 2,
		LineBreakerIdleAlliesMult = 1.1,
		LineBreakerForPositionMult = 0.75,
		LineBreakerWorsePositionMult = 0.5,
		LineBreakerBetterTargetThreshold = 0.06,
		LineBreakerCounterSkillMult = 1.1,
		LineBreakerVSRallyMult = 1.25,
		LineBreakerExecuteMult = 1.35,
		LineBreakerVSRiposteMult = 1.35,
		LineBreakerSetupAlliesBonus = 0.1,
		RotationSaveWoundedMult = 1.05,
		RotationWrongWeaponMult = 2.0,
		RotationShieldInFrontMult = 1.05,
		RotationSaveFleeingAlly = 1.25,
		RotationPriorityTargetMinPct = 1.33,
		RotationPriorityTargetMult = 1.25,
		RotationPositionTargetMult = 1.25,
		RotationAOEMult = 1.2,
		RotationOffensiveMult = 1.1,
		RotationRangedAllyToBetterLevelMult = 1.2,
		RotationEliteAllyXPMult = 1.8,
		RotationCoverMult = 1.2,
		ThrowNetMinHitpoints = 15,
		ThrowNetBadTerrainBonus = 10,
		ThrowNetNoRangedWeaponBonus = 10,
		ThrowNetCantAttackAnyoneBonus = 20,
		ThrowNetTVMult = 0.33,
		ThrowNetMinAttaction = 0.5,
		ThrowNetProtectPriorityTargetBonus = 10,
		ThrowNetVSWardogsMult = 0.5,
		ThrowNetVSAdrenalineMult = 1.25,
		ThrowNetToSetupDeathblowMult = 1.25,
		SwitchToQuickHandsMult = 2.0,
		SwitchToOutOfAmmoMult = 1.5,
		SwitchToEnemyInRangeMult = 1.5,
		SwitchToVSSpearwallPOW = 1.3,
		SwitchToMeleeAtNightMult = 2.0,
		SwitchToRangedAtNightMult = 0.5,
		ReloadMaxDanger = 4.0,
		RootNotEngagedBonus = 20.0,
		RootNoRangedWeaponBonus = 20.0,
		RootDangerBonus = 150.0,
		RootCantAttackAnyoneBonus = 30.0,
		RootAdrenalineBonus = 10.0,
		RootFleeingBonus = 5.0,
		RootBadTerrain = 20.0,
		RootNumAffectedPOW = 1.1,
		InsectSwarmEngagedMult = 1.25,
		InsectSwarmDistanceMult = 2.0,
		InsectSwarmAllyDistanceMult = 1.0,
		InsectSwarmAttackingMeMult = 2.0,
		InsectSwarmDangerOfRangedTarget = 30,
		InsectSwarmAlreadyAppliedMult = 0.25,
		WitherEngagedPOW = 1.1,
		WitherAllyDistanceMult = 1.0,
		WitherAlreadyAppliedMult = 0.25,
		WitherNearMasterMult = 2.0,
		BoostMoraleFleeingBonus = 25.0,
		BoostMoraleFleeingEngagedBonus = 50.0,
		BoostMoraleEngagedBonus = 10.0,
		DisengageWithShieldMult = 0.9,
		DisengageWithRangedWeaponMult = 1.5,
		DisengageWrongRangeMult = 1.25,
		DisengageWoundedMult = 1.1,
		DisengagePerOpponentPOW = 1.2,
		DisengageBetterTargetMult = 1.0,
		DisengageLessOpponentsMult = 1.2,
		DisengageTargetMult = 0.25,
		DisengageBetterTileMult = 1.25,
		DisengageMinBetterTargetPct = 1.5,
		DisengageToEngageShortcutMult = 2.0,
		HorrorZOCBonus = 2.0,
		HorrorMoraleStatePenalty = 1.0,
		HorrorAlmostFleeingBonus = 4.0,
		HorrorAdrenalineBonus = 2.0,
		HorrorAttackingMeBonus = 7.0,
		HorrorStillToActMult = 1.25,
		HorrorNegativeTileEffectBonus = 2.0,
		SleepCanWakeOthersMult = 1.1,
		SleepStillToActMult = 1.5,
		SleepZOCBonus = 2.0,
		MiasmaZOCBonus = 2.0,
		MiasmaAlmostDeadBonus = 4.0,
		MiasmaStunnedBonus = 4.0,
		MiasmaOneTurnLeftMult = 0.5,
		MiasmaVSWaitMult = 0.5,
		NightmareAllyDistanceMult = 0.25,
		NightmareEngagedMult = 1.0,
		NightmareAttackingMeMult = 3.0,
		NightmareDangerOfRangedTarget = 30,
		NightmareDistanceMult = 2.0,
		NightmareIsolatedBonus = 10,
		NightmareHelperPenalty = 1,
		CharmHelpOther = 3,
		CharmRootedMult = 0.5,
		CharmLevelMult = 5.0,
		CharmBraveryMult = 0.5,
		CharmDistanceMult = 1.0,
		CharmSkillMult = 0.25,
		CharmDefenseSkillMult = 0.5,
		CharmStillToActMult = 1.25,
		CharmAlreadyWaitedMult = 0.5,
		CharmTargetsMult = 4.0,
		CharmTargetLockdownMult = 0.25,
		CharmMeleeDangerMult = 7.0,
		CharmRemoveDangerMult = 4.0,
		CharmAoEMult = 1.35,
		CharmTargetUnarmedMult = 0.1,
		CharmTargetWoodenClubOnlyMult = 0.25,
		CharmTargetWoodenClubRightNowMult = 0.9,
		CharmLowerDurationMult = 0.75,
		CharmRangedWouldBeInZOCMult = 0.33,
		CharmWardogMult = 0.5,
		CharmRangedTargetMult = 1.5,
		CharmImmuneMult = 0.01,
		CharmEasierToKillMult = 0.75,
		HexCharacterLevelMult = 0.2,
		HexNoAttacksMult = 0.5,
		HexZoneOfControlMult = 1.5,
		HexPreferPlayerMult = 4.0,
		HexDOTScoreMult = 1.25,
		HexDOTCanKillMult = 10.0,
		HexNotAGoodTargetMult = 0.1,
		HexAgainstIndomitable = 0.75,
		MoveTentacleZOCMult = 0.9,
		MoveTentacleTargetAlreadyRooted = 0.25,
		MoveTentacleAlliesPresentMult = 0.75,
		MoveTentacleMyTileMult = 1.1,
		MoveTentacleBlockHeadMult = 0.25,
		UsePotionNightVisionMult = 10.0,
		GrantNightVisionMeleeMult = 1.0,
		GrantNightVisionRangedMult = 3.0,
		GrantNightVisionStillToActMult = 2.0,
		AdrenalineSurrounded = 0.1,
		AdrenalineActBeforeMeBonus = 0.25,
		AdrenalineScoreCutoff = 1.25,
		AdrenalineFirstRoundMult = 1.5,
		AdrenalineOnBadTerrainMult = 1.25,
		AdrenalineFresh = 0.4,
		AdrenalineBeingKitedMult = 2.0,
		IndomitableSurrounded = 0.1,
		IndomitableScoreCutoff = 2.5,
		SleepTurnDoneMult = 0.1,
		GashTargetUninjuredMult = 1.25,
		GashHeavyInjuryInsteadOfNoneMult = 1.5,
		GashMaxInjuries = 4,
		ThrowBombStunnedMult = 1.5,
		ThrowBombZOCMult = 1.1,
		ThrowBombAlreadyOutMult = 0.5,
		ThrowBombPriorityTargetMult = 1.1,
		ThrowBombInstakillMult = 3.0,
		AttackHandgoneOpponentsHitMult = 1.2,
		AttackHandgoneAlliesHitMult = 0.8,
		LightningStormStunnedTargetMult = 2.0,
		LightningStormTargetInZOCMult = 4.0,
		MoveToMergeMaxAttempts = 32
	}
};

