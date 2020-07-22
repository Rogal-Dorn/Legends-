this.legend_helmet_cloth_bandana <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend.legend_helmet_cloth_bandana";
		this.m.Name = "Cloth Bandana";
		this.m.Description = "TODO Cloth Bandana";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variant = 188;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 200;
		this.m.Condition = 80;
		this.m.ConditionMax = 80;
		this.m.StaminaModifier = -4;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "";
		this.m.SpriteDamaged = ""//"bust_helmet_" + variant + "_damaged";
		this.m.SpriteCorpse = ""//"bust_helmet_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "legend_helmets/helm/legend_cloth_bandana.png"
	}

});

