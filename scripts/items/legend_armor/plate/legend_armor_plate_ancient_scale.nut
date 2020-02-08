this.legend_armor_plate_ancient_scale <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.plate_ancient_scale";
		this.m.Name = "Ancient Plated Scale";
		this.m.Description = "A heavy coat of scales, partly reinforced with a layer of plated metal on top. It\'s a massive armor of ancient origin that didn\'t age well.";
		this.m.ArmorDescription = "Includes an ancient heavy coat of scales.";
		this.m.Icon = "legend_armor/plate/legend_plate_ancient_scale.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_plate_ancient_scale.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_plate_ancient_scale.png";
		this.m.SpriteBack = "bust_legend_plate_ancient_scale";
		this.m.SpriteDamagedBack = "bust_legend_plate_ancient_scale_damaged";
		this.m.SpriteCorpseBack = "bust_legend_plate_ancient_scale_dead";
		this.m.Value = 1000;
		this.m.Condition = 105;
		this.m.ConditionMax = 105;
		this.m.StaminaModifier = -17;
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
	}

});

