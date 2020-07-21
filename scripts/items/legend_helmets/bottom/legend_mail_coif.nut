this.legend_mail_coif <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Bottom;
		this.m.ID = "armor.head.legend.mail_coif";
		this.m.Name = "Mail Coif";
		this.m.Description = "A mail coif that also protects the neck.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variant = 188;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 200;
		this.m.Condition = 80;
		this.m.ConditionMax = 80;
		this.m.StaminaModifier = -4;
	}

});

