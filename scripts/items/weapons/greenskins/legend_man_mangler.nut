this.legend_man_mangler <- this.inherit("scripts/items/weapons/weapon", {
	m = {
		StunChance = 5
		},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_man_mangler";
		this.m.Name = "Man Mangler";
		this.m.Description = "A massive, crudely sharpened shard of metal that makes up for its stunted length through sheer weight. So heavy no average human can use it effectively.";
		this.m.Categories = "Sword, Two-Handed";
		this.m.IconLarge = "weapons/melee/legend_man_mangler_01.png";
		this.m.Icon = "weapons/melee/legend_man_mangler_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = false;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_legend_man_mangler_01";
		this.m.Value = 1600;
		this.m.Condition = 64.0;
		this.m.ConditionMax = 64.0;
		this.m.StaminaModifier = -26;
		this.m.RegularDamage = 90;
		this.m.RegularDamageMax = 120;
		this.m.ArmorDamageMult = 1.0;
		this.m.DirectDamageMult = 0.35;
		this.m.ChanceToHitHead = 5;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local skillToAdd = this.new("scripts/skills/actives/legend_great_swing");
		skillToAdd.setFatigueCost(skillToAdd.getFatigueCostRaw() + 5);
		this.addSkill(skillToAdd);
		skillToAdd = this.new("scripts/skills/actives/split_shield");
		skillToAdd.setFatigueCost(skillToAdd.getFatigueCostRaw() + 5);
		this.addSkill(skillToAdd);
		skillToAdd = this.new("scripts/skills/actives/overhead_strike");
		skillToAdd.setFatigueCost(skillToAdd.getFatigueCostRaw() + 5);
		skillToAdd.setStunChance(this.m.StunChance);
		this.addSkill(skillToAdd);
	}

});
