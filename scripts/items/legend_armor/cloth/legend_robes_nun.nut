this.legend_robes_nun <- this.inherit("scripts/items/legend_armor/cloth/legend_robes", {
	m = {},
	function create()
	{
		this.legend_robes.create();
		this.m.ID = "legend.armor.body.legend_nun_robes";
		this.m.Name = "Nun\'s Robe";
		this.m.Description = "A rugged, large robe made of simple cloth usually worn by young nuns.";
		this.m.Variants = [
			6,
			7
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 25;
		this.m.Condition = 22;
		this.m.ConditionMax = 22;
		this.m.StaminaModifier = -1;
	}

});

