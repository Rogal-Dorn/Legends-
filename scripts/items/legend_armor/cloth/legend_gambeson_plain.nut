this.legend_gambeson_plain <- this.inherit("scripts/items/legend_armor/cloth/legend_gambeson", {
	m = {},
	function create()
	{
		this.legend_gambeson.create();
		this.m.ID = "legend.armor.body.gambeson_plain.cloth";
        local variants = [
            0,
            1,
            8
        ]
		this.m.Variant = this.Math.rand(0, variants.len() - 1);
		this.updateVariant();

	}

});

