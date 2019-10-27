this.legend_apron_butcher <- this.inherit("scripts/items/legend_armor/cloth/legend_apron", {
	m = {},
	function create()
	{
		this.legend_robes.create();
		this.m.ID = "legend.armor.body.butcher_apron";
		this.m.Name = "Butcher\'s Apron";
		this.m.Description = "A rugged apron worn by butchers to protect against accidental cuts.";
		this.m.Variant = this.Math.rand(7,10);
		this.updateVariant();
		this.m.Value = 100;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = 0;
	}

});

