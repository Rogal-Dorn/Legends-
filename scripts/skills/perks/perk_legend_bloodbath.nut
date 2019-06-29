this.perk_legend_bloodbath <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_bloodbath";
		this.m.Name = this.Const.Strings.PerkName.LegendBloodbath;
		this.m.Description = this.Const.Strings.PerkDescription.LegendBloodbath;
		this.m.Icon = "ui/perks/bloodbath_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		local bleeders = this.getBleeders();
		return bleeders < 1;
	}

	function getTooltip()
	{
		local bleeders = this.getBleeders();
		local bonus = bleeders * 5;
		local tooltip = this.skill.getTooltip();

		if (bleeders >= 1)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "There are currently [color=" + this.Const.UI.Color.PositiveValue + "]" + bleeders + "[/color] characters bleeding, giving a bonus of [color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "%[/color] to resolve and fatigue"
			});
		}

		return tooltip;
	}



	function getBleeders()
	{
		local bleeders = 0;
		local actors = this.Tactical.Entities.getAllInstances();

		foreach( i in actors )
		{
			foreach( a in i )
			{
				if (a.getSkills().hasSkill("effects.bleeding"))
				{
					bleeders += 1;

				}

			}
		}
		return bleeders;
	}

	function onUpdate( _properties )
	{

		local bleeders = this.getBleeders();
		local percent = bleeders / 20;
		local bonus = 1 + percent;
		_properties.BraveryMult *= bonus;
		_properties.StaminaMult *= bonus;
	}

});

