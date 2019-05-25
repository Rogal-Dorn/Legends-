this.legends_sisterhood_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.legends_sisterhood";
		this.m.Name = "Legends Sisterhood";
		this.m.Description = "[p=c][img]gfx/ui/events/event_91.png[/img][/p][p]Born into a world dominated by kings and bishops, as a woman you were told you could never be anything. After years of studying in secret, you have made connections and drawn together a group of powerful women. Now you set out to forge your own destinies  \n\n[color=#bcad8c]Sisterhood:[/color] You can only hire women.\n[color=#bcad8c]Wisdom:[/color] Anyone you hire gains the Student perk in battle.\n[color=#bcad8c]Secret knowledge:[/color] You can unlock rare and powerful abilities and weapons.\n[color=#bcad8c]Avatar:[/color] If you die, it is game over[/p]";
		this.m.Difficulty = 2;
		this.m.Order = 15;
		this.m.IsFixedLook = true;
	}

	function isValid()
	{
		return this.Const.DLC.Unhold;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();

		for( local i = 0; i < 6; i = ++i )
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();
		}

		local bros = roster.getAll();
		bros[0].setStartValuesEx([
			"legend_shieldmaiden_background"
		]);
		bros[0].setPlaceInFormation(3);
		bros[1].setStartValuesEx([
			"female_adventurous_noble_background"
		]);
		bros[1].setPlaceInFormation(4);
		bros[2].setStartValuesEx([
			"female_thief_background"
		]);
		bros[2].setPlaceInFormation(5);
		bros[3].setStartValuesEx([
			"female_bowyer_background"
		]);
		bros[3].setPlaceInFormation(14);
		bros[4].setStartValuesEx([
			"legend_witch_commander_background"
		]);
		bros[4].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
		bros[4].getTags().set("IsPlayerCharacter", true);
		bros[4].setPlaceInFormation(15);
		bros[5].setStartValuesEx([
			"legend_vala_background"
		]);
		bros[5].setPlaceInFormation(16);

	}

	function onSpawnPlayer()
	{
		local randomVillage;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = ++i )
		{
			randomVillage = this.World.EntityManager.getSettlements()[i];

			if (!randomVillage.isMilitary() && !randomVillage.isIsolatedFromRoads() && randomVillage.getSize() <= 1)
			{
				break;
			}
		}

		local randomVillageTile = randomVillage.getTile();
		local navSettings = this.World.getNavigator().createSettings();
		navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Flat;

		do
		{
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 3), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 3));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 3), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 3));

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.Type == this.Const.World.TerrainType.Ocean || tile.Type == this.Const.World.TerrainType.Shore || tile.IsOccupied)
				{
				}
				else if (tile.getDistanceTo(randomVillageTile) <= 1)
				{
				}
				else
				{
					local path = this.World.getNavigator().findPath(tile, randomVillageTile, navSettings, 0);

					if (!path.isEmpty())
					{
						randomVillageTile = tile;
						break;
					}
				}
			}
		}
		while (1);

		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.Assets.updateLook(11);
		this.World.spawnLocation("scripts/entity/world/locations/battlefield_location", randomVillageTile.Coords).setSize(1);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList(this.Const.Music.CivilianTracks, this.Const.Music.CrossFadeTime);
		//	this.World.Events.fire("event.beast_hunters_scenario_intro");
		}, null);
	}

	function onInit()
	{
		this.World.Assets.m.BrothersMax = 6;
		this.World.Tags.set("IsLegendsWitch", true);
	}

	function onUpdateHiringRoster( _roster )
	{
		local garbage = [];
		local bros = _roster.getAll();

		foreach( i, bro in bros )
		{
			if (!bro.getBackground().isFemaleBackground())
			{
				garbage.push(bro);
			}
		}

		foreach( g in garbage )
		{
			_roster.remove(g);
		}
	}

	function onCombatFinished()
	{
		local roster = this.World.getPlayerRoster().getAll();

		foreach( bro in roster )
		{
			if (bro.getTags().get("IsPlayerCharacter"))
			{
				return true;
			}
		}

		return false;
	}
});

