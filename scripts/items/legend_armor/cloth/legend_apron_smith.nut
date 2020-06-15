this.legend_apron_smith <- this.inherit("scripts/items/legend_armor/cloth/legend_apron", {
	m = {},
	function create()
	{
		this.legend_apron.create();
		this.m.ID = "legend.armor.body.legend_blacksmith_apron";
		this.m.Name = "Blacksmith Apron";
		this.m.Description = "A leather apron usually worn by a blacksmith";
		this.m.Variants = [
			1,
			2,
			3,
			4
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 70;
		this.m.Condition = 45;
		this.m.ConditionMax = 45;
		this.m.StaminaModifier = -5;
	}

});

