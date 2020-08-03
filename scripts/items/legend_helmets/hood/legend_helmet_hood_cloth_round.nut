
this.legend_helmet_hood_cloth_round <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.legend_helmet_hood_cloth_round";
		this.m.Name = "Round Hood Cloth";
		this.m.Description = "A simple hood to protect against weather and scratches.";
		this.m.Variant = 1;
		this.m.Variants = [1];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 60;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -1;
		this.m.Vision = 0;
		this.m.HideHair = true;
		this.m.HideBeard = false;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_hood_cloth_round" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_hood_cloth_round" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_hood_cloth_round" + "_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "legend_helmets/inventory_hood_cloth_round" + "_" + variant + ".png"
	}
});
