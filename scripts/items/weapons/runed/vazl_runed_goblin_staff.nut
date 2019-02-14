this.vazl_runed_goblin_staff <- this.inherit("scripts/items/weapons/runed/vazl_runed_weapon", {
	m = {
		StunChance = 30
	},
	function create()
	{
		this.vazl_runed_weapon.create();
		this.m.ID = "weapon.vazl_runed_goblin_staff";
		this.m.Name = "Gnarly Staff";
		this.m.Description = "A gnarly staff carved from old and hard wood, adorned with bones and feathers. May be of interest to collectors.";
		this.m.Categories = "Mace, One-Handed";
		this.m.IconLarge = "weapons/melee/runed_goblin_weapon_06.png";
		this.m.Icon = "weapons/melee/runed_goblin_weapon_06_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = true;
		this.m.EquipSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_goblin_weapon_06";
		this.m.Value = 1000;
		this.m.Condition = 56.0;
		this.m.ConditionMax = 56.0;
		this.m.StaminaModifier = -4;
		this.m.RegularDamage = 25;
		this.m.RegularDamageMax = 35;
		this.m.ArmorDamageMult = 0.7;
		this.m.DirectDamageMult = 0.4;
	}

	function onEquip()
	{
		this.vazl_runed_weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/bash"));
		this.addSkill(this.new("scripts/skills/actives/knock_out"));
	}

});
