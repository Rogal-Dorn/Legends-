this.vazl_runed_named_mace_1 <- this.inherit("scripts/items/weapons/runed/vazl_runed_weapon", {
	m = {
		StunChance = 30
	},
	function create()
	{
		this.vazl_runed_weapon.create();
		this.m.ID = "weapon.vazl_runed_named_mace_1";
		this.m.Description = "A full-metal mace with a short shaft and attached blades. The smith who forged this weapon certainly knew what he was doing.";
		this.m.Categories = "Mace, One-Handed";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.Value = 4200;
		this.m.ShieldDamage = 0;
		this.m.Condition = 80.0;
		this.m.ConditionMax = 80.0;
		this.m.StaminaModifier = -10;
		this.m.RegularDamage = 35;
		this.m.RegularDamageMax = 55;
		this.m.ArmorDamageMult = 1.1;
		this.m.DirectDamageMult = 0.4;
		this.m.IconLarge = "weapons/melee/mace_01_named_01.png";
		this.m.Icon = "weapons/melee/mace_01_named_01_70x70.png";
		this.m.ArmamentIcon = "icon_named_mace_01";
	}


	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/bash"));
		this.addSkill(this.new("scripts/skills/actives/knock_out"));
	}

});
