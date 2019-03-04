this.send_supplies_action <- this.inherit("scripts/factions/faction_action", {
	m = {
		Start = null,
		Dest = null
	},
	function create()
	{
		this.m.ID = "send_supplies_action";
		this.m.Cooldown = this.World.getTime().SecondsPerDay * 3;
		this.m.IsSettlementsRequired = true;
		this.faction_action.create();
	}

	function onUpdate( _faction )
	{
		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		if (!_faction.isReadyToSpawnUnit())
		{
			return;
		}

		local starts = [];
		local dests = [];

		foreach( s in _faction.getSettlements() )
		{
			if (s.isIsolatedFromRoads())
			{
				continue;
			}

			if (s.isMilitary())
			{
				dests.push(s);
			}
			else if (!(s.getLastSpawnTime() + 300.0 > this.Time.getVirtualTimeF()))
			{
				starts.push(s);
			}
		}

		if (starts.len() != 0 && dests.len() != 0)
		{
			this.m.Start = starts[this.Math.rand(0, starts.len() - 1)];
			this.m.Dest = dests[this.Math.rand(0, dests.len() - 1)];

			if (this.m.Start.isConnectedToByRoads(this.m.Dest))
			{
				this.m.Score = 5;
			}
			else
			{
				this.m.Start = null;
				this.m.Dest = null;
				return;
			}
		}
	}

	function onClear()
	{
		this.m.Start = null;
		this.m.Dest = null;
	}

	function onExecute( _faction )
	{
		local r = this.Math.rand(100, 200) * 0.01;
		local party = _faction.spawnEntity(this.m.Start.getTile(), "Supply Caravan", false, this.Const.World.Spawn.NobleCaravan, r * 100);
		party.getSprite("base").Visible = false;
		party.setMirrored(true);
		party.setDescription("A caravan with armed escorts transporting provisions, supplies and equipment between settlements.");

		if (this.m.Start.getProduce().len() != 0)
		{
			for( local j = 0; j != this.Math.round(2 * r); j = ++j )
			{
				party.addToInventory(this.m.Start.getProduce()[this.Math.rand(0, this.m.Start.getProduce().len() - 1)]);
			}
		}

		party.getLoot().Money = this.Math.floor(this.Math.rand(0, 100) * r);
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
		local despawn = this.new("scripts/ai/world/orders/despawn_order");
		c.addOrder(move);
		c.addOrder(despawn);
	}

});

