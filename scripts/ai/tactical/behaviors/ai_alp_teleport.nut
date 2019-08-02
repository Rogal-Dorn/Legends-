this.ai_alp_teleport <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		SelectedSkill = null,
		PossibleSkills = [
			"actives.alp_teleport"
		]
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.AlpTeleport;
		this.m.Order = this.Const.AI.Behavior.Order.AlpTeleport;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		local score = this.getProperties().BehaviorMult[this.m.ID];
		this.m.TargetTile = null;
		this.m.SelectedSkill = null;

		if (_entity.getCurrentProperties().IsRooted)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getCurrentProperties().IsStunned)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.getAgent().getBehavior(this.Const.AI.Behavior.ID.Retreat) != null && this.getAgent().getBehavior(this.Const.AI.Behavior.ID.Retreat).getScore() > 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local skills = [];

		foreach( skillID in this.m.PossibleSkills )
		{
			local skill = _entity.getSkills().getSkillByID(skillID);

			if (skill != null && skill.isUsable() && skill.isAffordable())
			{
				this.m.SelectedSkill = skill;
				break;
			}
		}

		if (this.m.SelectedSkill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local myTile = _entity.getTile();
		local inZonesOfControl = myTile.getZoneOfControlCountOtherThan(_entity.getAlliedFactions());
		local targets = this.getAgent().getKnownOpponents();
		local potentialDestinations = [];

		foreach( t in targets )
		{
			if (t.Actor.isNull())
			{
				continue;
			}

			local targetValue = this.queryTargetValue(_entity, t.Actor);

			if (t.Actor.getCurrentProperties().IsStunned && t.Actor.getSkills().hasSkill("effects.sleeping"))
			{
				targetValue = targetValue * 1.33;
			}

			local potentialTiles = this.queryDestinationsInMeleeRange(t.Actor.getTile(), this.getProperties().EngageRangeMin, this.getProperties().EngageRangeMax);

			foreach( tile in potentialTiles )
			{
				if (!tile.IsEmpty || tile.Type == this.Const.Tactical.TerrainType.Impassable)
				{
					continue;
				}

				local score = 16;
				score = score - tile.getZoneOfControlCountOtherThan(_entity.getAlliedFactions()) * 6.0;
				score = score + tile.TVTotal;

				foreach( o in targets )
				{
					if (o.Actor.isNull() || o.Actor.getID() == t.Actor.getID())
					{
						continue;
					}

					if (o.Actor.getMoraleState() == this.Const.MoraleState.Fleeing)
					{
						continue;
					}

					local d = o.Actor.getTile().getDistanceTo(tile);

					if (d <= 3)
					{
						score = score - 2.0;
					}
				}

				for( local i = 0; i < 6; i = ++i )
				{
					if (!tile.hasNextTile(i))
					{
					}
					else
					{
						local nextTile = tile.getNextTile(i);

						if (nextTile.IsOccupiedByActor && nextTile.getEntity().getType() == this.Const.EntityType.Alp)
						{
							score = score - 6.0;
						}
					}
				}

				if (score >= 0)
				{
					score = score * targetValue;
				}
				else
				{
					score = score / targetValue;
				}

				if (score > 0)
				{
					potentialDestinations.push({
						Tile = tile,
						Score = score
					});
				}
			}
		}

		if (potentialDestinations.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		potentialDestinations.sort(this.onSortByScore);
		this.m.TargetTile = potentialDestinations[0].Tile;
		return this.Const.AI.Behavior.Score.AlpTeleport * score;
	}

	function onExecute( _entity )
	{
		if (this.m.TargetTile != null)
		{
			this.m.SelectedSkill.use(this.m.TargetTile);
			this.m.TargetTile = null;
		}

		return false;
	}

	function onSortByScore( _a, _b )
	{
		if (_a.Score > _b.Score)
		{
			return -1;
		}
		else if (_a.Score < _b.Score)
		{
			return 1;
		}

		return 0;
	}

});

