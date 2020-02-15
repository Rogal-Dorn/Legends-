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
			Text = "[img]gfx/ui/events/legend_cannibal_recruitment.png[/img]You find a man preparing some good-smelling but suspicious-looking meat.",
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
							_event.m.Cannibal.getTags().add("PlayerSkeleton");
							_event.m.Cannibal.getTags().add("undead");
							_event.m.Cannibal.getTags().add("skeleton");
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
	}

	function onClear()
	{
		this.m.Cannibal = null;
	}

});
