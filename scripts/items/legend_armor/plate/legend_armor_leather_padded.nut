this.legend_armor_leather_padded <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.leather_padded";
		this.m.Name = "Padded Leather Armor";
		this.m.Description = "Padded leather reinforced with fittings for added protection.";
		this.m.ArmorDescription = "Includes padded leather armor.";
		this.m.Icon = "legend_armor/plate/legend_leather_padded.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_leather_padded.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_leather_padded.png";
		this.m.SpriteBack = "bust_legend_leather_padded";
		this.m.SpriteDamagedBack = "bust_legend_leather_padded_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_padded_dead";
		this.m.Value = 175;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -5;
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
	}

});

