this.vazl_inventor_prosthetic_ear <- this.inherit("scripts/events/event", {
	m = {
		Inventor = null,
		Nofoot = null
	},
	function create()
	{
		this.m.ID = "event.vazl_inventor_prosthetic_ear";
		this.m.Title = "During camp...";
		this.m.Cooldown = 30 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/vazl_inventor_general.png[/img]%inventor% offers to fix %nofoot%\'s ear. He asks for coin to cover the cost, and requires the use of company tools.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Alright. Here\'s 1000 crowns. Do your thing.",
					function getResult( _event )
					{
						return "B";
					}
				},
				{
					Text = "We can\'t spare resources on this right now.",
					function getResult( _event )
					{
						return "C";
					}
				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Inventor.getImagePath());
			}
		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/vazl_inventor_general.png[/img]%inventor% attaches an artificial ear to %nofoot%'s head.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Let\'s try it out!",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Inventor.getImagePath());
				this.World.Assets.addMoney(-1000);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]1000[/color] Crowns"
				});

				this.World.Assets.addArmorParts(-20);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_supplies.png",
					text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]20[/color] Tools and Supplies"
				});

				local pros_foot_trait = this.new("scripts/skills/traits/vazl_prosthetic_ear");
				_event.m.Nofoot.getSkills().add(pros_foot_trait);
				this.List.push({
						id = 10,
						icon = pros_foot_trait.getIcon(),
						text = _event.m.Nofoot.getName() + " receives a " + pros_foot_trait.getName()
				});

				local maimed_foot_bye = this.new("scripts/skills/injury_permanent/missing_ear_injury");
				_event.m.Nofoot.getSkills().removeByID("injury.missing_ear");
				this.List.push({
						id = 10,
						icon = maimed_foot_bye.getIcon(),
						text = _event.m.Nofoot.getName() + " no longer has a " + maimed_foot_bye.getName()
				});

				_event.m.Inventor.improveMood(2.0, "Created a " + pros_foot_trait.getName() + " for " + _event.m.Nofoot.getName());
				_event.m.Nofoot.improveMood(2.0, "Received a " + pros_foot_trait.getName() + " from " + _event.m.Inventor.getName());
			}
		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/vazl_inventor_general.png[/img]You tell %inventor% that the %companyname% has no resources to spare for such things at this time.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Perhaps another time.",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Inventor.getImagePath());
			}
		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local inventor_candidates = [];
		local nofoot_candidates = [];


		if (this.World.Assets.getMoney() < 2000 || this.World.Assets.getArmorParts() < 40)
		{
			return;
		}


		foreach (bro in brothers)
		{
			if (bro.getBackground().getID() == "background.vazl_inventor")
			{
				inventor_candidates.push(bro);
			}
		}
		if (inventor_candidates.len() < 1)
		{
			return;
		}
		else
		{
			this.m.Inventor = inventor_candidates[this.Math.rand(0, inventor_candidates.len() - 1)];
		}


		foreach (bro in brothers)
		{
			if (bro.getSkills().hasSkill("injury.missing_ear") && !bro.getSkills().hasSkill("trait.vazl_prosthetic_ear") && bro.getID() != this.m.Inventor.getID())
			{
				nofoot_candidates.push(bro);
			}
		}
		if (nofoot_candidates.len() < 1)
		{
			return;
		}
		else
		{
			this.m.Nofoot = nofoot_candidates[this.Math.rand(0, nofoot_candidates.len() - 1)];
		}


		this.m.Score = 5 + ((this.m.Inventor.getLevel() / this.Const.LevelXP.len()) * 10);
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"inventor",
			this.m.Inventor.getName()
		]);
		_vars.push([
			"nofoot",
			this.m.Nofoot.getName()
		]);
	}

	function onDetermineStartScreen()
	{
		return "A";
	}

	function onClear()
	{
		this.m.Inventor = null;
		this.m.Nofoot = null;
	}
});
