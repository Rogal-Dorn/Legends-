this.legend_cannibal_recruitment <- this.inherit("scripts/events/event", {
	m = {
		Cannibal = null
	},
	function create()
	{
		this.m.ID = "event.legend_cannibal_recruitment";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 30 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/legend_cannibal_recruitment.png[/img]The company halts and collectively turns their noses skyward, a thread of flavour is drifting on the wind. It is not grain, fruit or %cannibal%\'s natural musk but instead something more sickly sweet.\n\nYou follow the skyward trail to a figure hunched double over a fire; a vast array of kitchen utensils is laid out in the same manner as a torturer lays out his instruments before beginning work.\n\nThe figure shuffles slightly, exchanging a ladle for a spoon.\n\n%cannibal% aptly misses the solid ground around them and tumbles perfectly into a dead bush, shattering the silence completely.\n\n\'Ther\'s enough fer all of yer\'s\', the figure retorts - failing to even twitch from the clash between fool and nature.\n\nThe company emerges into the dim dancing light of the open fire, the smell is stronger now, but there\'s something else in the air that was not there before.\n\nWith hands on weapons and approaching slowly, the company enters the innermost ring of the fire. The fire no longer dances, instead it mopes and tumbles slowly on the stranger\'s face, who is still fixated on the stew mere inches from the tip of their rankling nose.\n\n\'Ga\'wan siddown! Der yer hav\' nu manners!?\' they bark, startling you somewhat.\n\nIt\'s best to sit.\n\nThe stranger, now half illuminated by the tired flame, moves from their spot to fix eyes with you.\n\nThey stare and wait, as if they were dissecting you mentally. The thickness of the air starts to become noticeable this close to the ground. It feels like death. It feels like this stranger has just taken your hand and led you to your final rest.\n\nThe stranger hangs a crooked grin.\n\n\'Yer want something\' ta eat?\'\n\n\'Or are ya lookin\' for a real artist like merself?\'\n\nThe grin becomes uncomfortably wide.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Welcome to the %companyname%.",
					function getResult( _event )
					{
						this.World.getPlayerRoster().add(_event.m.Cannibal);
						this.World.getTemporaryRoster().clear();
						_event.m.Cannibal.onHired();
						return 0;
					}

				},
				{
					Text = "We\'d rather not take you in.",
					function getResult( _event )
					{
						this.World.getTemporaryRoster().clear();
						return 0;
					}

				}
			],
			function start( _event )
			{
				local roster = this.World.getTemporaryRoster();
				_event.m.Cannibal = roster.create("scripts/entity/tactical/player");
						if (this.World.Assets.getOrigin().getID() == "scenario.legend_risen_legion")
							{
							_event.m.Cannibal.getFlags().add("PlayerSkeleton");
							_event.m.Cannibal.getFlags().add("undead");
							_event.m.Cannibal.getFlags().add("skeleton");
							_event.m.Cannibal.setStartValuesEx([
								"legend_cannibal_background"
							]);
							_event.m.Cannibal.getSkills().add(this.new("scripts/skills/racial/skeleton_racial"));
							_event.m.Cannibal.getSkills().add(this.new("scripts/skills/injury_permanent/legend_fleshless"));
							}
						else
						{
							_event.m.Cannibal.setStartValuesEx([
								"legend_cannibal_background"
							]);
						}
				this.Characters.push(_event.m.Cannibal.getImagePath());
			}

		});
	}

	function onUpdateScore()
	{
		if (this.World.Assets.getOrigin().getID() == "scenario.legend_risen_legion")
		{
			return;
		}

		if (this.World.getPlayerRoster().getSize() >= this.World.Assets.getBrothersMax())
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();
		local totalbrothers = 0;
		local brotherlevels = 0;

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.legend_cannibal")
			{
				return;
			}

			totalbrothers = totalbrothers + 1;
			brotherlevels = brotherlevels + bro.getLevel();
		}

		if (totalbrothers < 1 || brotherlevels < 1)
		{
			return;
		}

		this.m.Score = 2.50 + ((brotherlevels / totalbrothers * 5.00) / this.Const.LevelXP.len());
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"cannibal",
			this.m.Cannibal.m.Name
		]);
	}

	function onClear()
	{
		this.m.Cannibal = null;
	}

});
