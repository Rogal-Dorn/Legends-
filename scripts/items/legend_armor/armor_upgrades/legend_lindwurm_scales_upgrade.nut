this.legend_lindwurm_scales_upgrade <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.ID = "legend_armor_upgrade.lindwurm_scales";
		this.m.Type = this.Const.Items.ArmorUpgrades.Attachment;
		this.m.Name = "Lindwurm Scale Cloak";
		this.m.Description = "A cloak made out of the scales of a Lindwurm. Not only is it a rare and impressive trophy, it also offers additional protection and is untouchable by corroding Lindwurm blood.";
		this.m.ArmorDescription = "A cloak made out of Lindwurm scales is worn over this armor for additional protection, including from the corrosive effects of Lindwurm blood.";
		this.m.Icon = "armor_upgrades/upgrade_04.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/icon_upgrade_04.png";
		this.m.OverlayIconLarge = "armor_upgrades/inventory_upgrade_04.png";
		this.m.SpriteFront = null;
		this.m.SpriteBack = "upgrade_04_back";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "upgrade_04_back_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "upgrade_04_back_dead";
		this.m.Value = 800;
		this.m.ConditionModifier = 40;
		this.m.StaminaModifier = 2;
	}

	function getTooltip()
	{
		local result = this.legend_armor_upgrade.getTooltip();
		result.push({
			id = 13,
			type = "text",
			icon = "ui/icons/armor_body.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+40[/color] Durability"
		});
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]-2[/color] Maximum Fatigue"
		});
		result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Unaffected by acidic Lindwurm blood"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
		_result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Unaffected by acidic Lindwurm blood"
		});
	}

	function onEquip()
	{
		this.item.onEquip();
		local c = this.m.Armor.getContainer();

		if (c != null && c.getActor() != null && !c.getActor().isNull())
		{
			c.getActor().getTags().add("body_immune_to_acid");
		}
	}

	function onUnequip()
	{
		this.item.onUnequip();
		local c = this.m.Armor.getContainer();

		if (c != null && c.getActor() != null && !c.getActor().isNull())
		{
			c.getActor().getTags().remove("body_immune_to_acid");
		}
	}

	function onAdded()
	{
		this.legend_armor_upgrade.onAdded();
		local c = this.m.Armor.getContainer();

		if (c != null && c.getActor() != null && !c.getActor().isNull())
		{
			c.getActor().getTags().add("body_immune_to_acid");
		}
	}

	function onRemoved()
	{
		this.legend_armor_upgrade.onRemoved();
		local c = this.m.Armor.getContainer();

		if (c != null && c.getActor() != null && !c.getActor().isNull())
		{
			c.getActor().getTags().remove("body_immune_to_acid");
		}
	}

});

