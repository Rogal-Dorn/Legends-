this.hate_nobles_event <- this.inherit("scripts/events/event", {
	m = {
		Image = "",
		Casualty = null,
		excludedTraits = [
			"fear_nobles",
			"hate_nobles",
			"dastard",
			"craven",
			"fainthearted",
			"weasel"
		]
	},
	function create()
	{
		this.m.ID = "event.hate_nobles";
		this.m.Title = "After the battle...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_26.png[/img]{You find %brother% staring moodily into the campfire, a crumpled letter clutched tightly in their hands. A single tear seems to have recently cut a path through the considerable grime on their cheek. You are not certain they are aware of you, until they speak up.%SPEECH_ON%Got a letter. Tis from my kin, dated last fall. Farkin Nobles hanged my nephew. Lad had barely seen 15 winters... 15 farking winters. Really high and mighty of His Lordship to string up a stableboy eh? Really damn noble of them and the gods!%SPEECH_OFF%The outburst leaves %brother% visibly shaking. The company around you quietly rumble sounds of condolences. Taken aback, you are just wondering whether or not to put a hand on their shoulder before %brother% quietly continues.%SPEECH_ON%All my life I\'ve scraped and bowed to those noble pricks. Paid me dues, kept me mouth shut, never crossed \'em. Truth is, reckon I was scared of \'em. But now, with the %companyname% beside me...%SPEECH_OFF%Their expression hardens and they throw the letter in the fire.%SPEECH_ON%I\'m gonna kill every noble fark I can.%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "At least they are motivated.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Casualty.getImagePath());
				local trait = this.new("scripts/skills/traits/hate_nobles_trait");
				_event.m.Casualty.getSkills().add(trait);
				this.List.push({
					id = 10,
					icon = trait.getIcon(),
					text = _event.m.Casualty.getName() + " now hates the nobility."
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

		if (this.Time.getVirtualTimeF() - this.World.Events.getLastBattleTime() > 30.0) //from 5
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

		if (this.World.Statistics.getFlags().getAsInt("LastCombatFaction") != this.World.FactionManager.getFactionOfType(this.Const.FactionType.NobleHouse).getID())
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
			if (bro.getLevel() < 3)
				return;
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
		this.m.Score = 500;
	}

	function onPrepare()
	{
		this.m.Image = "[img]gfx/ui/events/event_46.png[/img]";
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"brother",
			this.m.Casualty.getName()
		]);
		_vars.push([
			"image",
			this.m.Image
		]);
	}

	function onClear()
	{
		this.m.Casualty = null;
		this.m.Image = "";
	}

});

