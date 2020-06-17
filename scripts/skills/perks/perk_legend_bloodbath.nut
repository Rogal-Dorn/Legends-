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
		local bonus = bleeders * 100;
		local tooltip = this.skill.getTooltip();
		// Just some different wordings depending on the amount of characters bleeding
		if (bleeders > 0.8)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "There are a lot of characters bleeding, giving a bonus of [color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "%[/color] to resolve and fatigue"
			});
		} else if (bleeders > 0.5)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "There are some characters bleeding, giving a bonus of [color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "%[/color] to resolve and fatigue"
			});
		} else if (bleeders > 0.3)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "There are a few characters bleeding, giving a bonus of [color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "%[/color] to resolve and fatigue"
			});
		}
		return tooltip;
	}

	function getBleeders()
	{
		if (!("Entities" in this.Tactical))
		{
			return 0;
		}
		if (this.Tactical.Entities == null)
		{
			return 0;
		}
		
		if (!this.Tactical.isActive())
		{
			return 0;
		}
		local count = 0;
		local bleeders = 0;
	
		local actors = this.Tactical.Entities.getAllInstancesAsArray();

		foreach( a in actors )
		{
			if (a.getSkills().hasSkill("effects.bleeding") || a.getSkills().hasSkill("effects.legend_grazed_effect") )
			{
				bleeders += 1;

			}
			count += 1;
		}
		// Just so we don't get division by 0
		local ratio = bleeders / this.Math.maxf(count, 1);
		return ratio;
	}

	function onUpdate( _properties )
	{
		local bonus = this.getBleeders();
		_properties.BraveryMult += bonus;
		_properties.StaminaMult += bonus;
	}

});

