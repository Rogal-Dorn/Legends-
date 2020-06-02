this.legend_armor_plate_cuirass <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.plate_cuirass";
		this.m.Name = "Plate Cuirass Armor";
		this.m.Description = "A body vest of solid plated steel.";
		this.m.ArmorDescription = "Includes a body vest of solid plated steel.";
		this.m.Icon = "legend_armor/plate/legend_plate_cuirass.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_plate_cuirass.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_plate_cuirass.png";
		this.m.SpriteBack = "bust_legend_plate_cuirass";
		this.m.SpriteDamagedBack = "bust_legend_plate_cuirass_damaged";
		this.m.SpriteCorpseBack = "bust_legend_plate_cuirass_dead";
		this.m.Value = 3500;
		this.m.Condition = 150;
		this.m.ConditionMax = 150;
		this.m.StaminaModifier = -21;
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
	}

});

