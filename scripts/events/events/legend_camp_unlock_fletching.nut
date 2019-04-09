this.legend_camp_unlock_fletching <- this.inherit("scripts/events/event", {
	m = {
		TownName = ""
	},
	function create()
	{
		this.m.ID = "event.legend_camp_unlock_fletching";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 6.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/legend_camp_fletcher.png[/img]You notice ammunition is running low, making arrows and bolts cant be too hard, can it?",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Fletching unlocked in camp",
					function getResult( _event )
					{
						this.World.Tags.set("HasLegendCampFletching", true);
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
