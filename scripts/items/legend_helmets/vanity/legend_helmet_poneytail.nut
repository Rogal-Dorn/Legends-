
this.legend_helmet_poneytail <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
        this.m.Type = this.Const.Items.HelmetUpgrades.Vanity;
		this.m.ID = "armor.head.legend_helmet_poneytail";
		this.m.Name = "TODO legend_helmet_poneytail";
		this.m.Description = "TODO legend_helmet_poneytail";
        this.m.ArmorDescription = this.m.Description;
        this.m.Variant = 1;
		this.m.Variants = [1, 2, 3, 4];
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
		this.m.Sprite = "legendhelms_poneytail" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_poneytail" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_poneytail" + "_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "legend_helmets/vanity/inventory_poneytail" + "_" + variant + ".png";
        this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});
