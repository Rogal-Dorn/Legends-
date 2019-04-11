this.legend_camp_unlock_crafting <- this.inherit("scripts/events/event", {
	m = {
		TownName = ""
	},
	function create()
	{
		this.m.ID = "event.legend_camp_unlock_crafting";
		this.m.Title = "At %townname%";
		this.m.Cooldown = 21.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/legend_camp_crafting.png[/img]{As you approach %townname% talk turns to the taxidermist. A mercenary murmurs %SPEECH_ON%Taxidermists are strange ones, talking to them puts me on edge. Do we have to go there?%SPEECH_OFF%  The others point out the goods provided make the transactions worthwhile, but the mercenary continues %SPEECH_ON%Its just stitching dead things right? I bet i could do that, my mother showed me how to darn my socks, and stuffing dead things aint so different. %SPEECH_OFF%  ",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Crafting unlocked in camp.",
					function getResult( _event )
					{
						this.World.Tags.set("HasLegendCampCrafting", true);
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
