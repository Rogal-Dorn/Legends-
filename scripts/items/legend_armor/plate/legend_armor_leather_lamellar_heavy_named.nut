this.legend_armor_leather_lamellar_heavy_named <- this.inherit("scripts/items/legend_armor/legend_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.leather_lamellar_heavy_named";
		this.m.Name = "";
		this.m.Description = "An extraordinarily well-crafted piece of lamellar armor. It is covered with beaten gold, which makes it truly stand out.";
		this.m.ArmorDescription = "Includes an extraordinarily well-crafted piece of lamellar armor. It is covered with beaten gold, which makes it truly stand out.";
		this.m.NameList = [
			"Harness",
			"Ward",
			"Defense",
			"Splendor",
			"Golden Lamellar"
		];
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 7500;
		this.m.Condition = 140;
		this.m.ConditionMax = 140;
		this.m.StaminaModifier = -23;
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.randomizeValues();
	}

	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(19, 23) * -1;
		this.m.Condition = this.Math.rand(175, 195);
		this.m.ConditionMax = this.m.Condition;
	}

	function updateVariant()
	{
		local variant = this.m.Variant < 10 ? "0" + this.m.Variant : this.m.Variant;
		this.m.SpriteBack = "bust_legend_leather_lamellar_heavy_named_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_leather_lamellar_heavy_named_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_lamellar_heavy_named_" + variant + "_dead";
		this.m.Icon = "legend_armor/plate/legend_leather_lamellar_heavy_named_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_leather_lamellar_heavy_named_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_leather_lamellar_heavy_named_" + variant + ".png";
	}

});

