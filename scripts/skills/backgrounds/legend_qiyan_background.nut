this.legend_qiyan_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_qiyan";
		this.m.Name = "Qiyan";
		this.m.Icon = "ui/backgrounds/background_qiyan.png";
		this.m.BackgroundDescription = "";
		this.m.GoodEnding = "This is a good ending";
		this.m.BadEnding = "This is a bad ending";
		this.m.HiringCost = 500;
		this.m.DailyCost = 10;
		this.m.Excluded = [
			"trait.tough",
			"trait.strong",
			"trait.clumsy",
			"trait.fat",
			"trait.ailing",
			"trait.asthmatic",
			"trait.spartan",
			"trait.athletic",
			"trait.heavy",
			"trait.aggressive",
			"trait.huge",
			"trait.slack",
			"trait.craven"
		];
		this.m.ExcludedTalents = [
            this.Const.Attributes.Hitpoints,
			this.Const.Attributes.Fatigue
        ];
        this.m.IsGuaranteed = ["seductive_trait"]
		this.m.Bodies = this.Const.Bodies.SouthernFemale;
		this.m.Faces = this.Const.Faces.SouthernFemale;
		this.m.Hairs = this.Const.Hair.SouthernFemale;
		this.m.HairColors = this.Const.HairColors.Young;
        this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Ethnicity = 1;
		this.m.IsFemaleBackground = true;
		this.m.IsCombatBackground = false;
		this.m.IsPerformingBackground = true;
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Barter[3];
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Stash[2];
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Scout[1];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.DaggerTree,
				this.Const.Perks.SwordTree,
				this.Const.Perks.ThrowingTree
			],
			Defense = [
				this.Const.Perks.LightArmorTree
			],
			Traits = [ //lf 5
				this.Const.Perks.AgileTree,
				this.Const.Perks.InspirationalTree,
				this.Const.Perks.FastTree,
				this.Const.Perks.IntelligentTree
			],
			Enemy = [],
			Class = [
				this.Const.Perks.KnifeClassTree,
				this.Const.Perks.BardClassTree
            ],
			Magic = []
		}
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-10,
				3
			],
			Bravery = [
				5,
				10
			],
			Stamina = [
				-3,
				5
			],
			MeleeSkill = [
				-3,
				7
			],
			RangedSkill = [
				-5,
				5
			],
			MeleeDefense = [
				-10,
				10
			],
			RangedDefense = [
				-6,
				4
			],
			Initiative = [
				-5,
				5
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		actor.setTitle("the Qiyan");
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local armor = this.Const.World.Common.pickArmor([
			[1, "oriental/cloth_sash"]
		]);
		items.equip(armor)
		items.equip(this.Const.World.Common.pickHelmet([
			[1, ""],
			[1, "legend_headband_coin"],
			[1, "legend_headress_coin"],
			[1, "legend_earings"],
			[5, "legend_southern_veil"],
			[1, "legend_southern_veil_coin"],
			[1, "legend_southern_cloth_headress"]
		]));
	}
});

