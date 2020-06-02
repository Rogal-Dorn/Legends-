this.legend_armor_ancient_mail <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.ancient_mail";
		this.m.Name = "Ancient Mail";
		this.m.Description = "An old and crusted heavy mail of ancient design. Some parts are missing, but it still offers decent protection.";
		this.m.Description = "Includes an old and crusted heavy mail of ancient design.";
		this.m.Icon = "legend_armor/chain/legend_ancient_mail.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/chain/icon_legend_ancient_mail.png";
		this.m.OverlayIconLarge = "legend_armor/chain/inventory_legend_ancient_mail.png";
		this.m.SpriteBack = "bust_legend_ancient_mail";
		this.m.SpriteDamagedBack = "bust_legend_ancient_mail_damaged";
		this.m.SpriteCorpseBack = "bust_legend_ancient_mail_dead";
		this.m.Value = 300;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -6;
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
	}

});

