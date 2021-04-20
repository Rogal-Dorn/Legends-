this.legend_alchemist_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_alchemist";
		this.m.Name = "Alchemist";
		this.m.Icon = "ui/backgrounds/background_alchemist.png";
		this.m.BackgroundDescription = "";
		this.m.GoodEnding = "This is a good ending";
		this.m.BadEnding = "This is a bad ending";
		this.m.HiringCost = 1250;
		this.m.DailyCost = 20;
		this.m.Excluded = [
			"trait.heavy",
			"trait.martial",
			"trait.strong",
			"trait.bloodthirsty",
			"trait.athletic",
			"trait.spartan",
			"trait.strong",
			"trait.hesitant",
			"trait.dumb"
		];
		this.m.ExcludedTalents = [
            this.Const.Attributes.MeleeSkill,
			this.Const.Attributes.Fatigue
		];
		this.m.Bodies = this.Const.Bodies.SouthernMale;
		this.m.Faces = this.Const.Faces.SouthernMale;
		this.m.Hairs = this.Const.Hair.SouthernMale;
		this.m.HairColors = this.Const.HairColors.Southern;
		this.m.BeardChance = 50;
		this.m.Ethnicity = 1;
		this.m.IsFemaleBackground = false;
		this.m.IsCombatBackground = false;
		this.m.IsPerformingBackground = false;
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Barter[2];
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Healing[1];
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Injury[1];
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Crafting[3];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.SwordTree,
				this.Const.Perks.DaggerTree,
				this.Const.Perks.ThrowingTree
			],
			Defense = [
				this.Const.Perks.LightArmorTree
			],
			Traits = [ //lf 5
				this.Const.Perks.TrainedTree,
				this.Const.Perks.DeviousTree,
				this.Const.Perks.IntelligentTree,
				this.Const.Perks.CalmTree,
				this.Const.Perks.OrganisedTree
			],
			Enemy = [],
			Class = [
                this.Const.Perks.SickleClassTree, 
                this.Const.Perks.BarterClassTree]
			Magic = []
		}
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-5,
				-5
			],
			Bravery = [
				-5,
				5
			],
			Stamina = [
				-5,
				-5
			],
			MeleeSkill = [
				-10,
				3
			],
			RangedSkill = [
				0,
				10
			],
			MeleeDefense = [
				0,
				0
			],
			RangedDefense = [
				-3,
				6
			],
			Initiative = [
				10,
				10
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		actor.setTitle("the Alchemist");
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		items.equip(this.Const.World.Common.pickArmor([
			[3, "oriental/vizier_gear"]
		]))

		items.equip(this.Const.World.Common.pickHelmet([
			[2, ""],
			[1, "oriental/vizier_headgear"],
			[1, "oriental/engineer_hat"]
		]));
	}
});

