this.legend_gambeson_rare_color <- this.inherit("scripts/items/legend_armor/cloth/legend_gambeson", {
	m = {},
	function create()
	{
		this.legend_gambeson.create();
		this.m.ID = "legend.armor.body.gambeson_rare_color.cloth";
        local variants = [
            2,
			4,
			5,
			7,
			9,
			11,
			12,
			18,
			19,
			20,
			21,
			22,
			23,
			24,
			25,
			26,
			27,
			29,
			30,
			31,
			32,
			35,
			36,
			37,
			38,
			39,
			42,
			43,
			44,
			45,
			46,
			48,
			49,
			50,
			51,
			52,
			54,
			55,
			56,
			57,
			58,
			60,
			61,
			62,
			63,
			64
        ]
		this.m.Variant = variants[this.Math.rand(1, variants.len() - 1)];
		this.updateVariant();

	}

});

