this.legend_padded_surcoat <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend.armor.body.padded_surcoat.cloth";
		this.m.Name = "Padded Surcoat";
		this.m.Description = "A sturdy and heavy padded coat that offers decent protection.";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variants = [
			40,
			41,
			42,
			43,
			44,
			45,
			46,
			47,
			48,
			49,
			50,
			51,
			52,
			53,
			54,
			55,
			56,
			57,
			58,
			59,
			60,
			61,
			62,
			62,
			64
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 150;
		this.m.Condition = 55;
		this.m.ConditionMax = 55;
		this.m.StaminaModifier = -6;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_gambeson_" + variant;
		this.m.SpriteDamaged = "bust_legend_gambeson_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_gambeson_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/cloth/inventory_legend_gambeson_" + variant + ".png";
		this.m.Icon = "legend_armor/cloth/icon_legend_gambeson_" + variant + ".png";
	}

});

