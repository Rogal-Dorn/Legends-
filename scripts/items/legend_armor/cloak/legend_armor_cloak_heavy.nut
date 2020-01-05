this.legend_armor_cloak_heavy <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Cloak
		this.m.ID = "legend_armor.cloak_heavy";
		this.m.Name = "Heavy Cloak";
		this.m.Description = "A rustic cloak made of thick layered strong warm wool, provides protection from some blows but is quite hefty. ";
		this.m.ArmorDescription = "Has a heavy thick cloak";
		 local variants = [
					3,
					8,
					15,
					16,
					17,
					18,
					19,
					20,
					24,
					26,
					27,
					28,
					29,
					30,
					31,
					35,
				]
		this.m.Variant = variants[this.Math.rand(1, variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 1000;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -3;
	}

	function updateVariant()
	{
		local variant = this.m.Variant < 10 ? "0" + this.m.Variant : this.m.Variant;
		this.m.SpriteBack = "cloak_" + variant + "";
		this.m.SpriteDamagedBack = "cloak_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "cloak_" + variant + "_dead";
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

