this.legends_coast_fort <- this.inherit("scripts/entity/world/settlement", {
	m = {
		Names = [],
		DraftLists = [],
		StablesLists = []
	},
	function create()
	{
		this.settlement.create();
		this.m.IsMilitary = true;
	}

	function getUIBackgroundCenter()
	{
		return  "ui/settlements/stronghold_0" + this.m.Size;
	}

	function getUIBackgroundLeft()
	{
		return "ui/settlements/bg_houses_0" + this.m.Size + "_left";
	}

	function getUIBackgroundRight()
	{
		return "ui/settlements/bg_houses_0" + this.m.Size + "_right";
	}

	function getUIRampPathway()
	{
		switch (this.m.Size)
		{
			case 1:
			 	return "ui/settlements/ramp_01_planks";
			case 2:
				return "ui/settlements/ramp_01_planks";
			case 3:
				return "ui/settlements/ramp_01_cobblestone";
			default:
				return null;
		}
	}

	function getLighting()
	{
		local prefix = ""
		if (this.Const.LegendMod.Configs.LegendWorldEconomyEnabled())
		{
			prefix ="legend_";
		}
		return prefix + "world_stronghold_0" + this.m.Size + "_light";
	}

	function getSpriteName()
	{
		local prefix = ""
		if (this.Const.LegendMod.Configs.LegendWorldEconomyEnabled())
		{
			prefix ="legend_";
		}
		return prefix + "world_stronghold_0" + this.m.Size;
	}

	//UISprite
	function getImagePath()
	{
		return "ui/settlement_sprites/stronghold_0" + this.m.Size + ".png"
	}

	function getHousesMin()
	{
		switch (this.m.Size)
		{
			case 1:
			 	return 1;
			case 2:
				return 2;
			case 3:
				return 3;
			default:
				return 1;
		}
	}

	function getHousesMax()
	{
		switch (this.m.Size)
		{
			case 1:
			 	return 2;
			case 2:
				return 3;
			case 3:
				return 4;
			default:
				return 1;
		}
	}

	function getHousesType()
	{
		switch (this.m.Size)
		{
			case 1:
			 	return 1;
			case 2:
				return 2;
			case 3:
				return 3;
			default:
				return 1;
		}
	}

	function getAttachedLocationsMax()
	{
		switch (this.m.Size)
		{
			case 1:
			 	return 3;
			case 2:
				return 4;
			case 3:
				return 5;
			default:
				return 1;
		}
	}

	function getDraftList()
	{
		return this.m.DraftLists[this.m.Size - 1];
	}

	function getStablesList()
	{
		return this.m.DraftLists[this.m.Size - 1];
	}

	function onBuild( _settings )
	{
		switch (this.m.Size)
		{
			case 1:
				return this.onBuildOne(_settings);
			case 2:
				return this.onBuildTwo(_settings);
			case 3:
				return this.onBuildThree(_settings);
		}
	}

});

