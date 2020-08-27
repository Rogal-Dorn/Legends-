
this.legend_armor_leather_jacket_named_02 <- this.inherit("scripts/items/legend_armor/legend_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_leather_jacket_named_02";
		this.m.Name = "";
        this.m.NameList = ["Leather Cuirass", "Leather Armor", "Skin", "Peel", "Guard", "Coat", "Nightcloak", "Black", "Dark Omen", "Toadskin", "Ogreskin", ];
		this.m.Description = "A well-crafted leather coated jacket. Light to wear but very sturdy.";
		this.m.ArmorDescription = "Includes a well-crafted leather jacket. Light to wear but very sturdy.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 750;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -3;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_leather_jacket_named_02" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_leather_jacket_named_02" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_jacket_named_02" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/plate/legend_armor_leather_jacket_named_02" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_armor_leather_jacket_named_02" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_armor_leather_jacket_named_02" + "_" + variant + ".png";
	}

	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(1, 2) * -1;
		this.m.Condition = this.Math.rand(35, 45);
		this.m.ConditionMax = this.m.Condition;
	}
});
