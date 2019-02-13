this.vazl_runed_orc_axe_2h <- this.inherit("scripts/items/weapons/runed/vazl_runed_weapon", {
	m = {},
	function create()
	{
		this.vazl_runed_weapon.create();
		this.m.ID = "weapon.vazl_runed_orc_axe_2h";
		this.m.Name = "Man Splitter";
		this.m.Description = "A huge and crudely built double headed battleaxe too heavy to be used effectively by the average human.";
		this.m.Categories = "Axe, Two-Handed";
		this.m.IconLarge = "weapons/melee/orc_axe_two_handed.png";
		this.m.Icon = "weapons/melee/orc_axe_two_handed_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsAoE = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_orc_weapon_01";
		this.m.Value = 1500;
		this.m.ShieldDamage = 42;
		this.m.Condition = 64.0;
		this.m.ConditionMax = 64.0;
		this.m.StaminaModifier = -34;
		this.m.RegularDamage = 90;
		this.m.RegularDamageMax = 120;
		this.m.ArmorDamageMult = 1.6;
		this.m.DirectDamageMult = 0.4;
		this.m.ChanceToHitHead = 0;
	}

	function getTooltip()
	{
		local ret = this.vazl_runed_weapon.getTooltip();
		ret.push({
			id = 18,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "Builds up additional [color=" + this.Const.UI.Color.NegativeValue + "]5[/color] Fatigue with every skill use"
		});
		return ret;
	}

	function onEquip()
	{
		this.vazl_runed_weapon.onEquip();
		local skill;
		skill = this.new("scripts/skills/actives/split_man");
		skill.setFatigueCost(this.Math.round(skill.getFatigueCostRaw() + 5));
		this.addSkill(skill);
		skill = this.new("scripts/skills/actives/round_swing");
		skill.setFatigueCost(this.Math.round(skill.getFatigueCostRaw() + 5));
		this.addSkill(skill);
		skill = this.new("scripts/skills/actives/split_shield");
		skill.setApplyAxeMastery(true);
		skill.setFatigueCost(skill.getFatigueCostRaw() + 10);
		this.addSkill(skill);
	}

	function onUpdateProperties( _properties )
	{
		this.vazl_runed_weapon.onUpdateProperties(_properties);
	}

});
