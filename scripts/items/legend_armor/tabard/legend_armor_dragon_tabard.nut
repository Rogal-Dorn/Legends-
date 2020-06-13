this.legend_armor_dragon_tabard <- this.inherit("scripts/items/legend_armor/tabard/legend_armor_tabard", {
	m = {
		Variant = 10
	},
	function create()
	{
		this.legend_armor_tabard.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Tabbard;
		this.m.ID = "legend_armor.dragon_tabard";
		this.m.Variants = [
			10
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 1000;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = 0;
	}

	function setFaction( _f )
	{
		this.m.Variant = _f;
		this.updateVariant();
	}

});

