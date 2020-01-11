this.legend_armor_leather_jacket_named <- this.inherit("scripts/items/legend_armor/legend_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate
		this.m.ID = "legend_armor.body.leather_jacket_named";
        this.m.Description = "A well-crafted and hardened leather armor. Light to wear but very sturdy.";
		this.m.ArmorDescription = "Includes a well-crafted and hardened leather armor. Light to wear but very sturdy.";
        this.m.Name = "";
        this.m.NameList = [
			"Leather Cuirass",
			"Leather Armor",
			"Skin",
			"Peel",
			"Guard",
			"Coat",
			"Nightcloak",
			"Black",
			"Dark Omen",
            "Toadskin",
			"Ogreskin"
		];
		this.m.Variants = [1,2];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 2000;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -3;
		this.randomizeValues();
	}

	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(1, 3) * -1;
		this.m.Condition = this.Math.rand(30, 40);
		this.m.ConditionMax = this.m.Condition;
	}

	function updateVariant()
	{
		local variant = this.m.Variant < 10 ? "0" + this.m.Variant : this.m.Variant;
		this.m.SpriteBack = "bust_legend_leather_jacket_named_" + variant ;
		this.m.SpriteDamagedBack = "bust_legend_leather_jacket_named_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_jacket_named_" + variant + "_dead";
		this.m.Icon = "legend_armor/plate/legend_leather_jacket_named_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_leather_jacket_named_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_leather_jacket_named_"  + variant + ".png";
	}

});

