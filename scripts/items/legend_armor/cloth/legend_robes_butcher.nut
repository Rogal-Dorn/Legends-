this.legend_robes_butcher <- this.inherit("scripts/items/legend_armor/cloth/legend_robes", {
	m = {},
	function create()
	{
		this.legend_robes.create();
		this.m.ID = "legend.armor.body.butcher_apron";
		this.m.Name = "Butcher\'s Apron";
		this.m.Description = "A rugged apron worn by butchers to protect against accidental cuts.";
		this.m.Variant = 3;
		this.updateVariant();
		this.m.Value = 55;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = 0;
	}

});

