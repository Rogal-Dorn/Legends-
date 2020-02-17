this.legend_prayer_of_life_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_prayer_of_life";
		this.m.Name = "Prayer of Life";
		this.m.Description = "Push allies on with your chant of holy scripture, restoring the health of all allies within 1 tile by 10% of their resolve. ";
		this.m.Icon = "skills/prayer_green_square.png";
		this.m.IconDisabled = "skills/prayer_green_square_bw.png";
		this.m.Overlay = "prayer_green";
		this.m.SoundOnUse = [
			"sounds/ambience/buildings/temple_prayer_00.wav",
			"sounds/ambience/buildings/temple_prayer_01.wav",
			"sounds/ambience/buildings/temple_prayer_02.wav",
		];
		this.m.SoundVolume = 1.5;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = true;
		this.m.IsAttack = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local value = this.Math.round(this.Math.minf(0.5, this.getContainer().getActor().getCurrentProperties().Bravery * 0.005) * 100);
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
				id = 3,
				type = "text",
				text = this.getCostString()
			}
		];

		return ret;
	}
	
	function isUsable()
	{
		return this.skill.isUsable();
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

			if (myTile.getDistanceTo(a.getTile()) > 1)
			{
				continue;
			}

			if (a.getFaction() == _user.getFaction())
			{
				
				if (a.getBackground().getID() != "background.cultist" && a.getBackground().getID() != "background.converted_cultist")
				{
				a.getSkills().add(this.new("scripts/skills/effects/legend_prayer_of_life_effect"));
				}
			}

			if (a.getFaction() == this.Const.Faction.Undead ||  a.getFaction() == this.Const.Faction.Zombies)
			{
				a.getSkills().add(this.new("scripts/skills/effects/disintegrating_effect"));
			}
		}

		this.getContainer().add(this.new("scripts/skills/effects/legend_prayer_of_life_effect"));
		return true;
	}

});

