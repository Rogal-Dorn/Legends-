this.legend_tunic_noble <- this.inherit("scripts/items/legend_armor/cloth/legend_tunic", {
	m = {},
	function create()
	{
		this.legend_tunic.create();
		this.m.ID = "legend.armor.body.noble_tunic";
		this.m.Name = "Noble Tunic";
		this.m.Description = "A fine linen tunic of exquisite material, embroided with pleasing patterns. Fashionable but offering little in protection.";
		 local variants = [
			 		2,
					6,
					11,
					12,
					13,
					14,
					27,
					28
				]
		this.m.Variant = variants[this.Math.rand(1, variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 450;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = 0;
	}
});

