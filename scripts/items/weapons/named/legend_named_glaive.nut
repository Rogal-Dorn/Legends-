this.legend_named_glaive <- this.inherit("scripts/items/weapons/named/named_weapon", {
	m = {},
	function create()
	{
		this.named_weapon.create();
		this.m.ID = "weapon.legend_named_glaive";
		this.m.NameList = this.Const.Strings.SpearNames;
		this.m.Description = "A masterfully crafted glaive that feels surprisingly light, yet sturdy.";
		this.m.Categories = "Spear, One-Handed";
		this.m.IconLarge = "weapons/melee/legend_glaive_01_named_01.png";
		this.m.Icon = "weapons/melee/legend_glaive_01_named_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded | this.Const.Items.ItemType.Defensive;
		this.m.IsDoubleGrippable = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_legend_named_glaive_01";
		this.m.Value = 4200;
		this.m.Condition = 72.0;
		this.m.ConditionMax = 72.0;
		this.m.StaminaModifier = -16;
		this.m.RegularDamage = 45;
		this.m.RegularDamageMax = 50;
		this.m.ArmorDamageMult = 1.0;
		this.m.DirectDamageMult = 0.25;
		this.randomizeValues();
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local s = this.new("scripts/skills/actives/legend_glaive_slash");
		s.m.Icon = "skills/glaive_slash.png";
		s.m.IconDisabled = "skills/glaive_slash_bw.png";
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

