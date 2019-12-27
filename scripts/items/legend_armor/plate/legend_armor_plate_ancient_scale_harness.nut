
this.legend_armor_plate_ancient_scale_harness <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate
		this.m.ID = "legend_armor.plate_ancient_scale_harness";
		this.m.Name = "Ancient Scale Harness";
		this.m.Description = "A sturdy, but heavy and partly decayed ancient scale harness.";
		this.m.ArmorDescription = "Includes an heavy and partly decayed ancient scale harness.";
		this.m.Icon = "legend_armor/plate/legend_plate_ancient_scale_harness.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_plate_ancient_scale_harness.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_plate_ancient_scale_harness.png";
		this.m.SpriteBack = "bust_legend_plate_ancient_scale_harness";
		this.m.SpriteDamagedBack = "bust_legend_plate_ancient_scale_harness_damaged";
		this.m.SpriteCorpseBack = "bust_legend_plate_ancient_scale_harness_dead";
		this.m.Value = 650;
		this.m.Condition = 80;
		this.m.ConditionMax = 80;
		this.m.StaminaModifier = -14;
        this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
	}

});

