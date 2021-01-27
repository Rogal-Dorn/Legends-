this.legends_village <- this.inherit("scripts/entity/world/settlement", {
	m = {
		Names = [],
		DraftLists = [],
		FemaleDraftLists = [],
		StablesLists = []
	},
	function create()
	{
		this.settlement.create();
		this.m.DefenderMult = 1.6;
		this.setDefenderSpawnList(this.Const.World.Spawn.HumanVillage);
		this.m.CombatLocation.CutDownTrees = true;
		this.m.IsMilitary = false;
	}

	function getUIBackgroundCenter()
	{
		local s = "ui/settlements/townhall_0" + this.m.Size;
		return s;
	}

	function getUIBackgroundLeft()
	{
		local s = "ui/settlements/bg_houses_0" + this.m.Size + "_left";
		return s;
	}

	function getUIBackgroundRight()
	{
		local s =  "ui/settlements/bg_houses_0" + this.m.Size + "_right";
		return s;
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
		if (this.LegendsMod.Configs().LegendWorldEconomyEnabled())
		{
			prefix ="legend_";
		}
		local s = prefix + "world_townhall_0" + this.m.Size + "_light";
		return s;
	}

	function getSpriteName()
	{
		local prefix = ""
		if (this.LegendsMod.Configs().LegendWorldEconomyEnabled())
		{
			prefix ="legend_";
		}

		local s = prefix + "world_townhall_0" + this.m.Size;

		if (this.isUpgrading())
		{
			s += "_upgrade";
		}

		return s;
	}

	//UISprite
	function getImagePath()
	{
		local s = "ui/settlement_sprites/townhall_0" + this.m.Size + ".png"
		return s;
	}

	function getHousesMin()
	{
		switch (this.m.Size)
		{
			case 1:
			 	return 1;
			case 2:
				return 2
			case 3:
				return 4
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
				return 3
			case 3:
				return 6
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
				return 2
			case 3:
				return 3
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
				return 4
			case 3:
				return 7
			default:
				return 1;
		}
	}

	function getDraftList()
	{
		local L = clone this.m.DraftLists[this.m.Size - 1];
		if (this.LegendsMod.Configs().LegendGenderEnabled())
		{
			L.extend(this.m.FemaleDraftLists[this.m.Size - 1])
		}

		return L;

	}

	function getStablesList()
	{
		return this.m.StablesLists[this.m.Size - 1];
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

