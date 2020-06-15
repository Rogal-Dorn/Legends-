this.legend_rugged_scale_armor <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.rugged_scale_armor";
		this.m.Name = "Rugged Scale Armor";
		this.m.Description = "A heavy body armor made from thick iron scales.";
		this.m.ArmorDescription = "Includes A heavy body armor made from thick iron scales.";
		local variant = 93;
		this.m.SpriteBack = "bust_body_" + variant;
		this.m.SpriteDamagedBack = "bust_body_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_body_" + variant + "_dead";
		this.m.Icon = "legend_armor/plate/legend_rugged_scale_armor.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_rugged_scale_armor.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_rugged_scale_armor.png";
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 700;
		this.m.Condition = 95;
		this.m.ConditionMax = 95;
		this.m.StaminaModifier = -15;
	}

});

