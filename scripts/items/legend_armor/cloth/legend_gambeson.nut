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
		this.m.Variants = [
			0,
			1,
			3,
			6,
			7,
			8,
			9,
			10,
			13,
			14,
			15,
			16,
			17,
			18,
			19,
			20,
			21,
			22,
			23,
			24,
			25,
			26,
			27,
			28,
			29,
			30,
			31,
			32,
			33,
			34,
			35,
			36,
			37,
			38,
			39
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 250;
		this.m.Condition = 65;
		this.m.ConditionMax = 65;
		this.m.StaminaModifier = -8;
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

