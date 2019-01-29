this.named_orc_axe <- this.inherit("scripts/items/weapons/named/named_weapon", {
	m = {},
	function create()
	{
		this.named_weapon.create();
		this.m.Variant = this.Math.rand(1, 3);
		this.updateVariant();
		this.m.ID = "weapon.named_orc_axe";
		this.m.NameList = this.Const.Strings.AxeNames;
		this.m.Description = "A heavy piece of metal with a sharp head. Not made for human hands.";
		this.m.Categories = "Axe, One-Handed";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.Value = 2200;
		this.m.ShieldDamage = 16;
		this.m.Condition = 64.0;
		this.m.ConditionMax = 64.0;
		this.m.StaminaModifier = -22;
		this.m.RegularDamage = 35;
		this.m.RegularDamageMax = 65;
		this.m.ArmorDamageMult = 1.29999995;
		this.m.DirectDamageMult = 0.300000012;
		this.randomizeValues();
	}

	function updateVariant()
	{
		this.m.IconLarge = "weapons/melee/orc_axe_named_0" + this.m.Variant + "_140x70.png";
		this.m.Icon = "weapons/melee/orc_axe_named_0" + this.m.Variant + "_70x70.png";
		this.m.ArmamentIcon = "icon_orc_weapon_02_named_0" + this.m.Variant;
	}

	function getTooltip()
	{
		local ret = this.weapon.getTooltip();
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
		this.named_weapon.onEquip();
		local skill;
		skill = this.new("scripts/skills/actives/chop");
		skill.setFatigueCost(this.Math.round(skill.getFatigueCostRaw() + 5));
		this.addSkill(skill);
		skill = this.new("scripts/skills/actives/split_shield");
		skill.setApplyAxeMastery(true);
		skill.setFatigueCost(this.Math.round(skill.getFatigueCostRaw() + 5));
		this.addSkill(skill);
	}

});
