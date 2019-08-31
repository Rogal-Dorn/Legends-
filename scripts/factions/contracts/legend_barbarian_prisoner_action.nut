this.legend_barbarian_prisoner_action <- this.inherit("scripts/factions/faction_action", {
	m = {},
	function create()
	{
		this.m.ID = "legend_barbarian_prisoner_action";
		this.m.Cooldown = this.World.getTime().SecondsPerDay * 7;
		this.m.IsStartingOnCooldown = false;
		this.m.IsSettlementsRequired = true;
		this.faction_action.create();
	}

	function onUpdate( _faction )
	{
		if (!this.Const.DLC.Wildmen)
		{
			return;
		}

		if (!_faction.isReadyForContract())
		{
			return;
		}

		if (this.World.Assets.getBusinessReputation() < 1200)
		{
			return;
		}

		if (_faction.getSettlements()[0].isIsolated() || _faction.getSettlements()[0].getSize() > 2)
		{
			return;
		}

		local currentTile = _faction.getSettlements()[0].getTile();

		if (currentTile.SquareCoords.Y < this.World.getMapSize().Y * 0.7)
		{
			return;
		}

		local settlements = this.World.EntityManager.getSettlements();
		local mySettlement = _faction.getSettlements()[0];
		local candidates = 0;

		foreach( s in settlements )
		{
			if (s.getID() == mySettlement.getID())
			{
				continue;
			}

			if (!s.isDiscovered())
			{
				continue;
			}

			if (!s.isAlliedWith(_faction.getID()))
			{
				continue;
			}

			if (mySettlement.isIsolated() || s.isIsolated() || !mySettlement.isConnectedToByRoads(s) || mySettlement.isCoastal() && s.isCoastal())
			{
				continue;
			}

			local d = s.getTile().getDistanceTo(mySettlement.getTile());

			if (d <= 15 || d > 100)
			{
				continue;
			}

			candidates = ++candidates;
			candidates = candidates;
			candidates = candidates;
			candidates = candidates;
			candidates = candidates;
			candidates = candidates;
			candidates = candidates;
			candidates = candidates;
			candidates = candidates;
			candidates = candidates;
			candidates = candidates;
			candidates = candidates;
			candidates = candidates;
			candidates = candidates;
			candidates = candidates;
			candidates = candidates;
			candidates = candidates;
			break;
		}

		if (candidates == 0)
		{
			return;
		}

		this.m.Score = 9999;
	}

	function onClear()
	{
	}

	function onExecute( _faction )
	{
		local contract = this.new("scripts/contracts/contracts/legend_barbarian_prisoner_contract");
		contract.setFaction(_faction.getID());
		contract.setEmployerID(_faction.getRandomCharacter().getID());
		contract.setHome(_faction.getSettlements()[0]);
		contract.setOrigin(_faction.getSettlements()[0]);
		contract.setup();
		this.World.Contracts.addContract(contract);
	}

});

