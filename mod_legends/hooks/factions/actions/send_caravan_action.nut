::mods_hookExactClass("factions/actions/send_caravan_action", function(o) 
{
	o.setFaction <- function ( _f )
	{
		this.faction_action.setFaction(_f);

		if (_f.getType() == this.Const.FactionType.NobleHouse)
			this.m.Cooldown = this.World.getTime().SecondsPerDay * 2;
	}

	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Cooldown = 100.0;
	}

	o.onUpdate = function ( _faction )
	{
		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		if (_faction.isEnemyNearby())
		{
			return;
		}

		if (_faction.getUnits().len() >= 1)
		{
			return;
		}

		local mySettlements = _faction.getSettlements();
		local allSettlements = this.World.EntityManager.getSettlements();
		local destinations;

		if (!this.World.FactionManager.isGreaterEvil())
		{
			destinations = allSettlements;
		}
		else
		{
			destinations = [];

			foreach( s in allSettlements )
			{
				if (s.getOwner() == null || s.getOwner().isAlliedWith(_faction.getID()))
				{
					destinations.push(s);
				}
			}
		}

		local settlements = this.getRandomConnectedSettlements(2, mySettlements, destinations, true);

		if (settlements.len() < 2)
		{
			return;
		}

		this.m.Start = settlements[0];
		this.m.Dest = settlements[1];
		this.m.Score = 5;
	}

	o.isAbleToSpawnCaravan <- function ( _faction, _maxNum = 0 )
	{
		local caravan = 0;

		foreach( party in _faction.getUnits() )
		{
			if (party.getFlags().get("IsCaravan"))
				++caravan;
		}

		return caravan < _maxNum;
	}

	o.getFactionSettlememts <- function ( _faction, _onlyMilitary = false )
	{
		if (!_onlyMilitary)
			return _faction.getSettlements();

		local ret = [];

		foreach( s in _faction.getSettlements() )
		{
			if (!s.isMilitary())
				continue;

			ret.push(s);
		}

		if (ret.len() == 0)
			return _faction.getSettlements();

		return ret;
	}

	o.getReputationToDifficultyLightMult <- function ()
	{
		return this.faction_action.getReputationToDifficultyLightMult() * (this.World.FactionManager.isCivilWar() ? 1.1 : 1.0);
	}

	o.getCaravansRaidedToAdditionalResources <- function ( _faction) 
	{
		return _faction.getFlags().getAsInt("FactionsCaravansRaided") * 3; 	// 1 hand = ~15 troop power, so every 5 caravans raided is 
	}																		// another hand's worth of party power before multiplier

	o.getResourcesForParty <- function ( _settlement, _faction )
	{
		if (_settlement == null) return this.Math.rand(100, 200) * this.getReputationToDifficultyLightMult();

		if (_faction.hasTrait(this.Const.FactionTrait.OrientalCityState)) return (this.Math.rand(85, 130) + this.Math.round(0.12 * ::Math.max(1, _settlement.getResources()))) * this.getReputationToDifficultyLightMult(); // this.m.Start.getResources() * 0.6

		local extraFromFCR = this.getCaravansRaidedToAdditionalResources(_faction)
		return (this.Math.rand(45, 95) + this.Math.round(0.1 * ::Math.max(1, _settlement.getResources())) + extraFromFCR) * this.getReputationToDifficultyLightMult(); // this.m.Start.getResources() * 0.5
	}

	o.convertBudgetToMult <- function ( _budget )
	{
		if (_budget == 0)
			return 1.0;

		return 1.0 + this.Math.floor(_budget / 900) * 0.125;
	}

	o.onExecute = function ( _faction )
	{
		local party;

		if (_faction.hasTrait(this.Const.FactionTrait.OrientalCityState))
		{
			party = _faction.spawnEntity(this.m.Start.getTile(), "Trading Caravan", false, this.Const.World.Spawn.CaravanSouthern, this.m.Start.getResources() * 0.6);
		}
		else
		{
			party = _faction.spawnEntity(this.m.Start.getTile(), "Trading Caravan", false, this.Const.World.Spawn.Caravan, this.m.Start.getResources() * 0.5);
		}

		party.getSprite("banner").Visible = false;
		party.getSprite("base").Visible = false;
		party.setMirrored(true);
		party.setDescription("A trading caravan from " + this.m.Start.getName() + " that is transporting all manner of goods between settlements.");
		party.setFootprintType(this.Const.World.FootprintsType.Caravan);
		party.getFlags().set("IsCaravan", true);
		party.getFlags().set("IsRandomlySpawned", true);

		if (this.World.Assets.m.IsBrigand && this.m.Start.getTile().getDistanceTo(this.World.State.getPlayer().getTile()) <= 70)
		{
			party.setVisibleInFogOfWar(true);
			party.setImportant(true);
			party.setDiscovered(true);
		}

		if (this.m.Start.getProduce().len() != 0)
		{
			local e = 3;

			for( local j = 0; j != e; j = ++j )
			{
				party.addToInventory(this.m.Start.getProduce()[this.Math.rand(0, this.m.Start.getProduce().len() - 1)]);
			}
		}

		party.getLoot().Money = this.Math.rand(0, 100);

		if (this.Math.rand(1, 100) <= 50)
		{
			party.getLoot().ArmorParts = this.Math.rand(0, 10);
		}

		if (this.Math.rand(1, 100) <= 50)
		{
			party.getLoot().Medicine = this.Math.rand(0, 10);
		}

		if (this.Math.rand(1, 100) <= 50)
		{
			party.getLoot().Ammo = this.Math.rand(0, 25);
		}

		local r = this.Math.rand(1, 4);

		if (r == 1)
		{
			party.addToInventory("supplies/bread_item");
		}
		else if (r == 2)
		{
			party.addToInventory("supplies/roots_and_berries_item");
		}
		else if (r == 3)
		{
			party.addToInventory("supplies/dried_fruits_item");
		}
		else if (r == 4)
		{
			party.addToInventory("supplies/ground_grains_item");
		}

		local c = party.getController();
		c.getBehavior(this.Const.World.AI.Behavior.ID.Attack).setEnabled(false);
		c.getBehavior(this.Const.World.AI.Behavior.ID.Flee).setEnabled(false);
		local move = this.new("scripts/ai/world/orders/move_order");
		move.setDestination(this.m.Dest.getTile());
		move.setRoadsOnly(true);
		local unload = this.new("scripts/ai/world/orders/unload_order");
		local despawn = this.new("scripts/ai/world/orders/despawn_order");
		c.addOrder(move);
		c.addOrder(unload);
		c.addOrder(despawn);
	}
});