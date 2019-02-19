this.legend_hoe <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_hoe";
		this.m.Name = "Scythe";
		this.m.Description = "A digging tool, also digs through shields";
		this.m.Categories = "Axe, Two-Handed";
		this.m.IconLarge = "weapons/melee/hoe_01.png";
		this.m.Icon = "weapons/melee/hoe_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsAgainstShields = true;
		this.m.IsAoE = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "hoe_01";
		this.m.Value = 55;
		this.m.ShieldDamage = 20
		this.m.Condition = 30.0;
		this.m.ConditionMax = 30.0;
		this.m.StaminaModifier = -4;
		this.m.RegularDamage = 15;
		this.m.RegularDamageMax = 20;
		this.m.ArmorDamageMult = 0.6;
		this.m.DirectDamageMult = 0.25;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/chop"));
		local skillToAdd = this.new("scripts/skills/actives/split_shield");
		skillToAdd.setApplyAxeMastery(true);
		this.addSkill(skillToAdd);
	}

});
