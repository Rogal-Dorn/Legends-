local gt = this.getroottable();

local ver = "15.0.2.11a";
local buildName = "Bastard Blades";

gt.logInfo("Legends Mod Version " + ver + " " + buildName)

if (!("LegendMod" in gt.Const))
{
    gt.Const.LegendMod <- {};
}

gt.Const.LegendMod.Version <- "Legends Beta " + ver + " " + buildName;

// Returns -1 if Saved Version is lower than given version,
// 1 if Saved Version is higher, 0 if it is the same
gt.Const.LegendMod.compareSavedVersionTo <- function( _ver, _metaData )
{
    local savedVer = _metaData.getString("LegendsVersion");

    if (savedVer == "") return -1;

    _ver = split(_ver, ".").map(@(a) a.tointeger());
    savedVer = split(savedVer, ".").map(@(a) a.tointeger());

    foreach (i, num in _ver)
    {
        if (num > savedVer[i])
        {
            return -1;
        }
        else if (num < savedVer[i])
        {
            return 1;
        }
    }
    
    return 0;
}

gt.Const.LegendMod.getVersion <- function()
{
	return ver;
}

gt.Const.LegendMod.RequiredFiles <- {
	Sound = "",
	Patch = ""
}



