this.legend_gambeson <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend.armor.body.gambeson.cloth";
		this.m.Name = "Gambeson";
		this.m.Description = "A sturdy and heavy padded tunic that offers decent protection.";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
        local variants = [
            0,
			1,
			3,
			6,
            8,
			10,
			13,
			14,
			15,
			16,
			17,
			28,
			33,
			34,
			40,
			41,
			47,
			53,
			59,
			65,
			66,
			67,
			68,
			69,
			70

        ]
		this.m.Variant = variants[this.Math.rand(1, variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 100;
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

