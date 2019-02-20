this.legend_mystic_staff <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_mystic_staff";
		this.m.Name = "Mystic staff";
		this.m.Description = "A sturdy staff with a crystal ball on its tip, it catches the light in mysterious ways";
		this.m.Categories = "Staff, Two-Handed";
		this.m.IconLarge = "weapons/melee/staff_03.png";
		this.m.Icon = "weapons/melee/staff_03_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon | this.Const.Items.ItemType.TwoHanded | this.Const.Items.ItemType.Defensive;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_staff_03";
		this.m.Value = 1000;
		this.m.ShieldDamage = 0;
		this.m.Condition = 100.0;
		this.m.ConditionMax = 100.0;
		this.m.StaminaModifier = -4;
		this.m.RangeMin = 1;
		this.m.RangeMax = 6;
		this.m.RangeIdeal = 1;
		this.m.RegularDamage = 40;
		this.m.RegularDamageMax = 50;
		this.m.ArmorDamageMult = 0.3;
		this.m.DirectDamageMult = 0.3;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/bash"));
		this.addSkill(this.new("scripts/skills/actives/legend_magic_missile"));
	}

});
