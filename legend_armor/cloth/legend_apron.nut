
this.legend_apron <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_apron";
		this.m.Name = "Blacksmith Apron";
		this.m.Description = "A leather apron usually worn by a blacksmith";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 60;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -4;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_apron" + "_" + variant;
		this.m.SpriteDamaged = "bust_legend_apron" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_apron" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_helmets/cloth/inventory_legend_apron" + "_" + variant + ".png"
		this.m.Icon = "legend_helmets/cloth/icon_legend_apron" + "_" + variant + ".png"
	}
});
