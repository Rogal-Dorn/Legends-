this.legend_armor_leather_riveted_light <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.leather_riveted_light";
		this.m.Name = "Footman\'s Leather Armor";
		this.m.Description = "A light leather armor reinforced with metal rivets.";
		this.m.ArmorDescription = "Includes a leather armor coat rivetted with with metal plates.";
		this.m.Icon = "legend_armor/plate/legend_leather_riveted_light.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_leather_riveted_light.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_leather_riveted_light.png";
		this.m.SpriteBack = "bust_legend_leather_riveted_light";
		this.m.SpriteDamagedBack = "bust_legend_leather_riveted_light_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_riveted_light_dead";
		this.m.Value = 700;
		this.m.Condition = 80;
		this.m.ConditionMax = 80;
		this.m.StaminaModifier = -11;
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
	}

});

