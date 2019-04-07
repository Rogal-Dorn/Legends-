this.legend_camp_unlock_training <- this.inherit("scripts/events/event", {
	m = {
		Town = null
	},
	function create()
	{
		this.m.ID = "event.legend_camp_unlock_training";
		this.m.Title = "At %townname%";
		this.m.Cooldown = 21.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/legend_camp_train.png[/img]{As you approach %townname% the talk is of the training hall. Each mercenary claims they are more skilled than the next, and will prove it in the training hall. Some claim they are more skilled than the trainer himself.  As you walk %randombrother% says %SPEECH_ON%Each time we come here I talk to the trainer. It dont take much to train, the weight of your body and some sticks is enough. I bet we could train ourselves and save some coin.%SPEECH_OFF% ",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Training unlocked in camp.",
					function getResult( _event )
					{
						this.World.Tags.set("HasLegendCampTraining", true);
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


			if (t.getTile().getDistanceTo(playerTile) <= 3 && t.isAlliedWithPlayer() && !this.World.Tags.get("HasLegendCampTraining" && t.hasBuilding(building.training_hall)))
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
