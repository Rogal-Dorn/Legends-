this.fear_undead_event <- this.inherit("scripts/events/event", {
	m = {
		Casualty = null,
		excludedBackgrounds = [
			"companion",
			"crusader",
			"gravedigger",
			"graverobber",
			"wildman",
			"wildwoman",
			"hedge_knight"
		],
		excludedTraits = [
			"fear_undead",
			"hate_undead",
			"fearless",
			"brave",
			"determined",
			"bloodthirsty"
		]
	},
	function create()
	{
		this.m.ID = "event.fear_undead";
		this.m.Title = "During camp...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_26.png[/img]{%brother% looks around at the others around the campfire, then looks at the ground for a few minutes before exploding.%SPEECH_ON%Am I the only one here who is sane? How is no one else losing their farking minds over the dead walking the earth again? What the hell, where are the old gods in all this, they just farking gonna watch this shitshow?%SPEECH_OFF%The company tries to temper the fears, but %brother% goes back to a ponderous silence of a person with too much to think about and no one willing, or wanting, to truly listen.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "This is taking a toll on the company.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Casualty.getImagePath());
				local trait = this.new("scripts/skills/traits/fear_undead_trait");
				_event.m.Casualty.getSkills().add(trait);
				this.List.push({
					id = 10,
					icon = trait.getIcon(),
					text = _event.m.Casualty.getName() + " now fears the undead"
				});
			}

		});
	}

	function onUpdateScore()
	{
	if (!this.Const.DLC.Unhold)
		{
			return;
		}

		local fallen = [];
		local fallen = this.World.Statistics.getFallen();

		if (fallen.len() < 2)
		{
			return;
		}

		if (fallen[0].Time < this.World.getTime().Days || fallen[1].Time < this.World.getTime().Days)
		{
			return;
		}

		if (this.World.Statistics.getFlags().getAsInt("LastCombatFaction") != this.World.FactionManager.getFactionOfType(this.Const.FactionType.Undead).getID() && this.World.Statistics.getFlags().getAsInt("LastCombatFaction") != this.World.FactionManager.getFactionOfType(this.Const.FactionType.Zombies).getID())
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 2)
		{
			return;
		}

		local candidates = [];

		foreach( bro in brothers )
		{	
			foreach (background in this.m.excludedBackgrounds)
			{
				if (bro.getBackground().getID() == "background." + background)
					continue;
			}
			if (bro.getLevel() > 7)
				continue;

			foreach (trait in this.m.excludedTraits)
			{
				if (bro.getSkills().hasSkill("trait." + trait))
					continue;
			}
			candidates.push(bro);
		}

		if (candidates.len() == 0)
		{
			return;
		}

		this.m.Casualty = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = 50;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"brother",
			this.m.Casualty.getName()
		]);
	}

	function onClear()
	{
		this.m.Casualty = null;
	}

});

