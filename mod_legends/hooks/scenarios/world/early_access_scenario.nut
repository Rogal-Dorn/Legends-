::mods_hookExactClass("scenarios/world/early_access_scenario", function(o) {

	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Name = "(Tutorial)";
		this.m.Order = 1;
	}

	local onSpawnAssets = o.onSpawnAssets;
	o.onSpawnAssets = function()
	{
		onSpawnAssets();
		local bros = this.World.getPlayerRoster().getAll();
		foreach (bro in bros)
		{
			bro.setVeteranPerks(2);
		}

		this.World.Assets.m.Money = (this.World.Assets.m.Money - 400) * 2;
	}
});
