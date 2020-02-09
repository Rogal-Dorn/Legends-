this.legend_armor_cloak_noble <- this.inherit("scripts/items/legend_armor/cloak/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.Bravery = 3;
		this.m.Type = this.Const.Items.ArmorUpgrades.Cloak;
		this.m.ID = "legend_armor.cloak_noble";
		this.m.Name = "Noble Cloak";
		this.m.Description = "A fine cloak made of light foreign silk, provides protection and looks great. ";
		this.m.ArmorDescription = "Has a flowing light cloak";
		this.m.Variants = [
			1,
			2,
			4,
			5,
			6,
			7,
			25
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 3000;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = -2;
	}

});

