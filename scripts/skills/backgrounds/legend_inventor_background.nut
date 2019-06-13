this.legend_inventor_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_inventor";
		this.m.Name = "Inventor";
		this.m.Icon = "ui/backgrounds/legend_inventor.png";
		this.m.BackgroundDescription = "Inventors are trenchant problem solvers, fueled by a burning passion for knowledge.";
		this.m.GoodEnding = null;
		this.m.BadEnding = null;
		this.m.HiringCost = 120;
		this.m.DailyCost = 12;
		this.m.Excluded = [
			"trait.asthmatic",
			"trait.clumsy",
			"trait.cocky",
			"trait.dumb",
			"trait.superstitious"
		];
		this.m.Titles = [
			"the Inventor",
			"the Curious",
			"the Peculiar",
			"the Inquisitive",
			"the Utilitarian",
			"the Serendipitous",
			"the Eclectic",
			"the Tinkerer"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.Body = this.Const.Bodies.AllMale[this.Math.rand(0, this.Const.Bodies.AllMale.len() - 1)];
		this.m.IsCrusaderRecruitBackground = true;
		this.m.IsRangerRecruitBackground = true;
		this.m.IsEducatedBackground = true;
		this.m.Modifiers.ArmorParts = this.Const.LegendMod.ResourceModifiers.ArmorParts[2];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[2];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[1];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[1];
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[2];
		this.m.Modifiers.Salvage = this.Const.LegendMod.ResourceModifiers.Salvage[3];
		this.m.Modifiers.Crafting = this.Const.LegendMod.ResourceModifiers.Crafting[1];
		this.m.CustomPerkTree = [
			[
				gt.Const.Perks.PerkDefs.FastAdaption,
				gt.Const.Perks.PerkDefs.CripplingStrikes,
				gt.Const.Perks.PerkDefs.Colossus,
				gt.Const.Perks.PerkDefs.BagsAndBelts,
				gt.Const.Perks.PerkDefs.NineLives,
				gt.Const.Perks.PerkDefs.Pathfinder,
				gt.Const.Perks.PerkDefs.Adrenalin,
				gt.Const.Perks.PerkDefs.Recover,
				gt.Const.Perks.PerkDefs.Student
			],
			[
				gt.Const.Perks.PerkDefs.CoupDeGrace,
				gt.Const.Perks.PerkDefs.Bullseye,
				gt.Const.Perks.PerkDefs.Dodge,
				gt.Const.Perks.PerkDefs.FortifiedMind,
				gt.Const.Perks.PerkDefs.HoldOut,
				gt.Const.Perks.PerkDefs.SteelBrow,
				gt.Const.Perks.PerkDefs.QuickHands,
				gt.Const.Perks.PerkDefs.Gifted
			],
			[
				gt.Const.Perks.PerkDefs.Backstabber,	
				gt.Const.Perks.PerkDefs.Anticipation,
				gt.Const.Perks.PerkDefs.ShieldExpert,
				gt.Const.Perks.PerkDefs.Brawny,
				gt.Const.Perks.PerkDefs.Relentless,
				gt.Const.Perks.PerkDefs.Rotation,
				gt.Const.Perks.PerkDefs.RallyTheTroops,
				gt.Const.Perks.PerkDefs.Taunt
			],
			[
				gt.Const.Perks.PerkDefs.SpecMace,
				gt.Const.Perks.PerkDefs.SpecFlail,
				gt.Const.Perks.PerkDefs.SpecHammer,
				gt.Const.Perks.PerkDefs.SpecAxe,
				gt.Const.Perks.PerkDefs.SpecCleaver,
				gt.Const.Perks.PerkDefs.SpecSword,
				gt.Const.Perks.PerkDefs.SpecDagger,
				gt.Const.Perks.PerkDefs.SpecPolearm,
				gt.Const.Perks.PerkDefs.SpecSpear,
				gt.Const.Perks.PerkDefs.SpecCrossbow,
				gt.Const.Perks.PerkDefs.SpecBow,
				gt.Const.Perks.PerkDefs.SpecThrowing
			],
			[
				gt.Const.Perks.PerkDefs.Underdog,
				gt.Const.Perks.PerkDefs.LoneWolf,
				gt.Const.Perks.PerkDefs.Overwhelm,
				gt.Const.Perks.PerkDefs.Footwork
			],
			[
				gt.Const.Perks.PerkDefs.HeadHunter,
				gt.Const.Perks.PerkDefs.Berserk,
				gt.Const.Perks.PerkDefs.Nimble,
				gt.Const.Perks.PerkDefs.BattleForged
			],
			[
				gt.Const.Perks.PerkDefs.Fearsome,
				gt.Const.Perks.PerkDefs.Duelist,
				gt.Const.Perks.PerkDefs.KillingFrenzy,
				gt.Const.Perks.PerkDefs.Indomitable,
				gt.Const.Perks.PerkDefs.LegendInventorAnatomy,		
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
			},
			{
				id = 13,
				type = "text",
				icon = "ui/icons/xp_received.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+20%[/color] Experience Gain"
			}
		];
	}

	function onBuildDescription()
	{
		return "{Having spent most of his life in and around %townname%, covered in books, conducting various experiments and creating all sort of contraptions, %name% eventually turned his eyes towards knights, soldiers, sellswords, brigands and others that live and die by the sword. Perhaps his knowledge could be applied to their circumstances? Could he possibly become a great fighter himself? Tempted and intrigued by his own thoughts, he wasted no time setting out to look for a mercenary company that would consider taking him in. What could go wrong?}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				0,
				0
			],
			Bravery = [
				0,
				0
			],
			Stamina = [
				0,
				0
			],
			MeleeSkill = [
				0,
				0
			],
			RangedSkill = [
				0,
				0
			],
			MeleeDefense = [
				0,
				0
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
		actor.setTitle(this.Const.Strings.InventorTitles[this.Math.rand(0, this.Const.Strings.InventorTitles.len() - 1)]);
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;

		r = this.Math.rand(0, 1);
		if (r <= 1)
		{
			items.equip(this.new("scripts/items/armor/apron"));
		}

		r = this.Math.rand(0, 1);
		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/mouth_piece"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/headscarf"));
		}

		r = this.Math.rand(0, 1);
		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/knife"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/wooden_stick"));
		}
	}

	function onUpdate (_properties)
	{
		this.character_background.onUpdate(_properties);
		_properties.XPGainMult *= 1.2;
	}
});