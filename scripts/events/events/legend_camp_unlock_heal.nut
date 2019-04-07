this.legend_camp_unlock_heal <- this.inherit("scripts/events/event", {
	m = {
	Injured = null
	},
	function create()
	{
		this.m.ID = "event.legend_camp_unlock_heal";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 1.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/legend_camp_heal.png[/img]You notice %hurtbrother% wincing in pain from the fight, the mercenary says its fine, but you can see they should be lying down to heal.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Healing unlocked in camp",
					function getResult( _event )
					{
						this.World.Tags.set("HasLegendCampHeal", true);
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
	local candidates = [];
	if(!this.World.Tags.get("HasLegendCampHeal"))
		{
			local brothers = this.World.getPlayerRoster().getAll();
			foreach( bro in brothers )
			{
				if (bro.getHitpoints() < bro.getHitPointsMax() )
				{
					candidates.push(bro);
				}
			}
			if (candidates.len() == 0)
			{
				return;
			}
			this.m.Injured = candidates[this.Math.rand(0, candidates.len() - 1)];

		}
		this.m.Score = candidates.len() * 10;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"hurtbrother",
			this.m.Injured.getName()
		]);
	}

	function onClear()
	{
	this.m.Injured = null;
	}

});
