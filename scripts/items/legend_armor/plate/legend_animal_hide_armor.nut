this.legend_animal_hide_armor <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.animal_hide_armor";
		this.m.Name = "Animal Hide Armor";
		this.m.Description = "Heavy hides patched together to create a decent makeshift armor.";
		this.m.ArmorDescription = "Includes heavy hides patched together to create a decent makeshift armor.";
		local variant = 90;
		this.m.SpriteBack = "bust_body_" + variant;
		this.m.SpriteDamagedBack = "bust_body_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_body_" + variant + "_dead";
		this.m.Icon = "legend_armor/plate/legend_animal_hide_armor.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_animal_hide_armor.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_animal_hide_armor.png";
		this.m.Value = 100;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -4;
	}

});

