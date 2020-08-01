this.mercenary_forest <- this.inherit("scripts/entity/tactical/humans/special/mercenary_custom", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.Mercenary;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.Forest.XP;
		this.human.create();
		this.m.Faces = ["bust_head_female_01"];
		this.m.Hairs = ["01"];
		this.m.HairColors = ["grey"];
        this.m.AIAgent = this.new("scripts/ai/tactical/agents/mercenary_forest_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.mercenary_custom.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.Forest);
		b.IsSpecializedInSwords = true;
		b.IsSpecializedInAxes = true;
		b.IsSpecializedInMaces = true;
		b.IsSpecializedInFlails = true;
		b.IsSpecializedInPolearms = true;
		b.IsSpecializedInThrowing = true;
		b.IsSpecializedInHammers = true;
		b.IsSpecializedInSpears = true;
		b.IsSpecializedInCleavers = true;
        b.IsImmuneToKnockBackAndGrab = true;
		b.IsImmuneToStun = true;
        b.IsAffectedByNight = false;
		b.IsAffectedByInjuries = false;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_militia");

		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_mind_over_body"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));

        this.getSprite("head").Saturation = 1.0;
		this.getSprite("head").Color = this.createColor("#ffffff");


	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{
		local weapon = this.new("scripts/items/weapons/named/named_greatsword")
        weapon.m.IsDroppedAsLoot = false;
        this.m.Items.equip(weapon);
        if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
        {
            local armor = this.new("scripts/items/legend_armor/cloth/legend_dark_tunic");
            armor.m.ConditionMax = 300;
            armor.m.Condition = 300;
			armor.m.IsDroppedAsLoot = false;
            this.m.Items.equip(armor);
            local helm = this.new("scripts/items/helmets/hood");
            helm.m.ConditionMax = 300;
            helm.m.Condition = 300;
            helm.m.IsDroppedAsLoot = false;
			helm.m.HideHair = false;
            this.m.Items.equip(helm);
        }
		else //i just cba doing these sorry
		{
			if (this.Const.DLC.Unhold)
			{
                this.m.Items.equip(this.new("scripts/items/armor/sellsword_armor"));
			}
			else
			{
                this.m.Items.equip(this.new("scripts/items/armor/lamellar_harness"));
			}
            local helm = this.new("scripts/items/helmets/legend_vampire_lord_helmet");
            helm.m.ConditionMax = 300;
            helm.m.Condition = 300;
            helm.m.IsDroppedAsLoot = false;
            this.m.Items.equip(helm);
		}
    }

});

