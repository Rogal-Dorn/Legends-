this.legend_armor_plate_ancient_chest_restored <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.plate_ancient_chest_restored";
		this.m.Name = "Restored Ancient Breastplate";
		this.m.Description = "A restored thick breastplate of ancient origin.";
		this.m.ArmorDescription = "Includes a restoredd thick breastplate of ancient origin.";
		this.m.Icon = "legend_armor/plate/legend_plate_ancient_chest_restored.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_plate_ancient_chest_restored.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_plate_ancient_chest_restored.png";
		this.m.SpriteBack = "bust_legend_plate_ancient_chest_restored";
		this.m.SpriteDamagedBack = "bust_legend_plate_ancient_chest_restored_damaged";
		this.m.SpriteCorpseBack = "bust_legend_plate_ancient_chest_restored_dead";
		this.m.Value = 1500;
		this.m.Condition = 110;
		this.m.ConditionMax = 110;
		this.m.StaminaModifier = -15;
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
	}

});

