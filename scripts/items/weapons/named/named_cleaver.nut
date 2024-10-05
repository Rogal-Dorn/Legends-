this.named_cleaver <- this.inherit("scripts/items/weapons/named/named_weapon", {
	m = {
		PossibleEffects = ["scripts/skills/effects/legend_named_cleaver_effect"],
		EffectBounds = [ [10, 20] ]
	},
	function create()
	{
		this.named_weapon.create();
		this.m.Variants = [1,2,3]
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() -1)];
		this.updateVariant();
		this.m.ID = "weapon.named_cleaver";
		this.m.NameList = this.Const.Strings.CleaverNames;
		this.m.Description = "A masterful smith managed to create this military cleaver in a way that it handles almost like a regular sword but loses nothing of its devastating power.";
		this.m.WeaponType = this.Const.Items.WeaponType.Cleaver;
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ShieldDamage = 0;
		this.m.Condition = 80.0;
		this.m.ConditionMax = 80.0;
		this.m.StaminaModifier = -12;
		this.m.Value = 3800;
		this.m.RegularDamage = 40;
		this.m.RegularDamageMax = 60;
		this.m.ArmorDamageMult = 0.9;
		this.m.DirectDamageMult = 0.25;
		this.randomizeValues();
	}

	function getTooltip()
	{
		local result = this.named_weapon.getTooltip();
		if (this.m.PossibleEffectIdx == 0)
		{
			result.push({
				id = 12,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.EffectChanceOrBonus + "%[/color] Fatality Chance"
			});
		}
		return result;
	}


	function updateVariant()
	{
		this.m.IconLarge = "weapons/melee/cleaver_01_named_0" + this.m.Variant + ".png";
		this.m.Icon = "weapons/melee/cleaver_01_named_0" + this.m.Variant + "_70x70.png";
		this.m.ArmamentIcon = "icon_named_cleaver_0" + this.m.Variant;
	}

	function onEquip()
	{
		this.named_weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/cleave"));
		this.addSkill(this.new("scripts/skills/actives/decapitate"));
	}

});

