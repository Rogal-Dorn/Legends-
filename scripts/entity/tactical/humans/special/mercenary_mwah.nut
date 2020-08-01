this.mercenary <- this.inherit("scripts/entity/tactical/humans/special/mercenary_custom", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.Mercenary;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.Mwah.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Female;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/mercenary_mwah_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.mercenary_custom.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.Mwah);
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
	    this.m.Skills.add(this.new("scripts/skills/perks/perk_clarity"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));

	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{
		local r;
        this.m.Items.equip(this.new("scripts/items/weapons/named/named_warscythe"));
        this.m.Items.addToBag(this.new("scripts/items/weapons/javelin"));
        this.m.Items.addToBag(this.new("scripts/items/weapons/throwing_spear"));
        if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
        {
            local armor = this.new("scripts/items/legend_armor/cloth/legend_tunic_noble");
            armor.setUpgrade(this.new("scripts/items/legend_armor/legend_armor_hauberk_sleevless"));
            armor.setUpgrade(this.new("scripts/items/legend_armor/legend_armor_plate_full_greaves"));
            this.m.Items.equip(armor);
            local helm = this.new("scripts/items/helmets/legend_vampire_lord_helmet");
            helm.m.ConditionMax = 300;
            helm.m.Condition = 300;
            helm.m.IsDroppedAsLoot = false;
            this.m.Items.equip(helm);
        }
		else
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

