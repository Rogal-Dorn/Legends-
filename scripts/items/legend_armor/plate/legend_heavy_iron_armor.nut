this.legend_heavy_iron_armor <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.heavy_iron_armor";
		this.m.Name = "Heavy Iron Armor";
		this.m.Description = "This armor is made from heavy metal plates, scales and pieces of chainmal. The true armor of a northern warrior.";
		this.m.ArmorDescription = "Includes is made from heavy metal plates, scales and pieces of chainmal. The true armor of a northern warrior.";
		local variant = 95;
		this.m.SpriteBack = "bust_body_" + variant;
		this.m.SpriteDamagedBack = "bust_body_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_body_" + variant + "_dead";
		this.m.Icon = "legend_armor/plate/legend_heavy_iron_armor.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_heavy_iron_armor.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_heavy_iron_armor.png";
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 1000;
		this.m.Condition = 120;
		this.m.ConditionMax = 120;
		this.m.StaminaModifier = -18;
	}

});

