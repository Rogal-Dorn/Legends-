this.legends_party_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.legends_party";
		this.m.Name = "Adventuring Party";
		this.m.Description = "[p=c][img]gfx/ui/events/event_134.png[/img][/p][p]After an unlikely meeting in a tavern, an unlikely group of strangers have formed an adventuring party. They have set out in search of both dragons and dungeons.\n\n[color=#bcad8c]A party of six overpowered adventurers, each with their own skills.[/color][/p]";
		this.m.Difficulty = 1;
		this.m.Order = 2;
	}

	function isValid()
	{
		return this.Const.DLC.Wildmen;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 6; i = ++i )
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();
			bro.improveMood(1.5, "Joined an adventuring party");

			while (names.find(bro.getNameOnly()) != null)
			{
				bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
			}

			names.push(bro.getNameOnly());
		}

		local bros = roster.getAll();
		bros[0].setStartValuesEx([
			"legend_berserker_background"
		]);
		bros[0].getBackground().m.RawDescription = "{%name% was drunk when he agreed to join the party, now that he has sobered up you aren\'t sure if hiring him was a good idea. The man seems disturbed, unstable and prone to extreme violence. On the other hand, that could be very useful.}";
		bros[0].setPlaceInFormation(3);
		bros[0].setVeteranPerks(2);
		bros[1].setStartValuesEx([
			"assassin_background"
		]);
		bros[1].getBackground().m.RawDescription = "{%name% was weird when you met him. After some time traveling with your party you found out %name% was hired to assassinate local lord. %name%  wanted to use your company just for temporary disguise but decided to stay. }";
		bros[1].setPlaceInFormation(4);
		bros[1].setVeteranPerks(2);
		bros[2].setStartValuesEx([
			"legend_crusader_background"
		]);
		bros[2].getBackground().m.RawDescription = "%name% is a righteous man, constantly chanting religious hymns and passages. He exists to fight the undead and has a burning passion against any kind of necromancy. How he ever agreed to join forces with those who do not share his zeal remains a mystery.";
		bros[2].setPlaceInFormation(5);
		bros[2].setVeteranPerks(2);
		bros[3].setStartValuesEx([
			"legend_witch_background"
		]);
		bros[3].getBackground().m.RawDescription = "%name% is a cunning woman, knowledgable on nearly ever subject. She spends her time gathering ingredients and tinkering with concoctions to use in battle, she assures you nothing she does is magic, but it sure looks like it.";
		bros[3].setPlaceInFormation(12);
		bros[3].setVeteranPerks(2);
		bros[4].setStartValuesEx([
			"legend_noble_commander_background"
		]);
		bros[4].getBackground().m.RawDescription = "You can tell %name% is nobleborn from a thousand yards. The way he holds himself, his upper class mannerisms, and his uncanny ability to never get dirty as the rest of the party. He is also a conniving selfish liar with a silver tongue, like any noble. Despite this, he denies all connections to nobility and claims he is a commoner like everyone else.";
		bros[4].setPlaceInFormation(13);
		bros[4].setVeteranPerks(2);
		bros[5].setStartValuesEx([
			"legend_ranger_background"
		]);
		bros[5].getBackground().m.RawDescription = "There is a quiet calm to %name%, with an intense gaze that seems to see more detail than anyone else. He speaks little of himself, but it is clear he holds a deep affinity with the land, and sees orcs as a symbol of all that is wrong with the world.";
		bros[5].setPlaceInFormation(14);
		bros[5].setVeteranPerks(2);

		this.World.Assets.m.Money = this.World.Assets.m.Money * 2;
	}

	function onInit()
	{
		this.starting_scenario.onInit();
		this.World.Assets.m.BrothersMax = 6;
		this.World.Flags.set("IsLegendsParty", true);
	}


	function onSpawnPlayer()
	{
		local randomVillage;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = ++i )
		{
			randomVillage = this.World.EntityManager.getSettlements()[i];

			if (!randomVillage.isMilitary() && !randomVillage.isIsolatedFromRoads() && randomVillage.getSize() >= 3)
			{
				break;
			}
		}

		local randomVillageTile = randomVillage.getTile();
		local navSettings = this.World.getNavigator().createSettings();
		navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Flat;

		do
		{
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 4), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 4));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 4), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 4));

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
		this.World.Assets.updateLook(109);
		//this.World.State.m.Player.getSprite("body").setBrush("figure_player_party");
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList(this.Const.Music.IntroTracks, this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.legend_party_scenario_intro");
		}, null);
	}

});

