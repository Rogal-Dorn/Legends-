this.legend_gambeson_common_color <- this.inherit("scripts/items/legend_armor/cloth/legend_gambeson", {
	m = {},
	function create()
	{
		this.legend_gambeson.create();
		this.m.ID = "legend.armor.body.gambeson_common_color.cloth";
		this.m.Variants = [
			0,
			1,
			2,
			3,
			5,
			6,
			7,
			8,
            9,
			10,
			12,
			14,
			15,
			16,
			17,
			28,
			33,
			34,
        ]
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();

	}

});

