this.legend_armor_tabard_10 <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Cloak
		this.m.ID = "legend_armor.tabard_10";
		this.m.Name = "Tabard";
		this.m.Description = "A flowing cloth covering for armor, to show your allegiance";
		this.m.ArmorDescription = "Has a flowing cloth tabard";
		this.m.Icon = "legend_armor/tabard/icon_tabard_10.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/tabard/icon_tabard_10.png";
		this.m.OverlayIconLarge = "legend_armor/tabard/inventory_tabard_10.png";
		this.m.SpriteFront = null;
		this.m.SpriteBack = "legend_tabard_10";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "legend_tabard_10_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "legend_tabard_10_dead";
		this.m.Value = 100;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = 0;
	}

	function getTooltip()
	{
		local result = this.legend_armor_upgrade.getTooltip();
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/armor_body.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+195[/color] Durability"
		});
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]-26[/color] Maximum Fatigue"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
	}

});

