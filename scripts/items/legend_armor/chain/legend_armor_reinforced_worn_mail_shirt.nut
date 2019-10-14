this.legend_armor_reinforced_worn_mail_shirt <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain
		this.m.ID = "legend_armor.reinforced_worn_mail_shirt";
		this.m.Name = "Worn Reinforced Mail Shirt";
		this.m.Description = "A reinforced mail shirt that lost some parts over the years.";
		this.m.ArmorDescription = "Includes a reinforced mail shirt that has seen better days.";
		this.m.Icon = "legend_armor/chain/icon_legend_reinforced_worn_mail_shirt.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/chain/icon_legend_reinforced_worn_mail_shirt.png";
		this.m.OverlayIconLarge = "legend_armor/chain/inventory_legend_reinforced_worn_mail_shirt.png";
		this.m.SpriteBack = "legend_reinforced_worn_mail_shirt";
		this.m.SpriteDamagedBack = "legend_reinforced_worn_mail_shirt_damaged";
		this.m.SpriteCorpseBack = "legend_reinforced_worn_mail_shirt_dead";
		this.m.Value = 400;
		this.m.Condition = 110;
		this.m.ConditionMax = 110;
		this.m.StaminaModifier = 12;
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
	}

});

