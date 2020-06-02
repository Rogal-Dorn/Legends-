this.legend_armor_plate_chest_rotten <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.plate_chest_rotten";
		this.m.Name = "Decayed Breastplate Armor";
		this.m.Description = "A breastplate of solid plated steel that is worn and decayed.";
		this.m.ArmorDescription = "Includes a breastplate of decaying plated steel.";
		this.m.Icon = "legend_armor/plate/legend_plate_chest_rotten.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_plate_chest_rotten.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_plate_chest_rotten.png";
		this.m.SpriteBack = "bust_legend_plate_chest_rotten";
		this.m.SpriteDamagedBack = "bust_legend_plate_chest_rotten_damaged";
		this.m.SpriteCorpseBack = "bust_legend_plate_chest_rotten_dead";
		this.m.Value = 1250;
		this.m.Condition = 100;
		this.m.ConditionMax = 100;
		this.m.StaminaModifier = -16;
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
	}

});

