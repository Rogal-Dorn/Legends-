this.zombie_yeoman_frenzy <- this.inherit("scripts/entity/tactical/enemies/zombie", {
	m = {},
	function getName()
	{
		return "Feral Wiederganger";
	}

	function create()
	{
		this.zombie_yeoman.create();
	}

	function onInit()
	{
		this.zombie_yeoman.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.ZombieYeoman);
		b.IsAffectedByNight = false;
		b.IsImmuneToDisarm = false;
		b.DamageTotalMult = 1.30;
		this.m.ActionPoints = 9; //Normal starts with 6
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;

		local head_frenzy = this.getSprite("zombie_rage_eyes");
		head_frenzy.setBrush(this.getSprite("head").getBrush().Name + "_zombie_rage_eyes"); 

		this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
		if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));
		}

	}

});

