this.legend_gambeson_named <- this.inherit("scripts/items/legend_armor/cloth/legend_cloth_named", {
	m = {},
	function create()
	{
		this.legend_cloth_named.create();
		this.m.ID = "legend.armor.body.gambeson.cloth.named";
		this.m.Name = "";
		this.m.Description = "A master crafted heavy padded tunic that offers excellent protection.";
		this.m.NameList = [
			"Heraldic Gambeson",
			"Splendor",
			"Grandiosity",
			"Pageantry",
			"Swank",
			"Noble Surcoat",
			"Duty",
			"Honor"
		];
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 1500;
		this.m.Condition = 70;
		this.m.ConditionMax = 70;
		this.m.StaminaModifier = -7;
		this.randomizeValues();
	}

	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(4, 6) * -1;
		this.m.Condition = this.Math.rand(75, 90);
		this.m.ConditionMax = this.m.Condition;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_gambeson_named_" + variant;
		this.m.SpriteDamaged = "bust_legend_gambeson_named_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_gambeson_named_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/cloth/inventory_legend_gambeson_named_" + variant + ".png";
		this.m.Icon = "legend_armor/cloth/icon_legend_gambeson_named_" + variant + ".png";
	}

});

