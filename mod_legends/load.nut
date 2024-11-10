if (!("LegendMod" in ::Const)) {
	::Const.LegendMod <- {}
}

// load config folder
foreach (file in ::IO.enumerateFiles("mod_legends/!!!config")) {
	::logInfo("including: " + file);
	::include(file);
}
foreach (file in ::IO.enumerateFiles("mod_legends/!!config")) {
	::logInfo("including: " + file);
	::include(file);
}
foreach (file in ::IO.enumerateFiles("mod_legends/!config")) {
	::logInfo("including: " + file);
	::include(file);
}
foreach (file in ::IO.enumerateFiles("mod_legends/config")) {
	::logInfo("including: " + file);
	::include(file);
}

// load query folder
foreach (file in ::IO.enumerateFiles("mod_legends/system"))
{
	::logInfo("including: " + file);
	::include(file);
}

// load register folder
foreach (file in ::IO.enumerateFiles("mod_legends/register"))
{
	::logInfo("including: " + file);
	::include(file);
}

// load hooks folder
foreach (file in ::IO.enumerateFiles("mod_legends/hooks"))
{
	::logInfo("including: " + file);
	::include(file);
}
