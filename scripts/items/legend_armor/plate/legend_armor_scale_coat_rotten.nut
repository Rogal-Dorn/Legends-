this.legend_armor_scale_coat_rotten <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.scale_coat_rotten";
		this.m.Name = "Decayed Coat of Scales";
		this.m.Description = "This coat of scales is worn and parts have come lose or are missing. It still offers very good protection if you don\'t mind the smell.";
		this.m.ArmorDescription = "Includes worn and smelly heavy armor made of thick, overlapping metal scales.";
		this.m.Icon = "legend_armor/plate/legend_scale_coat_rotten.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_scale_coat_rotten.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_scale_coat_rotten.png";
		this.m.SpriteBack = "bust_legend_scale_coat_rotten";
		this.m.SpriteDamagedBack = "bust_legend_scale_coat_rotten_damaged";
		this.m.SpriteCorpseBack = "bust_legend_scale_coat_rotten_dead";
		this.m.Value = 600;
		this.m.Condition = 60;
		this.m.ConditionMax = 60;
		this.m.StaminaModifier = -9;
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
	}

});

