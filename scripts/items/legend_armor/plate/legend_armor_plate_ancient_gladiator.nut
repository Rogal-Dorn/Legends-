this.legend_armor_plate_ancient_gladiator <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.plate_ancient_gladiator";
		this.m.Name = "Restored Ancient Breastplate";
		this.m.Description = "A tarnished gladiator outfit of ancient origin.";
		this.m.ArmorDescription = "Includes a tarnished gladiator outfit of ancient origin.";
		this.m.Icon = "legend_armor/plate/legend_plate_ancient_gladiator.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_plate_ancient_gladiator.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_plate_ancient_gladiator.png";
		this.m.SpriteBack = "bust_legend_plate_ancient_gladiator";
		this.m.SpriteDamagedBack = "bust_legend_plate_ancient_gladiator_damaged";
		this.m.SpriteCorpseBack = "bust_legend_plate_ancient_gladiator_dead";
		this.m.Value = 100;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -6;
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
	}

});

