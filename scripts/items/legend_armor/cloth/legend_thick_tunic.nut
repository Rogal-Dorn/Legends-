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
		this.m.Variant = this.Math.rand(1, 24);
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 70;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -2;
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

