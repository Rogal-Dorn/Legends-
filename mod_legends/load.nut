// load config folder
foreach (file in ::IO.enumerateFiles("mod_legends/config"))
{
	::include(file);
}

// load query folder
foreach (file in ::IO.enumerateFiles("mod_legends/system"))
{
	::include(file);
}

// load register folder
foreach (file in ::IO.enumerateFiles("mod_legends/register"))
{
	::include(file);
}

// load hooks folder
foreach (file in ::IO.enumerateFiles("mod_legends/hooks"))
{
	::include(file);
}