this.legend_reinforced_animal_hide_armor <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
        this.m.Type = this.Const.Items.ArmorUpgrades.Plate
		this.m.ID = "legned_armor.body.reinforced_animal_hide_armor";
		this.m.Name = "Reinforced Animal Hide Armor";
		this.m.Description = "A reinforced animal hide armor fashioned from thick leather pieces with added mail and metal scales.";
		this.m.ArmorDescription = "Includes A reinforced animal hide armor fashioned from thick leather pieces with added mail and metal scales.";
		local variant = 97;
		this.m.SpriteBack = "bust_body_" + variant;
		this.m.SpriteDamagedBack = "bust_body_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_body_" + variant + "_dead";
		this.m.IconLarge = "armor/inventory_body_armor_" + variant + ".png";
		this.m.Icon = "armor/icon_body_armor_" + variant + ".png";
		this.m.OverlayIconLarge = this.m.IconLarge;
		this.m.OverlayIcon = this.m.Icon;
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 120;
		this.m.Condition = 65;
		this.m.ConditionMax = 65;
		this.m.StaminaModifier = -7;
	}

});

