this.legend_apron_taxidermist <- this.inherit("scripts/items/legend_armor/cloth/legend_apron", {
	m = {},
	function create()
	{
		this.legend_apron.create();
		this.m.ID = "legend.armor.body.legend_taxidermist_apron";
		this.m.Name = "Taxidermist Apron";
		this.m.Description = "A leather apron usually worn by a taxidermist";
		this.m.Variants = [5,6];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
	}

});

