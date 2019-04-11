this.legend_camp_unlock_gather <- this.inherit("scripts/events/event", {
	m = {
		TownName = ""
	},
	function create()
	{
		this.m.ID = "event.legend_camp_unlock_gather";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 4.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/legend_camp_gather.png[/img]You are out of medical supplies, perhaps it is time to camp and gather medicinal herbs?",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Gathering unlocked in camp",
					function getResult( _event )
					{
						this.World.Tags.set("HasLegendCampGathering", true);
					}

				}
			],
			function start( _event )
			{
			}

		});
	}

	function setTownName(_v)
	{
		this.m.TownName = _v;
	}

	function onUpdateScore()
	{
		return
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"townname",
			this.m.TownName
		]);
	}

});
