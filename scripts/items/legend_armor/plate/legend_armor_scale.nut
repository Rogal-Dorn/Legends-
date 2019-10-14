
this.legend_armor_scale <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate
		this.m.ID = "legend_armor.scale";
		this.m.Name = "Scale Armor";
		this.m.Description = "A body vest with overlapping scales.";
		this.m.ArmorDescription = "Includes body vest with overlapping scales.";
		this.m.Icon = "legend_armor/plate/icon_legend_scale.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_scale.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_scale.png";
		this.m.SpriteBack = "bust_legend_scale";
		this.m.SpriteDamagedBack = "bust_legend_scale_damaged";
		this.m.SpriteCorpseBack = "bust_legend_scale_dead";
		this.m.Value = 4000;
		this.m.Condition = 240;
		this.m.ConditionMax = 240;
		this.m.StaminaModifier = -28;
        this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
	}

});

