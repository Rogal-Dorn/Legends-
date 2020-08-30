
this.legend_sackcloth_patched <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_sackcloth_patched";
		this.m.Name = "Leather Wraps";
		this.m.Description = "Various patches of rough leather sewn together.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 25;
		this.m.Condition = 15;
		this.m.ConditionMax = 15;
		this.m.StaminaModifier = -1;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_sackcloth_patched" + "_" + variant;
		this.m.SpriteDamaged = "bust_legend_sackcloth_patched" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_sackcloth_patched" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_helmets/cloth/inventory_legend_sackcloth_patched" + "_" + variant + ".png"
		this.m.Icon = "legend_helmets/cloth/icon_legend_sackcloth_patched" + "_" + variant + ".png"
	}
});
