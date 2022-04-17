local gt = this.getroottable();

gt.Const.World.SettingsUpdate <- function (_settings)
{
	local landwaterratio = 1.6;
	local desert = 2000

	this.Const.World.Settings.LandMassMult = 1.0 + ::Legends.Mod.ModSettings.getSetting("landRatio").getValue();
	this.Const.World.Settings.WaterConnectivity = ::Legends.Mod.ModSettings.getSetting("water").getValue();
	this.Const.World.Settings.MinDesertTiles = desert
	this.Const.World.Settings.Snowline = ::Legends.Mod.ModSettings.getSetting("snowline").getValue();

	this.Const.World.Settings.SizeX = _settings.Width;
	this.Const.World.Settings.SizeY = _settings.Height;
};


gt.Const.World.SettlementsUpdate <- function (_val)
{
	local total = 0.0
	foreach(s in gt.Const.World.Settlements.Master)
	{
		total = total + s.Amount;
	}

	foreach(s in gt.Const.World.Settlements.Master)
	{
		s.Percentage <- s.Amount / total;
		s.Amount = Math.ceil(_val * (s.Amount / total));
	}
};


gt.Const.World.Settlements.LegendsWorldMaster <- [
	{
		Ratio = 0.20,
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
		Ratio = 0.50,
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
		Ratio = 0.30,
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
	},
	{
		Ratio = 0.0,
		Types = Const.World.Settlements.Legends_citystates,
		IgnoreSide = true,
		AdditionalSpace = 13,
		Sizes = [
			{
				Ratio = 10,
				MinAmount = 3,
				Size = 3
			}
		]
	}
];

gt.Const.World.NewCampaignOpts <- function ()
{
	return {
		Width = this.Const.World.Settings.SizeX,
		WidthMin = this.Const.World.Settings.SizeX,
		WidthMax = this.Const.World.Settings.SizeX,
		Height = this.Const.World.Settings.SizeY,
		HeightMin = this.Const.World.Settings.SizeY,
		HeightMax = this.Const.World.Settings.SizeY,
		LandMassMult = 50, //this.Const.World.Settings.LandMassMult * 100 - 100,
		LandMassMultMin = 45,
		LandMassMultMax = 80,
		WaterConnectivity = 38, //this.Const.World.Settings.WaterConnectivity - 36,
		WaterConnectivityMin = 28,
		WaterConnectivityMax = 48,
		MinLandToWaterRatio = 7, //this.Const.World.Settings.MinLandToWaterRatio * 10,
		MinLandToWaterRatioMin = 5,
		MinLandToWaterRatioMax = 9,
		Snowline = 0.85 * 100,
		SnowlineMin = 75,
		SnowlineMax = 95,
		NumSettlements = 27,
		NumSettlementsMax = 50,
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