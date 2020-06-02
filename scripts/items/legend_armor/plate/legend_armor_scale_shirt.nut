this.legend_armor_scale_shirt <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.scale_shirt";
		this.m.Name = "Light Scale Armor";
		this.m.Description = "A sturdy yet flexible armor composed of small, overlapping metal scales.";
		this.m.ArmorDescription = "Includes body vest with small overlapping metal scales.";
		this.m.Icon = "legend_armor/plate/legend_scale_shirt.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_scale_shirt.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_scale_shirt.png";
		this.m.SpriteBack = "bust_legend_scale_shirt";
		this.m.SpriteDamagedBack = "bust_legend_scale_shirt_damaged";
		this.m.SpriteCorpseBack = "bust_legend_scale_shirt_dead";
		this.m.Value = 1750;
		this.m.Condition = 85;
		this.m.ConditionMax = 85;
		this.m.StaminaModifier = -10;
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
	}

});

