this.legend_estoc <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_estoc";
		this.m.Name = "Estoc";
		this.m.Description = "A light and elegant two handed blade, favoring a swift and mobile fighting style.";
		this.m.Variants = [1,2,3,4]
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() -1)];
		this.updateVariant();
		this.m.WeaponType = this.Const.Items.WeaponType.Sword;
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.Condition = 56.0;
		this.m.ConditionMax = 56.0;
		this.m.StaminaModifier = -14;
		this.m.Value = 3200;
		this.m.RegularDamage = 45;
		this.m.RegularDamageMax = 60;
		this.m.ArmorDamageMult = 0.60;
		this.m.DirectDamageMult = 0.2;
		this.m.DirectDamageAdd = 0.3;
		this.m.ChanceToHitHead = 5;
	}

	function getTooltip()
	{
		local result = this.weapon.getTooltip();
		result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Due to its size, this weapon can only be used with both hands free."
		});
		return result;
	}

	function updateVariant()
	{
		this.m.IconLarge = "weapons/melee/legend_estoc_0" + this.m.Variant + ".png";
		this.m.Icon = "weapons/melee/legend_estoc_0" + this.m.Variant + "_70x70.png";
		this.m.ArmamentIcon = "icon_legend_estoc_0" + this.m.Variant;
	}

	function onEquip() //2 handed sword type but uses 1 handed skills. A little confusing may change all later - Luft 15/1/23
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/slash"));
		this.addSkill(this.new("scripts/skills/actives/lunge_skill"));
		this.addSkill(this.new("scripts/skills/actives/riposte"));
	}

	function onUpdateProperties( _properties )
	{
		this.weapon.onUpdateProperties(_properties);
	}

});

