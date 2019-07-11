this.legend_glaive <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_glaive";
		this.m.Name = "Glaive";
		this.m.Description = "A sturdy glaive, suitable for keeping the foe at bay and slashing in close quarters.";
		this.m.Categories = "Spear, One-Handed";
		this.m.IconLarge = "weapons/melee/legend_glaive_01.png";
		this.m.Icon = "weapons/melee/legend_glaive_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded | this.Const.Items.ItemType.Defensive;
		this.m.IsDoubleGrippable = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_legend_glaive_01";
		this.m.Value = 1250;
		this.m.Condition = 64.0;
		this.m.ConditionMax = 64.0;
		this.m.StaminaModifier = -12;
		this.m.RegularDamage = 40;
		this.m.RegularDamageMax = 55;
		this.m.ArmorDamageMult = 0.95;
		this.m.DirectDamageMult = 0.25;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/legend_glaive_slash"));
		local spearwall = this.new("scripts/skills/actives/spearwall");
		spearwall.m.BaseAttackName = legend_glaive_slash.getName();
		this.addSkill(spearwall);
	}

	function onUpdateProperties( _properties )
	{
		this.weapon.onUpdateProperties(_properties);
	}

});

