::mods_registerMod("mod_tooltip_extension", 1.01, "Tooltip Extension");
::mods_queue("mod_tooltip_extension", null, function()
{
	// provides longer tooltip backgrounds and attempts to prevent tooltips from extending outside of the screen
	::mods_registerCSS("mod_tooltip_extension.css");
	::mods_registerJS("mod_tooltip_extension.js");
});
