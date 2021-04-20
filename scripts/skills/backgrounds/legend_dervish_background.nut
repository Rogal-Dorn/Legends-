this.legend_dervish_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_dervish";
		this.m.Name = "Dervish";
		this.m.Icon = "ui/backgrounds/background_dervish.png";
		this.m.BackgroundDescription = "";
		this.m.GoodEnding = "This is a good ending";
		this.m.BadEnding = "This is a bad ending";
		this.m.HiringCost = 350;
		this.m.DailyCost = 8;
		this.m.Excluded = [
			"trait.bleeder",
			"trait.ailing",
			"trait.fragile",
			"trait.gluttonous",
			"trait.frail",
			"trait.light",
			"trait.dumb"
		];
		this.m.ExcludedTalents = [];
        this.m.IsGuaranteed = ["tough_trait"]
		this.m.Bodies = this.Const.Bodies.SouthernMale;
		this.m.Faces = this.Const.Faces.SouthernMale;
		this.m.Hairs = this.Const.Hair.SouthernMale;
		this.m.HairColors = this.Const.HairColors.Southern;
		this.m.BeardChance = 50;
		this.m.Ethnicity = 1;
		this.m.IsFemaleBackground = false;
		this.m.IsCombatBackground = false;
		this.m.IsPerformingBackground = false;
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Meds[1];
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Healing[2];
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Injury[3];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.SwordTree,
				this.Const.Perks.GreatSwordTree,
				this.Const.Perks.CleaverTree
			],
			Defense = [
				this.Const.Perks.LightArmorTree,
                this.Const.Perks.MediumArmorTree
			],
			Traits = [ //lf 5
				this.Const.Perks.IndestructibleTree,
				this.Const.Perks.InspirationalTree,
				this.Const.Perks.IntelligentTree
			],
			Enemy = [],
			Class = [
				this.Const.Perks.HealerClassTree,
				this.Const.Perks.FaithClassTree
            ],
			Magic = []
		}
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				5,
				15
			],
			Bravery = [
				5,
				10
			],
			Stamina = [
				0,
				10
			],
			MeleeSkill = [
				-8,
				8
			],
			RangedSkill = [
				0,
				3
			],
			MeleeDefense = [
				-10,
				5
			],
			RangedDefense = [
				-6,
				2
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
		actor.setTitle("the Dervish");
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local armor = this.Const.World.Common.pickArmor([
			[1, "oriental/cloth_sash"]
		]);
		items.equip(armor)
		local helm = this.Const.World.Common.pickHelmet([
			[2, "oriental/southern_head_wrap"],
			[1, "legend_noble_southern_hat"],
			[3, ""]
		]);
		items.equip(helm)
	}
});

