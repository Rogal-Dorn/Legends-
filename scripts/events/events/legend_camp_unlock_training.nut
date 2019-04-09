this.legend_camp_unlock_training <- this.inherit("scripts/events/event", {
	m = {
		TownName = ""
	},
	function create()
	{
		this.m.ID = "event.legend_camp_unlock_training";
		this.m.Title = "At %townname%";
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/legend_camp_train.png[/img]{As you leave %townname% the talk is of the training hall. Each mercenary claims they are more skilled than the next, and will prove it in the training hall. Some claim they are more skilled than the trainer himself.  As you walk %randombrother% says %SPEECH_ON%Each time we come here I talk to the trainer. It dont take much to train, the weight of your body and some sticks is enough. I bet we could train ourselves and save some coin.%SPEECH_OFF%}",
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
