this.vazl_cannibal_recruitment <- this.inherit("scripts/events/event", {
	m = {
		Cannibal = null,
	},
	function create()
	{
		this.m.ID = "event.vazl_cannibal_recruitment";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 60 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/vazl_cannibal_recruitment.png[/img]You find a man preparing some good-smelling but suspicious-looking meat.",
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
				_event.m.Cannibal.setStartValuesEx(["vazl_cannibal_background"]);
				this.Characters.push(_event.m.Cannibal.getImagePath());
			}
		});
	}

	function onUpdateScore()
	{
		this.logInfo("Cannibal recruitment  --  onUpdateScore");
		if (this.World.getPlayerRoster().getSize() >= this.World.Assets.getBrothersMax())
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();
		foreach (bro in brothers)
		{
			if (bro.getBackground().getID() == "background.vazl_cannibal")
			{
				return;
			}
		}
		
		local totalbrothers = 0;
		local totalbrotherlevels = 0;
		foreach (bro in brothers)
		{
			totalbrothers += 1;
			totalbrotherlevels += bro.getLevel();
		}
		if (totalbrothers < 1 || totalbrotherlevels < 1)
		{
			return;
		}

		this.m.Score = (totalbrotherlevels / totalbrothers) / 2;
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
