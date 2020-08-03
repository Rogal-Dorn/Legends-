
this.legend_helmet_faceplate_long <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_faceplate_long";
		this.m.Name = "Long Faceplate";
		this.m.Description = "Long Faceplate";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variant = 1;
		this.m.Variants = [1];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 700;
		this.m.Condition = 65;
		this.m.ConditionMax = 65;
		this.m.StaminaModifier = -5;
		this.m.Vision = -2;
		this.m.IsLowerVanity = false;
		this.m.HideHair = false;
		this.m.HideBeard = true;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_faceplate_long" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_faceplate_long" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_faceplate_long" + "_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "legend_helmets/inventory_faceplate_long" + "_" + variant + ".png";
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});
