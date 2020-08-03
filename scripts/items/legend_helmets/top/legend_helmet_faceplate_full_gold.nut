
this.legend_helmet_faceplate_full_gold <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_faceplate_full_gold";
		this.m.Name = "Golden Full Faceplate";
		this.m.Description = "Golden Full Faceplate";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variant = 1;
		this.m.Variants = [1];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 1800;
		this.m.Condition = 115;
		this.m.ConditionMax = 115;
		this.m.StaminaModifier = -9;
		this.m.Vision = -3;
		this.m.IsLowerVanity = false;
		this.m.HideHair = false;
		this.m.HideBeard = false;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_faceplate_full_gold" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_faceplate_full_gold" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_faceplate_full_gold" + "_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "legend_helmets/inventory_faceplate_full_gold" + "_" + variant + ".png";
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});
