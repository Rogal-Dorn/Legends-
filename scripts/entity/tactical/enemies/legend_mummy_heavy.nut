this.legend_mummy_heavy <- this.inherit("scripts/entity/tactical/legend_mummy", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.LegendMummyHeavy;
		this.m.XP = this.Const.Tactical.Actor.LegendMummyHeavy.XP;
		this.m.ResurrectionValue = 5.0;
		this.m.ResurrectWithScript = "scripts/entity/tactical/enemies/legend_mummy_heavy_polearm";
		this.skeleton.create();
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/skeleton_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.skeleton.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.LegendMummyHeavy);
		b.Initiative -= 20;
		b.IsAffectedByNight = false;
		b.IsAffectedByInjuries = false;
		b.IsImmuneToBleeding = true;
		b.IsImmuneToPoison = true;

		if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 100)
		{
			b.IsSpecializedInPolearms = true;
		}

		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
		 if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
			}

	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		if (!this.Tactical.State.isScenarioMode() && _killer != null && _killer.isPlayerControlled())
		{
			this.updateAchievement("WalkingStatue", 1, 1);
		}

		this.skeleton.onDeath(_killer, _skill, _tile, _fatalityType);
	}

	function assignRandomEquipment()
	{
		local r = this.Math.rand(1, 2);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/ancient/rhomphaia"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/ancient/crypt_cleaver"));
		}

		if (this.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) == null)
		{
			this.m.Items.equip(this.new("scripts/items/shields/ancient/legend_mummy_tower_shield"));
		}

		local armor = [
			[15, "ancient/legend_mummy_plate"],
			[5, "ancient/legend_mummy_bandages"],
			[80, "ancient/legend_mummy_royal_plate"]
		];
		local item = this.Const.World.Common.pickArmor(armor); 		
		this.m.Items.equip(item);

		local item = this.Const.World.Common.pickHelmet([
			[34, "mummy_headress"],
			[60, "mummy_crown_king"],
			[6, "mummy_beard"]
		])
		if (item != null)
		{
			this.m.Items.equip(item);
		}
	}

});

