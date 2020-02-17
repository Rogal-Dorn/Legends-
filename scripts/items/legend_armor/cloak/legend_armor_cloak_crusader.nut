this.legend_armor_cloak_crusader <- this.inherit("scripts/items/legend_armor/cloak/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.Bravery = 4;
		this.m.Type = this.Const.Items.ArmorUpgrades.Cloak;
		this.m.ID = "legend_armor.cloak_crusader";
		this.m.Name = "Crusader Cloak";
		this.m.Description = "A holy cloak made of thick layered strong warm wool, provides protection from some blows but is quite hefty. ";
		this.m.ArmorDescription = "Has a holy thick cloak";
		this.m.Variants = [
			36
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 1000;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -5;
	}

});

