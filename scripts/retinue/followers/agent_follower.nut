this.agent_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.agent";
		this.m.Name = "The Agent";
		this.m.Description = "The Agent has eyes and ears everywhere and will know where to go for a well-paying contract. She is also skilled at maintaining good relations with the important people of the lands. ";
		this.m.Image = "ui/campfire/agent_01";
		this.m.Cost = 2000;
		this.m.Effects = [
			"Reveals available contracts in the tooltip of settlements no matter where you are",
			"Makes good relations with any faction decay slower and bad relations recover faster"
		];
		this.m.Requirements = [
			{
				IsSatisfied = false,
				Text = "Have allied relations with a noble house or city state, and have a Eunuch, Messenger, Widow or Assassin in your company"
			}
		];
	}

	function onUpdate()
	{
		if ("RelationDecayGoodMult" in this.World.Assets.m) {
			if (this.World.Assets.getOrigin().getID() == "scenario.sato_escaped_slaves") {
				this.World.Assets.m.RelationDecayGoodMult = 1.05;
			} else {
				this.World.Assets.m.RelationDecayGoodMult = 0.9;
			}
		}
		if ("RelationDecayBadMult" in this.World.Assets.m) {
			if (this.World.Assets.getOrigin().getID() == "scenario.sato_escaped_slaves") {
				this.World.Assets.m.RelationDecayBadMult = 0.95;
			} else {
				this.World.Assets.m.RelationDecayBadMult = 1.1;
			}
		}
	}

	function onEvaluate()
	{
		local allied = false;
		local nobles = this.World.FactionManager.getFactionsOfType(this.Const.FactionType.NobleHouse);
		local hasAgent = 0;
		
		local brothers = this.World.getPlayerRoster().getAll();
		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.eunuch" || bro.getBackground().getID() == "background.messenger" || bro.getBackground().getID() == "background.assassin"  || bro.getBackground().getID() == "background.assassin_southern" || bro.getBackground().getID() == "background.female_beggar" )
			{
			hasAgent++;
			}

		}	

		foreach( n in nobles )
		{
			if (n.getPlayerRelation() >= 90.0 && hasAgent >=1)
			{
				this.m.Requirements[0].IsSatisfied = true;
				return;
			}
		}

		local citystates = this.World.FactionManager.getFactionsOfType(this.Const.FactionType.OrientalCityState);

		foreach( c in citystates )
		{
			if (c.getPlayerRelation() >= 90.0 && hasAgent >=1)
			{
				this.m.Requirements[0].IsSatisfied = true;
				return;
			}
		}
	}

});

