this.legend_trader_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.legend_trader_scenario_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
        	Text = "[img]gfx/ui/events/event_24.png[/img]The open road calls you to profit. The only rule is acquisition",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "To arms!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.logInfo("Unlocking fletching");
				this.World.Tags.set("HasLegendCampFletching", true);
				this.logInfo("Unlocking hunting");
				this.World.Tags.set("HasLegendCampHunting", true);
				this.logInfo("Unlocking scouting");
				this.World.Tags.set("HasLegendCampScouting", true);					
			}
		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
		this.m.Title = "Legend Trader";
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"home",
			this.World.Tags.get("HomeVillage")
		]);
	}

	function onClear()
	{
	}

});