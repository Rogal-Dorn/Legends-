this.legend_thick_tunic <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend.armor.body.thick_tunic";
		this.m.Name = "Thick Tunic";
		this.m.Description = "A heavy cloth tunic, bulky but offering some protection.";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variants = [
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11,
			12,
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
			24
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 40;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -3;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_thick_tunic_" + variant;
		this.m.SpriteDamaged = "bust_thick_tunic_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_thick_tunic_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/cloth/inventory_thick_tunic_" + variant + ".png";
		this.m.Icon = "legend_armor/cloth/icon_thick_tunic_" + variant + ".png";
	}

});

