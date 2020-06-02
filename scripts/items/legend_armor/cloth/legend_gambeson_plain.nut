this.legend_gambeson_plain <- this.inherit("scripts/items/legend_armor/cloth/legend_gambeson", {
	m = {},
	function create()
	{
		this.legend_gambeson.create();
		this.m.ID = "legend.armor.body.gambeson_plain.cloth";
		this.m.Variants = [
            0,
            8,
			13,
			14,
			16,
			34
        ];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();

	}

});

