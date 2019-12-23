this.legend_apron <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend.armor.body.legend_apron";
		this.m.Name = "Apron";
		this.m.Description = "A leather apron worn by a craftsman";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = this.Math.rand(1,7);
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 90;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -3;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_apron_" + variant;
		this.m.SpriteDamaged = "bust_legend_apron_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_apron_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/cloth/inventory_legend_apron_" + variant + ".png";
		this.m.Icon = "legend_armor/cloth/icon_legend_apron_" + variant + ".png";
	}

});

