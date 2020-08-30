
this.legend_armor_scale_coat_named <- this.inherit("scripts/items/legend_armor/legend_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_scale_coat_named";
		this.m.Name = "";
        this.m.NameList = ["Scale Shirt", "Scale Armor", "Dragonskin", "Snakeskin", "Scales", "Wyrmskin", "Goldskin", "Scale Tunic", "Golden Armor", "Golden Reminder", ];
		this.m.Description = "A scale armor made of small, interlocking metal scales. The style and craftsmanship hint at the armor coming from a far-away region.";
		this.m.ArmorDescription = "Includes a scale armor made of small, interlocking metal scales. The style and craftsmanship hint at the armor coming from a far-away region.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 5000;
		this.m.Condition = 160;
		this.m.ConditionMax = 160;
		this.m.StaminaModifier = -22;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_scale_coat_named" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_scale_coat_named" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_scale_coat_named" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/plate/legend_armor_scale_coat_named" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_armor_scale_coat_named" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_armor_scale_coat_named" + "_" + variant + ".png";
	}

	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(10, 14) * -1;
		this.m.Condition = this.Math.rand(130, 160);
		this.m.ConditionMax = this.m.Condition;
	}
});
