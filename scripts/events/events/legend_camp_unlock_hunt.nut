this.legend_camp_unlock_hunt <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.legend_camp_unlock_hunt";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 1.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/legend_camp_hunt.png[/img]You notice food stocks are running low, perhaps it is time to camp and go hunting?",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Hunting unlocked in camp",
					function getResult( _event )
					{
						this.World.Tags.set("HasLegendCampHunt", true);
					}

				}
			],
			function start( _event )
			{
			}

		});
	}

	function onUpdateScore()
	{
		if (this.World.Assets.getFood() < 10 && !this.World.Tags.get("HasLegendCampHunt"))
		{
			return;
		}

		this.m.Score = 1;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
	}

});
