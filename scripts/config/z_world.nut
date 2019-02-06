local gt = this.getroottable();

gt.Const.World.SettingsUpdate <- function (_settings)
{
	this.Const.World.Settings.SizeX = _settings.Width
	this.Const.World.Settings.SizeY = _settings.Height
	this.Const.World.Settings.LandMassMult = _settings.LandMassMult
	this.Const.World.Settings.WaterConnectivity = _settings.WaterConnectivity
	this.Const.World.Settings.MinLandToWaterRatio = _settings.MinLandToWaterRatio
	this.Const.World.Settings.Snowline = _settings.Snowline
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


gt.Const.World.NewCampaignOpts <- function ()
{
	return {
		Width = this.Const.World.Settings.SizeX,
		WidthMin = 60,
		WidthMax = 260,
		Height = this.Const.World.Settings.SizeY,
		HeightMin = 60,
		HeightMax = 260,
		LandMassMult = this.Const.World.Settings.LandMassMult * 100 - 100,
		LandMassMultMin = 1,
		LandMassMultMax = 100,
		WaterConnectivity = this.Const.World.Settings.WaterConnectivity,
		WaterConnectivityMin = 1,
		WaterConnectivityMax = 100,
		MinLandToWaterRatio = this.Const.World.Settings.MinLandToWaterRatio * 10,
		MinLandToWaterRatioMin = 1,
		MinLandToWaterRatioMax = 50,
		Snowline = this.Const.World.Settings.Snowline * 100,
		SnowlineMin = 1,
		SnowlineMax = 100,
		NumSettlements = 19,
		NumSettlementsMax = 60,
		NumSettlementsMin = 6
		NumFactions = 3,
		NumFactionsMin = 1,
		NumFactionsMax = 23,
		FOW = true
	}
}
