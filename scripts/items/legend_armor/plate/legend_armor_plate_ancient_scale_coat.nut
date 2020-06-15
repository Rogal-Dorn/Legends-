this.legend_armor_plate_ancient_scale_coat <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.plate_ancient_scale_coat";
		this.m.Name = "Ancient Scale Coat";
		this.m.Description = "A heavy and tarnished scale coat of ancient design that belongs into a collection, not on the battlefield.";
		this.m.ArmorDescription = "Includes an ancient heavy and tarnished scale coat.";
		this.m.Icon = "legend_armor/plate/legend_plate_ancient_scale_coat.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_plate_ancient_scale_coat.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_plate_ancient_scale_coat.png";
		this.m.SpriteBack = "bust_legend_plate_ancient_scale_coat";
		this.m.SpriteDamagedBack = "bust_legend_plate_ancient_scale_coat_damaged";
		this.m.SpriteCorpseBack = "bust_legend_plate_ancient_scale_coat_dead";
		this.m.Value = 2000;
		this.m.Condition = 140;
		this.m.ConditionMax = 140;
		this.m.StaminaModifier = -24;
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
	}

});

