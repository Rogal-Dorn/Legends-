this.legend_armor_hauberk_full <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.hauberk_full";
		this.m.Name = "Full Hauberk";
		this.m.Description = "A long and heavy chainmail that offers good protection but is very fatiguing to wear.";
		this.m.ArmorDescription = "Includes a long and heavy chainmail that offers good protection but is very fatiguing to wear.";
		this.m.Icon = "legend_armor/chain/legend_hauberk_full.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/chain/icon_legend_hauberk_full.png";
		this.m.OverlayIconLarge = "legend_armor/chain/inventory_legend_hauberk_full.png";
		this.m.SpriteBack = "bust_legend_hauberk_full";
		this.m.SpriteDamagedBack = "bust_legend_hauberk_full_damaged";
		this.m.SpriteCorpseBack = "bust_legend_hauberk_full_dead";
		this.m.Value = 2500;
		this.m.Condition = 115;
		this.m.ConditionMax = 115;
		this.m.StaminaModifier = -14;
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
	}

});

