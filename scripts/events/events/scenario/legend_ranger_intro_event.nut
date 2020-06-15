this.legend_ranger_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.legend_ranger_scenario_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
        	Text = "[img]gfx/ui/events/event_24.png[/img]The council sent us out three months ago, in all directions from the grove. They wouldn't tell us what we were looking for exactly, only that we would know the signs of destruction when we saw them. For weeks we have followed the tracks and watched the skies. The birds are migrating the wrong direction. The rabbits only run one way down their bramble paths. The animals abandon their ranges, as if they know what is coming.  So you pushed on in the other direction, past deserted fields and burned homesteads, past rivers, lakes and mountains.  As you pass the last rise you pause, this is the place. These valleys have no deer, smoke hangs in the air and clings to the hills, the light is harsh and the air is bitter. Whatever is coming, it is coming from here. ",
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
		this.m.Title = "Legend Ranger";
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