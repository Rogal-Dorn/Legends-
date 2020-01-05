this.legend_robes_herbalist <- this.inherit("scripts/items/legend_armor/cloth/legend_robes", {
	m = {},
	function create()
	{
		this.legend_robes.create();
		this.m.ID = "legend.armor.body.legend_robes_herbalist";
		this.m.Name = "Herbailist Robes";
		this.m.Description = "Robes worn by herbalists.";
		this.m.Variants = [
					2,
					12,
					16,
					18
				]
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 65;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -2;
	}

});

