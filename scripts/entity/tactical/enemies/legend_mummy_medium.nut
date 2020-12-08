this.legend_mummy_medium <- this.inherit("scripts/entity/tactical/legend_mummy", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.LegendMummyMedium;
		this.m.XP = this.Const.Tactical.Actor.LegendMummyMedium.XP;
		this.m.ResurrectionValue = 4.0;
		this.m.ResurrectWithScript = "scripts/entity/tactical/enemies/legend_mummy_medium";
		this.legend_mummy.create();
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/skeleton_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.legend_mummy.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.LegendMummyMedium);
		b.IsAffectedByNight = false;
		b.IsAffectedByInjuries = false;
		b.IsImmuneToBleeding = true;
		b.IsImmuneToPoison = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
			}

	}

	function assignRandomEquipment()
	{
		local r = this.Math.rand(1, 4);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/ancient/broken_ancient_sword"));
		}
		else
		{
			this.m.Items.equip(this.new("scripts/items/weapons/ancient/ancient_sword"));
		}

		if (this.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) == null)
		{

			this.m.Items.equip(this.new("scripts/items/shields/ancient/legend_mummy_tower_shield"));

		}

		local armor = [
			[1, "ancient/legend_mummy_bandages"],
			[4, "ancient/legend_mummy_plate"]
		];
		local item = this.Const.World.Common.pickArmor(armor);
		this.m.Items.equip(item);

		local item = this.Const.World.Common.pickHelmet([
			[99, "mummy_headband"]
		])
		if (item != null)
		{
			this.m.Items.equip(item);
		}
	}

});

