
this.legend_armor_scale_coat <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate
		this.m.ID = "legend_armor.scale_coat";
		this.m.Name = "Coat of Scales";
		this.m.Description = "A heavy armor made of thick, overlapping metal scales covering most of the body.";
		this.m.ArmorDescription = "Includes heavy armor made of thick, overlapping metal scales.";
		this.m.Icon = "legend_armor/plate/legend_scale_coat.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_scale_coat.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_scale_coat.png";
		this.m.SpriteBack = "bust_legend_scale_coat";
		this.m.SpriteDamagedBack = "bust_legend_scale_coat_damaged";
		this.m.SpriteCorpseBack = "bust_legend_scale_coat_dead";
		this.m.Value = 6000;
		this.m.Condition = 185;
		this.m.ConditionMax = 185;
		this.m.StaminaModifier = -20;
        this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
	}

});

