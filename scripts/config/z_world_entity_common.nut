local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

gt.Const.World.Common.assignTroops = function( _party, _partyList, _resources, _weightMode = 1 )
{
	this.logInfo("freykin test");
	
	//testing new bandit spawns
	
	if (_partyList.IsBandit == true)
	{
		this.logInfo("bandit spawn worked");
		
		local party =
		{
			Troops = []
		}
		
		party.MovementSpeedMult = _partyList.MovementSpeedMult;
		party.VisibilityMult = _partyList.VisibilityMult;
		party.VisionMult = _partyList.VisionMult;
		party.Body = _partyList.Body;
		this.logInfo("freykin assign party test");
		this.logInfo(party.Body);
		
		local troops = _partylist.Troops;
		
		local melee_weight = troops.Melee.Weight;
		local cavalry_weight = troops.Cavalry.Weight;
		local ranged_weight troops.Ranged.Weight;
		local leader_weight = troops.Leader.Weight;

		total_weight = melee_weight + cavalry_weight + ranged_weight + leader_weight;

		if(total_weight != 1)
			this.logInfo("Weight is not 100%");
		
		this.logInfo("resources test" + _resources);
		
		while(_resources > 0)
		{
			local random = this.Math.rand(1, 100);
			
			local weight = 0;
			
			foreach(type in troops)
			{
				weight += type.Weight * 100;
				
				if (random <= weight)
				{
					local t = this.Math.rand(1, type.len() - 1);
					local troop = type[t];
					
					if(this.doesTroopAlreadyExist(troop, party.Troops)
					{
						local index = this.getTroopIndex(troop, party.Troops);
						++party.Troops[index].Num;
						_resources = _resources - troop.Cost;
						break;
					}
					troop.Num = 1;
					party.Troops.push(troop);
					_resources = _resources - troop.Cost;
				}
			}
		}
		_party.setMovementSpeed(party.MovementSpeedMult * this.Const.World.MovementSettings.Speed);
		_party.setVisibilityMult(party.VisibilityMult);
		_party.setVisionRadius(this.Const.World.Settings.Vision * party.VisionMult);
		_party.getSprite("body").setBrush(party.Body);
		
		local troopMbMap = {};
		foreach( t in party.Troops )
		{
			local key = "Enemy" + t.Type.ID; 
			if (!(key in troopMbMap))
			{
				troopMbMap[key] <- this.Const.LegendMod.GetFavEnemyBossChance(t.Type.ID);
			}
		
			local mb = troopMbMap[key];

			for( local i = 0; i != t.Num; i = ++i )
			{
				this.addTroop(_party, t, false, mb);
			}
		}
	
		_party.updateStrength();
		this.logInfo("made it to end of bandit spawn test");
		return party;
	}
	
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


	local troopMbMap = {};
	foreach( t in p.Troops )
	{
		local key = "Enemy" + t.Type.ID; 
		if (!(key in troopMbMap))
		{
			troopMbMap[key] <- this.Const.LegendMod.GetFavEnemyBossChance(t.Type.ID);
		}
		
		local mb = troopMbMap[key];

		for( local i = 0; i != t.Num; i = ++i )
		{
			this.addTroop(_party, t, false, mb);
		}
	}

	_party.updateStrength();
	return p;
}

gt.Const.World.Common.addUnitsToCombat = function( _into, _partyList, _resources, _faction, _minibossify = 0 )
{
	local total_weight = 0;
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

		potential.push(party);
		total_weight = total_weight + party.Cost;
	}

	local p;

	if (potential.len() == 0)
	{
		local best;
		local bestCost = 9000;

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
	else
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

	local troopMbMap = {};
	foreach( t in p.Troops )
	{
		local key = "Enemy" + t.Type.ID; 
		if (!(key in troopMbMap))
		{
			troopMbMap[key] <- this.Const.LegendMod.GetFavEnemyBossChance(t.Type.ID);
		}
		local mb = troopMbMap[key];
		mb += _minibossify;

		for( local i = 0; i != t.Num; i = ++i )
		{
			local unit = clone t.Type;
			unit.Faction <- _faction;
			unit.Name <- "";

			if (unit.Variant > 0)
			{
				if (!this.Const.DLC.Wildmen || this.Math.rand(1, 100) > unit.Variant + mb + (this.World.getTime().Days > 100 ? 0 : -1))
				{
					unit.Variant = 0;
				}
				else
				{
					unit.Strength = this.Math.round(unit.Strength * 1.35);
					unit.Variant = this.Math.rand(1, 255);

					if ("NameList" in unit.Type)
					{
						unit.Name = this.generateName(unit.Type.NameList) + (unit.Type.TitleList != null ? " " + unit.Type.TitleList[this.Math.rand(0, unit.Type.TitleList.len() - 1)] : "");
					}
				}
			}

			_into.push(unit);
		}
	}
}

function getTroopIndex(_troop, _troops)
{
	for(i = 0; i < _troops.len(); ++i)
	{
		if(_troop == _troops[i])
			return i;
		else
			return null;
	}
}

function doesTroopAlreadyExist(_troop, _troops)
{
	foreach(t in _troops)
	{
		if(_troop.Type == t.Type)
		return true;
	}
	return false;
}