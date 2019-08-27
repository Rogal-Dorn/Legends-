this.rope_dart <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.rope_dart";
		this.m.Name = "Rope Dart";
		this.m.Description = "The rope dart is a long rope with a metal dart on one end. Extremely difficult to master, but deadly in the right hands.";
		this.m.Categories = "Dagger, Two-Handed";
		this.m.IconLarge = "weapons/melee/dagger_01.png";
		this.m.Icon = "weapons/melee/dagger_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_dagger_01";
		this.m.Value = 150;
		this.m.StaminaModifier = -4;
		this.m.RangeMin = 2;
		this.m.RangeMax = 3;
		this.m.RangeIdeal = 3;
		this.m.Condition = 50.0;
		this.m.ConditionMax = 50.0;
		this.m.RegularDamage = 35;
		this.m.RegularDamageMax = 40;
		this.m.ArmorDamageMult = 0.6;
		this.m.DirectDamageMult = 0.2;
	}


	function onEquip()
	{
		this.weapon.onEquip();
		local rope_dart = this.new("scripts/skills/actives/rope_dart");
		this.addSkill(rope_dart);
		this.addSkill(this.new("scripts/skills/actives/stab"));
	}

});
