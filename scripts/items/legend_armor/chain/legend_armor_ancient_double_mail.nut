this.legend_armor_ancient_double_mail <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.ancient_double_layer";
		this.m.Name = "Ancient Double Layer Mail";
		this.m.Description = "A heavy and rotten double-layered mail of ancient design. Not comfortable to wear but still useable.";
		this.m.Description = "Includes A heavy and rotten double-layered mail of ancient design.";
		this.m.Icon = "legend_armor/chain/legend_ancient_double_mail.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/chain/icon_legend_ancient_double_mail.png";
		this.m.OverlayIconLarge = "legend_armor/chain/inventory_legend_ancient_double_mail.png";
		this.m.SpriteBack = "bust_legend_ancient_double_mail";
		this.m.SpriteDamagedBack = "bust_legend_ancient_double_mail_damaged";
		this.m.SpriteCorpseBack = "bust_legend_ancient_double_mail_dead";
		this.m.Value = 750;
		this.m.Condition = 80;
		this.m.ConditionMax = 80;
		this.m.StaminaModifier = -14;
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
	}

});

