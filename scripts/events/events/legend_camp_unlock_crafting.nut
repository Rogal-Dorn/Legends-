this.legend_camp_unlock_crafting <- this.inherit("scripts/events/event", {
	m = {
		TownName = ""
	},
	function create()
	{
		this.m.ID = "event.legend_camp_unlock_crafting";
		this.m.Title = "At %townname%";
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/legend_camp_crafting.png[/img]",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Crafting unlocked in camp.",
					function getResult( _event )
					{
						this.World.Flags.set("HasLegendCampCrafting", true);
					}

				}
			],
			function start( _event )
			{
			}

		});
	}

	function getText()
	{
		local text = "{As you approach %townname% talk turns to the taxidermist. A mercenary murmurs %SPEECH_ON%Taxidermists are strange ones, "
		text += "talking to them puts me on edge. Do we have to go there?%SPEECH_OFF%  "
		text += "The others point out the goods provided make the transactions worthwhile, "
		text += "but the mercenary continues %SPEECH_ON%Its just stitching dead things right? "
		text += "I bet i could do that, my mother showed me how to darn my socks, and stuffing dead things aint so different. %SPEECH_OFF%  "
		text += "\n\n"
		text += this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Crafting).getDescription();
		return text;
	}

	function setTownName(_v)
	{
		this.m.TownName = _v;
		this.m.Screens[0].Text += this.getText()
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
