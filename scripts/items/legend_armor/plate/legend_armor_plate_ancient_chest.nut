this.legend_armor_plate_ancient_chest <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.plate_ancient_chest";
		this.m.Name = "Ancient Breastplate";
		this.m.Description = "A tarnished thick breastplate of ancient origin.";
		this.m.ArmorDescription = "Includes a tarnished thick breastplate of ancient origin.";
		this.m.Icon = "legend_armor/plate/legend_plate_ancient_chest.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_plate_ancient_chest.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_plate_ancient_chest.png";
		this.m.SpriteBack = "bust_legend_plate_ancient_chest";
		this.m.SpriteDamagedBack = "bust_legend_plate_ancient_chest_damaged";
		this.m.SpriteCorpseBack = "bust_legend_plate_ancient_chest_dead";
		this.m.Value = 750;
		this.m.Condition = 105;
		this.m.ConditionMax = 105;
		this.m.StaminaModifier = -18;
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
	}

});

