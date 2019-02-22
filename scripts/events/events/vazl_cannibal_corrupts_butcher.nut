this.vazl_cannibal_corrupts_butcher <- this.inherit("scripts/events/event", {
	m = {
		Cannibal = null,
		Butcher = null
	},
	function create()
	{
		this.m.ID = "event.vazl_cannibal_corrupts_butcher";
		this.m.Title = "During camp...";
		this.m.Cooldown = 30 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/vazl_cannibal_corrupts_butcher.png[/img]%cannibal% corrupts %butcher%.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Okay.",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Cannibal.getImagePath());
				local cannibalistic_trait = this.new("scripts/skills/traits/vazl_cannibalistic");
				_event.m.Butcher.getSkills().add(cannibalistic_trait);
				this.List.push({
						id = 10,
						icon = cannibalistic_trait.getIcon(),
						text = _event.m.Butcher.getName() + " now enjoys forbidden meat"
				});
				_event.m.Cannibal.improveMood(2.0, "Spread the joys of cannibalism");
				_event.m.Butcher.improveMood(2.0, "Started appreciating forbidden meat");
			}
		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local cannibal_candidates = [];
		local butcher_candidates = [];


		foreach (bro in brothers)
		{
			if (bro.getBackground().getID() == "background.vazl_cannibal")
			{
				cannibal_candidates.push(bro);
			}
			if (bro.getBackground().getID() == "background.butcher" && !bro.getSkills().hasSkill("trait.vazl_cannibalistic"))
			{
				butcher_candidates.push(bro);
			}
		}
		if (cannibal_candidates.len() < 1 || butcher_candidates.len() < 1)
		{
			return;
		}


		this.m.Cannibal = cannibal_candidates[this.Math.rand(0, cannibal_candidates.len() - 1)];
		this.m.Butcher = butcher_candidates[this.Math.rand(0, butcher_candidates.len() - 1)];
		this.m.Score = 5 + (((this.m.Cannibal.getLevel() + this.m.Butcher.getLevel()) / this.Const.LevelXP.len()) * 5);
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"cannibal",
			this.m.Cannibal.getName()
		]);
		_vars.push([
			"butcher",
			this.m.Butcher.getName()
		]);
	}

	function onDetermineStartScreen()
	{
		return "A";
	}

	function onClear()
	{
		this.m.Cannibal = null;
		this.m.Butcher = null;
	}
});
