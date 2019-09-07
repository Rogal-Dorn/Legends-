this.legend_trader_recruitment <- this.inherit("scripts/events/event", {
	m = {
		Trader = null
	},
	function create()
	{
		this.m.ID = "event.legend_trader_recruitment";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 120 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_41.png[/img]{Travelling along the road %companyname% passes by various ordinary people. Usually they step aside as soonest at they spot company of grim looking men armed to the teeth. Very few are bold enough to risk direct interaction with a mercenary band. This time it is one of these bold ones. This time wayfarer is courageous enough to approach %companyname%.%SPEECH_ON% Oh, hello there! Isn\'t this a famous %companyname% ! \n\n I have heard many stories about your famous deeds ! So many glorious battles ! So many enemies defeated ! … spoils collected. \n\n Anyhow, party of strong warriors like You could use some help outside the fight. Getting supplies at best price possible ! Selling excessive equipment even when nobody is interested in it ! I can make it happen ! \n\n I’m not much a warrior … but You don’t need more of these !  What You need is ME. %SPEECH_OFF% Trader is smiling cheerfully. You notice quick glances over supply wagon and more fancy pieces of your equipment. Looks like total value of %companyname%  possessions already has been evaluated at back of trader\'s mind.}",
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
				local trait = this.new("scripts/skills/traits/greedy_trait");
				_event.m.Trader.getSkills().add(trait);
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
		
		local brothers = this.World.getPlayerRoster().getAll();
		local totalbrothers = 0;
		local brotherlevels = 0;
		foreach (bro in brothers)
		{
			switch (bro.getBackground().getID())
			{
				case "background.legend_trader":
				case "background.legend_commander_trader":
					return;
				default:
				totalbrothers += 1;
				brotherlevels += bro.getLevel();
			}
		}
		
		if (totalbrothers < 1 || brotherlevels < 30)
		{
			return;
		}

		this.m.Score = 20.0 + ((brotherlevels / totalbrothers * 10.00) / this.Const.LevelXP.len());
		// this.m.Score = 9999;
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
