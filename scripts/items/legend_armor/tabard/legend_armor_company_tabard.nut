this.legend_armor_company_tabard <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Tabbard
		this.m.ID = "legend_armor.company_tabard";
		this.m.Name = "Tabard";
		this.m.Description = "A flowing cloth covering for armor, to show your allegiance. Offers minimal protection and small boost to moral.";
		this.m.ArmorDescription = "Has a flowing cloth tabard";
		this.m.Variant = this.Math.rand(101, 112);
		this.updateVariant();
		this.m.Icon = "legend_armor/tabard/tabard_101.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/tabard/icon_tabard_101.png";
		this.m.OverlayIconLarge = "legend_armor/tabard/inventory_tabard_101.png";
		this.m.SpriteFront = null;
		this.m.SpriteBack = "legend_tabard_101_back";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "legend_tabard_101_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "legend_tabard_101_dead";
		this.m.Value = 200;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = -1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant < 10 ? "0" + this.m.Variant : this.m.Variant;
		this.m.SpriteBack = "tabard_" + variant + "_back";
		this.m.SpriteDamagedBack = "tabard_" + variant + "_back_damaged";
		this.m.SpriteCorpseBack = "tabard_" + variant + "_back_destroyed";
		this.m.Icon = "legend_armor/tabard/icon_tabard_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/tabard/icon_tabard_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/tabard/inventory_tabard_"  + variant + ".png";
	}

	function getTooltip()
	{
		local result = this.legend_armor_upgrade.getTooltip();
		result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Increase the Resolve of the wearer by [color=" + this.Const.UI.Color.PositiveValue + "]+2[/color]"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
		_result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Increase the Resolve of the wearer by [color=" + this.Const.UI.Color.PositiveValue + "]+2[/color]"
		});
	}

	function onUpdateProperties( _properties )
	{
		_properties.Bravery += 2;
	}

});

