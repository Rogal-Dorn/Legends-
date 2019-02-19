this.legend_hammer <- this.inherit("scripts/items/weapons/weapon", {
	m = {
		StunChance = 30
	},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_hammer";
		this.m.Name = "Hammer";
		this.m.Description = "A simple hammer, now everything looks like a nail";
		this.m.Categories = "Mace, One-Handed";
		this.m.IconLarge = "weapons/melee/hammer_01.png";
		this.m.Icon = "weapons/melee/hammer_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_hammer_02";
		this.m.Value = 50;
		this.m.Condition = 22.0;
		this.m.ConditionMax = 22.0;
		this.m.StaminaModifier = -5;
		this.m.RegularDamage = 15;
		this.m.RegularDamageMax = 20;
		this.m.ArmorDamageMult = 0.75;
		this.m.DirectDamageMult = 0.4;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/hammer"));
		this.addSkill(this.new("scripts/skills/actives/crush_armor"));
	}

	function onUpdateProperties( _properties )
	{
		this.weapon.onUpdateProperties(_properties);
	}

});
