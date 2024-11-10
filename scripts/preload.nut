this.include("scripts/tools/weak_table_ref");
local gt = this.getroottable();
gt.Const <- {};
local scriptsPath = "scripts/";
local scriptsConfigPath = "scripts/config/";
local scriptsDLCInitPath = "scripts/dlc/";
local priorityScriptFiles = [
	scriptsConfigPath + "global",
	scriptsConfigPath + "ui",
	scriptsConfigPath + "strings",
	scriptsConfigPath + "character_names",
	scriptsConfigPath + "spawnlist_master"
];

foreach( scriptFile in priorityScriptFiles )
{
	::logInfo("loading: " + scriptFile);
	this.include(scriptFile);
}

local configScriptFiles = this.IO.enumerateFiles(scriptsConfigPath);

foreach( configScriptFile in configScriptFiles )
{
	if (priorityScriptFiles.find(configScriptFile) == null)
	{
		::logInfo("loading: " + configScriptFile);
		this.include(configScriptFile);
	}
}

local dlcInitScriptFiles = this.IO.enumerateFiles(scriptsDLCInitPath);

if (dlcInitScriptFiles != null)
{
	foreach( dlc in dlcInitScriptFiles )
	{
		::logInfo("loading: " + dlc);
		this.include(dlc);
	}
}

local scriptFiles = this.IO.enumerateFiles(scriptsPath);

foreach( scriptFile in scriptFiles )
{
	::logInfo("loading: " + scriptFile);
	this.include(scriptFile);
}

