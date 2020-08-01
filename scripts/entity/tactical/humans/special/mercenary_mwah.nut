this.mercenary_mwah <- this.inherit("scripts/entity/tactical/humans/special/mercenary_custom", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.Mercenary;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.Mwah.XP;
		this.human.create();
		this.m.Faces = ["bust_head_female_01"];
		this.m.Hairs = ["01"];
		this.m.HairColors = ["grey"];
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

		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_mind_over_body"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
		this.getSprite("hair").setBrush("hair_" + "grey" + "_" + "01");
	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{
		local r;
        // local weapon = this.new("scripts/items/weapons/ancient/warscythe");
        local weapon = this.new("scripts/items/weapons/named/named_warscythe")
        weapon.m.IsDroppedAsLoot = false;
        this.m.Items.equip(weapon);
        this.m.Items.addToBag(this.new("scripts/items/weapons/barbarians/heavy_javelin"));
        this.m.Items.addToBag(this.new("scripts/items/weapons/throwing_spear"));
        if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
        {
            local armor = this.new("scripts/items/legend_armor/cloth/legend_gambeson_wolf");
            armor.setUpgrade(this.new("scripts/items/legend_armor/chain/legend_armor_hauberk_full"));
            armor.setUpgrade(this.new("scripts/items/legend_armor/plate/legend_armor_plate_full_greaves"));
            armor.setUpgrade(this.new("scripts/items/legend_armor/cloak/legend_armor_cloak_noble"));
            armor.setUpgrade(this.new("scripts/items/legend_armor/armor_upgrades/legend_direwolf_pelt_upgrade"));
			armor.m.IsDroppedAsLoot = false;
            this.m.Items.equip(armor);
            local helm = this.new("scripts/items/helmets/legend_vampire_lord_helmet");
            helm.m.ConditionMax = 300;
            helm.m.Condition = 300;
            helm.m.IsDroppedAsLoot = false;
			helm.m.HideHair = false;
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
		this.getSprite("hair").Visible = true;
	}

});

