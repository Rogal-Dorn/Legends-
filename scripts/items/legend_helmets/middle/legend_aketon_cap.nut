this.legend_aketon_cap <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Middle;
		this.m.ID = "armor.head.legend.aketon_cap";
		this.m.Name = "Aketon Cap";
		this.m.Description = "A padded cloth cap.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variant = 21;
		this.m.Variants = [21];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 70;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -1;
	}

});