this.legend_armor_plate_full_greaves_named <- this.inherit("scripts/items/legend_armor/legend_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor_plate_full_greaves_painted";
		this.m.Name = "Full Coat Heavy Plate Armor";
		this.m.NameList = [
			"Glory",
			"Triumph",
			"Victory",
			"Joy",
		];
		this.m.Description = "A full set of painted solid plated steel with greaves.";
		this.m.ArmorDescription = "A masterfully crafted full set of painted solid plated steel with greaves.";
		this.m.Variants = [
			1,
			2,
			3,
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
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

	function updateVariant()
	{
		local variant = this.m.Variant < 10 ? "0" + this.m.Variant : this.m.Variant;
		this.m.SpriteBack = "bust_legend_plate_full_greaves_named_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_plate_full_greaves_named_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_plate_full_greaves_named_" + variant + "_dead";
		this.m.Icon = "legend_armor/plate/bust_legend_plate_full_greaves_named_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "bust_legend_plate_full_greaves_named_" + variant + ".png";
		this.m.OverlayIconLarge = "bust_legend_plate_full_greaves_named_" + variant + ".png";
	}

});

