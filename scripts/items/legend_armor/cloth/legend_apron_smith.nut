this.legend_apron_smith <- this.inherit("scripts/items/legend_armor/cloth/legend_apron", {
	m = {},
	function create()
	{
		this.legend_apron.create();
		this.m.ID = "legend.armor.body.legend_blacksmith_apron";
		this.m.Name = "Blacksmith Apron";
		this.m.Description = "A leather apron usually worn by a blacksmith";
		this.m.Variant = this.Math.rand(1,4);
		this.updateVariant();
		this.m.Value = 200;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = 0;
	}

});

