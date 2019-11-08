this.legend_gambeson_common_color <- this.inherit("scripts/items/legend_armor/cloth/legend_gambeson", {
	m = {},
	function create()
	{
		this.legend_gambeson.create();
		this.m.ID = "legend.armor.body.gambeson_common_color.cloth";
        local variants = [
            0,
			1,
			3,
			6,
            8,
			10,
			13,
			14,
			15,
			16,
			17,
			28,
			33,
			34,
			40,
			41,
			47,
			53,
			59,
			65,
			66,
			67,
			68,
			69,
			70

        ]
		this.m.Variant = this.Math.rand(0, variants.len() - 1);
		this.updateVariant();

	}

});

