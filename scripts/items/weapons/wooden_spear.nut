this.legend_wooden_spear <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_wooden_spear";
		this.m.Name = "Wooden Spear";
		this.m.Description = "A long stick with a sharpened end, barely a spear.";
		this.m.Categories = "Spear, One-Handed";
		this.m.IconLarge = "weapons/melee/spear_01.png";
		this.m.Icon = "weapons/melee/spear_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded | this.Const.Items.ItemType.Defensive;
		this.m.IsDoubleGrippable = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_spear_01";
		this.m.Value = 15;
		this.m.Condition = 16.0;
		this.m.ConditionMax = 16.0;
		this.m.StaminaModifier = -6;
		this.m.RegularDamage = 15;
		this.m.RegularDamageMax = 25;
		this.m.ArmorDamageMult = 0.45;
		this.m.DirectDamageMult = 0.2;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/thrust"));
		this.addSkill(this.new("scripts/skills/actives/spearwall"));
	}

	function onUpdateProperties( _properties )
	{
		this.weapon.onUpdateProperties(_properties);
	}

});
