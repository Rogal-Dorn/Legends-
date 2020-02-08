this.legend_armor_plate_chest <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.plate_chest";
		this.m.Name = "Breastplate Armor";
		this.m.Description = "A breastplate of solid plated steel.";
		this.m.ArmorDescription = "Includes a breastplate of solid plated steel.";
		this.m.Icon = "legend_armor/plate/legend_plate_chest.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_plate_chest.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_plate_chest.png";
		this.m.SpriteBack = "bust_legend_plate_chest";
		this.m.SpriteDamagedBack = "bust_legend_plate_chest_damaged";
		this.m.SpriteCorpseBack = "bust_legend_plate_chest_dead";
		this.m.Value = 2250;
		this.m.Condition = 125;
		this.m.ConditionMax = 125;
		this.m.StaminaModifier = -17;
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
	}

});

