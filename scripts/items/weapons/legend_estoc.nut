this.legend_estoc <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_estoc";
		this.m.Name = "Estoc";
		this.m.Description = "A light and elegant two handed blade, favoring a swift and mobile fighting style.";
		this.m.Variant = this.Math.rand(1, 4);
		this.updateVariant();
		this.m.Categories = "Sword, Two-Handed";
		this.m.IconLarge = "weapons/melee/legend_estoc_01.png";
		this.m.Icon = "weapons/melee/legend_estoc_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_legend_estoc_01";
		this.m.Condition = 56.0;
		this.m.ConditionMax = 56.0;
		this.m.StaminaModifier = -10;
		this.m.Value = 3200;
		this.m.RegularDamage = 50;
		this.m.RegularDamageMax = 85;
		this.m.ArmorDamageMult = 1.0;
		this.m.DirectDamageMult = 0.2;
		this.m.DirectDamageAdd = 0.2;
	}

	function updateVariant()
	{
		this.m.IconLarge = "weapons/melee/legend_estoc_0" + this.m.Variant + ".png";
		this.m.Icon = "weapons/melee/legend_estoc_0" + this.m.Variant + "_70x70.png";
		this.m.ArmamentIcon = "icon_legend_estoc_0" + this.m.Variant;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/slash"));
		this.addSkill(this.new("scripts/skills/actives/lunge_skill"));
		this.addSkill(this.new("scripts/skills/actives/riposte"));
		this.addSkill(this.new("scripts/skills/actives/split"));
	}

	function onUpdateProperties( _properties )
	{
		this.weapon.onUpdateProperties(_properties);
	}

});

