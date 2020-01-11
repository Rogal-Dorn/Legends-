this.legend_double_mail_upgrade <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.ID = "legend_armor_upgrade.double_mail";
		this.m.Type = this.Const.Items.ArmorUpgrades.Attachment;
		this.m.Name = "Double Mail";
		this.m.Description = "A thick double mail patch. Heavy, but effective in further adding to an armor\'s protection.";
		this.m.ArmorDescription = "A thick double mail has been added to this armor for further protection.";
		this.m.Icon = "armor_upgrades/upgrade_19.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/icon_upgrade_19.png";
		this.m.OverlayIconLarge = "armor_upgrades/inventory_upgrade_19.png";
		this.m.SpriteFront = null;
		this.m.SpriteBack = "upgrade_19_back";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "upgrade_19_back_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "upgrade_19_back_dead";
		this.m.Value = 450;
		this.m.Condition = 15;
		this.m.ConditionMax = 15;
		this.m.ConditionModifier = 15;
		this.m.StaminaModifier = -1;
	}

	function getTooltip()
	{
		local result = this.legend_armor_upgrade.getTooltip();
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/armor_body.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+15[/color] Durability"
		});
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]-1[/color] Maximum Fatigue"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
	}

});

