this.legend_wizard_robes <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend.armor.body.wizard_robes";
		this.m.Name = "Wizard\'s Robe";
		this.m.Description = "A soft shiny robe worn by practictioners of the arcane arts";
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
			11
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 250;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_wizard_robe_" + variant;
		this.m.SpriteDamaged = "bust_wizard_robe_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_wizard_robe_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/cloth/inventory_wizard_robe_" + variant + ".png";
		this.m.Icon = "legend_armor/cloth/icon_wizard_robe_" + variant + ".png";
	}

});

