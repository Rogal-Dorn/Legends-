this.legend_staff <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_staff";
		this.m.Name = "Staff";
		this.m.Description = "A sturdy staff, good for walking and whacking";
		this.m.Categories = "Staff, Two-Handed";
		this.m.IconLarge = "weapons/melee/staff_01.png";
		this.m.Icon = "weapons/melee/staff_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded | this.Const.Items.ItemType.Defensive;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_staff_01";
		this.m.Value = 50;
		this.m.ShieldDamage = 0;
		this.m.Condition = 40.0;
		this.m.ConditionMax = 40.0;
		this.m.StaminaModifier = -4;
		this.m.RangeMin = 1;
		this.m.RangeMax = 1;
		this.m.RangeIdeal = 2;
		this.m.RegularDamage = 20;
		this.m.RegularDamageMax = 30;
		this.m.ArmorDamageMult = 0.3;
		this.m.DirectDamageMult = 0.3;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/bash"));
		this.addSkill(this.new("scripts/skills/actives/knock_out"));
	}

});
