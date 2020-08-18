local gt = this.getroottable();

if (!("DLC" in gt.Const))
{
	gt.Const.DLC <- {};
	gt.Const.DLC.Mask <- 0;
}

if (!("Fangshire" in gt.Const.DLC) || !this.Const.DLC.Fangshire)
{
	this.Const.DLC.Fangshire <- this.hasDLC(365382);

	if (this.Const.DLC.Fangshire)
	{
		this.Const.DLC.Mask = this.Const.DLC.Mask | 1;
		this.Const.World.Assets.NewCampaignEquipment.push("scripts/items/helmets/legendary/fangshire");
	}
}

