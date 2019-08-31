this.named_slingstaff <- this.inherit("scripts/items/weapons/named/named_weapon", {
	m = {},
	function create()
	{
		this.named_weapon.create();
		this.m.ID = "weapon.named_slingstaff";
		this.m.Name = "Masterwork Slingstaff";
		this.m.Description = "A masterwork sling staff, for catapulting rocks at armored foes";
		this.m.Categories = "Throwing Weapon, Two-Handed";
		this.m.IconLarge = "weapons/ranged/sling_01.png";
		this.m.Icon = "weapons/ranged/sling_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType =
		this.Const.Items.ItemType.Named |
		 this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon;
		this.m.EquipSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_sling_01";
		this.m.Value = 4500;
		this.m.RangeMin = 2;
		this.m.RangeMax = 9;
		this.m.RangeIdeal = 9;
		this.m.StaminaModifier = -12;
		this.m.Condition = 100.0;
		this.m.ConditionMax = 100.0;
		this.m.RegularDamage = 45;
		this.m.RegularDamageMax = 60;
		this.m.ArmorDamageMult = 1.5;
		this.m.DirectDamageMult = 0.8;
		this.randomizeValues();
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local aimed_shot = this.new("scripts/skills/actives/legend_sling_heavy_stone_skill");
		this.addSkill(aimed_shot);
		this.addSkill(this.new("scripts/skills/actives/bash"));
	}


});
