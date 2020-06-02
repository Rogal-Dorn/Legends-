this.greenskins_slayer_event <- this.inherit("scripts/events/event", {
	m = {
		Dude = null
	},
	function create()
	{
		this.m.ID = "event.crisis.greenskins_slayer";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_35.png[/img]While marching, a man crosses paths with the %companyname%. He wears light armor and carries a fine bow, he looks aloof and distant at first as if staring off at something you can\'t see. %SPEECH_ON%Evening, sellswords.%SPEECH_OFF%The warrior waves. There\'s an uncanny air to this man, as though you can barely see him while he is standing right in front of you. He nods and continues speaking.%SPEECH_ON%You seem the greenskin skinnin\' sort, and that\'s the sort of company I\'d be most agreeable to joining.%SPEECH_OFF%%randombrother% exchanges a glance with you and shrugs. He whispers his indifference.%SPEECH_ON%If he\'s a problem, we can handle him.%SPEECH_OFF%The man shakes his head.%SPEECH_ON%Oh, I\'ll be no problem. I just want to kill orcs and goblins. What more do you need to know? Once these greenskins are taken care of, I\'ll be out of your hair.%SPEECH_OFF%",
			Banner = "",
			Characters = [],
			Options = [
				{
					Text = "You might as well join us.",
					function getResult( _event )
					{
						this.World.getPlayerRoster().add(_event.m.Dude);
						this.World.getTemporaryRoster().clear();
						_event.m.Dude.onHired();
						_event.m.Dude = null;
						return 0;
					}

				},
				{
					Text = "No, thanks, we\'re good.",
					function getResult( _event )
					{
						this.World.getTemporaryRoster().clear();
						_event.m.Dude = null;
						return 0;
					}

				}
			],
			function start( _event )
			{
				local roster = this.World.getTemporaryRoster();
				_event.m.Dude = roster.create("scripts/entity/tactical/player");
				_event.m.Dude.setStartValuesEx([
					"legend_ranger_background"
				]);
				if (this.World.Assets.getOrigin().getID() == "scenario.legend_risen_legion")
				{
					_event.m.Dude.getTags().add("PlayerSkeleton");
					_event.m.Dude.getTags().add("undead");
					_event.m.Dude.getTags().add("skeleton");
					_event.m.Dude.getSkills().add(this.new("scripts/skills/racial/skeleton_racial"));
					_event.m.Dude.getSkills().add(this.new("scripts/skills/injury_permanent/legend_fleshless"));					
				}

				_event.m.Dude.getSkills().add(this.new("scripts/skills/traits/hate_greenskins_trait"));
				local necklace = this.new("scripts/items/accessory/special/slayer_necklace_item");
				necklace.m.Name = _event.m.Dude.getNameOnly() + "\'s Necklace";
				_event.m.Dude.getItems().equip(necklace);
				this.Characters.push(_event.m.Dude.getImagePath());
			}

		});
	}

	function onUpdateScore()
	{
		if (!this.World.FactionManager.isGreenskinInvasion())
		{
			return;
		}

		if (this.World.getPlayerRoster().getSize() >= this.World.Assets.getBrothersMax())
		{
			return;
		}


        local roster = this.World.getPlayerRoster().getAll()
        foreach( bro in roster)
        {
			if (bro.getBackground().getID() == "background.legend_ranger")
			{
				return
			}

			if (bro.getBackground().getID() == "background.legend_commander_ranger")
			{
				return
			}
		}

		this.m.Score = 10;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
		this.m.Dude = null;
	}

});

