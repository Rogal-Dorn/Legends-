this.camp_completed_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.camp_completed";
		this.m.Title = "Camp Stricken";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_26.png[/img]Afer a well deserved rest, the company strikes the tents and prepares for the coming day.",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Music.setTrackList(this.Const.Music.VictoryTracks, this.Const.Music.CrossFadeTime);
				this.Banner = "ui/banners/" + this.World.Assets.getBanner() + "s.png";
				this.Options = [
					{
						Text = "Time to get moving",
						function getResult( _event )
						{
							this.Music.setTrackList(this.Const.Music.WorldmapTracks, this.Const.Music.CrossFadeTime, true);
							return 0;
						}

					}
				];
				this.List = this.World.Camp.getResults();
			}

		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
	}

});
