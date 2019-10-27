this.legend_apron_taxidermist <- this.inherit("scripts/items/legend_armor/cloth/legend_apron", {
	m = {},
	function create()
	{
		this.legend_apron.create();
		this.m.ID = "legend.armor.body.legend_taxidermist_apron";
		this.m.Name = "Taxidermist Apron";
		this.m.Description = "A leather apron usually worn by a taxidermist";
		this.m.Variant = this.Math.rand(5,6);
		this.updateVariant();
		this.m.Value = 100;
		this.m.Condition = 35;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = 0;
	}

});

