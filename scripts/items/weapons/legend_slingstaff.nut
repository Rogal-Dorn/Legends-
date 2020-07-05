this.legend_slingstaff <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_slingstaff";
		this.m.Name = "Slingstaff";
		this.m.Description = "A sturdy sling staff, for catapulting rocks at armored foes";
		this.m.Categories = "Throwing Weapon, Two-Handed";
		this.m.IconLarge = "weapons/ranged/sling_01.png";
		this.m.Icon = "weapons/ranged/sling_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon;
		this.m.EquipSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_sling_01";
		this.m.Value = 1000;
		this.m.RangeMin = 2;
		this.m.RangeMax = 9;
		this.m.RangeIdeal = 9;
		this.m.StaminaModifier = -12;
		this.m.Condition = 100.0;
		this.m.ConditionMax = 100.0;
		this.m.RegularDamage = 35;
		this.m.RegularDamageMax = 45;
		this.m.ArmorDamageMult = 1.5;
		this.m.DirectDamageMult = 0.35;
		this.m.DirectDamageAdd = 0.45;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local aimed_shot = this.new("scripts/skills/actives/legend_sling_heavy_stone_skill");
		this.addSkill(aimed_shot);
		this.addSkill(this.new("scripts/skills/actives/legend_slingstaff_bash")); //this was set to legend_staff_bash before but shouldnt it be slingstaff_bash because it's a slingstaff
	}

});

