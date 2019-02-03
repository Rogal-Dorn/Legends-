local gt = this.getroottable();

gt.Const.World.SettingsUpdate <- function (_settings)
{
	this.Const.World.Settings.SizeX = _settings.Width
	this.Const.World.Settings.SizeY = _settings.Height
	this.Const.World.Settings.LandMassMult = _settings.LandMassMult
	this.Const.World.Settings.WaterConnectivity = _settings.WaterConnectivity
	this.Const.World.Settings.MinLandToWaterRatio = _settings.MinLandToWaterRatio
	this.Const.World.Settings.Snowline = _settings.Snowline
	//Vision = 500.0
};
