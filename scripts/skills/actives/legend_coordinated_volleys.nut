this.legend_coordinated_volleys <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_coordinated_volleys";
		this.m.Name = "Coordinated Volleys";
		this.m.Description = "Time your shots to arrive together, increasing their damage";
		this.m.Icon = "skills/coordinated_volleys_square.png";
		this.m.IconDisabled = "skills/coordinated_volleys_square_bw.png";
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
			}
		];
	}

function isUsable()
	{
		return this.skill.isUsable() && !this.getContainer().hasSkill("effects.legend_coordinating_volleys");
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

			if (a.getFaction() == _user.getFaction() && !a.getSkills().hasSkill("effects.legend_coordinating_volleys"))
			{

			a.getSkills().add(this.new("scripts/skills/effects/legend_coordinating_volleys"));

			}
		}

		this.getContainer().add(this.new("scripts/skills/effects/legend_coordinating_volleys"));
		return true;
	}

});
