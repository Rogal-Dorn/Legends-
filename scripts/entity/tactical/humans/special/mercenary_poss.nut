this.mercenary_poss <- this.inherit("scripts/entity/tactical/humans/special/mercenary_custom", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.Mercenary;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.Poss.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.WildMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.Old;
        this.m.AIAgent = this.new("scripts/ai/tactical/agents/mercenary_poss_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.mercenary_custom.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.Poss);
		b.IsSpecializedInSwords = true;
		b.IsSpecializedInAxes = true;
		b.IsSpecializedInMaces = true;
		b.IsSpecializedInFlails = true;
		b.IsSpecializedInPolearms = true;
		b.IsSpecializedInThrowing = true;
		b.IsSpecializedInHammers = true;
		b.IsSpecializedInSpears = true;
		b.IsSpecializedInCleavers = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_militia");

		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_mind_over_body"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_ubernimble"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_composure"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_muscularity"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_forceful_swing"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_sundering_strikes"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_feint"));
		this.m.Skills.add(this.new("scripts/skills/racial/schrat_racial"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_pathfinder"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));

	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{
        local weapon = this.new("scripts/items/weapons/wooden_flail");
        weapon.m.IsDroppedAsLoot = false;
        this.m.Items.equip(weapon);
        this.m.Skills.getSkillByID("actives.flail").m.ActionPointCost = 1;
        this.m.Skills.getSkillByID("actives.lash").m.ActionPointCost = 1;
	}

});

