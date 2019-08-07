this.legend_drum <- this.inherit("scripts/items/weapons/weapon", {
	m = {
		StunChance = 30
	},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_drum";
		this.m.Name = "Drum";
		this.m.Description = "A musical instrument, can produce inspiring rythms, if you have the skill";
		this.m.Categories = "Musical Instrument, Two-Handed";
		this.m.IconLarge = "weapons/melee/drum_01.png";
		this.m.Icon = "weapons/melee/drum_01_70x70.png";
		this.m.BreakingSound = "sounds/combat/lute_break_01.wav";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsDoubleGrippable = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_drum";
		this.m.Value = 100;
		this.m.Condition = 30.0;
		this.m.ConditionMax = 30.0;
		this.m.StaminaModifier = -4;
		this.m.RegularDamage = 15;
		this.m.RegularDamageMax = 20;
		this.m.ArmorDamageMult = 0.1;
		this.m.DirectDamageMult = 0.4;
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

