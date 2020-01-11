this.legend_joint_cover_upgrade <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.ID = "legend_armor_upgrade.joint_cover";
		this.m.Type = this.Const.Items.ArmorUpgrades.Attachment;
		this.m.Name = "Metal Joint Covers";
		this.m.Description = "Large metal plates that cover the vulnerable shoulder joints.";
		this.m.ArmorDescription = "Large metal plates have been added to protect the vulnerable shoulder joints.";
		this.m.Icon = "armor_upgrades/upgrade_10.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/icon_upgrade_10.png";
		this.m.OverlayIconLarge = "armor_upgrades/inventory_upgrade_10.png";
		this.m.SpriteFront = null;
		this.m.SpriteBack = "upgrade_10_back";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "upgrade_10_back_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "upgrade_10_back_dead";
		this.m.Value = 900;
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
		this.m.ConditionModifier = 20;
		this.m.StaminaModifier = -2;
	}

	function getTooltip()
	{
		local result = this.legend_armor_upgrade.getTooltip();
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/armor_body.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+20[/color] Durability"
		});
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]-2[/color] Maximum Fatigue"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
	}

});

