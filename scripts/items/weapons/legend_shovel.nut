this.legend_shovel <- this.inherit("scripts/items/weapons/weapon", {
	m = {
		StunChance = 10
	},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_shovel";
		this.m.Name = "Shovel";
		this.m.Description = "A tool meant for digging holes, not maiming men. A shovel's wide blade lends accuracy when aiming for the head, but almost anything else would be better.";
		this.m.Categories = "Mace, Two-Handed";
		this.m.IconLarge = "weapons/melee/shovel_01.png";
		this.m.Icon = "weapons/melee/shovel_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = false;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_shovel_01";
		this.m.Value = 50;
		this.m.Condition = 32.0;
		this.m.ConditionMax = 32.0;
		this.m.StaminaModifier = -6;
		this.m.RegularDamage = 20;
		this.m.RegularDamageMax = 30;
		this.m.ArmorDamageMult = 0.45;
		this.m.DirectDamageMult = 0.15;
		this.m.ChanceToHitHead = 10;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/bash"));
	}

	function onUpdateProperties( _properties )
	{
		this.weapon.onUpdateProperties(_properties);
	}

});
