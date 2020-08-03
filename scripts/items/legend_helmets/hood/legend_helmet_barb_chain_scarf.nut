
this.legend_helmet_barb_chain_scarf <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.legend_helmet_barb_chain_scarf";
		this.m.Name = "Rusted Aventail";
		this.m.Description = "A rusty mail aventail that still offers good protection - it leaves horrible stains though.";
		this.m.Variant = 1;
		this.m.Variants = [1, 2, 3, 4, 5];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 165;
		this.m.Condition = 55;
		this.m.ConditionMax = 55;
		this.m.StaminaModifier = -2;
		this.m.Vision = 0;
		this.m.HideHair = false;
		this.m.HideBeard = true;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_barb_chain_scarf" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_barb_chain_scarf" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_barb_chain_scarf" + "_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "legend_helmets/inventory_barb_chain_scarf" + "_" + variant + ".png"
	}
});
