
this.legend_helmet_orc_double_helm <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_orc_double_helm";
		this.m.Name = "Orc Looted Kettle Hat";
		this.m.Description = "A simplistic orc helm made from two kettle hats tied together and reinforced with additional chain";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [1, 2];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 900;
		this.m.Condition = 240;
		this.m.ConditionMax = 240;
		this.m.StaminaModifier = -24;
		this.m.Vision = -2;
		this.m.IsLowerVanity = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_orc_double_helm" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_orc_double_helm" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_orc_double_helm" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_orc_double_helm" + "_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});
