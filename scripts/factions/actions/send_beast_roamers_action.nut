this.send_beast_roamers_action <- this.inherit("scripts/factions/faction_action", {
	m = {
		Options = [],
		BeastsLow = [],
		BeastsMedium = [],
		BeastsHigh = []
	},
	function create()
	{
		this.m.ID = "send_beast_roamers_action";
		this.m.Cooldown = 5.0;
		this.faction_action.create();
		local distanceToNextAlly = 10;
		local beast;
		beast = function ( _action, _nearTile = null )
		{
			local disallowedTerrain = [];

			if (this.Const.DLC.Unhold)
			{
				for( local i = 0; i < this.Const.World.TerrainType.COUNT; i = ++i )
				{
					if (i == this.Const.World.TerrainType.Steppe || i == this.Const.World.TerrainType.Plains)
					{
					}
					else
					{
						disallowedTerrain.push(i);
					}
				}
			}
			else
			{
				for( local i = 0; i < this.Const.World.TerrainType.COUNT; i = ++i )
				{
					if (i == this.Const.World.TerrainType.Snow || i == this.Const.World.TerrainType.SnowyForest || i == this.Const.World.TerrainType.Forest || i == this.Const.World.TerrainType.LeaveForest || i == this.Const.World.TerrainType.AutumnForest || i == this.Const.World.TerrainType.Hills)
					{
						disallowedTerrain.push(i);
					}
				}
			}

			local tile = _action.getTileToSpawnLocation(10, disallowedTerrain, 7, 35, 1000, 3, 0, _nearTile);

			if (tile == null)
			{
				return false;
			}

			if (_action.getDistanceToNextAlly(tile) <= distanceToNextAlly / (_nearTile == null ? 1 : 2))
			{
				return false;
			}

			local distanceToNextSettlement = _action.getDistanceToSettlements(tile);
			local party = _action.getFaction().spawnEntity(tile, "Nachzehrers", false, this.Const.World.Spawn.Ghouls, this.Math.rand(80, 120) * _action.getReputationToDifficultyMult() * this.Math.maxf(0.7, this.Math.minf(1.5, distanceToNextSettlement / 14.0)));
			party.getSprite("banner").setBrush("banner_beasts_01");
			party.setDescription("A flock of scavenging nachzehrers.");
			party.setSlowerAtNight(false);
			party.setUsingGlobalVision(false);
			party.setLooting(false);
			local roam = this.new("scripts/ai/world/orders/roam_order");
			roam.setAllTerrainAvailable();
			roam.setTerrain(this.Const.World.TerrainType.Mountains, false);
			roam.setTerrain(this.Const.World.TerrainType.Ocean, false);
			roam.setTerrain(this.Const.World.TerrainType.Shore, false);
			party.getController().addOrder(roam);
			return true;
		};
		this.m.Options.push(beast);
		this.m.BeastsLow.push(beast);
		beast = function ( _action, _nearTile = null )
		{
			local disallowedTerrain = [];

			for( local i = 0; i < this.Const.World.TerrainType.COUNT; i = ++i )
			{
				if (i == this.Const.World.TerrainType.Forest || i == this.Const.World.TerrainType.SnowyForest || i == this.Const.World.TerrainType.LeaveForest || i == this.Const.World.TerrainType.AutumnForest || i == this.Const.World.TerrainType.Hills)
				{
				}
				else
				{
					disallowedTerrain.push(i);
				}
			}

			local tile = _action.getTileToSpawnLocation(10, disallowedTerrain, 7, 50, 1000, 3, 0, _nearTile);

			if (tile == null)
			{
				return false;
			}

			if (_action.getDistanceToNextAlly(tile) <= distanceToNextAlly / (_nearTile == null ? 1 : 2))
			{
				return false;
			}

			local distanceToNextSettlement = _action.getDistanceToSettlements(tile);
			local party = _action.getFaction().spawnEntity(tile, "Direwolves", false, this.Const.World.Spawn.Direwolves, this.Math.rand(80, 120) * _action.getReputationToDifficultyMult() * this.Math.maxf(0.7, this.Math.minf(1.5, distanceToNextSettlement / 14.0)));
			party.getSprite("banner").setBrush("banner_beasts_01");
			party.setDescription("A pack of ferocious direwolves on the hunt for prey.");
			party.setSlowerAtNight(false);
			party.setUsingGlobalVision(false);
			party.setLooting(false);
			local roam = this.new("scripts/ai/world/orders/roam_order");
			roam.setNoTerrainAvailable();
			roam.setTerrain(this.Const.World.TerrainType.Forest, true);
			roam.setTerrain(this.Const.World.TerrainType.SnowyForest, true);
			roam.setTerrain(this.Const.World.TerrainType.LeaveForest, true);
			roam.setTerrain(this.Const.World.TerrainType.AutumnForest, true);
			roam.setTerrain(this.Const.World.TerrainType.Hills, true);
			party.getController().addOrder(roam);
			return true;
		};
		this.m.Options.push(beast);
		this.m.BeastsLow.push(beast);

		if (this.Const.DLC.Unhold)
		{
			beast = function ( _action, _nearTile = null )
			{
				local disallowedTerrain = [];

				for( local i = 0; i < this.Const.World.TerrainType.COUNT; i = ++i )
				{
					if (i == this.Const.World.TerrainType.Forest || i == this.Const.World.TerrainType.LeaveForest || i == this.Const.World.TerrainType.AutumnForest)
					{
					}
					else
					{
						disallowedTerrain.push(i);
					}
				}

				local tile = _action.getTileToSpawnLocation(10, disallowedTerrain, 7, 40, 1000, 3, 0, _nearTile);

				if (tile == null)
				{
					return false;
				}

				if (_action.getDistanceToNextAlly(tile) <= distanceToNextAlly / (_nearTile == null ? 1 : 2))
				{
					return false;
				}

				local distanceToNextSettlement = _action.getDistanceToSettlements(tile);
				local party = _action.getFaction().spawnEntity(tile, "Webknechts", false, this.Const.World.Spawn.Spiders, this.Math.rand(80, 120) * _action.getReputationToDifficultyMult() * this.Math.maxf(0.7, this.Math.minf(1.5, distanceToNextSettlement / 14.0)));
				party.getSprite("banner").setBrush("banner_beasts_01");
				party.setDescription("A swarm of webknechts skittering about.");
				party.setSlowerAtNight(false);
				party.setUsingGlobalVision(false);
				party.setLooting(false);
				party.getTags().set("IsWebknechts", true);
				local roam = this.new("scripts/ai/world/orders/roam_order");
				roam.setNoTerrainAvailable();
				roam.setTerrain(this.Const.World.TerrainType.Forest, true);
				roam.setTerrain(this.Const.World.TerrainType.LeaveForest, true);
				roam.setTerrain(this.Const.World.TerrainType.AutumnForest, true);
				roam.setMinRange(1);
				roam.setMaxRange(4);
				party.getController().addOrder(roam);
				return true;
			};
			this.m.Options.push(beast);
			this.m.BeastsLow.push(beast);
			beast = function ( _action, _nearTile = null )
			{
				if (this.World.getTime().Days < 10 && _nearTile == null)
				{
					return false;
				}

				local disallowedTerrain = [];

				for( local i = 0; i < this.Const.World.TerrainType.COUNT; i = ++i )
				{
					if (i == this.Const.World.TerrainType.Highlands || i == this.Const.World.TerrainType.Hills || i == this.Const.World.TerrainType.Mountains)
					{
					}
					else
					{
						disallowedTerrain.push(i);
					}
				}

				local tile = _action.getTileToSpawnLocation(10, disallowedTerrain, 10 - (_nearTile == null ? 0 : 2), 100, 1000, 3, 0, _nearTile);

				if (tile == null)
				{
					return false;
				}

				if (_action.getDistanceToNextAlly(tile) <= distanceToNextAlly / (_nearTile == null ? 1 : 2))
				{
					return false;
				}

				local distanceToNextSettlement = _action.getDistanceToSettlements(tile);
				local party = _action.getFaction().spawnEntity(tile, "Unhold", false, this.Const.World.Spawn.Unhold, this.Math.rand(80, 120) * _action.getReputationToDifficultyMult() * this.Math.maxf(0.7, this.Math.minf(1.5, distanceToNextSettlement / 14.0)));
				party.getSprite("banner").setBrush("banner_beasts_01");
				party.setDescription("One or more lumbering giants.");
				party.setSlowerAtNight(true);
				party.setUsingGlobalVision(false);
				party.setLooting(false);
				party.getTags().set("IsUnholds", true);
				local roam = this.new("scripts/ai/world/orders/roam_order");
				roam.setNoTerrainAvailable();
				roam.setTerrain(this.Const.World.TerrainType.Forest, true);
				roam.setTerrain(this.Const.World.TerrainType.Hills, true);
				roam.setTerrain(this.Const.World.TerrainType.Highlands, true);
				roam.setTerrain(this.Const.World.TerrainType.Mountains, true);
				party.getController().addOrder(roam);
				return true;
			};
			this.m.Options.push(beast);
			this.m.BeastsMedium.push(beast);
			beast = function ( _action, _nearTile = null )
			{
				if (this.World.getTime().Days < 10 && _nearTile == null)
				{
					return false;
				}

				local isTundraAllowed = this.Math.rand(1, 100) <= 20;
				local disallowedTerrain = [];

				for( local i = 0; i < this.Const.World.TerrainType.COUNT; i = ++i )
				{
					if (i == this.Const.World.TerrainType.Snow || i == this.Const.World.TerrainType.SnowyForest || i == this.Const.World.TerrainType.Highlands && isTundraAllowed)
					{
					}
					else
					{
						disallowedTerrain.push(i);
					}
				}

				local tile = _action.getTileToSpawnLocation(10, disallowedTerrain, 5, 100, 1000, 3, 0, _nearTile);

				if (tile == null)
				{
					return false;
				}

				if (_action.getDistanceToNextAlly(tile) <= distanceToNextAlly / (_nearTile == null ? 1 : 2))
				{
					return false;
				}

				local distanceToNextSettlement = _action.getDistanceToSettlements(tile);
				local party = _action.getFaction().spawnEntity(tile, "Unhold", false, this.Const.World.Spawn.UnholdFrost, this.Math.rand(80, 120) * _action.getReputationToDifficultyMult() * this.Math.maxf(0.7, this.Math.minf(1.5, distanceToNextSettlement / 14.0)));
				party.getSprite("banner").setBrush("banner_beasts_01");
				party.setDescription("One or more lumbering giants.");
				party.setSlowerAtNight(true);
				party.setUsingGlobalVision(false);
				party.setLooting(false);
				party.getTags().set("IsUnholds", true);
				local roam = this.new("scripts/ai/world/orders/roam_order");
				roam.setNoTerrainAvailable();
				roam.setTerrain(this.Const.World.TerrainType.Snow, true);
				roam.setTerrain(this.Const.World.TerrainType.SnowyForest, true);
				roam.setTerrain(this.Const.World.TerrainType.Hills, true);

				if (isTundraAllowed)
				{
					roam.setTerrain(this.Const.World.TerrainType.Highlands, true);
				}

				party.getController().addOrder(roam);
				return true;
			};
			this.m.Options.push(beast);
			this.m.BeastsMedium.push(beast);
			beast = function ( _action, _nearTile = null )
			{
				if (this.World.getTime().Days < 10 && _nearTile == null)
				{
					return false;
				}

				local disallowedTerrain = [];

				for( local i = 0; i < this.Const.World.TerrainType.COUNT; i = ++i )
				{
					if (i == this.Const.World.TerrainType.Swamp || i == this.Const.World.TerrainType.LeaveForest)
					{
					}
					else
					{
						disallowedTerrain.push(i);
					}
				}

				local tile = _action.getTileToSpawnLocation(10, disallowedTerrain, 10 - (_nearTile == null ? 0 : 2), 100, 1000, 3, 0, _nearTile);

				if (tile == null)
				{
					return false;
				}

				if (_action.getDistanceToNextAlly(tile) <= distanceToNextAlly / (_nearTile == null ? 1 : 2))
				{
					return false;
				}

				local distanceToNextSettlement = _action.getDistanceToSettlements(tile);
				local party = _action.getFaction().spawnEntity(tile, "Unhold", false, this.Const.World.Spawn.UnholdBog, this.Math.rand(80, 120) * _action.getReputationToDifficultyMult() * this.Math.maxf(0.7, this.Math.minf(1.5, distanceToNextSettlement / 14.0)));
				party.getSprite("banner").setBrush("banner_beasts_01");
				party.setDescription("One or more lumbering giants.");
				party.setSlowerAtNight(true);
				party.setUsingGlobalVision(false);
				party.setLooting(false);
				party.getTags().set("IsUnholds", true);
				local roam = this.new("scripts/ai/world/orders/roam_order");
				roam.setNoTerrainAvailable();
				roam.setTerrain(this.Const.World.TerrainType.Swamp, true);
				roam.setTerrain(this.Const.World.TerrainType.LeaveForest, true);
				party.getController().addOrder(roam);
				return true;
			};
			this.m.Options.push(beast);
			this.m.BeastsMedium.push(beast);
			beast = function ( _action, _nearTile = null )
			{
				if (_nearTile == null && this.Math.rand(1, 100) <= 25)
				{
					return false;
				}

				if (this.World.getTime().Days < 10 && _nearTile == null)
				{
					return false;
				}

				local tile = _action.getTileToSpawnLocation(10, [
					this.Const.World.TerrainType.Mountains,
					this.Const.World.TerrainType.Forest,
					this.Const.World.TerrainType.LeaveForest,
					this.Const.World.TerrainType.AutumnForest,
					this.Const.World.TerrainType.SnowyForest,
					this.Const.World.TerrainType.Swamp,
					this.Const.World.TerrainType.Hills
				], 7, 35, 1000, 3, 0, _nearTile);

				if (tile == null)
				{
					return false;
				}

				if (_action.getDistanceToNextAlly(tile) <= distanceToNextAlly / (_nearTile == null ? 1 : 2))
				{
					return false;
				}

				local distanceToNextSettlement = _action.getDistanceToSettlements(tile);
				local party = _action.getFaction().spawnEntity(tile, "Alps", false, this.Const.World.Spawn.Alps, this.Math.rand(80, 100) * _action.getReputationToDifficultyMult() * this.Math.maxf(0.7, this.Math.minf(1.5, distanceToNextSettlement / 14.0)));
				party.getSprite("banner").setBrush("banner_beasts_01");
				party.setDescription("Pale and haggard creatures creeping around.");
				party.setSlowerAtNight(false);
				party.setUsingGlobalVision(false);
				party.setLooting(false);
				party.getTags().set("IsAlps", true);
				local roam = this.new("scripts/ai/world/orders/roam_order");
				roam.setAllTerrainAvailable();
				roam.setTerrain(this.Const.World.TerrainType.Mountains, false);
				roam.setTerrain(this.Const.World.TerrainType.Ocean, false);
				roam.setTerrain(this.Const.World.TerrainType.Shore, false);
				party.getController().addOrder(roam);
				return true;
			};
			this.m.Options.push(beast);
			this.m.BeastsMedium.push(beast);
			beast = function ( _action, _nearTile = null )
			{
				if (this.World.getTime().Days < 15 && _nearTile == null)
				{
					return false;
				}

				if (_nearTile == null && this.Math.rand(1, 100) <= 10)
				{
					return false;
				}

				local tile = _action.getTileToSpawnLocation(10, [
					this.Const.World.TerrainType.Mountains,
					this.Const.World.TerrainType.Hills,
					this.Const.World.TerrainType.Snow,
					this.Const.World.TerrainType.SnowyForest
				], 8, 50, 1000, 3, 0, _nearTile);

				if (tile == null)
				{
					return false;
				}

				if (_action.getDistanceToNextAlly(tile) <= distanceToNextAlly / (_nearTile == null ? 1 : 2))
				{
					return false;
				}

				local distanceToNextSettlement = _action.getDistanceToSettlements(tile);
				local party = _action.getFaction().spawnEntity(tile, "Hexen", false, this.Const.World.Spawn.HexenAndMore, this.Math.rand(80, 120) * _action.getReputationToDifficultyMult() * this.Math.maxf(0.7, this.Math.minf(1.5, distanceToNextSettlement / 14.0)));
				party.getSprite("banner").setBrush("banner_beasts_01");
				party.setDescription("A malevolent old crone, said to lure and abduct little children to make broth and concoctions out of, strike sinister pacts with villagers, and weave curses.");
				party.setSlowerAtNight(false);
				party.setUsingGlobalVision(false);
				party.setLooting(true);
				local roam = this.new("scripts/ai/world/orders/roam_order");
				roam.setAllTerrainAvailable();
				roam.setTerrain(this.Const.World.TerrainType.Mountains, false);
				roam.setTerrain(this.Const.World.TerrainType.Ocean, false);
				roam.setTerrain(this.Const.World.TerrainType.Shore, false);
				party.getController().addOrder(roam);
				return true;
			};
			this.m.Options.push(beast);
			this.m.BeastsMedium.push(beast);
			beast = function ( _action, _nearTile = null )
			{
				if (this.World.getTime().Days < 20 && _nearTile == null)
				{
					return false;
				}

				local disallowedTerrain = [];

				for( local i = 0; i < this.Const.World.TerrainType.COUNT; i = ++i )
				{
					if (i == this.Const.World.TerrainType.Forest || i == this.Const.World.TerrainType.LeaveForest || i == this.Const.World.TerrainType.AutumnForest)
					{
					}
					else
					{
						disallowedTerrain.push(i);
					}
				}

				local tile = _action.getTileToSpawnLocation(10, disallowedTerrain, 20 - (_nearTile == null ? 0 : 11), 100, 1000, 3, 0, _nearTile);

				if (tile == null)
				{
					return false;
				}

				if (_action.getDistanceToNextAlly(tile) <= distanceToNextAlly / (_nearTile == null ? 1 : 2))
				{
					return false;
				}

				local distanceToNextSettlement = _action.getDistanceToSettlements(tile);
				local party = _action.getFaction().spawnEntity(tile, "Schrats", false, this.Const.World.Spawn.Schrats, this.Math.rand(80, 120) * _action.getReputationToDifficultyMult() * this.Math.maxf(0.7, this.Math.minf(1.5, distanceToNextSettlement / 14.0)));
				party.getSprite("banner").setBrush("banner_beasts_01");
				party.setDescription("A creature of bark and wood, blending between trees and shambling slowly, its roots digging through the soil.");
				party.setSlowerAtNight(false);
				party.setUsingGlobalVision(false);
				party.setLooting(false);
				local roam = this.new("scripts/ai/world/orders/roam_order");
				roam.setNoTerrainAvailable();
				roam.setTerrain(this.Const.World.TerrainType.Forest, true);
				roam.setTerrain(this.Const.World.TerrainType.LeaveForest, true);
				roam.setTerrain(this.Const.World.TerrainType.AutumnForest, true);
				roam.setMinRange(1);
				roam.setMaxRange(4);
				party.getController().addOrder(roam);
				return true;
			};
			this.m.Options.push(beast);
			this.m.BeastsHigh.push(beast);
			beast = function ( _action, _nearTile = null )
			{
				if (!this.World.Tags.get("IsKrakenDefeated"))
				{
					return false;
				}

				local disallowedTerrain = [];

				for( local i = 0; i < this.Const.World.TerrainType.COUNT; i = ++i )
				{
					if (i == this.Const.World.TerrainType.Swamp)
					{
					}
					else
					{
						disallowedTerrain.push(i);
					}
				}

				local tile = _action.getTileToSpawnLocation(10, disallowedTerrain, 25, 1000, 1000, 3, 0, _nearTile);

				if (tile == null)
				{
					return false;
				}

				if (_action.getDistanceToNextAlly(tile) <= distanceToNextAlly)
				{
					return false;
				}

				local distanceToNextSettlement = _action.getDistanceToSettlements(tile);
				local party = _action.getFaction().spawnEntity(tile, "Kraken", false, this.Const.World.Spawn.Kraken, 1000);
				party.getSprite("banner").setBrush("banner_beasts_01");
				party.setDescription("A tentacled horror from another age.");
				party.setSlowerAtNight(true);
				party.setUsingGlobalVision(false);
				party.setLooting(false);
				local roam = this.new("scripts/ai/world/orders/roam_order");
				roam.setNoTerrainAvailable();
				roam.setTerrain(this.Const.World.TerrainType.Swamp, true);
				party.getController().addOrder(roam);
				return true;
			};
			this.m.Options.push(beast);
		}

		if (this.Const.DLC.Lindwurm)
		{
			beast = function ( _action, _nearTile = null )
			{
				if (this.World.getTime().Days < 25 && _nearTile == null)
				{
					return false;
				}

				local disallowedTerrain = [];

				for( local i = 0; i < this.Const.World.TerrainType.COUNT; i = ++i )
				{
					if (i == this.Const.World.TerrainType.Steppe)
					{
					}
					else
					{
						disallowedTerrain.push(i);
					}
				}

				local tile = _action.getTileToSpawnLocation(10, disallowedTerrain, 18 - (_nearTile == null ? 0 : 10), 100, 1000, 3, 0, _nearTile);

				if (tile == null)
				{
					return false;
				}

				if (_action.getDistanceToNextAlly(tile) <= distanceToNextAlly / (_nearTile == null ? 1 : 2))
				{
					return false;
				}

				local distanceToNextSettlement = _action.getDistanceToSettlements(tile);
				local party = _action.getFaction().spawnEntity(tile, "Lindwurm", false, this.Const.World.Spawn.Lindwurm, this.Math.rand(80, 120) * _action.getReputationToDifficultyMult() * this.Math.maxf(0.7, this.Math.minf(1.5, distanceToNextSettlement / 14.0)));
				party.getSprite("banner").setBrush("banner_beasts_01");
				party.setDescription("A Lindwurm - a wingless bipedal dragon resembling a giant snake.");
				party.setSlowerAtNight(false);
				party.setUsingGlobalVision(false);
				party.setLooting(false);
				local roam = this.new("scripts/ai/world/orders/roam_order");
				roam.setNoTerrainAvailable();
				roam.setTerrain(this.Const.World.TerrainType.Forest, true);
				roam.setTerrain(this.Const.World.TerrainType.LeaveForest, true);
				roam.setTerrain(this.Const.World.TerrainType.AutumnForest, true);
				roam.setTerrain(this.Const.World.TerrainType.Swamp, true);
				party.getController().addOrder(roam);
				return true;
			};
			this.m.Options.push(beast);
			this.m.BeastsHigh.push(beast);
		}
	}

	function onUpdate( _faction )
	{
		foreach( u in _faction.getUnits() )
		{
			if (!u.isDiscovered() && this.Time.getVirtualTimeF() - u.getSpawnTime() >= 20.0 * this.World.getTime().SecondsPerDay && !u.getSprite("selection").Visible && (this.World.State.getPlayer() == null || this.World.State.getPlayer().getTile().getDistanceTo(u.getTile()) >= 6))
			{
				u.die();
				break;
			}
		}

		if (_faction.getUnits().len() >= 14)
		{
			return;
		}

		this.m.Score = 10;
	}

	function onClear()
	{
	}

	function onExecute( _faction )
	{
		local r = this.Math.rand(0, this.m.Options.len() - 1);

		if (this.World.getTime().Days <= 9)
		{
			r = this.Math.rand(0, this.Const.DLC.Unhold ? 2 : 1);
		}

		for( local i = 0; i < 15 - _faction.getUnits().len(); i = ++i )
		{
			if (this.m.Options[r](this))
			{
				this.m.Cooldown = 5.0;
				break;
			}
			else
			{
				this.m.Cooldown = 0.0;
			}
		}
	}

});

