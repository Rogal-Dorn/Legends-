local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

gt.Const.World.Common.doesTroopAlreadyExist <- function (_troop, _troops)
{
	local troop_existence =
	{
		AlreadyExists = false,
		Index = -1
	}

	for(local i = 0; i < _troops.len(); ++i)
	{
		if(_troop.Type == _troops[i].Type)
		{
			troop_existence.AlreadyExists = true;
			troop_existence.Index = i;

			return troop_existence;
		}
	}
	return troop_existence;
}

gt.Const.World.Common.assignTroops = function( _party, _partyList, _resources, _weightMode = 1 )
{
	//testing new bandit spawns
	if ("IsBandit" in _partyList)
	{
		this.assignTroopsDynamic(_party, _partyList, _resources);
		return;
		
		local party =
		{
			Troops = []
		}

		party.MovementSpeedMult <- _partyList.MovementSpeedMult;
		party.VisibilityMult <- _partyList.VisibilityMult;
		party.VisionMult <- _partyList.VisionMult;
		party.Body <- _partyList.Body;

		local troops = _partyList.Troops;

		local total_weight = 0;
		foreach(t in troops)
		{
			total_weight += t.Weight;
		}

		if(total_weight != 100)
		{
			this.logInfo("Weight is not 100%");
		}
		//currently assumes all weights add to 100

		while(_resources > 0)
		{
			local random = this.Math.rand(1, 100);

			local weight = 0;

			foreach(t in troops)
			{
				weight += t.Weight;

				if (random <= weight)
				{
					local type = this.Math.rand(0,  t.Types.len() - 1);
					local troop = t.Types[type];
					local troop_existence = this.doesTroopAlreadyExist(troop, party.Troops);
					if(troop_existence.AlreadyExists)
					{
						++party.Troops[troop_existence.Index].Num;
						_resources = _resources - troop.Cost;
						break;
					}
					troop.Num <- 1;
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

					if ("NameList" in t.Type)
					{
						unit.Name = this.generateName(t.Type.NameList) + (t.Type.TitleList != null ? " " + t.Type.TitleList[this.Math.rand(0, t.Type.TitleList.len() - 1)] : "");
					}
				}
			}

			_into.push(unit);
		}
	}
}


gt.Const.World.Common.assignTroopsDynamic <- function( _party, _template, _resources, _weightMode = 1 )
{
	// if (_partyList[_partyList.len() - 1].Cost < _resources * 0.7)
	// {
	// 	_resources = _partyList[_partyList.len() - 1].Cost;
	// }

	_party.setMovementSpeed(_template.MovementSpeedMult * this.Const.World.MovementSettings.Speed);
	_party.setVisibilityMult(_template.VisibilityMult);
	_party.setVisionRadius(this.Const.World.Settings.Vision * _template.VisionMult);
	_party.getSprite("body").setBrush(_template.Body);

	local totalWeight = 0;
	foreach (k, v in _template.Troops)
	{
		totalWeight += v.Weight;
	}

	local troop = null;
	local troopMbMap = {};

	while (_resources > 0)
	{
		local r = this.Math.rand(1, totalWeight)
		foreach (k, v in _template.Troops)
		{
			r -= v.Weight;
			if (r > 0)
			{
				continue
			}

			troop = v;
			break;
		}
		//We are assuming the Types list here is in Cost order
		//TODO call a sort on the spawnlist_xxxx file to guarentee this
		local min = troop.Types[0].Cost;
		local max = troop.Types[troop.Types.len() - 1].Cost;
		local mean = (max - min) / 2.0
		local deviation = mean / 3.5
		local meanScaled = 0;
		local points = min;
		if (mean > 0)
		{
			meanScaled = this.Math.min(max, this.Math.pow(resources / 10.0 / mean, 0.5))
			points = this.Const.LegendMod.BoxMuller.BoxMuller(meanScaled, deviation)
		}
		//Always purchase the most expensive unit we can
		for (local i = troop.Types.len() - 1; i >= 0; i = --i)
		{
			if (troop.Types[i].Cost > points)
			{
				continue;
			}

			points -= troop.Types[i].Cost;
			resources -= troop.Types[i].Cost;
			local key = "Enemy" + troop.Types[i].Type.ID;
			if (!(key in troopMbMap))
			{
				troopMbMap[key] <- this.Const.LegendMod.GetFavEnemyBossChance(t.Type.ID);
			}

			local mb = troopMbMap[key];
			this.addTroop(_party, troop.Types[i].Type, false, mb);

			//See if we have enough left to purcahse the next lowest
			if (i - 1 < 0)
			{
				break;
			}

			if (troop.Types[i-1].Cost > points)
			{
				break;
			}

			points -= troop.Types[i-1].Cost;
			resources -= troop.Types[i-1].Cost;
			local key = "Enemy" + troop.Types[i-1].Type.ID;
			if (!(key in troopMbMap))
			{
				troopMbMap[key] <- this.Const.LegendMod.GetFavEnemyBossChance(t.Type.ID);
			}

			local mb = troopMbMap[key];
			this.addTroop(_party, troop.Types[i-1].Type, false, mb);
			break;
		}

	}

	_party.updateStrength();
	return;
}

if (!("LegendMod" in gt.Const))
{
	gt.Const.LegendMod <- {};
}

gt.Const.LegendMod.BoxMuller <- {
	UseLast = false,
	NextValue = 0.0,
	function generate()
	{
		if (this.UseLast)
		{
			this.UseLast = false;
			return this.NextValue;
		}
		local s = 0.0;
		local v1 = 0.0;
		local v2 = 0.0;
		while (s >= 1.0 || s == 0.0)
		{
			v1 = 2.0 * this.Math.rand(0, 1000) / 1000 - 1.0;
			v2 = 2.0 * this.Math.rand(0, 1000) / 1000 - 1.0;
			s = v1 * v1 + v2 * v2;
		}

		s = this.Math.pow(-2.0 * log(s) / s, 0.5);
		this.NextValue = v2 * s
		this.UseLast = true;
		return v1 * s;
	}

	function BoxMuller( _mean, _deviation )
	{
		return _mean + this.generate() * _deviation;
	}

	function Next( _min, _max )
	{
		local deviations = 3.5;
		local r = _max + 1; //so we iterate at least once
		while (r > _max || r < _min)
		{
			r = this.BoxMuller(_min + (_max - _min) / 2.0, (_max - _min) / 2.0 / deviations);
		}
		return r;
	}
}

function testSpawn( _template, resources )
{
	local totalWeight = 0;
	foreach (k, v in _template.Troops)
	{
		totalWeight += v.Weight;
	}

	local troop = null;
	local troopMbMap = {};

	while (resources > 0)
	{
		local r = this.Math.rand(1, totalWeight)
		local cat = ""
		foreach (k, v in _template.Troops)
		{
			r -= v.Weight;
			if (r > 0)
			{
				continue
			}

			troop = v;
			cat = k;
			break;
		}
		//We are assuming the Types list here is in Cost order
		//TODO call a sort on the spawnlist_xxxx file to guarentee this
		local min = troop.Types[0].Cost;
		local max = troop.Types[troop.Types.len() - 1].Cost;
		local mean = (max - min) / 2.0
		local deviation = mean / 3.5
		local meanScaled = 0;
		local points = min;
		if (mean > 0)
		{
			meanScaled = resources / mean
			points = this.Const.LegendMod.BoxMuller.BoxMuller(meanScaled, deviation)
		}
		//Always purchase the most expensive unit we can
		for (local i = troop.Types.len() - 1; i >= 0; i = --i)
		{
			if (troop.Types[i].Cost > points)
			{
				continue;
			}

			points -= troop.Types[i].Cost;
			resources -= troop.Types[i].Cost;
			local key = "" + cat + " " + i
			if (!(key in troopMbMap))
			{
				troopMbMap[key] <- 0;
			}

			troopMbMap[key] += 1;

			//See if we have enough left to purcahse the next lowest
			if (i - 1 < 0)
			{
				break;
			}

			if (troop.Types[i-1].Cost > points)
			{
				break;
			}

			points -= troop.Types[i-1].Cost;
			resources -= troop.Types[i-1].Cost;
			local key = "" + cat + " " + i
			if (!(key in troopMbMap))
			{
				troopMbMap[key] <- 0;
			}

			troopMbMap[key] += 1;
			break;
		}
	}

	return troopMbMap
}
this.logInfo("****** 100 ")
for (local i = 0; i < 10; i = ++i)
{
	this.logInfo(" > " + i)
	local res = testSpawn(gt.Const.World.Spawn.BanditRaiders, 100)
	foreach (k, v in res)
	{
		this.logInfo(k + " : " + v)
	}
}

this.logInfo("****** 500 ")
for (local i = 0; i < 10; i = ++i)
{
	this.logInfo(" > " + i)
	local res = testSpawn(gt.Const.World.Spawn.BanditRaiders, 500)
	foreach (k, v in res)
	{
		this.logInfo(k + " : " + v)
	}
}

this.logInfo("****** 1000 ")
for (local i = 0; i < 10; i = ++i)
{
	this.logInfo(" > " + i)
	local res = testSpawn(gt.Const.World.Spawn.BanditRaiders, 1000)
	foreach (k, v in res)
	{
		this.logInfo(k + " : " + v)
	}
}

this.logInfo("****** 2000 ")
for (local i = 0; i < 10; i = ++i)
{
	this.logInfo(" > " + i)
	local res = testSpawn(gt.Const.World.Spawn.BanditRaiders, 2000)
	foreach (k, v in res)
	{
		this.logInfo(k + " : " + v)
	}
}