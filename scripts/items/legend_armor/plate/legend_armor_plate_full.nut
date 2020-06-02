this.legend_armor_plate_full <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.plate_full";
		this.m.Name = "Full Coat of Plate Armor";
		this.m.Description = "A full set of solid plated steel.";
		this.m.ArmorDescription = "Includes a full set of solid plated steel.";
		this.m.Icon = "legend_armor/plate/legend_plate_full.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_plate_full.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_plate_full.png";
		this.m.SpriteBack = "bust_legend_plate_full";
		this.m.SpriteDamagedBack = "bust_legend_plate_full_damaged";
		this.m.SpriteCorpseBack = "bust_legend_plate_full_dead";
		this.m.Value = 4500;
		this.m.Condition = 160;
		this.m.ConditionMax = 160;
		this.m.StaminaModifier = -22;
	}

});

