this.legend_mummy_priest <- this.inherit("scripts/entity/tactical/legend_mummy", {
	m = {},
	function create()
	{
        this.legend_mummy.create();
		this.m.Type = this.Const.EntityType.LegendMummyPriest;
		this.m.XP = this.Const.Tactical.Actor.LegendMummyPriest.XP;
		this.m.ResurrectionValue = 10.0;
		this.m.ResurrectWithScript = "scripts/entity/tactical/enemies/legend_mummy_priest";
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/skeleton_priest_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.legend_mummy.onInit();
		this.getSprite("body").setBrush("bust_skeleton_body_02");
		this.setDirty(true);
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.LegendMummyPriest);
		b.TargetAttractionMult = 3.0;
		b.IsAffectedByNight = false;
		b.IsAffectedByInjuries = false;
		b.IsImmuneToBleeding = true;
		b.IsImmuneToPoison = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		this.m.Skills.add(this.new("scripts/skills/actives/horror_skill"));
		this.m.Skills.add(this.new("scripts/skills/actives/miasma_skill"));
		 if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));
			}

	}

	function assignRandomEquipment()
	{
		local armor = [
			[1, "ancient/legend_mummy_dress"]
		];
		local item = this.Const.World.Common.pickArmor(armor);
		this.m.Items.equip(item);

		local item = this.Const.World.Common.pickHelmet([
			[1, "ancient/legend_mummy_headband"],
            [1, "ancient/legend_mummy_crown"]
		])
		if (item != null)
		{
			this.m.Items.equip(item);
		}
	}

});

