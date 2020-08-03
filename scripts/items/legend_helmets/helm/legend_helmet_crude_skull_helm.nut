
this.legend_helmet_crude_skull_helm <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_crude_skull_helm";
		this.m.Name = "Crude Skull Helm";
		this.m.Description = "A heavy helmet typical of the northern barbarians with a skull-like facemask. This piece is as massive as it is impressive.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variant = 1;
		this.m.Variants = [1];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 5000;
		this.m.Condition = 130;
		this.m.ConditionMax = 130;
		this.m.StaminaModifier = -7;
		this.m.Vision = -2;
		this.m.IsLowerVanity = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_crude_skull_helm" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_crude_skull_helm" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_crude_skull_helm" + "_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "legend_helmets/inventory_crude_skull_helm" + "_" + variant + ".png";
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});
