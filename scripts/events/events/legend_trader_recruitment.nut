this.legend_trader_recruitment <- this.inherit("scripts/events/event", {
	m = {
		Trader = null
	},
	function create()
	{
		this.m.ID = "event.legend_trader_recruitment";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 60 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_41.png[/img]You run into a greedy trader who wants your money.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Welcome to the %companyname%.",
					function getResult( _event )
					{
						this.World.getPlayerRoster().add(_event.m.Trader);
						this.World.getTemporaryRoster().clear();
						_event.m.Trader.onHired();
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
				_event.m.Trader = roster.create("scripts/entity/tactical/player");
				_event.m.Trader.setStartValuesEx(["legend_trader_background"]);
				_event.m.Trader.add(this.new("scripts/skills/traits/greedy_trait"));
				this.Characters.push(_event.m.Trader.getImagePath());
			}
		});
	}

	function onUpdateScore()
	{
		
		if (this.World.getPlayerRoster().getSize() >= this.World.Assets.getBrothersMax())
		{
			return;
		}

		if (!this.World.Ambitions.getAmbition("ambition.have_z_crowns").isDone())
		{
			return;
		}
		
		if (this.World.Assets.getMoney() <= 30000)
		{
			return;
		}
	
		local playerTile = this.World.State.getPlayer().getTile();
		
		if (!playerTile.HasRoad)
		{
			return;
		}

		if (playerTile.SquareCoords.Y > this.World.getMapSize().Y * 0.7)
		{
			return;
		}
		
		
		local brothers = this.World.getPlayerRoster().getAll();
		local totalbrothers = 0;
		local brotherlevels = 0;
		foreach (bro in brothers)
		{
			if (bro.getBackground().getID() == "background.legend_trader")
			{
				return;
			}
			if (bro.getBackground().getID() == "background.legend_commander_trader")
			{
				return;
			}
			
			totalbrothers += 1;
			brotherlevels += bro.getLevel();
		}
		
		if (totalbrothers < 1 || brotherlevels < 30)
		{
			return;
		}

		this.m.Score = 20.0 + ((brotherlevels / totalbrothers * 10.00) / this.Const.LevelXP.len());
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
		this.m.Trader = null;
	}
});
