this.legend_push_forward <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_push_forward";
		this.m.Name = "Push Forward";
		this.m.Description = "Advance as one, increasing your melee effectiveness";
		this.m.Icon = "skills/spears_square.png";
		this.m.IconDisabled = "skills/spears_square_bw.png";
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
				text =  "[color=" + this.Const.UI.Color.PositiveValue + "]10[/color] melee attack to all allies within [color=" + this.Const.UI.Color.PositiveValue + "]4[/color] tiles for one turn"
			},			
		];
	}

function isUsable()
	{
		return this.skill.isUsable() && !this.getContainer().hasSkill("effects.legend_pushing_forward");
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

			if (a.getFaction() == _user.getFaction() && !a.getSkills().hasSkill("effects.legend_pushing_forward"))
			{

			a.getSkills().add(this.new("scripts/skills/effects/legend_pushing_forward"));

			}
		}

		this.getContainer().add(this.new("scripts/skills/effects/legend_pushing_forward"));
		return true;
	}

});
