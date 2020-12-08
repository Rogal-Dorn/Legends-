this.legend_mummy_queen <- this.inherit("scripts/entity/tactical/legend_mummy", {
	m = {
	WasInjured = false
	},
	function create()
	{
		this.m.Type = this.Const.EntityType.LegendMummyQueen;
		this.m.XP = this.Const.Tactical.Actor.LegendMummyQueen.XP;
		this.m.ResurrectionValue = 15.0;
		this.m.ResurrectWithScript = "scripts/entity/tactical/enemies/legend_mummy_queen";
		this.m.IsGeneratingKillName = false;
		this.legend_mummy.create();
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/vampire_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.legend_mummy.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.LegendMummyQueen);
		b.IsAffectedByNight = false;
		b.IsAffectedByInjuries = false;
		b.IsImmuneToBleeding = true;
		b.IsImmuneToPoison = true;
		b.IsImmuneToDisarm = true;
		b.IsSpecializedInCleavers = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
		this.m.Skills.add(this.new("scripts/skills/special/double_grip"));
		this.m.Skills.add(this.new("scripts/skills/racial/vampire_racial"));
		this.m.Skills.add(this.new("scripts/skills/actives/darkflight"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_head_hunter"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_nine_lives"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_bloodbath"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_slaughter"));		
		
		 if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_full_force"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_composure"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			}

			if (this.Math.rand(1,100) <= 50)
			{
				this.getSprite("body").setBrush("bust_vampire_lady_body_01");
				this.getSprite("head").setBrush("bust_vampire_lady_head_01");
			}
			else
			{
				this.getSprite("body").setBrush("bust_vampire_lady_body_02");
				this.getSprite("head").setBrush("bust_vampire_lady_head_02");
			}
			if (this.Math.rand(1, 100) <= 60)
			{
				hair.setBrush("hair_black_25")
			}
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_terrifying_visage"));
	}


function onUpdateInjuryLayer()
	{
		local p = this.getHitpointsPct();
		local bodyBrush = this.getSprite("body").getBrush().Name;
		local headBrush = this.getSprite("head").getBrush().Name;

		if (p <= 0.33)
		{
			this.getSprite("body").setBrush("bust_vampire_lord_body_03");
			this.getSprite("body_injury").setBrush("bust_skeleton_body_03_injured");
			this.getSprite("head").setBrush("bust_vampire_lord_head_03");
			this.getSprite("injury").setBrush("bust_skeleton_head_03_injured");
		}
		else if (p <= 0.66)
		{
			this.getSprite("body").setBrush("bust_vampire_lord_body_02");
			this.getSprite("body_injury").setBrush("bust_skeleton_body_04_injured");
			this.getSprite("head").setBrush("bust_vampire_lord_head_02");
			this.getSprite("injury").setBrush("bust_skeleton_head_04_injured");
		}
		else
		{
			this.getSprite("body").setBrush("bust_vampire_lady_body_01");
			this.getSprite("body_injury").setBrush("bust_skeleton_body_05_injured");
			this.getSprite("head").setBrush("bust_vampire_lady_head_01");
			this.getSprite("injury").setBrush("bust_skeleton_head_05_injured");
			this.getSprite("hair").setBrush("hair_black_25");
		}


		this.getSprite("body_injury").Visible = this.m.WasInjured;
		this.getSprite("injury").Visible = this.m.WasInjured;

		if (bodyBrush != this.getSprite("body").getBrush().Name)
		{
			local old_body = this.getSprite("old_body");
			old_body.Visible = true;
			old_body.Alpha = 255;
			old_body.setBrush(bodyBrush);
			old_body.fadeOutAndHide(3000);
			local old_head = this.getSprite("old_head");
			old_head.Visible = true;
			old_head.Alpha = 255;
			old_head.setBrush(headBrush);
			old_head.fadeOutAndHide(3000);
		}

		this.setDirty(true);
	}



	function assignRandomEquipment()
	{
		this.m.Items.equip(this.new("scripts/items/weapons/named/named_legend_great_khopesh"));

		local item = this.Const.World.Common.pickArmor([
			[1, "ancient/legend_mummy_dress"] 
		]);
		this.m.Items.equip(item);

		local item = this.Const.World.Common.pickHelmet([
			[66, ancient/mummy_crown"]
		])
		if (item != null)
		{
			this.m.Items.equip(item);
		}
	}

});

