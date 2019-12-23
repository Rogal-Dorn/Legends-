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
		this.m.Variant = this.Math.rand(40, 64);
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 450;
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
		this.m.StaminaModifier = -4;
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

