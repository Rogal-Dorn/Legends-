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

