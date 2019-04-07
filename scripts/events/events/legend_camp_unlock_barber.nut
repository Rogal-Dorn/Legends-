this.legend_camp_unlock_barber <- this.inherit("scripts/events/event", {
	m = {
		Town = null
	},
	function create()
	{
		this.m.ID = "event.legend_camp_unlock_barber";
		this.m.Title = "At %townname%";
		this.m.Cooldown = 21.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_85.png[/img]{As you approach %townname% all thoughts turn to the barber. Life on the road makes it hard to keep beard and hair in check, and everyone is looking forward to a trim. As you walk %randombrother% says %SPEECH_ON%Barbering aint so hard, we chop up more difficult things every day. I was asking the barber about it last time, and he showed me some tricks. I bet with a chair and some scissors i could at least keep the hair from matting together%SPEECH_OFF%. ",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Barbering unlocked in camp.",
					function getResult( _event )
					{
						this.World.Tags.set("HasLegendCampBarber", true);
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
		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		local towns = this.World.EntityManager.getSettlements();
		local playerTile = this.World.State.getPlayer().getTile();
		local nearTown = false;
		local town;

		foreach( t in towns )
		{


			if (t.getTile().getDistanceTo(playerTile) <= 3 && t.isAlliedWithPlayer() && !this.World.Tags.get("HasLegendCampBarber" && t.hasBuilding(building.barber)))
			{
				nearTown = true;
				town = t;
				break;
			}
		}

		if (!nearTown)
		{
			return;
		}

		this.m.Town = town;
		this.m.Score = 1;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"townname",
			this.m.Town.getName()
		]);
	}

	function onClear()
	{
		this.m.Town = null;
	}

});
