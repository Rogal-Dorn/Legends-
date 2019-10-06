this.legend_robes <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend.armor.body.monk_robes";
		this.m.Name = "Monk\'s Robe";
		this.m.Description = "A rugged, large robe made of simple cloth usually worn by monks and similar individuals who don\'t care for fashion.";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = this.Math.rand(1,2);
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 45;
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
		this.m.StaminaModifier = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_robes_" + variant;
		this.m.SpriteDamaged = "bust_legend_robes_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_robes_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/cloth/inventory_legend_robes_" + variant + ".png";
		this.m.Icon = "legend_armor/cloth/icon_legend_robes_" + variant + ".png";
	}

});

