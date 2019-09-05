local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

gt.Const.World.Common.assignTroops = function( _party, _partyList, _resources, _weightMode = 1 )
{
	local p;
	//New Legends Dynamic Spawn lists
	if ("IsDynamic" in _partyList)
	{
		p = this.Const.World.Common.buildDynamicTroopList(_partyList, _resources)
	}
	//Vanilla partlyList spawnlists
	else
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
	local p

	if ("IsDynamic" in _partyList)
	{
		p = this.Const.World.Common.buildDynamicTroopList(_partyList, _resources)
	}
	else
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

gt.Const.World.Common.buildDynamicTroopList <- function( _template, _resources)
{
	local totalWeight = 0;
	foreach (k, v in _template.Troops)
	{
		totalWeight += v.Weight;
	}

	local troops = null;
	local troopMap = {};

	local resourceScale = this.Math.pow(_resources / 10.0, 0.5)

	while (_resources > 0)
	{
		local r = this.Math.rand(1, totalWeight)
		local cat
		foreach (k, v in _template.Troops)
		{

			r = r - v.Weight;
			if (r > 0)
			{
				continue
			}

			troops = v.Types;
			cat = k
			break;
		}
		//We are assuming the Types list here is in Cost order
		//TODO call a sort on the spawnlist_xxxx file to guarentee this
		local min = troops[0].Cost;
		local max = troops.len() > 1 ? troops[1].Cost : troops[0].Cost;
		local meanMax = troops[troops.len() - 1].Cost
		local mean = (max + min) / 2.0
		local deviation = (meanMax - min) / 2.0 / 2.0
		local meanScaled = 0;
		local points = min;
		if (mean > 0)
		{
			meanScaled = mean + this.Math.min(max, resourceScale)
			points = this.Math.max(min, this.Const.LegendMod.BoxMuller.BoxMuller(meanScaled, deviation))
			//this.logInfo(cat + " Mean " + mean + " : Scaled " + meanScaled + " : Deviation " + deviation + " : Points " + points)
		}
		//Always purchase the most expensive unit we can
		for (local i = troops.len() - 1; i >= 0; i = --i)
		{
			if (troops[i].Cost > points)
			{
				continue;
			}

			points -= troops[i].Cost;
			_resources -= troops[i].Cost;

			local key = troops[i].Type.Script;
			if (!(key in troopMap))
			{
				troopMap[key] <- {
					Type = troops[i].Type,
					Num = 0
				}
			}
			troopMap[key].Num += 1

			//See if we have enough left to purcahse the next lowest
			if (i - 1 < 0)
			{
				break;
			}

			if (troops[i-1].Cost > points)
			{
				break;
			}

			points -= troops[i-1].Cost;
			_resources -= troops[i-1].Cost;
			key = troops[i].Type.Script;
			if (!(key in troopMap))
			{
				troopMap[key] <- {
					Type = troops[i].Type,
					Num = 0
				}
			}
			troopMap[key].Num += 1
			break;
		}
	}

	local T = []
	foreach ( k, v in troopMap)
	{
		T.push(v)
	}

	return {
		MovementSpeedMult = _template.MovementSpeedMult,
		VisibilityMult = _template.VisibilityMult,
		VisionMult = _template.VisionMult,
		Body = _template.Body,
		Troops = T
	}
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

this.logInfo("****** 100 ")
for (local i = 0; i < 10; i = ++i)
{
	this.logInfo(" > " + i)
	local res = gt.Const.World.Common.buildDynamicTroopList(gt.Const.World.Spawn.BanditRaiders, 100)
	foreach (t in res.Troops)
	{
		this.logInfo(t.Type.Script + " : " + t.Num)
	}
}

this.logInfo("****** 500 ")
for (local i = 0; i < 10; i = ++i)
{
	this.logInfo(" > " + i)
	local res = gt.Const.World.Common.buildDynamicTroopList(gt.Const.World.Spawn.BanditRaiders, 500)
	foreach (t in res.Troops)
	{
		this.logInfo(t.Type.Script + " : " + t.Num)
	}
}

this.logInfo("****** 1000 ")
for (local i = 0; i < 10; i = ++i)
{
	this.logInfo(" > " + i)
	local res = gt.Const.World.Common.buildDynamicTroopList(gt.Const.World.Spawn.BanditRaiders, 1000)
	foreach (t in res.Troops)
	{
		this.logInfo(t.Type.Script + " : " + t.Num)
	}
}

this.logInfo("****** 2000 ")
for (local i = 0; i < 10; i = ++i)
{
	this.logInfo(" > " + i)
	local res = gt.Const.World.Common.buildDynamicTroopList(gt.Const.World.Spawn.BanditRaiders, 2000)
	foreach (t in res.Troops)
	{
		this.logInfo(t.Type.Script + " : " + t.Num)
	}
}