
this.legend_helmet_bronze_chain <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.legend_helmet_bronze_chain";
		this.m.Name = "Bronze Chain";
		this.m.Description = "Bronze Chain";
		this.m.Variant = 1;
		this.m.Variants = [1];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 450;
		this.m.Condition = 100;
		this.m.ConditionMax = 100;
		this.m.StaminaModifier = -7;
		this.m.Vision = 0;
		this.m.HideHair = false;
		this.m.HideBeard = false;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_bronze_chain" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_bronze_chain" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_bronze_chain" + "_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "legend_helmets/inventory_bronze_chain" + "_" + variant + ".png"
	}
});
