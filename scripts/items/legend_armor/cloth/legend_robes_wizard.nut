this.legend_robes_wizard <- this.inherit("scripts/items/legend_armor/cloth/legend_robes", {
	m = {},
	function create()
	{
		this.legend_robes.create();
		this.m.ID = "legend.armor.body.wizard_robe";
		this.m.Name = "Wizard\'s Robe";
		this.m.Description = "A cloth robe coverd in all kinds of mystical ornaments and symbols.";
		this.m.Variant = 3;
		this.updateVariant();
		this.m.Value = 1400;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = 4;
	}

});

