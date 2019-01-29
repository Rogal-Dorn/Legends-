this.stabbed_guts_injury <- this.inherit("scripts/skills/injury/injury", {
	m = {},
	function create()
	{
		this.injury.create();
		this.m.ID = "injury.stabbed_guts";
		this.m.Name = "Stabbed Guts";
		this.m.Description = "A wound at the intestines drains constitution, and the high chance of infection and the prospect of a slow and painful death doesn\'t help either.";
		this.m.Type = this.m.Type | this.Const.SkillType.TemporaryInjury;
		this.m.DropIcon = "injury_icon_39";
		this.m.Icon = "ui/injury/injury_icon_39.png";
		this.m.IconMini = "injury_icon_39_mini";
		this.m.InfectionChance = 4.0;
		this.m.HealingTimeMin = 3;
		this.m.HealingTimeMax = 5;
		this.m.IsShownOnBody = true;
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/health.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-40%[/color] Hitpoints"
			}
		];
		this.addTooltipHint(ret);
		return ret;
	}

	function onUpdate( _properties )
	{
		this.injury.onUpdate(_properties);

		if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
		{
			return;
		}

		if (this.m.IsShownOutOfCombat)
		{
			_properties.HitpointsMult *= 0.600000024;
		}
	}

});
