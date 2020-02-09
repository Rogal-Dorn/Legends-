this.legend_sackcloth_tattered <- this.inherit("scripts/items/legend_armor/cloth/legend_sackcloth", {
	m = {},
	function create()
	{
		this.legend_sackcloth.create();
		this.m.ID = "legend.armor.body.tattered_sackcloth";
		this.m.Name = "Tattered Sackcloth";
		this.m.Description = "Barely better than running naked.";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variants = [
			2,
			13,
			14,
			15,
			16,
			17,
			18
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 5;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = 0;
	}

});

