this.legend_robes_herbalist <- this.inherit("scripts/items/legend_armor/cloth/legend_apron", {
	m = {},
	function create()
	{
		this.legend_robes.create();
		this.m.ID = "legend.armor.body.butcher_apron";
		this.m.Name = "Herbailist Robes";
		this.m.Description = "Robes worn by herbalists.";
		 local variants = [
					2,
					12,
					16,
					18
				]
		this.m.Variant = variants[this.Math.rand(1, variants.len() - 1)];
		this.updateVariant();
	}

});

