local gt = this.getroottable();

if (!("DLC" in gt.Const))
{
	gt.Const.DLC <- {};
	gt.Const.DLC.Mask <- 0;
}

if (!("WildmenSupporter" in gt.Const.DLC) || !this.Const.DLC.WildmenSupporter)
{
	this.Const.DLC.WildmenSupporter <- this.hasDLC(1067750) && this.Const.Serialization.Version >= 48;

	if (this.Const.DLC.WildmenSupporter)
	{
		this.Const.DLC.Mask = this.Const.DLC.Mask | 32;
		this.Const.PlayerBanners.push("banner_26");
	}
}

