this.legend_armor_coat_of_scales <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain
		this.m.ID = "legend_armor.coat_of_scales";
		this.m.Name = "Coat of Scales";
		this.m.Description = "A long and heavy chainmail that offers good protection but is very fatiguing to wear.";
		this.m.ArmorDescription = "Includes a long and heavy chainmail that offers good protection but is very fatiguing to wear.";
		this.m.Icon = "legend_armor/chain/icon_legend_armor_coat_of_scales.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/chain/icon_legend_armor_coat_of_scales.png";
		this.m.OverlayIconLarge = "legend_armor/chain/inventory_legend_armor_coat_of_scales.png";
		this.m.SpriteFront = null;
		this.m.SpriteBack = "legend_armor_coat_of_scales";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "legend_armor_coat_of_scales_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "legend_armor_coat_of_scales_dead";
		this.m.Value = 600;
		this.m.Condition = 300;
		this.m.ConditionMax = 300;
		this.m.StaminaModifier = 38;
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
	}

	function getTooltip()
	{
		local result = this.legend_armor_upgrade.getTooltip();
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/armor_body.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+300[/color] Durability"
		});
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]-38[/color] Maximum Fatigue"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
	}

});

