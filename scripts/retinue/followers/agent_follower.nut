this.agent_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.agent";
		this.m.Name = "Messenger's Rest";
		this.m.Description = "Through setting up a network of messengers, skilled agents can be employed to deliver information that you may find of use...after a short rest, of course.";
		this.m.Image = "ui/campfire/legend_agent_01";
		this.m.Cost = 2000;
		this.m.Effects = [
			"Reveals available contracts and active situations in the tooltip of settlements no matter where you are"
		];
		this.m.Requirements = [
			{
				IsSatisfied = false,
				Text = "Have allied relations with a noble house or city state"
			},
			{
				IsSatisfied = false,
				Text = "Have at least one of the following backgrounds: Eunuch, Messenger, Assassin (Southern or Northern)"
			}
		];
	}

	function onUpdate()
	{
	}

	function onEvaluate()
	{
		local allied = false;
		local nobles = this.World.FactionManager.getFactionsOfType(this.Const.FactionType.NobleHouse);

		local availableBGs = [
			"background.eunuch",
			"background.messenger",
			"background.assassin",
			"background.assassin_southern"
		];

		local brothers = this.World.getPlayerRoster().getAll();
		foreach( bro in brothers )
		{

			local id = bro.getBackground().getID();
			if (availableBGs.find(id) != null)
			{
				this.m.Requirements[1].IsSatisfied = true;
				break;
			}

		}

		foreach( n in nobles )
		{
			if (n.getPlayerRelation() >= 90.0 )
			{
				this.m.Requirements[0].IsSatisfied = true;
				return;
			}
		}

		local citystates = this.World.FactionManager.getFactionsOfType(this.Const.FactionType.OrientalCityState);

		foreach( c in citystates )
		{
			if (c.getPlayerRelation() >= 90.0)
			{
				this.m.Requirements[0].IsSatisfied = true;
				return;
			}
		}
	}

});

