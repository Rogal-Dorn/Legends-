
this.legend_helmet_heavy_plate_helm <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_heavy_plate_helm";
		this.m.Name = "Heavy Plate Helm";
		this.m.Description = "This heavy helmet usually has ornamental horns attached. This is a sign of high standing and reputation within barbarian warbands.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variant = 1;
		this.m.Variants = [1, 2];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 1300;
		this.m.Condition = 170;
		this.m.ConditionMax = 170;
		this.m.StaminaModifier = -15;
		this.m.Vision = -3;
		this.m.IsLowerVanity = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_heavy_plate_helm" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_heavy_plate_helm" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_heavy_plate_helm" + "_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "legend_helmets/inventory_heavy_plate_helm" + "_" + variant + ".png";
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});
