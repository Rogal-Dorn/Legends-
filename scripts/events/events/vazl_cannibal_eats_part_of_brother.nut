this.vazl_cannibal_eats_part_of_brother <- this.inherit("scripts/events/event", {
	m = {
		Cannibal = null,
		Dinner = null
	},
	function create()
	{
		this.m.ID = "event.vazl_cannibal_eats_part_of_brother";
		this.m.Title = "At night...";
		this.m.Cooldown = 60 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/vazl_cannibal_eats_part_of_brother.png[/img]%cannibal% eats part of %dinner%.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Gross!",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
				local potential = [];
				local injuries = this.Const.Injury.Cannibal;
				foreach (inj in injuries)
				{
					if (inj.ID == "injury.missing_hand" && !_event.m.Dinner.getSkills().hasSkill("injury.missing_hand") && !_event.m.Dinner.getSkills().hasSkill("trait.vazl_prosthetic_hand"))
					{
						potential.push(inj);
					}
					else if (inj.ID == "injury.missing_eye" && !_event.m.Dinner.getSkills().hasSkill("injury.missing_eye") && !_event.m.Dinner.getSkills().hasSkill("trait.vazl_glass_eye"))
					{
						potential.push(inj);
					}
					else if (inj.ID != "injury.missing_hand" && inj.ID != "injury.missing_eye" && !_event.m.Dinner.getSkills().hasSkill(inj.ID))
					{
						potential.push(inj);
					}
				}
				if (potential.len() == 0)
				{
					_event.m.Cannibal.improveMood(1.0, "Enjoyed a good meal");
					_event.m.Dinner.worsenMood(3.0, "Got partially eaten by " + _event.m.Cannibal.getName());
				}
				else
				{
					local cannibal_injury = this.new("scripts/skills/" + potential[this.Math.rand(0, potential.len() - 1)].Script);
					_event.m.Dinner.getSkills().add(cannibal_injury);
					this.List.push({
							id = 10,
							icon = cannibal_injury.getIcon(),
							text = _event.m.Dinner.getName() + " suffers " + cannibal_injury.getName()
					});
					_event.m.Cannibal.improveMood(2.0, "Enjoyed a good meal");
					_event.m.Dinner.worsenMood(4.0, "Got partially eaten by " + _event.m.Cannibal.getName());
				}

				this.Characters.push(_event.m.Dinner.getImagePath());
			}
		});
	}

	function onUpdateScore()
	{
		this.logInfo("Cannibal eats part of brother  --  onUpdateScore");
		local brothers = this.World.getPlayerRoster().getAll();
		local cannibal_candidates = [];
		local dinner_candidates = [];


		if (this.World.Assets.getFood() > 0)
		{
			return;
		}
		if (this.World.getTime().IsDaytime)
		{
			return;
		}


		foreach (bro in brothers)
		{
			if (bro.getBackground().getID() == "background.vazl_cannibal")
			{
				cannibal_candidates.push(bro);
			}
		}
		if (cannibal_candidates.len() < 1)
		{
			return;
		}
		else
		{
			this.m.Cannibal = cannibal_candidates[this.Math.rand(0, cannibal_candidates.len() - 1)];
		}


		foreach (bro in brothers)
		{
			if (bro != this.m.Cannibal)
			{
				local potential = [];
				local injuries = this.Const.Injury.Cannibal;
				foreach (inj in injuries)
				{
					if (inj.ID == "injury.missing_hand" && !bro.getSkills().hasSkill("injury.missing_hand") && !bro.getSkills().hasSkill("trait.vazl_prosthetic_hand"))
					{
						potential.push(inj);
					}
					else if (inj.ID == "injury.missing_eye" && !bro.getSkills().hasSkill("injury.missing_eye") && !bro.getSkills().hasSkill("trait.vazl_glass_eye"))
					{
						potential.push(inj);
					}
					else if (inj.ID != "injury.missing_hand" && inj.ID != "injury.missing_eye" && !bro.getSkills().hasSkill(inj.ID))
					{
						potential.push(inj);
					}
				}

				if (potential.len() == 0)
				{
					return;
				}
				else
				{
					dinner_candidates.push(bro);
				}
			}
		}
		if (dinner_candidates.len() < 1)
		{
			return;
		}
		else
		{
			this.m.Dinner = dinner_candidates[this.Math.rand(0, dinner_candidates.len() - 1)];
		}


		this.m.Score = (this.m.Cannibal.getLevel() + this.m.Dinner.getLevel()) / 4;
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
			"dinner",
			this.m.Dinner.getName()
		]);
	}

	function onDetermineStartScreen()
	{
		return "A";
	}

	function onClear()
	{
		this.m.Cannibal = null;
		this.m.Dinner = null;
	}
});
