this.legend_armor_plate_ancient_harness <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.plate_ancient_harness";
		this.m.Name = "Ancient Plate Harness";
		this.m.Description = "Made of thick metal plates and mail, this heavy ancient armor still offers great protection after countless years. It\'s crusted and rotten in parts, however, severely limiting the mobility of the wearer.";
		this.m.ArmorDescription = "Includes an ancient plate harness of thick metal plates and mail.";
		this.m.Icon = "legend_armor/plate/legend_plate_ancient_harness.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_plate_ancient_harness.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_plate_ancient_harness.png";
		this.m.SpriteBack = "bust_legend_plate_ancient_harness";
		this.m.SpriteDamagedBack = "bust_legend_plate_ancient_harness_damaged";
		this.m.SpriteCorpseBack = "bust_legend_plate_ancient_harness_dead";
		this.m.Value = 1500;
		this.m.Condition = 115;
		this.m.ConditionMax = 115;
		this.m.StaminaModifier = -19;
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
	}

});

