this.legend_armor_leather_lamellar_reinforced <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.leather_lamellar_reinforced";
		this.m.Name = "Reinforced Leather Lamellar Armor";
		this.m.Description = "Numerous overlapping metal reinforced leather plates that provides excellent protection for most of the upper body but is very heavy.";
		this.m.ArmorDescription = "Includes armor of overlapping reinforced metal leather plates.";
		this.m.Icon = "legend_armor/plate/legend_leather_lamellar_reinforced.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_leather_lamellar_reinforced.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_leather_lamellar_reinforced.png";
		this.m.SpriteBack = "bust_legend_leather_lamellar_reinforced";
		this.m.SpriteDamagedBack = "bust_legend_leather_lamellar_reinforced_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_lamellar_reinforced_dead";
		this.m.Value = 350;
		this.m.Condition = 55;
		this.m.ConditionMax = 55;
		this.m.StaminaModifier = -7;
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
	}

});

