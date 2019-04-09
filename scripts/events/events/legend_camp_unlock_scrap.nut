this.legend_camp_unlock_scrap <- this.inherit("scripts/events/event", {
	m = {
		TownName = ""
	},
	function create()
	{
		this.m.ID = "event.legend_camp_unlock_scrap";
		this.m.Title = "At %townname%";
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/legend_camp_scrap.png[/img]{As you leave %townname%, %randombrother% says %SPEECH_ON%I was watching how they were recycling gear into tools in that last town. I think with a little work we could do the same with our gear.%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Scrapping unlocked in camp",
					function getResult( _event )
					{
						this.World.Tags.set("HasLegendCampScraping", true);
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
