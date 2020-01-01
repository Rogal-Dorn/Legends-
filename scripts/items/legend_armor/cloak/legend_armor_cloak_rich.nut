this.legend_armor_cloak_rich <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Cloak
		this.m.ID = "legend_armor.cloak_rich";
		this.m.Name = "Elegant Cloak";
		this.m.Description = "A silk embroidered cloak made with the finest clothes. Those who wear it feel as if a king";
		this.m.ArmorDescription = "Has a flowing embroidered cloak";
		this.m.Variant = this.Math.rand(1, 5);
		this.updateVariant();
		this.m.Value = 1350;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = -1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant < 10 ? "0" + this.m.Variant : this.m.Variant;
		this.m.SpriteBack = "cloak_rich_" + variant + "";
		this.m.SpriteDamagedBack = "cloak_rich_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "cloak_rich_" + variant + "_destroyed";
		this.m.Icon = "legend_armor/cloak/cloak_rich_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/cloak/icon_cloak_rich_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/cloak/inventory_cloak_rich_"  + variant + ".png";
	}

	function getTooltip()
	{
		local result = this.legend_armor_upgrade.getTooltip();
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

