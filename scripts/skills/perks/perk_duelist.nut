this.perk_duelist <- this.inherit("scripts/skills/skill", {
	m = {
		AllowedWeapons = [
			"_parrying_dagger",
			"_hand_crossbow",
			"buckler",
		],
	},
	function create()
	{
		this.m.ID = "perk.duelist";
		this.m.Name = this.Const.Strings.PerkName.Duelist;
		this.m.Description = this.Const.Strings.PerkDescription.Duelist;
		this.m.Icon = "skills/passive_03.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return ::Tactical.isActive();
	}

	function getTooltip()
	{
		local main = getContainer().getActor().getMainhandItem();
		local off = getContainer().getActor().getOffhandItem();
		local tooltip = this.skill.getTooltip();

		if (!isValid(main, off))
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]You do not have the right equipment to receive Duelist's effect[/color]"
			});
		else if (isFullEffect(main, off))
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/direct_damage.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+25%[/color] of any damage ignores armor"
			});
		else if (isPartialEffect(main, off))
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/direct_damage.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+13%[/color] of any damage ignores armor"
			});
		else
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]You do not have the right equipment to receive Duelist's effect[/color]"
			});
	
		return tooltip;
	}

	function isValid( _mainhand, _offhand )
	{
		if (_mainhand == null && _offhand == null)
			return false;

		return true;
	}

	function isFullEffect( _mainhand, _offhand )
	{
		return getContainer().hasSkill("injury.missing_hand") || _offhand == null && !_mainhand.isItemType(::Const.Items.ItemType.TwoHanded) || _offhand != null && _offhand.isItemType(::Const.Items.ItemType.Tool);
	}

	function isPartialEffect( _mainhand, _offhand )
	{
		if (off == null)
			return false;

		foreach( valid in m.AllowedWeapons )
		{
			if (::MSU.String.endsWith(off.getID(), valid))
				return true;
		}

		return false;
	}

	function onUpdate( _properties )
	{
		local main = getContainer().getActor().getMainhandItem();
		local off = getContainer().getActor().getOffhandItem();

		if (!isValid(main, off))
			return;

		if (isFullEffect(main, off))
			_properties.DamageDirectAdd += 0.25;
		else if (isPartialEffect(main, off))
			_properties.DamageDirectAdd += 0.13;
	}

});

