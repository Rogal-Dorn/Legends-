this.legend_armor_hauberk_sleevless <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.hauberk_sleeveless";
		this.m.Name = "Sleeveless Hauberk";
		this.m.Description = "A long and heavy chainmail that offers good protection but is very fatiguing to wear.";
		this.m.ArmorDescription = "Includes a long and heavy chainmail that offers good protection but is very fatiguing to wear.";
		this.m.Icon = "legend_armor/chain/legend_hauberk_sleevless.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/chain/icon_legend_hauberk_sleevless.png";
		this.m.OverlayIconLarge = "legend_armor/chain/inventory_legend_hauberk_sleevless.png";
		this.m.SpriteBack = "bust_legend_hauberk_sleevless";
		this.m.SpriteDamagedBack = "bust_legend_hauberk_sleevless_damaged";
		this.m.SpriteCorpseBack = "bust_legend_hauberk_sleevless_dead";
		this.m.Value = 1250;
		this.m.Condition = 65;
		this.m.ConditionMax = 65;
		this.m.StaminaModifier = -7;
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
	}

});

