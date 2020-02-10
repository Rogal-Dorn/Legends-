this.legend_armor_reinforced_rotten_mail_shirt <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.reinforced_rotten_mail_shirt";
		this.m.Name = "Rotten Reinforced Mail Shirt";
		this.m.Description = "A reinforced mail shirt that is rotting at the seams.";
		this.m.ArmorDescription = "Includes a reinforced mail shirt that has seen better days.";
		this.m.Icon = "legend_armor/chain/legend_reinforced_rotten_mail_shirt.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/chain/icon_legend_reinforced_rotten_mail_shirt.png";
		this.m.OverlayIconLarge = "legend_armor/chain/inventory_legend_reinforced_rotten_mail_shirt.png";
		this.m.SpriteBack = "bust_legend_reinforced_rotten_mail_shirt";
		this.m.SpriteDamagedBack = "bust_legend_reinforced_rotten_mail_shirt_damaged";
		this.m.SpriteCorpseBack = "bust_legend_reinforced_rotten_mail_shirt_dead";
		this.m.Value = 200;
		this.m.Condition = 45;
		this.m.ConditionMax = 45;
		this.m.StaminaModifier = -7;
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
	}

});

