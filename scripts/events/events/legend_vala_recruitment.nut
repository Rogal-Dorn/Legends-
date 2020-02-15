this.legend_vala_recruitment <- this.inherit("scripts/events/event", {
	m = {
		Vala = null,
		Town = null
	},
	function create()
	{
		this.m.ID = "event.legend_vala_recruitment";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 60 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/legend_vala_recruitment.png[/img]You run into a mysterious staff-wielding woman.",
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
						_event.m.Vala = null;
						return 0;
					}
				},
				{
					Text = "We\'d rather not take you in.",
					function getResult( _event )
					{
						this.World.getTemporaryRoster().clear();
						_event.m.Vala = null;
						return 0;
					}
				}
			],
			function start( _event )
			{
				local roster = this.World.getTemporaryRoster();
				_event.m.Vala = roster.create("scripts/entity/tactical/player");
				if (this.World.Assets.getOrigin().getID() == "scenario.legend_risen_legion")
				{
					_event.m.Vala.getTags().add("PlayerSkeleton");
					_event.m.Vala.getTags().add("undead");
					_event.m.Vala.getTags().add("skeleton");
				}	
				_event.m.Vala.setStartValuesEx(["legend_vala_background"]);
				_event.m.Vala.getSkills().add(this.new("scripts/skills/racial/skeleton_racial"));
				_event.m.Vala.getSkills().add(this.new("scripts/skills/injury_permanent/legend_fleshless"));	
			
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

		if (this.World.Assets.getOrigin().getID() == "scenario.legend_risen_legion")
		{
			return;
		}

		local towns = this.World.EntityManager.getSettlements();
		local nearTown = false;
		local town;
		local playerTile = this.World.State.getPlayer().getTile();

		foreach (t in towns)
		{
			if (t.getTile().getDistanceTo(playerTile) <= 7 && !t.isIsolatedFromRoads())
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

		if (playerTile.SquareCoords.Y < this.World.getMapSize().Y * 0.7)
		{
			return;
		}

		if (!this.Const.LegendMod.Configs.LegendMagicEnabled())
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();
		local totalbrothers = 0;
		local brotherlevels = 0;
		foreach (bro in brothers)
		{
			if (bro.getBackground().getID() == "background.legend_vala")
			{
				return;
			}
			if (bro.getBackground().getID() == "background.legend_commander_vala")
			{
				return;
			}
			totalbrothers += 1;
			brotherlevels += bro.getLevel();
		}

		if (totalbrothers < 1 || brotherlevels < 30)
		{
			return;
		}


		this.m.Town = town;
		this.m.Score = 20.0 + ((brotherlevels / totalbrothers * 10.00) / this.Const.LevelXP.len());
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
		this.m.Vala = null;
		this.m.Town = null;
	}
});
