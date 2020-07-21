this.legend_mouth_piece <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend.witchhunter_hat";
		this.m.Name = "Mouth Piece";
		this.m.Description = "A piece of cloth covering the lower face to protect from breathing in dust or prevent identification.";
		this.m.ArmorDescription = this.m.Description;
		local variants = [
			28,
			45,
			46,
			47
		];
		this.m.Variant = variants[this.Math.rand(0, variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 15;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = 0;
	}

});

