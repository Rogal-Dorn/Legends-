this.legend_armor_rusty_mail_shirt <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain
		this.m.ID = "legend_armor.patched_mail";
		this.m.Name = "Patched Mail Shirt";
		this.m.Description = "This light mail shirt has seen better times but still grants decent protection.";
		this.m.ArmorDescription = "Includes a rusty and patched mail shirt that offers decent protection.";
		this.m.Variant = this.Math.rand(1, 11);
		this.updateVariant();
		this.m.Value = 250;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -5;
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_rusty_mail_shirt_" + variant;
		this.m.SpriteDamaged = "bust_legend_rusty_mail_shirt_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_rusty_mail_shirt_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/cloth/inventory_legend_rusty_mail_shirt_" + variant + ".png";
		this.m.Icon = "legend_armor/cloth/icon_legend_rusty_mail_shirt_" + variant + ".png";
	}

});

