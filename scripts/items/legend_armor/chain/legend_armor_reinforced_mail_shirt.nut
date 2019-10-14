this.legend_armor_reinforced_mail_shirt <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain
		this.m.ID = "legend_armor.reinforced_mail_shirt";
		this.m.Name = "Reinforced Mail Shirt";
		this.m.Description = "A reinforced mail shirt with shoulder guards providing excellent protection against most weapons.";
		this.m.ArmorDescription = "Includes a reinforced mail shirt in excellent condition.";
		this.m.Icon = "legend_armor/chain/icon_legend_reinforced_mail_shirt.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/chain/icon_legend_reinforced_mail_shirt.png";
		this.m.OverlayIconLarge = "legend_armor/chain/inventory_legend_reinforced_mail_shirt.png";
		this.m.SpriteBack = "legend_reinforced_mail_shirt";
		this.m.SpriteDamagedBack = "legend_reinforced_mail_shirt_damaged";
		this.m.SpriteCorpseBack = "legend_reinforced_mail_shirt_dead";
		this.m.Value = 600;
		this.m.Condition = 120;
		this.m.ConditionMax = 120;
		this.m.StaminaModifier = 14;
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
	}

});

