
this.legend_peasant_dress <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_peasant_dress";
		this.m.Name = "Peasant's Dress";
		this.m.Description = "A simple dress of rough fabric and common dye";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 25;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = -2;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_peasant_dress" + "_" + variant;
		this.m.SpriteDamaged = "bust_legend_peasant_dress" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_peasant_dress" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_helmets/cloth/inventory_legend_peasant_dress" + "_" + variant + ".png"
		this.m.Icon = "legend_helmets/cloth/icon_legend_peasant_dress" + "_" + variant + ".png"
	}
});
