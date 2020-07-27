
this.legend_helmet_cloth_long_hood <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.legend_helmet_cloth_long_hood";
		this.m.Name = "Cloth Long Hood";
		this.m.Description = "Cloth Long Hood";
		this.m.Variant = 1;
		this.m.Variants = [1, 2, 3, 4];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 200;
		this.m.Condition = 80;
		this.m.ConditionMax = 80;
		this.m.StaminaModifier = -4;
		this.m.Vision = 0;
		this.m.HideHair = true;
		this.m.HideBeard = false;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_cloth_long_hood" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_cloth_long_hood" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_cloth_long_hood" + "_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "legend_helmets/inventory_cloth_long_hood" + "_" + variant + ".png"
	}
});
