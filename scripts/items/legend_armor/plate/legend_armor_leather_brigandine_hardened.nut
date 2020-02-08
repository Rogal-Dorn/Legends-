this.legend_armor_leather_brigandine_hardened <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.leather_brigandine_hardened";
		this.m.Name = "Hardened Leather Brigandine Armor";
		this.m.Description = "A boiled and hardened leather brigandine studded with steel rivets for added protection.";
		this.m.ArmorDescription = "Includes leather brigandine armor.";
		this.m.Icon = "legend_armor/plate/legend_leather_brigandine_hardened.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_leather_brigandine_hardened.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_leather_brigandine_hardened.png";
		this.m.SpriteBack = "bust_legend_leather_brigandine_hardened";
		this.m.SpriteDamagedBack = "bust_legend_leather_brigandine_hardened_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_brigandine_hardened_dead";
		this.m.Value = 1250;
		this.m.Condition = 110;
		this.m.ConditionMax = 110;
		this.m.StaminaModifier = -15;
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
	}

});

