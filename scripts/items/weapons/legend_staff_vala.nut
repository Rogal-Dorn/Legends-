this.legend_staff_vala <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_staff_vala";
		this.m.Name = "Vala Staff";
		this.m.Description = "The Vala's staff, required for most of her skills.";
		this.m.Categories = "Staff, One-Handed";
		this.m.IconLarge = "weapons/melee/legend_staff_05.png";
		this.m.Icon = "weapons/melee/legend_staff_05_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_legend_staff_05";
		this.m.Value = 1000;
		this.m.Condition = 80.0;
		this.m.ConditionMax = 80.0;
		this.m.StaminaModifier = -4;
		this.m.RegularDamage = 25;
		this.m.RegularDamageMax = 35;
		this.m.ArmorDamageMult = 0.7;
		this.m.DirectDamageMult = 0.4;
//		this.m.IsChangeableInBattle = false;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/bash"));
		this.addSkill(this.new("scripts/skills/actives/knock_out"));
	}

});
