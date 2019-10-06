this.legend_robes_smith <- this.inherit("scripts/items/legend_armor/cloth/legend_robes", {
	m = {},
	function create()
	{
		this.legend_robes.create();
		this.m.ID = "legend.armor.body.legend_blacksmith_apron";
		this.m.Name = "Blacksmith Apron";
		this.m.Description = "A leather apron usually worn by a blacksmith";
		this.m.Variant = this.Math.rand(4,5);
		this.updateVariant();
		this.m.Value = 80;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = 0;
	}

});

