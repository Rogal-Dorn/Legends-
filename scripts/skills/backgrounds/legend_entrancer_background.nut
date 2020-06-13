this.legend_entrancer_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_entrancer";
		this.m.Icon = "ui/backgrounds/background_wizard_2.png";
		local r = this.Math.rand(0, 3);
		this.m.Name = "Entrancer";
		this.m.HiringCost = 1000;
		this.m.DailyCost = 25;
		this.m.Excluded = [
			"trait.impatient",
			"trait.iron_jaw",
			"trait.clubfooted",
			"trait.dumb",
			"trait.insecure",
			"trait.loyal",
			"trait.hesitant",
			"trait.craven",
			"trait.fainthearted",
			"trait.brute",
			"trait.bloodthirsty"
		];
		this.m.Titles = [
			"Glass Eyed",
			"the Distant",
			"Dream Walker",
			"the Possessed",
			"the Dreamer",
			"the Haunted"
		];
		this.m.Faces = this.Const.Faces.AllFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = null;
		this.m.Body = this.Const.Bodies.AllFemale[this.Math.rand(0, this.Const.Bodies.AllFemale.len() - 1)];
		this.m.IsFemaleBackground = true;
		this.m.IsPerformingBackground = true;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Merciless;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Good;
		this.m.Modifiers.Ammo = this.Const.LegendMod.ResourceModifiers.Ammo[0];
		this.m.Modifiers.ArmorParts = this.Const.LegendMod.ResourceModifiers.ArmorParts[0];
		this.m.Modifiers.Meds = this.Const.LegendMod.ResourceModifiers.Meds[1];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[0];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[1];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[1];
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[0];
		this.m.Modifiers.Salvage = this.Const.LegendMod.ResourceModifiers.Salvage[0];
		this.m.Modifiers.Crafting = this.Const.LegendMod.ResourceModifiers.Crafting[0];
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Barter[0];
		this.m.Modifiers.ToolConsumption = this.Const.LegendMod.ResourceModifiers.ToolConsumption[0];
		this.m.Modifiers.MedConsumption = this.Const.LegendMod.ResourceModifiers.MedConsumption[1];
		this.m.Modifiers.Hunting = this.Const.LegendMod.ResourceModifiers.Hunting[0];
		this.m.Modifiers.Fletching = this.Const.LegendMod.ResourceModifiers.Fletching[0];
		this.m.Modifiers.Scout = this.Const.LegendMod.ResourceModifiers.Scout[0];
		this.m.Modifiers.Gathering = this.Const.LegendMod.ResourceModifiers.Gather[0];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[0];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.HammerTree,
				this.Const.Perks.StavesTree,
				this.Const.Perks.ThrowingTree,
				this.Const.Perks.FlailTree
			],
			Defense = [
				this.Const.Perks.LightArmorTree
			],
			Traits = [
				this.Const.Perks.IntelligentTree,
				this.Const.Perks.MartyrTree,
				this.Const.Perks.InspirationalTree,
				this.Const.Perks.CalmTree
			],
			Enemy = [],
			Class = [],
			Magic = [this.Const.Perks.ValaTranceMagicTree]
		}
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
		return "{%name% appears distant, barely concious of the outside world. There is a whole universe unfolding behind those eyes, and at times the trance drives limbs to move and utterances to spill forth.  It can be unerving, but at times the serenity of it all soothes you and draws you into the trance state. }";
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 0);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/legend_herbalist_robe"));
		}

		r = this.Math.rand(0, 0);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/hood"));
		}
	}

	function onAddLegendEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local cloths = [
            [0, ""],
			[0, "cloth/legend_gambeson"],
			[0, "cloth/legend_gambeson_plain"],
			[0, "cloth/legend_gambeson_wolf"],
			[0, "cloth/legend_padded_surcoat"],
			[0, "cloth/legend_robes_herbalist"],
			[0, "cloth/legend_apron_butcher"],
			[0, "cloth/legend_robes_nun"],
			[0, "cloth/legend_apron_smith"],
			[0, "cloth/legend_robes_wizard"],
			[1, "cloth/legend_robes_magic"],
			[0, "cloth/legend_sackcloth"],
			[0, "cloth/legend_sackcloth_patched"],
			[0, "cloth/legend_sackcloth_tattered"],
			[0, "cloth/legend_tunic"],
			[0, "cloth/legend_tunic_noble"]
		];
		local armor = this.Const.World.Common.pickLegendArmor(cloths)
		items.equip(armor)
		local plates = [
			[0, ""],
			[0, "plate/legend_thick_furs_armor"],
			[1, "plate/legend_animal_hide_armor"],
			[0, "plate/legend_hide_and_bone_armor"],
			[0, "plate/legend_reinforced_animal_hide_armor"],
			[0, "plate/legend_scrap_metal_armor"],
			[0, "plate/legend_rugged_scale_armor"],
			[0, "plate/legend_heavy_iron_armor"],
			[0, "plate/legend_thick_plated_barbarian_armor"]
		]
		local plate = this.Const.World.Common.pickLegendArmor(plates)
		if (plate != null)
		{
			armor.setUpgrade(plate)
		}
		items.equip(this.new("scripts/items/helmets/hood"));

	}
});

