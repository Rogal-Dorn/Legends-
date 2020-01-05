this.legend_armor_hauberk_full_named <- this.inherit("scripts/items/legend_armor/legend_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain
		this.m.ID = "legend_armor.hauberk_full_named";
		this.m.Name = "";
		this.m.NameList = [
			"Heraldic Mail",
			"Splendor",
			"Grandiosity",
			"Pageantry",
			"Swank",
			"Full Mail",
			"Mail Hauberk",
			"Chainmail",
			"Surcoat",
			"Duty",
			"Honor",
			"Noble Mail"
		];
		this.m.Description = "Truly fit for a knight, this mail hauberk is made from the highest quality materials and boasts precious decorations and ornaments.";
		this.m.ArmorDescription = "Includes a mail hauberk made from the highest quality materials and boasts precious decorations and ornaments.";
		this.m.Variants = [1];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 4500;
		this.m.Condition = 115;
		this.m.ConditionMax = 115;
		this.m.StaminaModifier = -14;
		this.randomizeValues();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
	}

	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(11, 14) * -1;
		this.m.Condition = this.Math.rand(115, 135);
		this.m.ConditionMax = this.m.Condition;
	}

	function updateVariant()
	{
		local variant = this.m.Variant < 10 ? "0" + this.m.Variant : this.m.Variant;
		this.m.SpriteBack = "bust_legend_hauberk_full_named_" + variant ;
		this.m.SpriteDamagedBack = "bust_legend_hauberk_full_named_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_hauberk_full_named_" + variant + "_dead";
		this.m.Icon = "legend_armor/chain/legend_hauberk_full_named_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/chain/icon_legend_hauberk_full_named_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/chain/inventory_legend_hauberk_full_named_"  + variant + ".png";
	}
});

