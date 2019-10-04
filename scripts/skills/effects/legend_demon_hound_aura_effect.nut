this.legend_demon_hound_aura_effect <- this.inherit("scripts/skills/skill", {
	m = {
	Penalty = 0
	},
	function create()
	{
		this.m.ID = "effects.legend_demon_hound_aura";
		this.m.Name = "Sluggish";
		this.m.Description = "The Höllenhund's presence has sapped the strength from your limbs, slowing you down.";
		this.m.Icon = "ui/orientation/hollenhound_orientation.png";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
	}

	function getTooltip()
	{
		local penalty = this.m.Penalty;
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
				id = 10,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + penalty + "[/color] Initative"
			}
		];
	}

	function getPenalty( _properties )
	{
		local actor = this.getContainer().getActor();

		if (!actor.isPlacedOnMap() || ("State" in this.Tactical) && this.Tactical.State.isBattleEnded())
		{
			return 0;
		}

		local myTile = actor.getTile();
		local targets = this.Tactical.Entities.getAllInstances();

		foreach(tar in targets)
		{
			foreach(t in tar)
			{
				local penalty = 0;
				if (t.getID() == actor.getID() || !t.isPlacedOnMap())
				{
					continue;
				}
	
				if (t.getTile().getDistanceTo(myTile) > 2)
				{
					continue;
				}
	
				if (t.getType() == this.Const.EntityType.LegendDemonHound)
				{
					if(t.getTile().getDistanceTo(myTile) == 2)
					{
						penalty = actor.getInitiative() * 0.25;
					}
					else if(t.getTile().getDistanceTo(myTile) == 1)
					{
						penalty = actor.getInitiative() * 0.5;
					}
				}
				return penalty;
			}
		}
	}

	function onUpdate( _properties )
	{
		this.m.IsHidden = true;
	}

	function onAfterUpdate( _properties )
	{
		local penalty = this.getPenalty(_properties);

		if (penalty != 0)
		{
			this.m.IsHidden = false;
			_properties.Initiative -= penalty;
			this.m.Penalty = penalty;
		}
		else
		{
			this.m.IsHidden = true;
			this.m.Penalty = 0;
		}
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.IsHidden = true;
		this.m.Penalty = 0;
	}

});

