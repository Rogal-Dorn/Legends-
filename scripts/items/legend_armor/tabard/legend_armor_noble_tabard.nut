this.legend_armor_tabard <- this.inherit("scripts/items/legend_armor/legend_armor_tabard", {
	m = {},
	function create()
	{
		this.legend_armor_tabard.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Tabbard
		this.m.ID = "legend_armor.noble_tabard";
		this.m.Variant = this.Math.rand(1, 10);
		this.updateVariant();
		this.m.Value = 200;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = -1;
	}
});

