local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

gt.Const.World.Common <- {
	WeightMode = {
		Random = 0,
		Weighted = 1,
		Strongest = 2,
		Weakest = 3
	},
	function addTroop( _party, _troop, _updateStrength = true )
	{
		local troop = clone _troop.Type;
		troop.Party <- this.WeakTableRef(_party);
		troop.Faction <- _party.getFaction();
		_party.getTroops().push(troop);

		if (_updateStrength)
		{
			_party.updateStrength();
		}
	}

	function despawnParty( _party, _location )
	{
		_party.fadeOutAndDie();
	}

	function assignTroops( _party, _partyList, _resources, _weightMode = 1 )
	{
		if (_partyList[_partyList.len() - 1].Cost < _resources * 0.7)
		{
			_resources = _partyList[_partyList.len() - 1].Cost;
		}

		local total_weight = 0;
		local best;
		local bestCost = _weightMode == this.WeightMode.Strongest ? -9000.0 : 9000;
		local potential = [];

		foreach( party in _partyList )
		{
			if (party.Cost < _resources * 0.7)
			{
				continue;
			}

			if (party.Cost > _resources)
			{
				break;
			}

			if (_weightMode == this.WeightMode.Weighted || _weightMode == this.WeightMode.Random)
			{
				potential.push(party);
				total_weight = total_weight + party.Cost;
			}
			else if (_weightMode == this.WeightMode.Strongest)
			{
				if (party.Cost > bestCost)
				{
					best = party;
					bestCost = party.Cost;
				}
			}
			else if (_weightMode == this.WeightMode.Weakest)
			{
				if (party.Cost < bestCost)
				{
					best = party;
					bestCost = party.Cost;
				}
			}
		}

		local p;

		if (potential.len() == 0 && best == null)
		{
			bestCost = 9000;

			foreach( party in _partyList )
			{
				if (this.Math.abs(_resources - party.Cost) <= bestCost)
				{
					best = party;
					bestCost = this.Math.abs(_resources - party.Cost);
				}
			}

			p = best;
		}
		else if (_weightMode == this.WeightMode.Random)
		{
			p = potential[this.Math.rand(0, potential.len() - 1)];
		}
		else if (_weightMode == this.WeightMode.Strongest || _weightMode == this.WeightMode.Weakest)
		{
			p = best;
		}
		else if (_weightMode == this.WeightMode.Weighted)
		{
			local pick = this.Math.rand(1, total_weight);

			foreach( party in potential )
			{
				if (pick <= party.Cost)
				{
					p = party;
					break;
				}

				pick = pick - party.Cost;
			}
		}

		_party.setMovementSpeed(p.MovementSpeedMult * this.Const.World.MovementSettings.Speed);
		_party.setVisibilityMult(p.VisibilityMult);
		_party.setVisionRadius(this.Const.World.Settings.Vision * p.VisionMult);
		_party.getSprite("body").setBrush(p.Body);

		foreach( t in p.Troops )
		{
			for( local i = 0; i != t.Num; i = ++i )
			{
				this.addTroop(_party, t, false);
			}
		}

		_party.updateStrength();
		return p;
	}

	function getRect( _x, _y, _width, _height )
	{
		local mapSize = this.World.getMapSize();
		return {
			X = mapSize.X * _x,
			Y = mapSize.Y * _y,
			W = mapSize.X * (_width - _x),
			H = mapSize.Y * (_height - _y)
		};
	}

	function getTileToSpawnLocation( _rect, _minDistToLocations = 8 )
	{
		local mapSize = this.World.getMapSize();
		local tries = 0;
		tries = ++tries;

		while (tries < 20)
		{
			local x = this.Math.rand(this.Math.max(4, _rect.X), this.Math.min(_rect.X + _rect.W, mapSize.X - 4));
			local y = this.Math.rand(this.Math.max(4, _rect.Y), this.Math.min(_rect.Y + _rect.H, mapSize.Y - 4));
			local tile = this.World.getTileSquare(x, y);

			if (tile.IsOccupied || tile.HasRoad || tile.HasRiver)
			{
				continue;
			}

			if (tile.Type == this.Const.World.TerrainType.Mountains)
			{
				continue;
			}

			if (this.World.State.getPlayer().getTile().getDistanceTo(tile) < 6)
			{
				continue;
			}

			local abort = false;

			for( local i = 0; i != 6; i = ++i )
			{
				if (!tile.hasNextTile(i))
				{
				}
				else
				{
					local next = tile.getNextTile(i);

					if (next.HasRoad)
					{
						abort = true;
						break;
					}
				}
			}

			if (abort)
			{
				continue;
			}

			for( local i = this.Const.Faction.Neutral + 1; i < this.Const.Faction.COUNT; i = ++i )
			{
				local locations = this.World.EntityManager.getLocations(i);

				foreach( v in locations )
				{
					if (tile.getDistanceTo(v.getTile()) < _minDistToLocations)
					{
						abort = true;
						break;
					}
				}

				if (abort)
				{
					break;
				}
			}

			if (abort)
			{
				continue;
			}

			for( local i = x - 4; i < x + 4; i = ++i )
			{
				for( local j = y - 4; j < y + 4; j = ++j )
				{
					if (!this.World.isValidTileSquare(i, j))
					{
					}
					else if (this.World.getTileSquare(i, j).HasRoad)
					{
						abort = true;
						break;
					}
				}
			}

			if (abort)
			{
				continue;
			}

			return tile;
		}

		return null;
	}

};
