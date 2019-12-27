this.legend_armor_cloak_noble <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Cloak
		this.m.ID = "legend_armor.cloak_noble";
		this.m.Name = "Noble Cloak";
		this.m.Description = "A fine cloak made of light foreign silk, provides protection and looks great. ";
		this.m.ArmorDescription = "Has a flowing light cloak";
		 local variants = [
					1,
					2,
					4,
					5,
					6,
					7,
					25,
				]
		this.m.Variant = variants[this.Math.rand(1, variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 5000;
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
		this.m.StaminaModifier = -1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant < 10 ? "0" + this.m.Variant : this.m.Variant;
		this.m.SpriteBack = "cloak_" + variant + "";
		this.m.SpriteDamagedBack = "cloak_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "cloak_" + variant + "_destroyed";
		this.m.Icon = "legend_armor/cloak/cloak_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/cloak/icon_cloak_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/cloak/inventory_cloak_"  + variant + ".png";
	}

	function getTooltip()
	{
		local result = this.legend_armor_upgrade.getTooltip();
		result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Increase the Resolve of the wearer by [color=" + this.Const.UI.Color.PositiveValue + "]+3[/color]"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
		_result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Increase the Resolve of the wearer by [color=" + this.Const.UI.Color.PositiveValue + "]+3[/color]"
		});
	}

	function onUpdateProperties( _properties )
	{
		_properties.Bravery += 3;
	}

});

