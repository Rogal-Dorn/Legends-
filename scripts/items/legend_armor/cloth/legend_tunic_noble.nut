this.legend_tunic_noble <- this.inherit("scripts/items/legend_armor/cloth/legend_tunic", {
	m = {},
	function create()
	{
		this.legend_tunic.create();
		this.m.ID = "legend.armor.body.noble_tunic";
		this.m.Name = "Noble Tunic";
		this.m.Description = "A fine linen tunic of exquisite material, embroided with pleasing patterns. Fashionable but offering little in protection.";
		this.m.Variant = 6;
		this.updateVariant();
		this.m.Value = 100;
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
		this.m.StaminaModifier = -2;
	}
});

