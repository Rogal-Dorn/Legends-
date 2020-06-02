this.legend_tunic <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend.armor.body.linen_tunic";
		this.m.Name = "Linen Tunic";
		this.m.Description = "A simple cloth tunic. Fashionable but offering little in protection.";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variants = [
			1,
			3,
			4,
			5,
			7,
			8,
			9,
			10,
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
			29,
			30,
			31,
			32,
			33,
			34
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 25;
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
		this.m.StaminaModifier = -1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_tunic_" + variant;
		this.m.SpriteDamaged = "bust_legend_tunic_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_tunic_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/cloth/inventory_legend_tunic_" + variant + ".png";
		this.m.Icon = "legend_armor/cloth/icon_legend_tunic_" + variant + ".png";
	}

});

