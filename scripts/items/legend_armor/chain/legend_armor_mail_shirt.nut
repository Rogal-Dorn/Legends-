this.legend_armor_mail_shirt <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.mail_shirt";
		this.m.Name = "Basic Mail Shirt";
		this.m.Description = "A basic mail shirt. Offers decent and affordable protection against slashing and piercing attacks.";
		this.m.ArmorDescription = "Includes a basic mail shirt that offers good protection against slashing and piercing attacks.";
		this.m.Icon = "legend_armor/chain/legend_mail_shirt.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/chain/icon_legend_mail_shirt.png";
		this.m.OverlayIconLarge = "legend_armor/chain/inventory_legend_mail_shirt.png";
		this.m.SpriteBack = "bust_legend_mail_shirt";
		this.m.SpriteDamagedBack = "bust_legend_mail_shirt_damaged";
		this.m.SpriteCorpseBack = "bust_legend_mail_shirt_dead";
		this.m.Value = 350;
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
		this.m.StaminaModifier = -6;
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
	}

});

