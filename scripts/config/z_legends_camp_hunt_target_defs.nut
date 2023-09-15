// Unfortunately we have to manually add any backgrounds that are used in TargetDefs, as there's no way to dynamically do it
// MAKE SURE ANY BACKGROUNDS ADDED IN TargetDefs IS ALSO ADDED HERE
::Const.HuntingLoot.RequiredBackgrounds <- {};
::Const.HuntingLoot.RequiredBackgrounds["background.hunter"] <- "Hunter";
::Const.HuntingLoot.RequiredBackgrounds["background.poacher"] <-	"Poacher";
::Const.HuntingLoot.RequiredBackgrounds["background.beast_slayer"] <- "Beast Slayer";
::Const.HuntingLoot.RequiredBackgrounds["background.legend_muladi"] <- "Muladí";
::Const.HuntingLoot.RequiredBackgrounds["background.barbarian"] <- "Barbarian";
::Const.HuntingLoot.RequiredBackgrounds["background.legend_berserker"] <- "Berserker";
::Const.HuntingLoot.RequiredBackgrounds["background.legend_commander_berserker"] <- "Berserker Commander";
::Const.HuntingLoot.RequiredBackgrounds["background.legend_ranger"] <- "Ranger";
::Const.HuntingLoot.RequiredBackgrounds["background.legend_commander_ranger"] <- "Ranger Commander";
::Const.HuntingLoot.RequiredBackgrounds["background.wildman"] <- "Wildman";
::Const.HuntingLoot.RequiredBackgrounds["background.wildwoman"] <- "Wildwoman";
::Const.HuntingLoot.RequiredBackgrounds["background.fisherman"] <- "Fisherman";
::Const.HuntingLoot.RequiredBackgrounds["background.nomad"] <- "Nomad";
::Const.HuntingLoot.RequiredBackgrounds["background.legend_cannibal"] <- "Cannibal";
::Const.HuntingLoot.RequiredBackgrounds["background.cultist"] <- "Cultist";
::Const.HuntingLoot.RequiredBackgrounds["background.shepherd"] <- "Shepherd";
::Const.HuntingLoot.RequiredBackgrounds["background.lindwurm_slayer"] <- "Lindwurm Slayer";
::Const.HuntingLoot.RequiredBackgrounds["background.legend_master_archer"] <- "Master Archer";
::Const.HuntingLoot.RequiredBackgrounds["background.ratcatcher"] <- "Ratcatcher";
// Foragers
::Const.HuntingLoot.RequiredBackgrounds["background.daytaler"] <- "Daytaler";
::Const.HuntingLoot.RequiredBackgrounds["background.farmhand"] <- "Farmhand";
::Const.HuntingLoot.RequiredBackgrounds["background.gravedigger"] <- "Gravedigger";
::Const.HuntingLoot.RequiredBackgrounds["background.legend_druid"] <- "Druid";
::Const.HuntingLoot.RequiredBackgrounds["background.legend_commander_druid"] <- "Druid Commander";
::Const.HuntingLoot.RequiredBackgrounds["background.legend_herbalist"] <- "Herbalist / Apothecary";
::Const.HuntingLoot.RequiredBackgrounds["background.vagabond"] <- "Vagabond";
::Const.HuntingLoot.RequiredBackgrounds["background.monk"] <- "Monk";
::Const.HuntingLoot.RequiredBackgrounds["background.legend_nun"] <- "Nun";
::Const.HuntingLoot.RequiredBackgrounds["background.anatomist"] <- "Anatomist";
::Const.HuntingLoot.RequiredBackgrounds["background.miller"] <- "Miller";

// These backgrounds will contribute to Hunt Level (and hence Hunt Tier)
// NOTE: The "ExpertHunter" Background Type defined in each background needs to be manually maintained)
::Const.HuntingLoot.ExpertHunterBackgrounds <- [
	"background.barbarian",
	"background.beast_slayer",
	"background.hunter",
	"background.legend_cannibal",
	"background.legend_commander_ranger",
	"background.legend_muladi",
	"background.legend_master_archer",
	"background.legend_ranger",
	"background.nomad",
	"background.poacher",
	"background.ratcatcher",
	"background.wildman",
	"background.wildwoman",
]

// Define the various targets that can be hunted / looted
// TODO: add all the possible targets in the design document
::Const.HuntingLoot.TargetDefs <- {

	// Foraging Loot
	Fruit = {
		Name = "Fruit",
		Text = "fruit",
		Type = "Forage",
		Difficulty = 100,
		Food = "scripts/items/supplies/legend_fresh_fruit_item",
		Cook = "scripts/items/supplies/dried_fruits_item",
	},

	Berries = {
		Name = "Roots and Berries",
		Text = "roots and berries",
		Type = "Forage",
		Difficulty = 200,
		Food = "scripts/items/supplies/roots_and_berries_item",
	},

	Herbs = {
		Name = "Herbs",
		Text = "herbs",
		Type = "Forage",
		Difficulty = 100,
		Food = "scripts/items/supplies/roots_and_berries_item", // placeholder
	},

	// Hunting Loot
	Direwolf = {
		Name = "Direwolf",
		Text = "a direwolf",
		Type = "Hunt",
		Tier = 1,
		Difficulty = 500,
		// Food = "scripts/items/supplies/legend_wolf_meat_item", // doesn't exist yet
		Food = "scripts/items/supplies/strange_meat_item",
		Cook = "scripts/items/supplies/cured_venison_item", // placeholder
		Loot = [
			[3,"scripts/items/misc/werewolf_pelt_item"], // the numbers are probability weights
			[1,"scripts/items/misc/adrenaline_gland_item"],
		],
		Backgrounds = [
			"background.hunter",
			"background.poacher",
			"background.beast_slayer",
			"background.legend_muladi",
		]
	},

	FrostUnhold = {
		Name = "Frost Unhold",
		Text = "a frost unhold",
		Type = "Hunt",
		Tier = 3,
		Difficulty = 1500,
		Food = "scripts/items/supplies/strange_meat_item",
		Cook = "scripts/items/supplies/cured_venison_item", // placeholder
		Loot = [
			[3,"scripts/items/misc/unhold_bones_item"],
			[3,"scripts/items/misc/unhold_heart_item"],
			[4,"scripts/items/misc/unhold_hide_item"],
		],
		Backgrounds = [
			"background.beast_slayer",
			"background.barbarian",
			"background.legend_ranger",
			"background.legend_commander_ranger",
			"background.legend_berserker",
			"background.legend_commander_berserker"
		]
	},

	Squirrel = {
		Name = "Squirrel",
		Text = "a squirrel",
		Type = "Hunt",
		Tier = 0,
		Difficulty = 250,
		Food = "scripts/items/supplies/legend_fresh_meat_item", // placeholder
		Cook = "scripts/items/supplies/legend_pie_item", // placeholder
	},

	Rabbit = {
		Name = "Rabbit",
		Text = "a rabbit",
		Type = "Hunt",
		Tier = 0,
		Difficulty = 250,
		Food = "scripts/items/supplies/legend_fresh_meat_item", // placeholder
		Cook = "scripts/items/supplies/legend_pie_item", // placeholder
	},

	Deer = {
		Name = "Deer",
		Text = "a deer",
		Type = "Hunt",
		Tier = 0,
		Difficulty = 350,
		Food = "scripts/items/supplies/legend_fresh_meat_item",
		Cook = "scripts/items/supplies/cured_venison_item",
	},

}

// Gather all the backgrounds that enable hunting / foraging for convenient reference at runtime
::Const.HuntingLoot.AllRequiredBackgrounds <- {
	All = [],
	Forage = [],
	Hunt = [],
}
foreach(t in ::Const.HuntingLoot.TargetDefs)
{
	if ("Backgrounds" in t)
	{
		foreach (b in t.Backgrounds)
		{
			if (!(b in ::Const.HuntingLoot.AllRequiredBackgrounds.All))
			{
				::Const.HuntingLoot.AllRequiredBackgrounds.All.push(b);	
			}
			if (t.Type == "Forage" && !(b in ::Const.HuntingLoot.AllRequiredBackgrounds.Forage))
			{
				::Const.HuntingLoot.AllRequiredBackgrounds.Forage.push(b);
			}
			else if (t.Type == "Hunt" && !(b in ::Const.HuntingLoot.AllRequiredBackgrounds.Hunt))
			{
				::Const.HuntingLoot.AllRequiredBackgrounds.Hunt.push(b);	
			}
		}
	}
}