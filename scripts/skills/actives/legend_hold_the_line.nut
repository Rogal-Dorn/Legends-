this.legend_hold_the_line <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_hold_the_line";
		this.m.Name = "Hold the line";
		this.m.Description = "Instruct your mercenaries to push their advantages, raising melee defence by 10 within 4 tiles";
		this.m.Icon = "skills/holdtheline_square.png";
		this.m.IconDisabled = "skills/holdtheline_square_bw.png";
		this.m.Overlay = "active_22";
		this.m.SoundOnUse = [
		
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 20;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local p = this.getContainer().getActor().getCurrentProperties();
		return [
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
				id = 3,
				type = "text",
				text = this.getCostString()
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text =  "[color=" + this.Const.UI.Color.PositiveValue + "]10[/color] melee defense to all allies within [color=" + this.Const.UI.Color.PositiveValue + "]4[/color] tiles for one turn"
			}
		];
	}

function isUsable()
	{
		return this.skill.isUsable() && !this.getContainer().hasSkill("effects.legend_holding_the_line");
	}

	function onUse( _user, _targetTile )
	{
		local myTile = _user.getTile();
		local actors = this.Tactical.Entities.getInstancesOfFaction(_user.getFaction());

		foreach( a in actors )
		{
			if (a.getID() == _user.getID())
			{
				continue;
			}

			if (myTile.getDistanceTo(a.getTile()) > 4)
			{
				continue;
			}

			if (a.getFaction() == _user.getFaction() && !a.getSkills().hasSkill("effects.holding_the_line"))
			{

			a.getSkills().add(this.new("scripts/skills/effects/legend_holding_the_line"));

			}
		}

		this.getContainer().add(this.new("scripts/skills/effects/legend_holding_the_line"));
		return true;
	}

});
