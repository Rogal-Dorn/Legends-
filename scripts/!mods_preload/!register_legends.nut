::mods_registerMod("mod_legends", 1.0, "Legends Mod");
::mods_queue(null, null, function()
{
	::mods_registerJS("legends_assets.js");
});