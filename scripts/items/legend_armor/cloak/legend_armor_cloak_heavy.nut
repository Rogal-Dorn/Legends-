this.legend_armor_cloak_heavy <- this.inherit("scripts/items/legend_armor/cloak/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.Bravery = 2;
		this.m.Type = this.Const.Items.ArmorUpgrades.Cloak;
		this.m.ID = "legend_armor.cloak_heavy";
		this.m.Name = "Heavy Cloak";
		this.m.Description = "A rustic cloak made of thick layered strong warm wool, provides protection from some blows but is quite hefty. ";
		this.m.ArmorDescription = "Has a heavy thick cloak";
		this.m.Variants = [
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
			35
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 1000;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -4;
	}

	function getTooltip()
	{
		local result = this.named_helmet.getTooltip();
		result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Wearer is not affected by rain penalties"
		});
		return result;
	}

	function onUpdateProperties( _properties )
	{
		_properties.Bravery += this.m.Bravery;
		_properties.getSkills().removeByID("special.legend_rain");
	}

});

