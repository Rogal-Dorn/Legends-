this.legend_militia_glaive <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_militia_glaive";
		this.m.Name = "Militia Glaive";
		this.m.Description = "A simple glaive improvised from a scramasax.";
		this.m.Categories = "Spear, One-Handed";
		this.m.IconLarge = "weapons/melee/legend_militia_glaive_01.png";
		this.m.Icon = "weapons/melee/legend_militia_glaive_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded | this.Const.Items.ItemType.Defensive;
		this.m.IsDoubleGrippable = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_legend_militia_glaive_01";
		this.m.Value = 350;
		this.m.Condition = 48.0;
		this.m.ConditionMax = 48.0;
		this.m.StaminaModifier = -8;
		this.m.RegularDamage = 30;
		this.m.RegularDamageMax = 40;
		this.m.ArmorDamageMult = 0.9;
		this.m.DirectDamageMult = 0.25;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local s = this.new("scripts/skills/actives/legend_militia_slash");
		s.m.Icon = "skills/glaive_militia_slash.png";
		s.m.IconDisabled = "skills/glaive_militia_slash_bw.png";
		this.addSkill(s);

	
		local t = this.new("scripts/skills/actives/spearwall");
		t.m.Icon = "skills/glaive_spearwall.png";
		t.m.IconDisabled = "skills/glaive_spearwall_bw.png";
		this.addSkill(t);
	}

	function onUpdateProperties( _properties )
	{
		this.weapon.onUpdateProperties(_properties);
	}

});

