this.legend_reinforced_animal_hide_armor <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.reinforced_animal_hide_armor";
		this.m.Name = "Reinforced Animal Hide Armor";
		this.m.Description = "A reinforced animal hide armor fashioned from thick leather pieces with added mail and metal scales.";
		this.m.ArmorDescription = "Includes A reinforced animal hide armor fashioned from thick leather pieces with added mail and metal scales.";
		local variant = 97;
		this.m.SpriteBack = "bust_body_" + variant;
		this.m.SpriteDamagedBack = "bust_body_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_body_" + variant + "_dead";
		this.m.Icon = "legend_armor/plate/legend_reinforced_animal_hide_armor.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_reinforced_animal_hide_armor.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_reinforced_animal_hide_armor.png";
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 175;
		this.m.Condition = 55;
		this.m.ConditionMax = 55;
		this.m.StaminaModifier = -9;
	}

});

