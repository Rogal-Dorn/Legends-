this.named_sling <- this.inherit("scripts/items/weapons/named/named_weapon", {
	m = {},
	function create()
	{
		this.named_weapon.create();
		this.m.ID = "weapon.named_sling";
		this.m.Name = "Fancy Sling";
		this.m.Description = "A very fancy sling, for hurling rocks at your rivals. With stones abundant everywhere, it will never run out of ammunition.";
		this.m.Categories = "Throwing Weapon, One-Handed";
		this.m.IconLarge = "weapons/ranged/legend_sling_02.png";
		this.m.Icon = "weapons/ranged/legend_sling_02_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType =
		 this.Const.Items.ItemType.Named |this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon;
		this.m.EquipSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_legend_sling_02";
		this.m.Value = 700;
		this.m.StaminaModifier = -4;
		this.m.RangeMin = 2;
		this.m.RangeMax = 6;
		this.m.RangeIdeal = 6;
		this.m.Condition = 50.0;
		this.m.ConditionMax = 50.0;
		this.m.RegularDamage = 25;
		this.m.RegularDamageMax = 35;
		this.m.ArmorDamageMult = 0.5;
		this.m.DirectDamageMult = 0.35;
		this.randomizeValues();
	}


	function onEquip()
	{
		this.weapon.onEquip();
		local quick_shot = this.new("scripts/skills/actives/sling_stone_skill");
		this.addSkill(quick_shot);
	}

});
