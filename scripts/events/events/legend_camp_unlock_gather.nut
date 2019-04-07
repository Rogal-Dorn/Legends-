this.legend_camp_unlock_gather <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.legend_camp_unlock_gather";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 4.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_52.png[/img]You are out of medical supplies, perhaps it is time to camp and gather medicinal herbs?",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Gathering unlocked in camp",
					function getResult( _event )
					{
						this.World.Tags.set("HasLegendCampGather", true);
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
		if (this.World.Assets.getMedicine() < 1 && !this.World.Tags.get("HasLegendCampGather"))
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
