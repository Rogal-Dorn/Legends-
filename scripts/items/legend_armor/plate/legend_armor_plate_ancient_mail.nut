this.legend_armor_plate_ancient_mail <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.plate_ancient_mail";
		this.m.Name = "Ancient Plated Mail";
		this.m.Description = "An ancient mail armor with plated arm guards. Very heavy and severely limiting the mobility of the wearer.";
		this.m.ArmorDescription = "Includes an ancient mail armor with plated arm guards.";
		this.m.Icon = "legend_armor/plate/legend_plate_ancient_mail.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_plate_ancient_mail.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_plate_ancient_mail.png";
		this.m.SpriteBack = "bust_legend_plate_ancient_mail";
		this.m.SpriteDamagedBack = "bust_legend_plate_ancient_mail_damaged";
		this.m.SpriteCorpseBack = "bust_legend_plate_ancient_mail_dead";
		this.m.Value = 300;
		this.m.Condition = 45;
		this.m.ConditionMax = 45;
		this.m.StaminaModifier = -7;
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
	}

});

