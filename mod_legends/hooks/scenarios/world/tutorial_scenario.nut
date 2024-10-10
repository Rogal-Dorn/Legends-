::mods_hookExactClass("scenarios/world/tutorial_scenario", function(o) {

	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Name = "(Tutorial)";
		this.m.Order = 2;
		this.m.StartingBusinessReputation = 100;
		this.setRosterReputationTiers(this.Const.Roster.createReputationTiers(this.m.StartingBusinessReputation));
	}

	o.onSpawnAssets = function()
	{
		// i'm not sure how to hook this bit, so whoever wants to help
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 3; i = ++i )
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();
			bro.worsenMood(0.5, "Lost most of the company");

			while (names.find(bro.getNameOnly()) != null)
			{
				bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
			}

			names.push(bro.getNameOnly());
		}

		local bros = roster.getAll();
		bros[0].setStartValuesEx([
			"companion_1h_background"
		]);
		bros[0].setPlaceInFormation(3);
		bros[1].setStartValuesEx([
			"companion_2h_background"
		]);
		bros[1].setPlaceInFormation(4);
		bros[2].setStartValuesEx([
			"companion_ranged_background"
		]);
		bros[2].setPlaceInFormation(5);

		this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.m.Money = this.World.Assets.m.Money * 2;
	}
});
