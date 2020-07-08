this.legend_sisterhood_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.legend_sisterhood_scenario_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
       		Text = "[img]gfx/ui/events/event_24.png[/img] The world has long been ruled by cruel and uncaring men. Each of us has been hurt by them in some way, but at least in each other we can find friendship and justice. It is time to forge our own path, and carve out our own destinty in the sisterhood",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Onwards!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.logInfo("Unlocking hunting");
				this.World.Tags.set("HasLegendCampHunting", true);
				this.logInfo("Unlocking scouting");
				this.World.Tags.set("HasLegendCampScouting", true);
				this.logInfo("Unlocking gathering");
				this.World.Tags.set("HasLegendCampGathering", true);		
			}
		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
		this.m.Title = "The Sisterhood";
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