this.legend_armor_leather_lamellar_heavy <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.leather_lamellar_heavy";
		this.m.Name = "Heavy Lamellar Armor";
		this.m.Description = "A heavy lamellar armor that covers most parts of the body with thick, overlapping metal plates for maximum protection.";
		this.m.ArmorDescription = "Includes heavy lamellar armor that covers most parts of the body with thick, overlapping metal plates.";
		this.m.Icon = "legend_armor/plate/legend_leather_lamellar_heavy.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_leather_lamellar_heavy.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_leather_lamellar_heavy.png";
		this.m.SpriteBack = "bust_legend_leather_lamellar_heavy";
		this.m.SpriteDamagedBack = "bust_legend_leather_lamellar_heavy_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_lamellar_heavy_dead";
		this.m.Value = 4750;
		this.m.Condition = 165;
		this.m.ConditionMax = 165;
		this.m.StaminaModifier = -24;
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
	}

});

