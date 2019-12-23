this.legend_robes_nun <- this.inherit("scripts/items/legend_armor/cloth/legend_robes", {
	m = {},
	function create()
	{
		this.legend_robes.create();
		this.m.ID = "legend.armor.body.legend_nun_robes";
		this.m.Name = "Nun\'s Robe";
		this.m.Description = "A rugged, large robe made of simple cloth usually worn by young nuns.";
		this.m.Variant = this.Math.rand(6,7);
		this.updateVariant();
		this.m.Value = 190;
		this.m.Condition = 18;
		this.m.ConditionMax = 18;
		this.m.StaminaModifier = -1;
	}

});
