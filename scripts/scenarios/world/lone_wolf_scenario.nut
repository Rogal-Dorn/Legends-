this.lone_wolf_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.lone_wolf";
		this.m.Name = "Lone Wolf";
		this.m.Description = "[p=c][img]gfx/ui/events/event_35.png[/img][/p][p]You have been traveling with your squire for a long time, taking part in tourneys and sparring with young nobles. A hedge knight as tall as a tree, you never needed anybody for long. Is it true still?\n\n[color=#bcad8c]Lone Wolf:[/color] Start with a single experienced hedge knight and great equipment but low funds.\n[color=#bcad8c]Elite Few:[/color] Can never have more than 16 men in your roster.\n[color=#bcad8c]Avatar:[/color] If your hedge knight dies, the campaign ends. Start with an enthusiastic squire.\n[color=#c90000]The Best:[/color] Hunt other swordsmen to become the best in the lands.[/p]";
		this.m.Difficulty = 3;
		this.m.Order = 150;
		this.m.IsFixedLook = true;
		this.m.StartingRosterTier = this.Const.Roster.getTierForSize(3);
		this.m.RosterTierMax = this.Const.Roster.getTierForSize(12);
	}

	function isValid()
	{
		return this.Const.DLC.Wildmen;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 2; i = i ) //party size = 2
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();

			while (names.find(bro.getNameOnly()) != null)
			{
				bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
			}

			names.push(bro.getNameOnly());
			i = ++i;
		}

		local bros = roster.getAll(); //starting party
		local talents;
		bros[0].setStartValuesEx([
			"hedge_knight_background"
		]);
		bros[0].getBackground().m.RawDescription = "A wandering hedge knight, you were a veteran of jousting and sparring tournaments. You were also a veteran of victory. It is a scary thought for many, but if it were anything at all that turned your eye toward mercenary work, it was boredom. Outwardly you state it is for the coin, but a part of you knows it is also for the company.";
		bros[0].getBackground().buildDescription(true);
		bros[0].setTitle("the Lone Wolf");
		bros[0].getSkills().removeByID("trait.survivor");
		bros[0].getSkills().removeByID("trait.greedy");
		bros[0].getSkills().removeByID("trait.loyal");
		bros[0].getSkills().removeByID("trait.disloyal");
		bros[0].getSkills().add(this.new("scripts/skills/perks/perk_legend_favoured_enemy_swordmaster"));
		bros[0].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
		bros[0].setPlaceInFormation(4);
		bros[0].getFlags().set("IsPlayerCharacter", true);
		bros[0].getSprite("miniboss").setBrush("bust_miniboss_lone_wolf");
		bros[0].m.HireTime = this.Time.getVirtualTimeF();
		bros[0].m.PerkPoints = 3;
		bros[0].m.LevelUps = 3;
		bros[0].m.Level = 4;
		bros[0].setVeteranPerks(2);
		bros[0].getBaseProperties().MeleeDefense -= 2;
		bros[0].m.Talents = [];
		bros[0].m.Attributes = [];
		local talents = bros[0].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.MeleeDefense] = 2;
		talents[this.Const.Attributes.Fatigue] = 3;
		talents[this.Const.Attributes.MeleeSkill] = 3;
		bros[0].fillAttributeLevelUpValues(this.Const.XP.MaxLevelWithPerkpoints - 1);
		local items = bros[0].getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));

		if (this.LegendsMod.Configs().LegendArmorsEnabled())
		{
			local armor = this.new("scripts/items/legend_armor/cloth/legend_gambeson");
			local chains = this.new("scripts/items/legend_armor/chain/legend_armor_hauberk");
			local plate = this.new("scripts/items/legend_armor/plate/legend_armor_leather_riveted");
			armor.setUpgrade(chains);
			armor.setUpgrade(plate);
			items.equip(armor);
		}
		else
		{
			items.equip(this.new("scripts/items/armor/sellsword_armor"));
		}

		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"bascinet_with_mail"
			]
		]));
		items.equip(this.new("scripts/items/weapons/longsword"));
		bros[1].setStartValuesEx([
			"squire_background"
		]);
		bros[1].getBackground().m.RawDescription = "{%name% is just happy to be here. After months of polishing armour, cooking meals and dealing with gruesome injuries, %name% will finally get to see their master in action. Hopefully learning something in the process...}";
		bros[1].improveMood(2.5, "I\'m going on an adventure!");
		bros[1].getSkills().removeByID("trait.disloyal");
		bros[1].getSkills().removeByID("trait.greedy");
		bros[1].setPlaceInFormation(3);
		bros[1].setVeteranPerks(2);
		local talents = bros[1].getTalents();
		talents[this.Const.Attributes.Bravery] = 2;
		//---
		this.World.Assets.addBusinessReputation(200);
		this.setRosterReputationTiers(this.Const.Roster.createReputationTiers(this.World.Assets.getBusinessReputation()));
		this.World.Flags.set("HasLegendCampTraining", true);
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/smoked_ham_item"));
		this.World.Assets.m.Money = this.World.Assets.m.Money / 2 - (this.World.Assets.getEconomicDifficulty() == 0 ? 0 : 100);
		this.World.Assets.m.ArmorParts = this.World.Assets.m.ArmorParts / 2;
		this.World.Assets.m.Medicine = this.World.Assets.m.Medicine / 3;
		this.World.Assets.m.Ammo = 0;
	}

	function onSpawnPlayer()
	{
		local randomVillage;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = i )
		{
			randomVillage = this.World.EntityManager.getSettlements()[i];

			if (randomVillage.isMilitary() && !randomVillage.isIsolatedFromRoads() && randomVillage.getSize() >= 3 && !randomVillage.isSouthern())
			{
				break;
			}

			i = ++i;
		}

		local randomVillageTile = randomVillage.getTile();

		do
		{
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 1), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 1));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 1), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 1));

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.Type == this.Const.World.TerrainType.Ocean || tile.Type == this.Const.World.TerrainType.Shore)
				{
				}
				else if (tile.getDistanceTo(randomVillageTile) == 0)
				{
				}
				else if (!tile.HasRoad)
				{
				}
				else
				{
					randomVillageTile = tile;
					break;
				}
			}
		}
		while (1);

		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.Assets.updateLook(6);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList([
				"music/noble_02.ogg"
			], this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.lone_wolf_scenario_intro");
		}, null);
	}

	function onInit()
	{
		this.starting_scenario.onInit();
	}

	function onCombatFinished()
	{
		local roster = this.World.getPlayerRoster().getAll();

		foreach( bro in roster )
		{
			if (bro.getFlags().get("IsPlayerCharacter"))
			{
				return true;
			}
		}

		return false;
	}
	function onUpdateDraftList( _list, _gender )
	{
		local r;
		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			_list.push("squire_background");
		}

		local r;
		r = this.Math.rand(0, 9);

		if (r == 0)
		{
			_list.push("legend_blacksmith_background");
		}

		local r;
		r = this.Math.rand(0, 9);

		if (r == 0)
		{
			_list.push("hedge_knight_background");
		}
	}
	function onHiredByScenario( bro )
	{
		if (bro.getBackground().getID() == "background.squire" || bro.getBackground().getID() == "background.hedge_knight" || bro.getBackground().getID() == "background.legend_blacksmith")
		{
			bro.improveMood(2.0, "Respects your profession");
		}
		else
		{
			bro.improveMood(1.0, "Joined a mercenary company");
		}
	}
	function onUpdateHiringRoster( _roster )
	{
		local bros = _roster.getAll();

		foreach( i, bro in bros )
		{
			if (bro.getBackground().getID() == "background.squire" || bro.getBackground().getID() == "background.hedge_knight" || bro.getBackground().getID() == "background.legend_blacksmith")
			{
				bro.getBaseProperties().DailyWage = this.Math.floor(bro.getBaseProperties().DailyWage * 0.85);
				bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 0.85);
			}
			else
			{
				bro.getBaseProperties().DailyWage = this.Math.floor(bro.getBaseProperties().DailyWage * 1.00);
				bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 1.00);
			}
		}
	}

});

