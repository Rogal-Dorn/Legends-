this.legend_camp_unlock_scouting <- this.inherit("scripts/events/event", {
	m = {
		TownName = ""
	},
	function create()
	{
		this.m.ID = "event.legend_camp_unlock_scouting";
		this.m.Title = "At %townname%";
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/legend_camp_train.png[/img]{On the out skirts of %townname%, you pass a local guard force on patrol. You over hear them talking about a camp they came upon where they found everyone slaughtered... Something about how they were all caught unaware because they had no one on patrol.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Scouting unlocked in camp.",
					function getResult( _event )
					{
						this.World.Tags.set("HasLegendCampScouting", true);
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
