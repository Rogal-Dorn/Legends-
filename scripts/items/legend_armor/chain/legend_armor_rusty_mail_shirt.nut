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
		this.m.Icon = "legend_armor/chain/icon_legend_rusty_mail_shirt.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/chain/icon_legend_rusty_mail_shirt.png";
		this.m.OverlayIconLarge = "legend_armor/chain/inventory_legend_rusty_mail_shirt.png";
		this.m.SpriteBack = "bust_legend_rusty_mail_shirt";
		this.m.SpriteDamagedBack = "bust_legend_rusty_mail_shirt_damaged";
		this.m.SpriteCorpseBack = "bust_legend_rusty_mail_shirt_dead";
		this.m.Value = 250;
		this.m.Condition = 90;
		this.m.ConditionMax = 90;
		this.m.StaminaModifier = 10;
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
	}

});

