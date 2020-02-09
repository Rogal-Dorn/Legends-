this.legend_armor_leather_lamellar <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.leather_lamellar";
		this.m.Name = "Leather Lamellar Armor";
		this.m.Description = "Numerous overlapping leather plates provide decent protection for most of the upper body.";
		this.m.ArmorDescription = "Includes armor of overlapping leather plates.";
		this.m.Icon = "legend_armor/plate/legend_leather_lamellar.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_leather_lamellar.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_leather_lamellar.png";
		this.m.SpriteBack = "bust_legend_leather_lamellar";
		this.m.SpriteDamagedBack = "bust_legend_leather_lamellar_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_lamellar_dead";
		this.m.Value = 250;
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
		this.m.StaminaModifier = -6;
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
	}

});

