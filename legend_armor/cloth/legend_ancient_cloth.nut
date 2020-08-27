
this.legend_ancient_cloth <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_ancient_cloth";
		this.m.Name = "Ancient Cloth";
		this.m.Description = "An ancient cloth wrap, heavy and offering little protection";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 20;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -5;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_ancient_cloth" + "_" + variant;
		this.m.SpriteDamaged = "bust_legend_ancient_cloth" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_ancient_cloth" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_helmets/cloth/inventory_legend_ancient_cloth" + "_" + variant + ".png"
		this.m.Icon = "legend_helmets/cloth/icon_legend_ancient_cloth" + "_" + variant + ".png"
	}
});
