this.legend_inquisition_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.legend_inquisition_scenario_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
        	Text = "[img]gfx/ui/events/event_68.png[/img]A dark fog reigns over these lands. Petty nobility controlled by the whispers of corrupting magics. Men driven to madness by the touch of forces beyond comprehension. As a youngling you never took the bishops word seriously, a day of seclusion in prayer ended with a return to the the charred remains of his chapel. The sin of man came apparent when you saw the bishops charred corpse paraded by a mob of peasants on top of a pike. ",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Set Forth!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.logInfo("Unlocking healing");
				this.World.Tags.set("HasLegendCampHealing", true);				
			}
		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
		this.m.Title = "The Inquisition";
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"home",
			this.World.Tags.get("HomeVillage")
		]);
	}

	function onClear()
	{
	}

});