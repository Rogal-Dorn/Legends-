this.legend_camp_unlock_scrap <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.legend_camp_unlock_scrap";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 5.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/llegend_camp_scrap.png[/img]You are out of armor parts, perhaps it is time to camp and scrap some gear?",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Scrapping unlocked in camp",
					function getResult( _event )
					{
						this.World.Tags.set("HasLegendCampScrap", true);
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
		if (this.World.Assets.getArmorParts() < 1 && !this.World.Tags.get("HasLegendCampScrap"))
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
