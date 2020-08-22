local gt = this.getroottable();

if (!("DLC" in gt.Const))
{
	gt.Const.DLC <- {};
	gt.Const.DLC.Mask <- 0;
}

if (!("DesertSupporter" in gt.Const.DLC) || !this.Const.DLC.DesertSupporter)
{
	this.Const.DLC.DesertSupporter <- this.hasDLC(1362330) && this.Const.Serialization.Version >= 63;

	if (this.Const.DLC.DesertSupporter)
	{
		this.Const.DLC.Mask = this.Const.DLC.Mask | 128;
		this.Const.PlayerBanners.push("banner_31");
	}
}

