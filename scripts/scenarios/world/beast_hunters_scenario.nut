this.beast_hunters_scenario_modded <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.beast_hunters_modded";
		this.m.Name = "Beast Slayers Buffed";
		this.m.Description = "[p=c][img]gfx/ui/events/event_122.png[/img][/p][p]You and your men make your living by hunting down the many beasts that beset villages on the fringes of civilization. It\'s dangerous work, but it pays well enough, and there\'s always a bigger beast to slay and more crowns to earn.\n[color=#bcad8c]Beast Slayers:[/color] Start with three beast slayers and decent equipment, as well as some beast trophies.\n[color=#bcad8c]Expert Trackers:[/color] See tracks from further away, [color=#c90000]perks for hunting legendary beasts.[/color]\n[color=#bcad8c]Expert Skinners:[/color] Each beast you slay has a 50% chance to drop an additional trophy [color=#c90000]or runestone[/color].\n[color=#bcad8c]Prejudice:[/color] Most people don\'t trust your kind, so you get 10% worse prices.[/p]";
		this.m.Difficulty = 2;
		this.m.Order = 5;
		this.m.IsFixedLook = true;
	}

	function isValid()
	{
		return this.Const.DLC.Unhold;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 3; i = i )
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();
			bro.improveMood(1.0, "Has slain a dangerous witch");
			bro.worsenMood(3.0, "Lost most of the company in a betrayal");

			while (names.find(bro.getNameOnly()) != null)
			{
				bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
			}

			names.push(bro.getNameOnly());
			i = ++i;
		}
		

		/*local localTree = { //From past attempt at this scenario, kept for refence
			Tree = [],
			Map = {}
		}
		localTree.addPerk <- function (_perk, _row=0) 
			{
				local perk = clone this.Const.Perks.PerkDefObjects[_perk];
				//Dont add dupes
				if (perk.ID in this.Map)
				{
					return;
				}
				perk.Row <- _row;
				perk.Unlocks <- _row;
				for (local i = this.Tree.len(); i < _row + 1; i = ++i)
				{
					this.Tree.push([]);
				}
				this.Tree[_row].push(perk);
				this.Map[perk.ID] <- perk;
			};
		localTree.addPerkGroup <- function (_group)
		{
			for(local row = 0; row < 7; row=row) 
			{
				if (_group.Tree[row] == [])
				{
					continue;
				}
				foreach (perk in _group.Tree[row])
				{
					this.addPerk(perk, row);
				}
				row = ++row;
			}
		}*/ 
		local bros = roster.getAll();
		bros[0].setStartValuesEx([
			"ends_beast_hunter_melee"
		]);
		bros[0].getBackground().m.RawDescription = "%name% saved you in the brigand\'s ambush that destroyed your band of slayers. He does not hang this fact over you, for you have saved him many a times yourself. The man suffers no emotion that does not bid him well in this world, and that alone makes him a sound slayer.";
		bros[0].setPlaceInFormation(3);
		bros[0].m.Talents = [];
		bros[0].setVeteranPerks(2);
		bros[0].m.Skills.add(this.new("scripts/skills/traits/iron_lungs_trait"));

		local talents = bros[0].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.MeleeSkill] = 3;
		talents[this.Const.Attributes.MeleeDefense] = 3;
		talents[this.Const.Attributes.Fatigue] = 3;
		local items = bros[0].getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
		items.equip(this.new("scripts/items/weapons/boar_spear"));
		items.equip(this.new("scripts/items/tools/throwing_net"));
		bros[1].setStartValuesEx([
			"ends_beast_hunter_sergeant"
		]);
		bros[1].getBackground().m.RawDescription = "A young lad from the city, %name% got his start in beast slaying by rooting out the warrens of \'vicious rabbits\', as he puts it. You\'re not sure how true that is, but regardless he has proven himself on the field of battle more times than you can count.";
		bros[1].setPlaceInFormation(4);
		bros[1].setVeteranPerks(2);
		bros[1].m.Talents = [];
		local talents = bros[1].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Fatigue] = 3;
		talents[this.Const.Attributes.MeleeSkill] = 3;
		talents[this.Const.Attributes.Bravery] = 3;
		bros[1].m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
		
		local items = bros[1].getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
		items.equip(this.new("scripts/items/weapons/spetum"));
		bros[2].setStartValuesEx([
			"ends_beast_hunter_ranged"
		]);
		bros[2].getBackground().m.RawDescription = "Grizzled vets are a rarity in beast slaying, and %name% sure ain\'t one. Instead, he\'s an intelligent man who started his foray into monster hunting by reading books instead of training the sword. Still a good enough warrior at heart, it is his study and preparation that gives him the edge in battle.";
		bros[2].setPlaceInFormation(5);
		bros[2].setVeteranPerks(2);
		bros[2].m.Talents = [];
		local talents = bros[2].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.RangedSkill] = 3;
		talents[this.Const.Attributes.RangedDefense] = 3;
		talents[this.Const.Attributes.MeleeSkill] = 3;
		bros[2].m.Skills.add(this.new("scripts/skills/traits/eagle_eyes_trait"));
		local items = bros[2].getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
		items.equip(this.new("scripts/items/weapons/hunting_bow"));
		items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		items.equip(this.new("scripts/items/accessory/wardog_item"));

		foreach( bro in bros )
		{
			bro.m.PerkPoints = 1;
			bro.m.LevelUps = 1;
			bro.m.Level = 2;
		}

		this.World.Assets.m.BusinessReputation = 200;
		this.World.Tags.set("HasLegendCampCrafting", true);
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/witch_hair_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/werewolf_pelt_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/werewolf_pelt_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/tools/legend_broken_throwing_net"));
		this.World.Assets.m.Money = this.Math.round(this.World.Assets.m.Money * 0.75);
	}

	function onSpawnPlayer()
	{
		local randomVillage;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = i )
		{
			randomVillage = this.World.EntityManager.getSettlements()[i];

			if (!randomVillage.isMilitary() && !randomVillage.isIsolatedFromRoads() && randomVillage.getSize() <= 1)
			{
				break;
			}

			i = ++i;
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
			this.World.Events.fire("event.beast_hunters_scenario_intro");
		}, null);
	}

	function onInit()
	{
		this.starting_scenario.onInit();
		this.World.Assets.m.BuyPriceMult = 1.1;
		this.World.Assets.m.SellPriceMult = 0.9;
		this.World.Assets.m.ExtraLootChance = 50;
		this.World.Assets.m.FootprintVision = 1.5;
	}

	function onUpdateDraftList( _list )
	{
		if (_list.len() < 10)
		{
			return;
		}

		local r;
		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			_list.push("beast_hunter_background");
		}
	}

});

