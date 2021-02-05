this.legend_necro_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.legend_necro_scenario_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_24.png[/img]{ %SPEECH_ON%Things were rough in that last town...but come, let\'s not talk about that place anymore.%SPEECH_OFF%You stop and turn to the corpse beside you, your only companion.%SPEECH_ON%I told you to stop talking about that place already! I know you miss your wife and family, but there are greater opportunities for you in the afterlife!%SPEECH_OFF%Your companion\'s head lolls slightly to the side as if rolling its eyes. All at once, the tattered neck flesh gives way and the skull rolls off into the valley. You mutter to yourself.%SPEECH_ON%That\'s the problem with people these days, always giving up, no one has the fortitude to handle the trials death throws at them. Pah! Time to find some new assistants.%SPEECH_OFF% }",
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
	}

	function onClear()
	{
	}

});