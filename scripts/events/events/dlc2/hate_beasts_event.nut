this.hate_beasts_event <- this.inherit("scripts/events/event", {
	m = {
		Image = "",
		Casualty = null,
		excludedTraits = [
			"fear_beasts",
			"hate_beasts",
			"dastard",
			"craven",
			"fainthearted",
			"weasel"
		]
	},
	function create()
	{
		this.m.ID = "event.hate_beasts";
		this.m.Title = "After the battle...";
		this.m.Cooldown = 25.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfxuieventsevent_26.png[img]{Whilst on the trail the company comes across the splintered remains of what appears to have been a small wagon, it\'s contents scattered around a large area. The debris yields nothing of value, these people were clearly poor and any supplies they might have had has since been consumed by the local wildlife. You are about to give the signal to move out when a shout calls you over to a nearby clearing. You find the normally stalwart %brother% now pale and busily puking their breakfast onto the grass.%SPEECH_ON%In there Captain, I... I found the wagon drivers.%SPEECH_OFF%You peer past some bushes. Gods, that\'s an awful sight. The corpses are heavily ravaged, but not enough to disguise the fact that four of victims were so very small. Gore, bones and clefts of human hair litter the area. It would seem something awful, nay, a pack of something awful, chased the family and overwhelmed them. You shake your head and turn away, there is nothing to be done here. You retrace your steps back past %brother%, who is somewhat dazed and muttering to themselves.%SPEECH_ON%That in there, that \'aint farkin right. I got couple o\' nieces same age as that. Farkin ripped apart...%SPEECH_OFF%You clap them on the arm and order them back to join the others. The sellsword jolts out of their reverie with a shudder, some colour returning to the cheeks. They nod.%SPEECH_ON%Aye Capt... y\'know the things that did this? I hope we find \'em. They \'aint no animals, they be monsters of evil and I\'m gonna slay as many of them as I can.", 
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "A new monster hunter is born.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Casualty.getImagePath());
				local trait = this.new("scripts/skills/traits/hate_beasts_trait");
				_event.m.Casualty.getSkills().add(trait);
				this.List.push({
					id = 10,
					icon = trait.getIcon(),
					text = _event.m.Casualty.getName() + " now hates beasts"
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

		if (this.World.Statistics.getFlags().getAsInt("LastCombatFaction") != this.World.FactionManager.getFactionOfType(this.Const.FactionType.Beasts).getID())
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
		if (this.World.Statistics.getFlags().getAsInt("LastCombatFaction") == this.World.FactionManager.getFactionOfType(this.Const.FactionType.Beasts).getID())
		{
			this.m.Image = "[img]gfx/ui/events/event_81.png[/img]";
		}
		else
		{
			this.m.Image = "[img]gfx/ui/events/event_83.png[/img]";
		}
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

