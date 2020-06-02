this.legend_armor_cloak_common <- this.inherit("scripts/items/legend_armor/cloak/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Cloak;
		this.m.ID = "legend_armor.cloak_common";
		this.m.Name = "Simple Cloak";
		this.m.Description = "A rustic cloak made of strong warm wool, provides some small protection, from the weather if nothing else ";
		this.m.ArmorDescription = "Has a stout wool cloak";
		this.m.Variants = [
			8,
			9,
			10,
			11,
			12,
			13,
			14,
			21,
			22,
			23,
			32,
			33,
			34
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 100;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = -2;
	}

});

