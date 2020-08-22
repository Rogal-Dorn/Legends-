local gt = this.getroottable();

if (!("DLC" in gt.Const))
{
	gt.Const.DLC <- {};
	gt.Const.DLC.Mask <- 0;
}

if (!("UnholdSupporter" in gt.Const.DLC) || !this.Const.DLC.UnholdSupporter)
{
	this.Const.DLC.UnholdSupporter <- this.hasDLC(986090) && this.Const.Serialization.Version >= 46;

	if (this.Const.DLC.UnholdSupporter)
	{
		this.Const.DLC.Mask = this.Const.DLC.Mask | 8;
		this.Const.PlayerBanners.push("banner_23");
	}
}

