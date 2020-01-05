this.legend_armor_sash <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Cloak
		this.m.ID = "legend_armor.sash";
		this.m.Name = "Sash";
		this.m.Description = "Sash.";
		this.m.ArmorDescription = "Has a flowing cloth sash";
		this.m.Variant = this.Math.rand(1, 1);
		this.updateVariant();
		this.m.Value = 150;
		this.m.Condition = 3;
		this.m.ConditionMax = 3;
		this.m.StaminaModifier = -1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant < 10 ? "0" + this.m.Variant : this.m.Variant;
		this.m.SpriteBack = "sash_" + variant + "";
		this.m.SpriteDamagedBack = "sash_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "sash_" + variant + "_dead";
		this.m.Icon = "legend_armor/cloak/sash_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/cloak/icon_sash_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/cloak/inventory_sash_"  + variant + ".png";
	}

	function getTooltip()
	{
		local result = this.legend_armor_upgrade.getTooltip();
		result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Increase the Resolve of the wearer by [color=" + this.Const.UI.Color.PositiveValue + "]+1[/color]"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
		_result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Increase the Resolve of the wearer by [color=" + this.Const.UI.Color.PositiveValue + "]+1[/color]"
		});
	}

	function onUpdateProperties( _properties )
	{
		_properties.Bravery += 1;
	}

});

