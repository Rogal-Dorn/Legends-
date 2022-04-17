::Const.LegendMod.addSettings <- function()
{
	local map = ::MSU.Class.SettingsPage("Map Options");
	::Legends.Mod.ModSettings.addPage(map);

	local function addSetting(_page, _setting, _description);
	{
		_setting.setDescription(_description);
		_page.add(_setting);
	}
	local function addNCSetting( _page, _setting, _description )
	{
		_setting.addFlags("NewCampaign", "NewCampaignOnly");
		addSetting(_page, _setting, _description);
	}

	addNCSetting(map, ::MSU.Class.RangeSetting("landRatio", 50, 45, 80, 1, "Land Mass Ratio"), "Minimum land to water ratio for an acceptable map. Default is 50. Going either extremes on this slider can result in map never getting generated.");
	addNCSetting(map, ::MSU.Class.RangeSetting("water", 38, 28, 48, 1, "Water"), "Impacts how much of the map is water. Small value results in patchy water around the corners of the map. Larger numbers can create a single large island given a low enough land mass ratio.");
	addNCSetting(map, ::MSU.Class.RangeSetting("snow", 85, 75, 95, 1, "Snowline"), "Determines where the snowline is generated. Default is 90. This value is inverted. A value of 10 would mean the top 90% of the map is snow.");
	addNCSetting(map, ::MSU.Class.RangeSetting("settlements", 27, 19, 50, 1, "Settlements"), "Maximum number of settlements. Depending on map size, this will try to add the number of settlements on the slider. It will keep the same ratio of settlement types as default Battle Brothers maps. Minimum distance between settlements is 12 tiles.");
	addNCSetting(map, ::MSU.Class.RangeSetting("factions", 3, 1, 6, 1, "Factions"), "Maximum number of Factions to try and generate. Depending on map size, this may not add all the factions on the slider.");

	addNCSetting(map, ::MSU.Class.BooleanSetting("FOW", true, "Unexplored Map"), "An optional way to play the game where the map is entirely unexplored and not visible to you at the start of your campaign. You\'ll have to discover everything on your own, which makes your campaign more difficult, but potentially also more exciting.\n\nRecommended only for experienced players that know what they\'re doing.");
	addNCSetting(map, ::MSU.Class.BooleanSetting("stackCitadels", false, "Decked Out Citadels"), "If enabled, every Citadel will start with all those building attachments map scummers are re-rolling for.");
	addNCSetting(map, ::MSU.Class.BooleanSetting("allTradeLocations", false, "All trade buildings available"), "If enabled, ensures there is at least one of each trade location building on the map.");
	addNCSetting(map, ::MSU.Class.BooleanSetting("debugMap", false, "(Debug) Show Entire Map"), "If enabled, the map will start completely revealed and all enemies and camps will be visible.");

	local config = ::MSU.Class.SettingsPage("New Campaign");
	::Legends.Mod.ModSettings.addPage(config);

	addNCSetting(config, ::MSU.Class.EnumSetting("genderEquality", "All", ["Disabled", "Specific", "All"]), "TODO", "Battle Sisters");
	addNCSetting(config, ::MSU.Class.BooleanSetting("perkTrees", true, "Dynamic Perks"), "If enabled, all recruits for hire will have a unique perk tree including new Legends perks. \n\n Detail: Dynamic perk trees are half determined by background, and half randomly chosen from perk groups. Perk groups align around a theme, and you can see hints about the perks of potential recruits in their background description. Recruits will also have their stats and talents modifed to align with their new perks");
	addNCSetting(config, ::MSU.Class.BooleanSetting("unlayeredArmor", false, "Unlayered Armor[LEGACY]"), "[color=" + this.Const.UI.Color.NegativeValue + "]LEGACY OPTION, NOT RECOMMENDED.[/color]\n\nIn Legends, armor is arranged in layers, hundreds of pieces combine into millions of visual combinations. \n\n Detail: Armor is made up of a base cloth layer, chain, plate, tabard, cloak, attachment and finally a rune layer.\n\nHelmet is made up of a base hood layer, helmet layer, top layer, vanity layer and finally a rune layer.\n\nEach layer can be upgraded individually, allowing flexible armor builds and aesthetics\n\nIf this option is checked, layered armor is disabled.");
	addNCSetting(config, ::MSU.Class.BooleanSetting("distanceScaling", true, "Distance Scaling"), "If enabled, enemies will be stronger the further they spawn from civilization. \n\n Detail: Begins at 14 tiles from the nearest town, enemies spawned at 28 tiles will be twice as strong. \n\n This is in addition to other difficulty settings.");
	addNCSetting(config, ::MSU.Class.BooleanSetting("skipCamp", true, "Skip Camp Tutorial"), "If disabled, you will gradually unlock camping activities by visiting towns. Useful for first playthroughs. \n\n Detail: skips the camp unlock events and ambition, you still need to buy upgrades.");
	addNCSetting(config, ::MSU.Class.BooleanSetting("recruitScaling", true, "Recruit Scaling"), "If enabled, new recruits will gain levels based on the levels in your party and your renown in the world. \n\n  Details: The maximum level of recruits is increased by half the average level of mercs in your company, averaged with your reputation divided by 1,000. \n\n For example: if your company were all level 10, and your renown was 10,000, new recruits could gain up to 7 levels rounded down. \n\n This in addition to normal recruit level variance.");
	addNCSetting(config, ::MSU.Class.BooleanSetting("bleedKiller", true, "Bleeds Count As Kills"), "If enabled, kills by bleeding out are granted to the actor who caused the bleed.");
	addNCSetting(config, ::MSU.Class.BooleanSetting("worldEconomy", true, "World Economy"), "If enabled, Settlements will actively trade items and resources and can grow or decline in value \n\n  Details: The value of a settlement is now a dynamic value that grows and declines with caravan arrivals and departures, contracts fullfilled or failed, good or bad settlement events. \n\n The value of the settlement determines how valuable the caravans it creates are, as well as the strength of local militia. \n\n Very prosperous settlements will continue to grow and potentialy add new locations.");
	addNCSetting(config, ::MSU.Class.BooleanSetting("craftingUnlocked", false, "All Crafting Recipes Unlocked"), "If enabled, all crafting recipes will be visible at the taxidermist and camp crafting. If disabled, vanilla behavior of having to discover the ingredients first will be enforced.");

	addNCSetting(config, ::MSU.Class.BooleanSetting("autosaveOff", false, "Disable Autosave"), "Only disable for the most masochistic playthroughs. No save will exist for the company, the game will not be automatically saved during the game or when exiting it. \n\n Harder than ironman, there can be no alt f4, the entire run must happen in one sitting.")

	local combat = ::MSU.Class.SettingsPage("Combat");
	::Legends.Mod.ModSettings.addPage(combat);

	addSetting(combat, ::MSU.Class.RangeSetting("aispeed", 1.0, 1.0, 4.0, 0.5, "AI Battle Speed"), "Increases the overall speed of all tactical engagements.");
	addSetting(combat, ::MSU.Class.BooleanSetting("enhancedTooltips", false, "Enhanced Enemy Tooltips"), "Enemy tooltips in tactical battles will show more information, like perks and statuses");
}