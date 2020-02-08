this.legend_armor_basic_mail <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.basic_mail";
		this.m.Name = "Basic Mail";
		this.m.Description = "A long and heavy chainmail that offers good protection but is very fatiguing to wear.";
		this.m.ArmorDescription = "Includes a long and heavy chainmail that offers good protection but is very fatiguing to wear.";
		this.m.Icon = "legend_armor/chain/legend_basic_mail.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/chain/icon_legend_basic_mail.png";
		this.m.OverlayIconLarge = "legend_armor/chain/inventory_legend_basic_mail.png";
		this.m.SpriteBack = "bust_legend_basic_mail";
		this.m.SpriteDamagedBack = "bust_legend_basic_mail_damaged";
		this.m.SpriteCorpseBack = "bust_legend_basic_mail_dead";
		this.m.Value = 800;
		this.m.Condition = 85;
		this.m.ConditionMax = 85;
		this.m.StaminaModifier = -12;
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
	}

});

