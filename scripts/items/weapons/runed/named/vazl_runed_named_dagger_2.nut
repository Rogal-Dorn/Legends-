this.vazl_runed_named_dagger_2 <- this.inherit("scripts/items/weapons/runed/vazl_runed_weapon", {
	m = {},
	function create()
	{
		this.vazl_runed_weapon.create();
		this.m.ID = "weapon.vazl_runed_named_dagger_2";
		this.m.Description = "A short and hardened dagger, masterfully crafted with a pointed blade for piercing through the smallest gaps in armor.";
		this.m.Categories = "Dagger, One-Handed";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.Condition = 50.0;
		this.m.ConditionMax = 50.0;
		this.m.Value = 1000;
		this.m.RegularDamage = 20;
		this.m.RegularDamageMax = 40;
		this.m.ArmorDamageMult = 0.7;
		this.m.DirectDamageMult = 0.2;
		this.m.IconLarge = "weapons/melee/runed_dagger_named_02.png";
		this.m.Icon = "weapons/melee/runed_dagger_named_02_70x70.png";
		this.m.ArmamentIcon = "runed_icon_named_dagger_02";
	}


	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/stab"));
		this.addSkill(this.new("scripts/skills/actives/puncture"));
	}

});
