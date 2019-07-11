this.legend_mage_swordstaff <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_mage_swordstaff";
		this.m.Name = "Bladed Magestaff";
		this.m.Description = "While the nature of its construction remains a myth, this unique mage's staff is permeated with magic";
		this.m.Categories = "Staff, Two-Handed";
		this.m.IconLarge = "weapons/melee/legend_swordstaff_01_legendary_01.png";
		this.m.Icon = "weapons/melee/legend_swordstaff_01_legendary_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded | this.Const.Items.ItemType.Defensive | this.Const.Items.ItemType.MagicStaff;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_legend_swordstaff_legendary_01";
		this.m.Value = 750;
		this.m.ShieldDamage = 0;
		this.m.Condition = 60.0;
		this.m.ConditionMax = 60.0;
		this.m.StaminaModifier = -12;
		this.m.RegularDamage = 55;
		this.m.RegularDamageMax = 75;
		this.m.ArmorDamageMult = 1.0;
		this.m.DirectDamageMult = 0.25;
		this.m.ChanceToHitHead = 5;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/legend_staff_thrust"));
		this.addSkill(this.new("scripts/skills/actives/legend_staffwall"));
		this.addSkill(this.new("scripts/skills/actives/legend_staff_riposte"));
		this.addSkill(this.new("scripts/skills/actives/legend_staff_lunge_skill"));
	}

});

