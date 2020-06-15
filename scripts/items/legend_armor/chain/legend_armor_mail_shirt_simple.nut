this.legend_armor_mail_shirt_simple <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.mail_shirt_simple";
		this.m.Name = "Simple Mail Shirt";
		this.m.Description = "A simple mail shirt. Offers decent and affordable protection against slashing and piercing attacks.";
		this.m.ArmorDescription = "Includes a simple mail shirt that offers good protection against slashing and piercing attacks.";
		this.m.Icon = "legend_armor/chain/legend_mail_shirt_2.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/chain/icon_legend_mail_shirt_2.png";
		this.m.OverlayIconLarge = "legend_armor/chain/inventory_legend_mail_shirt_2.png";
		this.m.SpriteBack = "bust_legend_mail_shirt_2";
		this.m.SpriteDamagedBack = "bust_legend_mail_shirt_2_damaged";
		this.m.SpriteCorpseBack = "bust_legend_mail_shirt_2_dead";
		this.m.Value = 250;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = -3;
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
	}

});

