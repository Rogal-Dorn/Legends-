if (::mods_getRegisteredMod("mod_msu") == null)
{
	::MSU.Popup.forceQuit(true);
	::MSU.Popup.showRawText("ERROR: Legends Requires Modding Standards & Utilities (MSU) to function.<br>Get MSU from Nexusmods (https://www.nexusmods.com/battlebrothers/mods/479)")
}