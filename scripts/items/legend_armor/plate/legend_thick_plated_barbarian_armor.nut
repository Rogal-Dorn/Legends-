this.legend_thick_plated_barbarian_armor <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.thick_plated_barbarian_armor";
		this.m.Name = "Thick Plated Barbarian Armor";
		this.m.Description = "A heavy armor that is made from mostly metal. Only one chosen by the ancestors will own a set like this.";
		this.m.ArmorDescription = "Includes A heavy armor that is made from mostly metal. Only one chosen by the ancestors will own a set like this.";
		local variant = 96;
		this.m.SpriteBack = "bust_body_" + variant;
		this.m.SpriteDamagedBack = "bust_body_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_body_" + variant + "_dead";
		this.m.Icon = "legend_armor/plate/legend_thick_plated_barbarian_armor.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_thick_plated_barbarian_armor.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_thick_plated_barbarian_armor.png";
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 1500;
		this.m.Condition = 155;
		this.m.ConditionMax = 155;
		this.m.StaminaModifier = -26;
	}

});

