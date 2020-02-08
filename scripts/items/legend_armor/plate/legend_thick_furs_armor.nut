this.legend_thick_furs_armor <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.thick_furs";
		this.m.Name = "Thick Furs";
		this.m.Description = "Thick furs that are crudely dried and tied together to protect from both the cold and any incoming blows.";
		this.m.ArmorDescription = "Includes Thick furs that are crudely dried and tied together to protect from both the cold and any incoming blows.";
		local variant = 91;
		this.m.SpriteBack = "bust_body_" + variant;
		this.m.SpriteDamagedBack = "bust_body_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_body_" + variant + "_dead";
		this.m.Icon = "legend_armor/plate/legend_thick_furs_armor.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_thick_furs_armor.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_thick_furs_armor.png";
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 15;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = -1;
	}

});

