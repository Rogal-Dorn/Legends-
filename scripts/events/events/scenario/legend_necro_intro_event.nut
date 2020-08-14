this.legend_necro_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.legend_necro_scenario_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
        	Text = "[img]gfx/ui/events/event_24.png[/img]That last town was rough... lets not talk about that place anymore. You stop and turn to the corpse beside you, your only companion. I told you to stop talking about that last town already, I know you miss your wife and family, but I told you there are much greater opportunities for you in the afterlife.  Your companion's head lolls slightly to the side as if rolling its eyes at you before finally the tattered neck flesh gives way, and sends the skull rolling off down the valley. Thats the problem with people these days, always giving up, no one seems to have the fortitude to handle whatever death throws at them. Time to hire some new assistants.  ",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Arise!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.logInfo("Making zombies like you");
				//this.World.FactionManager.makeZombiesFriendlyToPlayer();
				this.logInfo("Unlocking gathering");
				this.World.Flags.set("HasLegendCampGathering", true);
			}
		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
		this.m.Title = "Legend Necro";
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"home",
			this.World.Flags.get("HomeVillage")
		]);
	}

	function onClear()
	{
	}

});