this.legend_armor_rusty_mail_shirt <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.patched_mail";
		this.m.Name = "Patched Mail Shirt";
		this.m.Description = "This light mail shirt has seen better times but still grants decent protection.";
		this.m.ArmorDescription = "Includes a rusty and patched mail shirt that offers decent protection.";
		this.m.Variants = [
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 125;
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
		this.m.StaminaModifier = -4;
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_rusty_mail_shirt_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_rusty_mail_shirt_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_rusty_mail_shirt_" + variant + "_dead";
		this.m.Icon = "legend_armor/chain/legend_rusty_mail_shirt_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/chain/icon_legend_rusty_mail_shirt_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/chain/inventory_legend_rusty_mail_shirt_" + variant + ".png";
	}

});

