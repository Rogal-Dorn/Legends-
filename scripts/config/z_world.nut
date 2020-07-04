local gt = this.getroottable();

gt.Const.World.SettingsUpdate <- function (_settings)
{
	this.Const.World.Settings.SizeX = _settings.Width;
	this.Const.World.Settings.SizeY = _settings.Height;
	this.Const.World.Settings.LandMassMult = _settings.LandMassMult;
	this.Const.World.Settings.WaterConnectivity = _settings.WaterConnectivity;
	if ( _settings.LandMassMult < 1.1) {
		this.Const.World.Settings.MinLandToWaterRatio = 1.0;
	} else if  ( _settings.LandMassMult < 1.2 ) {
		this.Const.World.Settings.MinLandToWaterRatio = 1.2;
	} else if  ( _settings.LandMassMult < 1.3 ) {
		this.Const.World.Settings.MinLandToWaterRatio = 1.3;
	} else if  ( _settings.LandMassMult < 1.4 ) {
		this.Const.World.Settings.MinLandToWaterRatio = 1.4;
	}
	//this.Const.World.Settings.MinLandToWaterRatio = _settings.MinLandToWaterRatio;
	this.Const.World.Settings.Snowline = _settings.Snowline;
	this.Const.World.Settings.ForestsMult <- _settings.ForestsMult;
	this.Const.World.Settings.SwampsMult <- _settings.SwampsMult;
	this.Const.World.Settings.MountainsMult <- _settings.MountainsMult;
	// this.Const.World.Settings.Vision = _settings.Vision
	//Vision = 500.0
};


gt.Const.World.SettlementsUpdate <- function (_val)
{
	foreach (s in gt.Const.World.Settlements.Master)
	{
		s.Amount = Math.ceil(_val * s.Percentage);
	}
};

local total = 0.0
foreach(s in gt.Const.World.Settlements.Master)
{
	total = total + s.Amount;
}

foreach(s in gt.Const.World.Settlements.Master)
{
	s.Percentage <- s.Amount / total;
}


gt.Const.World.Settlements.LegendsWorldMaster <- [
	{
		Ratio = 0.30,
		Types = this.Const.World.Settlements.Legends_villages_coast,
		Sizes = [
			{
				Ratio = 5,
				MinAmount = 1,
				Size = 1
			},
			{
				Ratio = 3,
				MinAmount = 1,
				Size = 2
			},
			{
				Ratio = 2,
				MinAmount = 1,
				Size = 3
			}
		]
	},
	{
		Ratio = 0.45,
		Types = Const.World.Settlements.Legends_villages,
		Sizes = [
			{
				Ratio = 5,
				MinAmount = 1,
				Size = 1
			},
			{
				Ratio = 3,
				MinAmount = 1,
				Size = 2,
			},
			{
				Ratio = 2,
				MinAmount = 2,
				Size = 3
			}
		]
	},
	{
		Ratio = 0.25,
		Types = Const.World.Settlements.Legends_fortifications,
		Sizes = [
			{
				Ratio = 5,
				MinAmount = 1,
				Size = 1
			},
			{
				Ratio = 3,
				MinAmount = 1,
				Size = 2
			},
			{
				Ratio = 2,
				MinAmount = 2,
				Size = 3
			}
		]
	}
];

gt.Const.World.NewCampaignOpts <- function ()
{
	return {
		Width = this.Const.World.Settings.SizeX,
		WidthMin = 100,
		WidthMax = 140,
		Height = this.Const.World.Settings.SizeY,
		HeightMin = 100,
		HeightMax = 140,
		LandMassMult = 40, //this.Const.World.Settings.LandMassMult * 100 - 100,
		LandMassMultMin = 1,
		LandMassMultMax = 100,
		WaterConnectivity = this.Const.World.Settings.WaterConnectivity - 34,
		WaterConnectivityMin = 1,
		WaterConnectivityMax = 8,
		MinLandToWaterRatio = this.Const.World.Settings.MinLandToWaterRatio * 10,
		MinLandToWaterRatioMin = 1,
		MinLandToWaterRatioMax = 50,
		Snowline = this.Const.World.Settings.Snowline * 100,
		SnowlineMin = 40,
		SnowlineMax = 100,
		NumSettlements = 27,
		NumSettlementsMax = 40,
		NumSettlementsMin = 19,
		NumFactions = 3,
		NumFactionsMin = 1,
		NumFactionsMax = 6//Math.min(11, this.Const.GetFactionArchetypesList().len()),
		FOW = true,
		ForestsMult = 50,
		ForestsMultMax = 100,
		ForestsMultMin = 1
		SwampsMult = 50,
		SwampsMultMax = 100,
		SwampsMultMin = 1,
		MountainsMult = 50,
		MountainsMultMax = 100,
		MountainsMultMin = 1,
		Debug = false,
		StackCitadels = false,
		AllTradeLocations = false
	}
}

gt.Const.World.LegendaryContract <-
{
	WhiteWolf = 0,
	RedSpider = 0,
	GreenSchrat = 0,
	DemonAlp = 0,
	BossHexe = 0,
	RockUnhold = 0,
	Stollwurm = 0,
	SkinGhoul = 0,
	BarbPrison = 0,
	BanditArmy = 0
}

gt.Const.World.ContractCost <-
{
	WhiteWolf = 200,
	RedSpider = 200,
	GreenSchrat = 200,
	DemonAlp = 200,
	BossHexe = 200,
	RockUnhold = 200,
	StollWurm = 200,
	SkinGhoul = 200,
	BarbPrison = 200,
	BanditArmy = 200
};