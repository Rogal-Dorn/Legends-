if (::mods_getRegisteredMod("mod_msu") == null)
{
	::MSU.Popup.forceQuit(true);
	::MSU.Popup.showRawText("ERROR: Legends Requires Modding Standards & Utilities (MSU) to function.<br>Get MSU from Nexusmods (https://www.nexusmods.com/battlebrothers/mods/479)")
}

local missing = [];

if (!::Const.DLC.Lindwurm) missing.push("Lindwurm");
if (!::Const.DLC.Unhold) missing.push("Beasts & Exploration");
if (!::Const.DLC.Wildmen) missing.push("Warriors of the North");
if (!::Const.DLC.Desert) missing.push("Blazing Deserts");
if (!::Const.DLC.Paladins) missing.push("Of Flesh and Faith");

if (missing.len() != 0)
{
	::MSU.Popup.forceQuit(true);
	local text = missing.reduce(@(_a, _b) _a + ", " + _b);
	::MSU.Popup.showRawText("ERROR: Legends requires all DLC to function.<br><br>Missing DLC" + (missing.len() == 1 ? "" : "s") + ": " + text);
}