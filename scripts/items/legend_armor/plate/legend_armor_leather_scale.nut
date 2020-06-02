this.legend_armor_leather_scale <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.leather_scale";
		this.m.Name = "Leather Scale Armor";
		this.m.Description = "A thick leather scale armor for added protection.";
		this.m.ArmorDescription = "Includes scaled leather armor.";
		this.m.Icon = "legend_armor/plate/legend_leather_scale.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_leather_scale.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_leather_scale.png";
		this.m.SpriteBack = "bust_legend_leather_scale";
		this.m.SpriteDamagedBack = "bust_legend_leather_scale_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_scale_dead";
		this.m.Value = 600;
		this.m.Condition = 70;
		this.m.ConditionMax = 70;
		this.m.StaminaModifier = -9;
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
	}

});

