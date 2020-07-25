
this.legend_helmet_vampire_crown <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
        this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_vampire_crown";
		this.m.Name = "TODO legend_helmet_vampire_crown";
		this.m.Description = "TODO legend_helmet_vampire_crown";
        this.m.ArmorDescription = this.m.Description;
        this.m.Variant = 1;
		this.m.Variants = [1];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 200;
		this.m.Condition = 80;
		this.m.ConditionMax = 80;
		this.m.StaminaModifier = -4;
        this.m.IsLowerVanity = False;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_vampire_crown" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_vampire_crown" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_vampire_crown" + "_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "legend_helmets/helm/inventory_vampire_crown" + "_" + variant + ".png";
        this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});
