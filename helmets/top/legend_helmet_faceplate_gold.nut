
this.legend_helmet_faceplate_gold <- this.inherit("scripts/items/legend_helmets/legend_named_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_faceplate_gold";
        this.m.NameList = this.Const.Strings.LegendArmorLayers;
		this.m.Description = "A gilded faceplate of excellent quality";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 550;
		this.m.Condition = 52;
		this.m.ConditionMax = 52;
		this.m.StaminaModifier = -3;
		this.m.Vision = -2;
		this.m.IsLowerVanity = false;
		this.m.HideHair = false;
		this.m.HideBeard = true;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_faceplate_gold" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_faceplate_gold" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_faceplate_gold" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_faceplate_gold" + "_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

	function randomizeValues()
	{
        this.m.Vision = this.Math.rand(0, 0);
		this.m.StaminaModifier = this.Math.rand(-6, -8);
		this.m.Condition = this.Math.rand(105, 135);
		this.m.ConditionMax = this.m.Condition;
	}
});
