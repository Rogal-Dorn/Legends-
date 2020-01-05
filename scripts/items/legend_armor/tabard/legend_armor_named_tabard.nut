this.legend_armor_named_tabard <- this.inherit("scripts/items/legend_armor/legend_named_armor_upgrade", {
	m = {
		BraveryMult = 1.05
	},
	function create()
	{
		this.legend_named_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Tabbard
		this.m.ID = "legend_armor.named_tabard";
		this.m.Name = "";
		this.m.NameList = [
			"Kingly",
			"Splendor",
			"Pageantry",
			"Swank",
			"Noble",
			"Undead"
		];
		this.m.Variants = [1];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 5500;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = -1;
		this.randomizeValues()
	}

	function randomizeValues()
	{
		this.m.Condition = this.Math.floor(this.m.Condition * this.Math.rand(110, 125) * 0.01) * 1.0;
		this.m.ConditionMax = this.m.Condition;
		this.m.BraveryMult = this.Math.rand(105, 115) * 0.01
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
		local result = this.legend_named_armor_upgrade.getTooltip();
		result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Increase the Resolve of the wearer by [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.BraveryMult * 100.0 - 100 +"[/color]"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
		_result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Increase the Resolve of the wearer by [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.BraveryMult * 100.0 - 100 +"[/color]"
		});
	}

	function onUpdateProperties( _properties )
	{
		_properties.BraveryMult *= this.m.BraveryMult;
	}

	function onSerialize( _out )
	{
		_out.writeF32(this.m.BraveryMult);
		this.legend_named_armor_upgrade.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.m.BraveryMult = _in.readF32();
		this.legend_named_armor_upgrade.onDeserialize(_in);
	}

});

