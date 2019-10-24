local gt = this.getroottable();

if (!("LegendMod" in gt.Const))
{
	gt.Const.LegendMod <- {};
}

gt.Const.LegendMod.Configs <- {
    LegendArmorsEnabled = function ()
    {
        if (!("Assets" in this.World))
        {
            return false;
        }
        if (this.World.Assets == null)
        {
            return false;
        }
        return this.World.Assets.isLegendArmor();
    },
    LegendMagicEnabled = function ()
    {
        if (!("Assets" in this.World))
        {
            return false;
        }
        if (this.World.Assets == null)
        {
            return false;
        }
        return 	this.World.Assets.isLegendMagic()
    }
}

