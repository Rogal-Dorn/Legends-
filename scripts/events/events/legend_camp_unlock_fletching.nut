this.legend_camp_unlock_fletching <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.legend_camp_unlock_fletching";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 6.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_52.png[/img]You notice ammunition is running low, making arrows and bolts cant be too hard, can it?",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Fletching unlocked in camp",
					function getResult( _event )
					{
						this.World.Tags.set("HasLegendCampFletch", true);
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
		if (this.World.Assets.getFood() < 10 && !this.World.Tags.get("HasLegendCampFletch"))
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
