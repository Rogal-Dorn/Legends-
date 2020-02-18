this.trader_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.trader";
		this.m.Name = "Trading Caravan";
		this.m.Description = "[p=c][img]gfx/ui/events/event_41.png[/img][/p]You\'re running a small trading caravan and have most of your crowns invested into trading goods. But the roads have become dangerous - brigands and greenskins lay in ambush, and there\'s rumors of even worse things out there.\n\n [color=#bcad8c]Trader:[/color] Get better prices for buying and selling.\n[color=#bcad8c]Not a Warrior:[/color] Start with no renown, and gain renown at half the normal rate. Every non-combat recruit gains the Pacifist perk. \n[color=#bcad8c]Bribery:[/color] Pay off human enemies instead of fighting them. Combat backgrounds cost more to hire, peddlers and donkeys cost less.";
		this.m.Difficulty = 2;
		this.m.Order = 24;
	}

	function isValid()
	{
		return this.Const.DLC.Wildmen;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 2; i = ++i )
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();
			bro.worsenMood(0.5, "Encountered another caravan slaughtered by greenskins");

			while (names.find(bro.getNameOnly()) != null)
			{
				bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
			}

			names.push(bro.getNameOnly());
		}

		local bros = roster.getAll();
		bros[0].setStartValuesEx([
			"peddler_background"
		]);
		bros[0].setPlaceInFormation(4);
		bros[0].setVeteranPerks(2);
		bros[0].getSkills().add(this.new("scripts/skills/perks/perk_legend_pacifist"));
		local items = bros[0].getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
		items.equip(this.new("scripts/items/weapons/legend_staff"));
		items.equip(this.new("scripts/items/helmets/feathered_hat"));

		bros[1].setStartValuesEx([
			"caravan_hand_background"
		]);
		bros[1].setPlaceInFormation(5);
		bros[1].setVeteranPerks(2);
		bros[1].getBackground().m.RawDescription = "You found %name% being thrown out of a pub and at first glance was little more than a drunken miscreant. But you watched as he fought off three would-be muggers. They managed to take his boots in the end, sure, but they couldn\'t truly defeat his spirit. Impressed, you took him on as a caravan hand.";
		local talents = bros[1].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.MeleeSkill] = 2;
		talents[this.Const.Attributes.MeleeDefense] = 1;
		talents[this.Const.Attributes.Hitpoints] = 1;
		local items = bros[1].getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.equip(this.new("scripts/items/weapons/scimitar"));
		foreach( bro in bros )
		{
			local val = this.World.State.addNewID(bro);
			bro.m.CompanyID = val;
		}
		this.World.Assets.m.BusinessReputation = 0;
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/bread_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/mead_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/wine_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/trade/amber_shards_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/trade/cloth_rolls_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/trade/dies_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/trade/furs_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/trade/salt_item"));
		this.World.Assets.m.Money = this.World.Assets.m.Money * 2;
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
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 8), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 8));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 8), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 8));

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.IsOccupied)
				{
				}
				else if (tile.getDistanceTo(randomVillageTile) <= 5)
				{
				}
				else if (!tile.HasRoad)
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
		this.World.Assets.updateLook(9);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList([
				"music/retirement_01.ogg"
			], this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.legend_trader_scenario_intro");
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
		this.World.Assets.m.BusinessReputationRate = 0.5;
		this.World.Assets.m.BuyPriceMult = 0.9;
		this.World.Assets.m.SellPriceMult = 1.1;
		this.World.Assets.m.BrothersMax = 27;
		this.World.Tags.set("IsLegendsTrader", true);
	}


	function onHiredByScenario( bro )
	{
		if (bro.getBackground().isCombatBackground())
		{
			bro.worsenMood(1.0, "Unhappy they will need to do all the fighting");	
		}
		else if (!bro.getBackground().isCombatBackground())
		{
			bro.improveMood(0.5, "Glad to be out of the fighting line");
		    bro.getSkills().add(this.new("scripts/skills/perks/perk_legend_pacifist"));
		    bro.m.PerkPointsSpent += 1;
		}


	}

	function onUpdateHiringRoster( _roster )
	{
		local bros = _roster.getAll();

		foreach( i, bro in bros )
		{
		
			if (bro.getBackground().isCombatBackground())
			{
				bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 1.25);
				bro.getBaseProperties().DailyWage = this.Math.floor(bro.getBaseProperties().DailyWage * 1.25);
			}
			else if (!bro.getBackground().isCombatBackground())
			{
				bro.getSkills().add(this.new("scripts/skills/perks/perk_legend_pacifist"));
			}

			if (bro.getBackground().getID() == "background.peddler" || bro.getBackground().getID() == "background.legend_donkey" )
			{
					bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 0.75);
					bro.getBaseProperties().DailyWage = this.Math.floor(bro.getBaseProperties().DailyWage * 0.75);		 
			}
		}
	}

	function onUpdateDraftList( _list )
	{
		if (_list.len() < 10)
		{
			return;
		}
		local r;
		r = this.Math.rand(0, 4);
		if (r == 0)
		{
			_list.push("peddler_background");
		}
		r = this.Math.rand(0, 2);
		if (r == 0)
		{
			_list.push("caravan_hand_background");
		}
	}

	function onBuildPerkTree( _tree)
	{
		if  (_tree == null)
		{
			return;
		}

		_tree.addPerk(this.Const.Perks.PerkDefs.LegendPacifist)
	}


});