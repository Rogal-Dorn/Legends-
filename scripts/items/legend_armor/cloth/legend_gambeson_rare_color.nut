this.legend_gambeson_rare_color <- this.inherit("scripts/items/legend_armor/cloth/legend_gambeson", {
	m = {},
	function create()
	{
		this.legend_gambeson.create();
		this.m.ID = "legend.armor.body.gambeson_rare_color.cloth";
		this.m.Variants = [
			4,
			5,
			11,
			12
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 400;
		this.m.Condition = 65;
		this.m.ConditionMax = 65;
		this.m.StaminaModifier = -7;
	}

});

