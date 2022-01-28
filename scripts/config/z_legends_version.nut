local gt = this.getroottable();

local ver = "15.0.2.7"

gt.logInfo("Legends Mod Version " + ver)


if (!("LegendMod" in gt.Const))
{
	gt.Const.LegendMod <- {};
}

gt.Const.LegendMod.Version <- "Legends Beta " + ver;
gt.Const.LegendMod.RequiredFiles <- {
	Sound = "",
	Patch = ""
}



