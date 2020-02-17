this.legend_armor_tabard_crusader <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Tabbard;
		this.m.ID = "legend_armor.company_tabard_crusader";
		this.m.Name = "Crusader Tabard";
		this.m.Description = "A flowing cloth covering for armor, to show your faith. Offers minimal protection and small boost to morale.";
		this.m.ArmorDescription = "Has a flowing cloth tabard";
		this.m.Variants = [
			113
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 500;
		this.m.Condition = 8;
		this.m.ConditionMax = 8;
		this.m.StaminaModifier = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant < 10 ? "0" + this.m.Variant : this.m.Variant;
		this.m.SpriteBack = "legend_tabard_" + variant;
		this.m.SpriteDamagedBack = "legend_tabard_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "legend_tabard_" + variant + "_dead";
		this.m.Icon = "legend_armor/tabard/tabard_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/tabard/icon_tabard_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/tabard/inventory_tabard_" + variant + ".png";
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

	function onPaintSpecificColor( _color )
	{
		this.m.Variant =  _color;

		local app = this.m.Armor.getContainer().getAppearance();
		this.updateAppearance(app);

	}

	function onUpdateProperties( _properties )
	{
		_properties.Bravery += 4;
	}

});

