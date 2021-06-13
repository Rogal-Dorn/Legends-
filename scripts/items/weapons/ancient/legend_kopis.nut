this.legend_kopis <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_kopis";
		this.m.Name = "Kopis";
		this.m.Description = "A lightweight, curved sword good at piercing armor";
		this.m.Categories = "Sword, One-Handed";
		this.m.IconLarge = "weapons/melee/legend_kopis_01.png";
		this.m.Icon = "weapons/melee/legend_kopis_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_legend_kopis_01";
		this.m.Condition = 56.0;
		this.m.ConditionMax = 56.0;
		this.m.StaminaModifier = -8;
		this.m.Value = 1250;
		this.m.RegularDamage = 40;
		this.m.RegularDamageMax = 50;
		this.m.ArmorDamageMult = 1.2;
		this.m.DirectDamageMult = 0.25;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/slash"));
		this.addSkill(this.new("scripts/skills/actives/riposte"));
	}

	function onUpdateProperties( _properties )
	{
		this.weapon.onUpdateProperties(_properties);
	}

});

