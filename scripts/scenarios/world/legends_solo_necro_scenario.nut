this.legends_solo_necro_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.legends_solo_necro";
		this.m.Name = "Lone Necromancer";
		this.m.Description = "[p=c][img]gfx/ui/events/event_29.png[/img][/p][p] Death is no barrier, others flee from its yawning abyss, but we embrace the other side. \n\n[color=#bcad8c]Dark arts:[/color] Start with three apprentice necromancers.\n[color=#bcad8c]Gruesome harvest:[/color] Collect human corpses to fashion new minions, maintain them with medical supplies.\n[color=#bcad8c]Blood magic:[/color] Cultists and other macabre backgrounds will flock to join you and cost 25% less to maintain. Cannot hire pious backgrounds. Everyone else costs 50% more to upkeep\n[color=#bcad8c]Avatars:[/color] If all three necromancers die, the spell is broken and the story ends.[/p]";
		this.m.Difficulty = 4; //recruits cannot hate undead, start with very poor relations with all factions that degrade quickly as your party grows //graverobbers, gravediggers, anatomists and cultists all gain access to the 'siphon' perk // Puppets under your control gain additional bonuses to health. //cannot recruit pious backgrounds living backgrounds have a chance to raise as undead after death, but suffer from negative effects while mortal
		this.m.Order = 311;
		this.m.IsFixedLook = true;
		this.m.StartingRosterTier = this.Const.Roster.getTierForSize(4);
		this.m.RosterTierMax = this.Const.Roster.getTierForSize(27);
		this.m.StartingBusinessReputation = 100;
		this.setRosterReputationTiers(this.Const.Roster.createReputationTiers(this.m.StartingBusinessReputation));
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster(); //1 necro commander, 2 cultists, 2 puppets and a bard
		local names = [];

		for( local i = 0; i < 4; i = i )
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.getSkills().add(this.new("scripts/skills/traits/necromancer_trait")); //IMPORTANT - dictates relationship loss/gain
			bro.m.HireTime = this.Time.getVirtualTimeF();

			while (names.find(bro.getNameOnly()) != null)
			{
				bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
			}

			names.push(bro.getNameOnly());
			i = ++i;
		}

		local bros = roster.getAll();
		bros[0].setStartValuesEx([
			"legend_necro_commander_background" //starts @ lvl 3
		]);
		bros[0].setPlaceInFormation(4);
		bros[0].setVeteranPerks(2);
		bros[0].getSprite("miniboss").setBrush("bust_miniboss_undead");
		bros[0].getFlags().set("IsPlayerCharacter", true); //player character
		bros[0].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
		bros[0].getSkills().add(this.new("scripts/skills/perks/legend_possession"));
		bros[0].getSkills().add(this.new("scripts/skills/perks/perk_legend_spawn_zombie_low"));

		bros[1].setStartValuesEx([ //ur a wizard, Harold
			"legend_puppet_background"
		]);
		bros[1].setPlaceInFormation(5);
		bros[1].setVeteranPerks(2);
 		bros[1].getSprite("socket").setBrush("bust_base_undead");
		bros[1].getBaseProperties().MeleeSkill += 12;
		local items = bros[1].getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
		items.equip(this.new("scripts/items/weapons/legend_mystic_staff"));
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"wizard_hat"
			]
		]));
		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"wizard_robe"
			]
		]));

		bros[2].setStartValuesEx([
			"legend_puppet_background"
		]);
		bros[2].setPlaceInFormation(3);
		bros[2].setVeteranPerks(2);
 		bros[2].getSprite("socket").setBrush("bust_base_undead");
		bros[2].getBaseProperties().MeleeSkill += 12;
		local items = bros[2].getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
		items.equip(this.new("scripts/items/weapons/throwing_axe"));
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"jesters_hat"
			]
		]));
		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"noble_tunic"
			]
		]));

		bros[3].setStartValuesEx([
			"minstrel_background"
		]);
		bros[3].setPlaceInFormation(12);
		bros[3].setVeteranPerks(2);
		bros[3].getSkills().add(this.new("scripts/skills/traits/legend_deathly_spectre_trait"));
		bros[3].getSkills().add(this.new("scripts/skills/traits/legend_withering_aura_trait"));
		bros[3].getBackground().m.RawDescription = "";

		bros[4].setStartValuesEx([
			"cultist_background"
		]);
		bros[4].setPlaceInFormation(11);
		bros[4].setVeteranPerks(2);
		bros[4].getSkills().add(this.new("scripts/skills/traits/legend_withering_aura_trait"));
		bros[4].getSkills().add(this.new("scripts/skills/traits/legend_deathly_spectre_trait"));
		bros[4].getBackground().m.RawDescription = "";
 		
		bros[5].setStartValuesEx([
			"cultist_background"
		]);
		bros[5].setPlaceInFormation(13);
		bros[5].setVeteranPerks(2);
		bros[5].getSkills().add(this.new("scripts/skills/traits/legend_withering_aura_trait"));
		bros[5].getSkills().add(this.new("scripts/skills/traits/legend_deathly_spectre_trait"));
		bros[5].getBackground().m.RawDescription = "";

		//Starting stash
		this.World.Assets.m.Money = this.World.Assets.m.Money / 1;
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/strange_meat_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/strange_meat_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/black_marsh_stew_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/spawns/zombie_item"));
		this.World.Assets.m.Money = this.World.Assets.m.Money + 300;
	}

	function onSpawnPlayer()
	{
		local randomVillage;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = i )
		{
			randomVillage = this.World.EntityManager.getSettlements()[i];

			if (!randomVillage.isMilitary() && !randomVillage.isIsolatedFromRoads() && randomVillage.getSize() == 1)
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
				else if (tile.Type != this.Const.World.TerrainType.Plains && tile.Type != this.Const.World.TerrainType.Steppe && tile.Type != this.Const.World.TerrainType.Tundra && tile.Type != this.Const.World.TerrainType.Snow)
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
					//Relations: 0 = hostile, 100 = allied
		local nobles = this.World.FactionManager.getFactionsOfType(this.Const.FactionType.NobleHouse);
		foreach( n in nobles )
		{
			n.addPlayerRelation(-50.0, "Wary of necromancers");
		}

		local unwashedPeasants = this.World.FactionManager.getFactionsOfType(this.Const.FactionType.Settlement);
		foreach( n in unwashedPeasants )
		{
			n.addPlayerRelation(-50.0, "Wary of necromancers");
		}

		local oriental = this.World.FactionManager.getFactionsOfType(this.Const.FactionType.OrientalCityState);
		foreach( n in oriental )
		{
			n.addPlayerRelation(-50.0, "Wary of necromancers");
		}

		local undead = this.World.FactionManager.getFactionsOfType(this.Const.FactionType.Undead);
		foreach( n in undead )
		{
			n.addPlayerRelation(50.0, "To whom it may concern, my nuts hang");
		}

		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.Assets.updateLook(104);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList(["music/retirement_02.ogg"], this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.legend_solo_necro_intro_event"); //starting event
		}, null);
	}

	function onInit()
	{
		this.starting_scenario.onInit();
		this.World.Flags.set("IsLegendsNecro", true); //used to unlock puppets in towns
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

	function onHiredByScenario( bro )
	{
		if (bro.getBackground().getID() == "background.graverobber" || bro.getBackground().getID() == "background.gravedigger" || bro.getBackground().getID() == "background.cultist" || bro.getBackground().getID() == "background.anatomist" || bro.getBackground().getID() == "background.converted_cultist")
		{
			bro.improveMood(1.5, "These people really understand me!");
			bro.getSprite("socket").setBrush("bust_base_undead");
			bro.getSkills().add(this.new("scripts/skills/traits/legend_deathly_spectre_trait"));
			bro.getSkills().add(this.new("scripts/skills/traits/legend_withering_aura_trait"));
		}
		else if (bro.getBackground().getID() == "background.legend_puppet")
		{
			bro.getSprite("socket").setBrush("bust_base_undead");
			bro.getBaseProperties().Hitpoints += 12;
		}
		else
		{
			bro.worsenMood(2.0, "Something doesn't feel right here...");
			bro.getSkills().add(this.new("scripts/skills/traits/legend_withering_aura_trait"));
		}
	}

	function onUpdateHiringRoster( _roster )
	{
		local garbage = [];
		local bros = _roster.getAll();
		this.addBroToRoster(_roster, "graverobber_background", 4);
		this.addBroToRoster(_roster, "gravedigger_background", 4);
		this.addBroToRoster(_roster, "cultist_background", 4);
		this.addBroToRoster(_roster, "legend_puppet_background", 6);
		foreach( i, bro in bros )
		{
			if (bro.getBackground().isBackgroundType(this.Const.BackgroundType.Crusader)) //delete crusader/pious recruits
			{
				garbage.push(bro);
			}
		}
	}

	function onGenerateBro(bro)
	{
		if (bro.getBackground().getID() == "background.graverobber" || bro.getBackground().getID() == "background.gravedigger" || bro.getBackground().getID() == "background.cultist")
		{
			bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 1.00) //1.0 = default
			bro.getBaseProperties().DailyWageMult *= 1.00; //1.0 = default
			bro.getSkills().update();
		}
		else if (bro.getBackground().getID() == "background.legend_puppet")
		{
			bro.getBaseProperties().Hitpoints += 12;
		}
		else
		{
			bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 1.5) //1.0 = default
			bro.getBaseProperties().DailyWageMult *= 1.5; //1.0 = default
			bro.getSkills().update();
		}
	}

	function onGetBackgroundTooltip( _background, _tooltip )
	{
		if (_background.getID() == "background.legend_puppet")
		{
			_tooltip.push({
				id = 16,
				type = "text",
				icon = "ui/icons/Hitpoints.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+12[/color] Hitpoints due to being under the control of a powerful necromancer"
			});
		}
	}

	function onBuildPerkTree( _background )
	{
		if (_background.getID() == "background.gravedigger" || _background.getID() == "background.graverobber" || _background.getID() == "background.cultist")
		{
			this.addScenarioPerk(_background, this.Const.Perks.PerkDefs.LegendSiphon); //change to siphon maybe?
		}
	}

	function updateFactionActionsDeck()
	{
		// Disable specific contracts regarding fighting undead
		local factions = [];
		foreach (type in [::Const.FactionType.OrientalCityState, ::Const.FactionType.Settlement, ::Const.FactionType.NobleHouse])
		{
			factions.extend(::World.FactionManager.getFactionsOfType(type));
			factions.removeActionByID("root_out_undead_action");
			factions.removeActionByID("investigate_cemetery_action");
			factions.removeActionByID("find_artifact_action");
			// factions.removeActionByID("send_undead_roamers_action"); //no contract, back on the menu
			// factions.removeActionByID("defend_undead_action"); //no contract, back on the menu
			// factions.removeActionByID("move_undead_action"); //no contract, back on the menu
			// factions.removeActionByID("send_undead_ambushers_action"); //no contract, back on the menu
		}
	}
});

