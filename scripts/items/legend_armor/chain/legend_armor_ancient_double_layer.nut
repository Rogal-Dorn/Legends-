this.legend_armor_ancient_double_layer <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain
		this.m.ID = "legend_armor.ancient_double_layer";
		this.m.Name = "Ancient Double Layer";
		this.m.Description = "A long and heavy chainmail that offers good protection but is very fatiguing to wear.";
		this.m.ArmorDescription = "Includes a long and heavy chainmail that offers good protection but is very fatiguing to wear.";
		this.m.Icon = "legend_armor/chain/icon_legend_armor_ancient_double_layer.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/chain/icon_legend_armor_ancient_double_layer.png";
		this.m.OverlayIconLarge = "legend_armor/chain/inventory_legend_armor_ancient_double_layer.png";
		this.m.SpriteFront = null;
		this.m.SpriteBack = "legend_armor_ancient_double_layer";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "legend_armor_ancient_double_layer_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "legend_armor_ancient_double_layer_dead";
		this.m.Value = 450;
		this.m.Condition = 120;
		this.m.ConditionMax = 120;
		this.m.StaminaModifier = 16;
		this.m.ImpactSound = this.Const.Sound.ArmorChainImpact;
	}

	function getTooltip()
	{
		local result = this.legend_armor_upgrade.getTooltip();
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/armor_body.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+120[/color] Durability"
		});
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]-16[/color] Maximum Fatigue"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
	}

});

