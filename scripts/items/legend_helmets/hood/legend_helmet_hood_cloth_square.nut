
this.legend_helmet_hood_cloth_square <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.legend_helmet_hood_cloth_square";
		this.m.Name = "Square Cloth Hood";
		this.m.Description = "Square Hood Cloth";
		this.m.Variant = 1;
		this.m.Variants = [1];
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
		this.m.Sprite = "legendhelms_hood_cloth_square" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_hood_cloth_square" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_hood_cloth_square" + "_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "legend_helmets/inventory_hood_cloth_square" + "_" + variant + ".png"
	}
});
