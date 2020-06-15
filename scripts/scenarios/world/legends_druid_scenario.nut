this.legends_druid_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.legends_druid";
		this.m.Name = "Druid";
		this.m.Description = "[p=c][img]gfx/ui/events/event_25.png[/img][/p][p]The druids of the wild woods are wary of humans, prefering the company of beasts \n\n[color=#bcad8c]Wildform:[/color]  All recruits gain Bear form and Wolf form.\n[color=#bcad8c]Solitary:[/color] The Druid hates nearly all humans except wildlings, herbalists and practictioners of wild magic \n[color=#bcad8c]Avatar:[/color] If your druid dies, its game over.[/p]";
		this.m.Difficulty = 3;
		this.m.Order = 27;
	}

	function isValid()
	{
		return this.Const.DLC.Wildmen;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 1; i = ++i )
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();

			while (names.find(bro.getNameOnly()) != null)
			{
				bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
			}

			names.push(bro.getNameOnly());
		}

		local bros = roster.getAll();
		local talents;
		bros[0].setStartValuesEx([
			"legend_druid_commander_background"
		]);
		bros[0].getBackground().m.RawDescription = "%name% has only ever known the wild woods, the worlds of men are strange and disgusting";
		bros[0].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
		bros[0].getSkills().add(this.new("scripts/skills/perks/perk_legend_bearform"));
		bros[0].getTags().set("IsPlayerCharacter", true);
		bros[0].setPlaceInFormation(3);
		bros[0].setVeteranPerks(2);	

		foreach( bro in bros )
		{
			local val = this.World.State.addNewID(bro);
			bro.m.CompanyID = val;
		}
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/legend_fresh_fruit_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/roots_and_berries_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/legend_apothecary_mushrooms_item"));
	}

	function onSpawnPlayer()
	{
		local spawnTile;
		local settlements = this.World.EntityManager.getSettlements();
		local nearestVillage;
		local navSettings = this.World.getNavigator().createSettings();
		navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Flat;

		do
		{
			local x = this.Math.rand(5, this.Const.World.Settings.SizeX - 5);
			local y = this.Math.rand(5, this.Const.World.Settings.SizeY - 5);

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.IsOccupied)
				{
				}
				else if (tile.Type != this.Const.World.TerrainType.Forest && tile.Type != this.Const.World.TerrainType.SnowyForest && tile.Type != this.Const.World.TerrainType.LeaveForest && tile.Type != this.Const.World.TerrainType.AutumnForest)
				{
				}
				else
				{
					local next = true;

					foreach( s in settlements )
					{
						local d = s.getTile().getDistanceTo(tile);

						if (d > 6 && d < 15)
						{
							local path = this.World.getNavigator().findPath(tile, s.getTile(), navSettings, 0);

							if (!path.isEmpty())
							{
								next = false;
								nearestVillage = s;
								break;
							}
						}
					}

					if (next)
					{
					}
					else
					{
						spawnTile = tile;
						break;
					}
				}
			}
		}
		while (1);


		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", spawnTile.Coords.X, spawnTile.Coords.Y);
		this.World.Assets.updateLook(115);
		//this.World.State.m.Player.getSprite("body").setBrush("figure_player_druid");
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList(this.Const.Music.IntroTracks, this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.legend_druid_scenario_intro");
		}, null);
foreach (b in this.World.getPlayerRoster().getAll())
		{
			foreach (add in this.World.getPlayerRoster().getAll())
			{
				b.changeActiveRelationship(add, this.Math.rand(0, 10));
			}
		}
	}

	function onInit()
	{
		this.starting_scenario.onInit();
		this.World.State.getPlayer().m.BaseMovementSpeed = 111;
		this.World.Assets.m.BrothersMax = 27;
		this.World.Tags.set("IsLegendsDruid", true);
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
	
	function onUpdateDraftList( _list )
	{

	}

	function onHiredByScenario( bro )
	{

		bro.improveMood(0.5, "Learned a new skill");
		local r = this.Math.rand(1, 3);
		if (r == 1)
		{
		bro.getSkills().add(this.new("scripts/skills/perks/perk_legend_bearform"));
		}

		else if (r == 2)
		{
		bro.getSkills().add(this.new("scripts/skills/perks/perk_legend_wolfform"));
		}

		else if (r == 3)
		{
		bro.getSkills().add(this.new("scripts/skills/perks/perk_legend_treeform"));
		}
	}

	function onUpdateHiringRoster( _roster )
	{
		local bros = _roster.getAll();

		foreach( i, bro in bros )
		{
			if (bro.getBackground().isDruidRecruitBackground())
			{
				bro.getBaseProperties().DailyWage = this.Math.floor(bro.getBaseProperties().DailyWage * 0.9);
				bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 0.9);	
			}
			else
			{
			garbage.push(bro);
			}
		}

		foreach( g in garbage )
		{
			_roster.remove(g);
		}
	}

	function onBuildPerkTree( _tree)
	{

		if  (_tree == null)
		{
			return;
		}
		local r = this.Math.rand(0, 5);
		if (r <= 2)
		{
		_tree.addPerk(this.Const.Perks.PerkDefs.LegendWolfform);
		}
		else if (r == 3)
		{
		_tree.addPerk(this.Const.Perks.PerkDefs.LegendBearform);
		}
		else if (r == 4)
		{
		_tree.addPerk(this.Const.Perks.PerkDefs.LegendBearform);
		}
		else if (r == 5)
		{
		_tree.addPerk(this.Const.Perks.PerkDefs.LegendTreeform);
		}


		
	}

});

