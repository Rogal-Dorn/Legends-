this.legend_armor_plate_full_greaves_painted <- this.inherit("scripts/items/legend_armor/legend_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor_plate_full_greaves_painted";
		this.m.Name = "Full Coat of Painted Heavy Plate Armor";
		this.m.NameList = [
			"Ward",
			"Death",
			"Barrier",
			"Plate Armor",
			"Dark Plated Armor",
			"Life Stealer"
		];
		this.m.Description = "A full set of painted solid plated steel with greaves.";
		this.m.ArmorDescription = "A masterfully crafted full set of painted solid plated steel with greaves.";
		this.m.Icon = "legend_armor/plate/legend_plate_full_greaves_painted.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_plate_full_greaves_painted.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_plate_full_greaves_painted.png";
		this.m.SpriteBack = "bust_legend_plate_full_greaves_painted";
		this.m.SpriteDamagedBack = "bust_legend_plate_full_greaves_painted_damaged";
		this.m.SpriteCorpseBack = "bust_legend_plate_full_greaves_painted_dead";
		this.m.Value = 10000;
		this.m.Condition = 170;
		this.m.ConditionMax = 170;
		this.m.StaminaModifier = -26;
		this.randomizeValues();
	}

	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(23, 25) * -1;
		this.m.Condition = this.Math.rand(185, 225);
		this.m.ConditionMax = this.m.Condition;
	}

});

