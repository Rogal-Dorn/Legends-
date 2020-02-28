this.butcher_gives_pointers_event <- this.inherit("scripts/events/event", {
	m = {
		Butcher = null,
		Flagellant = null
	},
	function create()
	{
		this.m.ID = "event.pointers_from_butcher";
		this.m.Title = "During camp...";
		this.m.Cooldown = 50.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_38.png[/img]You find %butcher% the butcher tracing a finger along %flagellant%\'s unclothed back. He finds a point between the sinews and scars and taps it.%SPEECH_ON%Here. If you strike yourself here, the largest amount of meat - I mean muscle, I will be hit.%SPEECH_OFF%The flagellant looks up.%SPEECH_ON%Will it be painful?%SPEECH_OFF%A grin crosses the butcher\'s face.%SPEECH_ON%Oh yes, very much so.%SPEECH_OFF%It appears the man is giving the flagellant pointers on how to mark himself up. Before you can step in, %flagellant% takes up a whip and hits himself right where %butcher% had directed him to. The tendrils of leather, glass, and sharpened bone snap against the man\'s back, dig in, and then upon retrieval tear his flesh asunder.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Why the hell would you show him that?",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Butcher.getImagePath());
				this.Characters.push(_event.m.Flagellant.getImagePath());
				_event.m.Flagellant.getTags().add("pointers_from_butcher");
				_event.m.Flagellant.getBaseProperties().MeleeSkill += 2;
				_event.m.Flagellant.getSkills().update();
				this.List.push({
					id = 16,
					icon = "ui/icons/melee_skill.png",
					text = _event.m.Flagellant.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+2[/color] Melee Skill"
				});
				local injury = _event.m.Flagellant.addInjury(this.Const.Injury.Flagellation);
				this.List.push({
					id = 10,
					icon = injury.getIcon(),
					text = _event.m.Flagellant.getName() + " suffers " + injury.getNameOnly()
				});
				_event.m.Butcher.improveMood(2.0, "Took pleasure from someone else\'s pain");

				if (_event.m.Butcher.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Butcher.getMoodState()],
						text = _event.m.Butcher.getName() + this.Const.MoodStateEvent[_event.m.Butcher.getMoodState()]
					});
				}

				//Exampe code on how to do relation changes between characters
				//We use _event.m.Butcher and _event.m.Flagellant because these are the two brothers defined
				

				//the necessary values for changeActiveRelationship() are
				//	 Actor, Modifier
				//after those 2 are optional values
				//	 Table Key/What we modify, and Set
				//the default table key is "RelationNum", and set is automatically off unless you need to set a value specifically and overwrite the old one (maybe going to neutral 0 specifically etc)
				//examples below


				//for a typical event you may only use the next 3 lines and none of the commented code below

				//This has a random modifier to increase our relations
				//It changes how the Butcher views the Flagellant
				local modifier = this.Math.rand(1, 5);
				_event.m.Butcher.changeActiveRelationship( _event.m.Flagellant, modifier );

				//You can instead set a flat modifier also like so
				//This changes how the Flagellant sees the butcher
				_event.m.Flagellant.changeActiveRelationship( _event.m.Butcher, 3 );

				//Remember, [-50, 50] is the intended range of relations "steps" with each step being 10 numbers
				//So [-9, 9] is something like "they know each other", and [10, 19] is "they're starting to like each other"
				
				//Below we show how to add new key or to change a relation, but for this event it won't be used
				/*

				_event.m.Butcher.changeactiveRelationship( _event.m.Flagellant, true, "ourNewModifier" )
				_event.m.Flagellant.changeActiveRelationship( _event.m.Butcher, 13, "flagNewModifier" )
				
				*/

				//If we happen to want to set a number, not just modify it we do the following
				/*

				_event.m.Butcher.changeActiveRelationship( _event.m.Flagellant, 999, "RelationNum", true)

				*/


			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates_butcher = [];
		local candidates_flagellant = [];

		foreach( bro in brothers )
		{
			if (bro.getTags().has("pointers_from_butcher"))
			{
				continue;
			}

			if (bro.getSkills().hasSkillOfType(this.Const.SkillType.TemporaryInjury))
			{
				continue;
			}

			if (bro.getBackground().getID() == "background.butcher"|| bro.getBackground().getID() == "background.female_butcher")
			{
				candidates_butcher.push(bro);
			}
			else if (bro.getBackground().getID() == "background.flagellant" || bro.getBackground().getID() == "background.monk_turned_flagellant")
			{
				candidates_flagellant.push(bro);
			}
		}

		if (candidates_butcher.len() == 0 || candidates_flagellant.len() == 0)
		{
			return;
		}

		this.m.Butcher = candidates_butcher[this.Math.rand(0, candidates_butcher.len() - 1)];
		this.m.Flagellant = candidates_flagellant[this.Math.rand(0, candidates_flagellant.len() - 1)];
		this.m.Score = 5;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"butcher",
			this.m.Butcher.getNameOnly()
		]);
		_vars.push([
			"flagellant",
			this.m.Flagellant.getNameOnly()
		]);
	}

	function onClear()
	{
		this.m.Butcher = null;
		this.m.Flagellant = null;
	}

});

