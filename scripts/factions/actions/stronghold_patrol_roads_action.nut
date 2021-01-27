this.stronghold_patrol_roads_action <- this.inherit("scripts/factions/faction_action", {
	//Governs the spawning of stronghold patrols.
	m = {},
	function create()
	{
		this.m.ID = "stronghold_patrol_roads_action";
		//spawn them every 4 days
		this.m.Cooldown = this.World.getTime().SecondsPerDay * 4;
		this.m.IsSettlementsRequired = true;
		this.m.Settlements <- null;
		this.faction_action.create();
	}

	function onUpdate( _faction )
	{
		//only works with level 2+ base
		local player_base = this.getPlayerBase()
		if (!player_base || player_base.getSize() == 1 || player_base.isIsolated())
		{
			return
		}
		local connected_settlements = [];
		local friendly_factions = []
		if (player_base)
		{
			foreach (faction in this.World.FactionManager.getFactions())
			{
				if (faction != null && faction.m.PlayerRelation > 70 && (faction.m.Type == this.Const.FactionType.NobleHouse || faction.m.Type == this.Const.FactionType.OrientalCityState))
				{
					foreach (settlement in faction.getSettlements())
					{
						if ( settlement.isConnectedToByRoads(player_base))
						{
							connected_settlements.push(settlement)
							if (!friendly_factions.find(faction)){
								friendly_factions.push(faction)}
						}
					}
				}
			}
			if (connected_settlements.len() < 1) {return}
		}
		this.m.Settlements <- connected_settlements;
		this.m.Cooldown = (this.World.getTime().SecondsPerDay * 7) / (friendly_factions.len()+1);
		this.m.Score = 10;
	}

	function onClear()
	{
	}

	function onExecute( _faction )
	{
		local player_base = this.getPlayerBase()
		local patrol_strength = 200 * (player_base.getSize()-1)
		
		//add strength if you have the attachment
		if (player_base.hasAttachedLocation("attached_location.militia_trainingcamp")){
			patrol_strength += 200
		}
		local party = _faction.stronghold_spawnEntity(player_base.getTile(), "Mercenary patrol of " + player_base.getName(), true, this.Const.World.Spawn.Mercenaries, patrol_strength);
		party.m.OnCombatWithPlayerCallback = null;
		party.getSprite("body").setBrush(player_base.m.troopSprites);
		party.setDescription("A band of mercenaries patrolling the roads.");
		party.setFootprintType(this.Const.World.FootprintsType.Mercenaries);
		party.getFlags().set("IsRandomlySpawned", true);
		local c = party.getController();
		local index = 0;
		local target_settlements = [];
		while (this.m.Settlements.len() > 0 && index < 5)
		{
			local rng = this.Math.rand(0, this.m.Settlements.len() -1)
			target_settlements.push(this.m.Settlements[rng])
			this.m.Settlements.remove(rng)
			index++
		}
		local sort_settlements;
		/*
		sort_settlements = function(_start, _settlements, _sorted_list = [])
		{
			this.logInfo("START" + _start.getName())
	
			local closest = null
			local closestDist = 9999
			local index;
			foreach (idx, settlement in _settlements)
			{
				local newDist = _start.getTile().getDistanceTo(settlement.getTile())
				if (closest == null || newDist < closestDist)
				{
					closest = settlement;
					this.logInfo("NEW CLOSEST = " +settlement.getName())
					closestDist = newDist;
					index = idx;
				}
			}
			_sorted_list.push(closest)
			_settlements.remove(index)
			if (_settlements.len() > 0){
				sort_settlements(closest, _settlements, _sorted_list)
			}
			else{
				foreach (settlement in _sorted_list){
					this.logInfo("SETTLEMENT:" + settlement.getName())
				}
				return _sorted_list
			}
			return _sorted_list
		}
		
		sort_settlements = function(_start, _settlements)
		{
			local sorted_list = _settlements
			local idx = 0
			while (true)
			{
				this.logInfo(idx +" " +sorted_list[idx].getName() + " " + sorted_list[idx+1].getName())
				if(_start.getTile().getDistanceTo(sorted_list[idx].getTile()) > _start.getTile().getDistanceTo(sorted_list[idx+1].getTile())){
					local set = sorted_list.remove(idx)
					sorted_list.push(set)
				}
				else{
					idx++
					if (idx == sorted_list.len()-1) {break}
				}
			}
			return sorted_list
		}*/
		sort_settlements = function(_start, _settlements)
		{
			local sorted_list = clone _settlements
			local furthest = null;
			local furthest_dist = 0
			foreach (set in sorted_list){
				local dist = set.getTile().getDistanceTo(_start.getTile())
				if(furthest == null || furthest_dist < dist){
					furthest = set;
					furthest_dist = dist
				}
			}
			return furthest
		}	
				
		local waypoint_1 = sort_settlements(player_base, target_settlements)
		local waypoint_2 = sort_settlements(waypoint_1, target_settlements)
		local sorted_list = [waypoint_1, waypoint_2, player_base];
		foreach (town in sorted_list)
		{
			local move = this.new("scripts/ai/world/orders/move_order");
			move.setDestination(town.getTile());
			move.setRoadsOnly(true);
			c.addOrder(move);
		}
		local despawn = this.new("scripts/ai/world/orders/despawn_order");
		c.addOrder(despawn);
		/*
		party.getSprite("selection").Color = this.createColor("#4c0000")
		party.getSprite("selection").Visible = true;
		foreach (member, value in party.getSprite("selection").getclass()){
			this.logInfo("MEMBER " + member + " VALUE " + value)
			if (typeof value == "table"){
				this.logInfo("Exploring " + member)
				foreach (x, y in value){
					this.logInfo("MEMBER " + x + " VALUE " + y)
					if (x == "Visible") this.logInfo(typeof y)
				}
				this.logInfo("-------------------------------")
			}
		}*/
		return true;
	}

});

