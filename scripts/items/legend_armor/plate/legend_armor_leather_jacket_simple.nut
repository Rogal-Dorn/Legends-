this.legend_armor_leather_jacket_simple <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate
		this.m.ID = "legend_armor.leather_jacket_simple";
		this.m.Name = "Simple Leather Jacket";
		this.m.Description = "A simple leather jacket for minimal protection."
		this.m.ArmorDescription = "Includes a simple leather jacket for added protection.";
		this.m.Icon = "legend_armor/plate/legend_leather_jacket_simple.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_leather_jacket_simple.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_leather_jacket_simple.png";
		this.m.SpriteBack = "bust_legend_leather_jacket_simple";
		this.m.SpriteDamagedBack = "bust_legend_leather_jacket_simple_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_jacket_simple_dead";
		this.m.Value = 200;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -4;
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
	}

});

