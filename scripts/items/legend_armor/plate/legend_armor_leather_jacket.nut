this.legend_armor_leather_jacket <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate
		this.m.ID = "legend_armor.leather_jacket";
		this.m.Name = "Leather Jacket";
		this.m.Description = "A leather jacket for minimal protection."
		this.m.ArmorDescription = "Includes a leather jacket for added protection.";
		this.m.Icon = "legend_armor/plate/legend_leather_jacket.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_leather_jacket.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_leather_jacket.png";
		this.m.SpriteBack = "bust_legend_leather_jacket";
		this.m.SpriteDamagedBack = "bust_legend_leather_jacket_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_jacket_dead";
		this.m.Value = 200;
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
		this.m.StaminaModifier = -5;
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
	}

});

