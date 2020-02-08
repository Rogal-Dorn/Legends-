this.legend_armor_leather_brigandine_hardened_full <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.leather_brigandine_hardened_full";
		this.m.Name = "Reinforced Hardened Leather Brigandine Armor";
		this.m.Description = "A boiled and hardened brigandine studded with steel rivets and reinforced with steel padded shoulders for added protection.";
		this.m.ArmorDescription = "Includes hardened brigandine armor.";
		this.m.Icon = "legend_armor/plate/legend_leather_brigandine_hardened_full.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_leather_brigandine_hardened_full.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_leather_brigandine_hardened_full.png";
		this.m.SpriteBack = "bust_legend_leather_brigandine_hardened_full";
		this.m.SpriteDamagedBack = "bust_legend_leather_brigandine_hardened_full_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_brigandine_hardened_full_dead";
		this.m.Value = 3000;
		this.m.Condition = 140;
		this.m.ConditionMax = 140;
		this.m.StaminaModifier = -19;
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
	}

});

