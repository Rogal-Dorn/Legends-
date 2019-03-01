this.vazl_vala_recruitment <- this.inherit("scripts/events/event", {
	m = {
		Vala = null,
		Town = null
	},
	function create()
	{
		this.m.ID = "event.vazl_vala_recruitment";
		this.m.Title = "Somewhere around %townname%...";
		this.m.Cooldown = 30 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/vazl_vala_recruitment.png[/img]You run into a mysterious staff-wielding woman.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Welcome to the %companyname%.",
					function getResult( _event )
					{
						this.World.getPlayerRoster().add(_event.m.Vala);
						this.World.getTemporaryRoster().clear();
						_event.m.Vala.onHired();
						return 0;
					}
				},
				{
					Text = "We\'d rather not take you in.",
					function getResult( _event )
					{
						this.World.getTemporaryRoster().clear();
						return 0;
					}
				}
			],
			function start( _event )
			{
				local roster = this.World.getTemporaryRoster();
				_event.m.Vala = roster.create("scripts/entity/tactical/player");
				_event.m.Vala.setStartValuesEx(["vazl_vala_background"]);
				this.Characters.push(_event.m.Vala.getImagePath());
			}
		});
	}

	function onUpdateScore()
	{
		
		if (this.World.getPlayerRoster().getSize() >= this.World.Assets.getBrothersMax())
		{
			return;
		}



		local towns = this.World.EntityManager.getSettlements();
		local nearTown = false;
		local town;
		local playerTile = this.World.State.getPlayer().getTile();
		foreach (t in towns)
		{
			if (t.getTile().getDistanceTo(playerTile) <= 500)
			{
				nearTown = true;
				town = t;
				break;
			}
		}
		if (!nearTown)
		{
			return;
		}


		local brothers = this.World.getPlayerRoster().getAll();
		local totalbrothers = 0;
		local brotherlevels = 0;
		foreach (bro in brothers)
		{
			if (bro.getBackground().getID() == "background.vazl_vala")
			{
				return;
			}
			if (bro.getBackground().getID() == "background.legend_commander_witch")
			{
				return;
			}
			if (bro.getBackground().getID() == "background.legend_witch")
			{
				return;
			}
			totalbrothers += 1;
			brotherlevels += bro.getLevel();
		}
		if (totalbrothers < 1 || brotherlevels < 1)
		{
			return;
		}


		this.m.Town = town;
		this.m.Score = 15 + (((brotherlevels / totalbrothers) / this.Const.LevelXP.len()) * 15);
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"townname",
			this.m.Town.m.Name
		]);
	}

	function onClear()
	{
		this.m.Vala = null;
		this.m.Town = null;
	}
});
