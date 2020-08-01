this.mercenary_freykin <- this.inherit("scripts/entity/tactical/humans/special/mercenary_custom", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.Mercenary;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.Freykin.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
        this.m.AIAgent = this.new("scripts/ai/tactical/agents/mercenary_freykin_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.mercenary_custom.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.Freykin);
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

        this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_fortified_mind"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_mind_over_body"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_ninetails_damage"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_cult_hood"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_cult_armor"));
		this.m.Skills.add(this.new("scripts/skills/actives/horrific_scream"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));


	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{
		local r;
        this.m.Items.equip(this.new("scripts/items/weapons/battle_whip"));
        this.m.Items.addToBag(this.new("scripts/items/weapons/throwing_spear"));
        if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
        {
            local armor = this.new("scripts/items/legend_armor/cloth/legend_sackcloth");
            armor.m.ConditionMax = 155;
            armor.m.Condition = 155;
            armor.m.IsDroppedAsLoot = false;
            this.m.Items.equip(armor);
            local helm = this.new("scripts/items/helmets/cultist_hood");
            helm.m.ConditionMax = 155;
            helm.m.Condition = 155;
            helm.m.IsDroppedAsLoot = false;
            this.m.Items.equip(helm);
        }
		else
		{
            local armor = this.new("scripts/items/armor/legend_sackcloth");
            armor.m.DurabilityMax = 155;
            armor.m.Durability = 155;
            armor.m.IsDroppedAsLoot = false;
            this.m.Items.equip(armor);
            local helm = this.new("scripts/items/helmets/cultist_hood");
            helm.m.ConditionMax = 155;
            helm.m.Condition = 155;
            helm.m.IsDroppedAsLoot = false;
            this.m.Items.equip(helm);
		}
	}

});

