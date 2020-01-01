this.legend_armor_named_tabard <- this.inherit("scripts/items/legend_armor/tabard/legend_armor_tabard", {
	m = {},
	function create()
	{
		this.legend_armor_tabard.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Tabbard
		this.m.ID = "legend_armor.named_tabard";
		this.m.Variant = this.Math.rand(1, 1);
		this.updateVariant();
		this.m.Value = 2000;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = -1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant < 10 ? "0" + this.m.Variant : this.m.Variant;
		this.m.SpriteBack = "legend_tabard_named_" + variant;
		this.m.SpriteDamagedBack = "legend_tabard_named_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "legend_tabard_named_" + variant + "_dead";
		this.m.Icon = "legend_armor/tabard/tabard_named_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/tabard/icon_tabard_named_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/tabard/inventory_tabard_named_"  + variant + ".png";
	}

	function getTooltip()
	{
		local result = this.legend_armor_tabard.getTooltip();
		result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Increase the Resolve of the wearer by [color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color]"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
		_result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Increase the Resolve of the wearer by [color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color]"
		});
	}

	function onUpdateProperties( _properties )
	{
		_properties.BraveryMult *= 1.10;
	}

});

