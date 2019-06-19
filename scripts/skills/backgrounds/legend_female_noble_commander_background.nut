this.legend_female_noble_commander_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_female_commander_noble";
		this.m.Name = "Captain";
		this.m.Icon = "ui/backgrounds/noble_02.png";
		this.m.BackgroundDescription = "A captain of the guard, well trained in the arts of war";
		this.m.GoodEnding = "Adventurousness never leaves the soul of a woman like %name%. {Instead of returning to the armed services, she left the %companyname% and headed east in search of rare beasts. Word has it she returned to town with the head of what looked like a giant lizard, but you don\'t believe such fantastical tripe. | She departed the %companyname% and ventured west, sailing across the oceans to unseen lands. There\'s no telling where she is these days, but you\'ve little doubt that she\'ll be coming back with stories to tell. | She retired from the %companyname% and, instead of returning to her noble family, headed south. Word has it she fought in a great noble civil war, killed an orc warlord, climbed the highest mountain in the land, and is currently writing an epic about his travels. | The noblewoman left the %companyname% and, preferring the life of adventure to noble boredom, she headed north. Word has it that she\'s currently marching a troop of explorers to the furthest reaches of the world.}";
		this.m.BadEnding = "%name% departed the %companyname% and continued his adventuring elsewhere. {She headed east, hoping to discover the source of the greenskins, but the noblewoman has not been heard from since. | She headed north into the snowy wastes. Word has it she was seen a week ago, marching south this time, looking rather pale and shuffling moreso than walking. | She headed south into brutal marshlands. Word has it that a mysterious flame appeared in the fog and she walked toward it. The men who saw this said she disappeared into the mist and never returned. | She headed west and sailed the open sea. Despite having no experience at sea, she saw fit to make herself captain of the boat. They say pieces of her ship and dead sailors kept washing ashore for weeks.}";
		this.m.HiringCost = 15000;
		this.m.DailyCost = 0;
		this.m.Excluded = [
			"trait.weasel",
			"trait.fear_beasts",
			"trait.clubfooted",
			"trait.irrational",
			"trait.hesitant",
			"trait.drunkard",
			"trait.fainthearted",
			"trait.craven",
			"trait.dastard",
			"trait.fragile",
			"trait.insecure",
			"trait.asthmatic",
			"trait.spartan",
			"trait.disloyal",
			"trait.loyal"
		];
		this.m.Faces = this.Const.Faces.AllFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Body = "bust_naked_body_03";
		this.m.Level = 2;
		this.m.IsCombatBackground = true;
		this.m.IsNoble = true;
		this.m.IsUntalented = true;
		this.m.IsFemaleBackground = true;
		this.m.Modifiers.Ammo = this.Const.LegendMod.ResourceModifiers.Ammo[1];
		this.m.Modifiers.ArmorParts = this.Const.LegendMod.ResourceModifiers.ArmorParts[1];
		this.m.Modifiers.Meds = this.Const.LegendMod.ResourceModifiers.Meds[1];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[2];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[1];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[1];
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Barter[1];
		this.m.Modifiers.ToolConsumption = this.Const.LegendMod.ResourceModifiers.ToolConsumption[1];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[1];
		this.m.Modifiers.Terrain = [
			0.0,
			0.0,
			0.025,
			0.01,
			0.01,
			0.01,
			0.01,
			0.01,
			0.01,
			0.01,
			0.0,
			0.025,
			0.011,
			0.015,
			0.015,
			0.025,
			0.0
		];
		this.m.CustomPerkTree = [
			[
				this.Const.Perks.PerkDefs.Adrenalin,
				this.Const.Perks.PerkDefs.Backstabber,
				this.Const.Perks.PerkDefs.CripplingStrikes,
				this.Const.Perks.PerkDefs.Pathfinder,
				this.Const.Perks.PerkDefs.NineLives,
				this.Const.Perks.PerkDefs.Student,
				this.Const.Perks.PerkDefs.Recover,
				this.Const.Perks.PerkDefs.BagsAndBelts
			],
			[
				this.Const.Perks.PerkDefs.CoupDeGrace,
				this.Const.Perks.PerkDefs.Dodge,
				this.Const.Perks.PerkDefs.HoldOut,
				this.Const.Perks.PerkDefs.SteelBrow,
				this.Const.Perks.PerkDefs.QuickHands,
				this.Const.Perks.PerkDefs.FortifiedMind,
				this.Const.Perks.PerkDefs.Gifted,
				this.Const.Perks.PerkDefs.Sprint,
				this.Const.Perks.PerkDefs.LegendComposure,
				this.Const.Perks.PerkDefs.LegendRoster2
			],
			[
				this.Const.Perks.PerkDefs.Brawny,
				this.Const.Perks.PerkDefs.Anticipation,
				this.Const.Perks.PerkDefs.Rotation,
				this.Const.Perks.PerkDefs.Taunt,
				this.Const.Perks.PerkDefs.RallyTheTroops,
				this.Const.Perks.PerkDefs.InspiringPresence,
				this.Const.Perks.PerkDefs.LegendTrueBeliever,
				this.Const.Perks.PerkDefs.LegendRoster3
			],
			[
				this.Const.Perks.PerkDefs.SpecPolearm,
				this.Const.Perks.PerkDefs.SpecSword,
				this.Const.Perks.PerkDefs.LegendSpecBandage,
				this.Const.Perks.PerkDefs.LegendEfficientPacking,
				this.Const.Perks.PerkDefs.LegendBarterConvincing,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyNoble,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyBandit,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyBarbarian,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyMercenary,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyCaravan,
				this.Const.Perks.PerkDefs.LegendRoster4
			],
			[
				this.Const.Perks.PerkDefs.ReachAdvantage,
				this.Const.Perks.PerkDefs.Overwhelm,
				this.Const.Perks.PerkDefs.Underdog,
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.LegendBribe,
				this.Const.Perks.PerkDefs.LegendRoster5
			],
			[
				this.Const.Perks.PerkDefs.Berserk,
				this.Const.Perks.PerkDefs.HeadHunter,
				this.Const.Perks.PerkDefs.BattleForged,
				this.Const.Perks.PerkDefs.Nimble,
				this.Const.Perks.PerkDefs.LegendHoldTheLine,
				this.Const.Perks.PerkDefs.LegendForwardPush,
				this.Const.Perks.PerkDefs.LegendCoordinatedVolleys,
				this.Const.Perks.PerkDefs.LegendRoster6
			],
			[
				this.Const.Perks.PerkDefs.Fearsome,
				this.Const.Perks.PerkDefs.KillingFrenzy,
				this.Const.Perks.PerkDefs.Duelist,
				this.Const.Perks.PerkDefs.Inspire,
				this.Const.Perks.PerkDefs.LegendRelax,
				//this.Const.Perks.PerkDefs.LegendPreparedForAnything,
				this.Const.Perks.PerkDefs.LegendRoster7
			],
			[],
			[],
			[],
			[]			
		];		
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
	}

	function onBuildDescription()
	{
		return "This is the commander, when he dies the game is over. {A captain of the gaurd | As the third in the line of the noble retinue | A young and brash captain | A skilled swordsman}, %name%\'s life at court {had grown stale for him | was not exciting enough for him with endless studying of tactics and strategy | felt like wasting the best time of his life | was not half as exciting to him as the tales of adventures, battles, fearsome beasts to vanquish and fair maidens to conquer}. {Wearing the house crest proudly | At the encouragement of his brother | To the frustration of his mother | Finally making a decision to change things}, %name% rode out to {prove himself | make a name for himself | earn glory on the battlefield | test his skills in battle} and {live life to its fullest as he imagined it from behind the castle walls | see all the wonders and exotic places of the world | earn his place in the world | be knighted for his valor | become famous and loved in all the known world | become infamous and feared in all the known world}.";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				5,
				5
			],
			Bravery = [
				25,
				25
			],
			Stamina = [
				5,
				5
			],
			MeleeSkill = [
				15,
				15
			],
			RangedSkill = [
				-5,
				-5
			],
			MeleeDefense = [
				10,
				10
			],
			RangedDefense = [
				0,
				0
			],
			Initiative = [
				0,
				0
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		this.m.Container.add(this.new("scripts/skills/perks/perk_legend_roster_2"));
		this.m.Container.add(this.new("scripts/skills/perks/perk_legend_roster_4"));
		this.m.Container.add(this.new("scripts/skills/perks/perk_rally_the_troops"));
		//this.m.Container.add(this.new("scripts/skills/perks/perk_legend_prepared_for_anything"));
		this.m.Container.add(this.new("scripts/skills/traits/loyal_trait"));
		actor.setName(this.Const.Strings.KnightNames[this.Math.rand(0, this.Const.Strings.KnightNames.len() - 1)]);
	}

	function onAddEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Bravery] = 3;
		talents[this.Const.Attributes.MeleeSkill] = 2;
		this.getContainer().getActor().fillTalentValues(2, true);
		local items = this.getContainer().getActor().getItems();
		items.equip(this.new("scripts/items/armor/mail_shirt"));
		items.equip(this.new("scripts/items/helmets/greatsword_hat"));
		local stash = this.World.Assets.getStash();
		stash.removeByID("supplies.ground_grains");
		stash.removeByID("supplies.ground_grains");
		stash.add(this.new("scripts/items/supplies/wine_item"));
		stash.add(this.new("scripts/items/loot/signet_ring_item"));
		items.equip(this.new("scripts/items/weapons/pike"));
	}

});

