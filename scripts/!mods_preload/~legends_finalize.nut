if (::mods_getRegisteredMod("mod_msu") == null)
{
	::MSU.Popup.forceQuit(true);
	::MSU.Popup.showRawText("ERROR: Legends Requires Modding Standards & Utilities (MSU) to function.<br><a style=\"color: lightblue; text-decoration: underline;\"onclick=\"openURL('https://www.nexusmods.com/battlebrothers/mods/479')\">Get MSU from Nexusmods</a>")
}