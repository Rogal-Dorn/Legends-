local gt = this.getroottable();

if (!("Faces" in gt.Const))
{
	gt.Const.Faces <- {};
}

if (!("Hair" in gt.Const))
{
	gt.Const.Hair <- {};
}

if (!("HairColors" in gt.Const))
{
	gt.Const.HairColors <- {};
}

if (!("Beards" in gt.Const))
{
	gt.Const.Beards <- {};
}

if (!("Tattoos" in gt.Const))
{
	gt.Const.Tattoos <- {};
}

if (!("Bodies" in gt.Const))
{
	gt.Const.Bodies <- {};
}

gt.Const.HairColors.All <- [
	"black",
	"grey",
	"blonde",
	"brown",
	"red"
];
gt.Const.HairColors.Old <- [
	"grey"
];
gt.Const.HairColors.Young <- [
	"black",
	"blonde",
	"brown",
	"red"
];
gt.Const.HairColors.Zombie <- [
	"black",
	"grey"
];
gt.Const.HairColors.None <- [
	""
];


gt.Const.HairColors.Lineage <- [
	[
		"black",
		"black",
		"grey"
	],
	[
		"blonde",
		"blonde",
		"grey"
	],
	[
		"brown",
		"brown",
		"grey"
	],
	[
		"red",
		"red",
		"grey"
	]
];
gt.Const.Faces.AllHuman <- [
	"bust_head_01",
	"bust_head_02",
	"bust_head_03",
	"bust_head_04",
	"bust_head_05",
	"bust_head_06",
	"bust_head_07",
	"bust_head_08",
	"bust_head_09",
	"bust_head_10",
	"bust_head_11",
	"bust_head_12",
	"bust_head_13",
	"bust_head_14",
	"bust_head_15",
	"bust_head_16",
	"bust_head_17",
	"bust_head_18",
	"bust_head_19",
	"bust_head_20",
	"bust_head_50",
	"bust_head_51",
	"bust_head_female_01",
	"bust_head_female_02",
	"bust_head_female_03",
	"bust_head_female_04",
	"bust_head_female_05",
	"bust_head_female_06",
	"bust_head_female_07",
	"bust_head_female_08",
	"bust_head_female_09",
	"bust_head_female_10",
	"bust_head_female_11",
	"bust_head_female_12",
	"bust_head_female_13",
	"bust_head_female_14",
	"bust_head_female_15",
	"bust_head_female_16"
];
gt.Const.Faces.AllMale <- [
	"bust_head_01",
	"bust_head_02",
	"bust_head_03",
	"bust_head_04",
	"bust_head_05",
	"bust_head_06",
	"bust_head_07",
	"bust_head_08",
	"bust_head_09",
	"bust_head_10",
	"bust_head_11",
	"bust_head_12",
	"bust_head_13",
	"bust_head_14",
	"bust_head_15",
	"bust_head_16",
	"bust_head_17",
	"bust_head_18",
	"bust_head_19",
	"bust_head_20",
	"bust_head_50",
	"bust_head_51"
];
gt.Const.Faces.AllFemale <- [
	"bust_head_female_01",
	"bust_head_female_02",
	"bust_head_female_03",
	"bust_head_female_04",
	"bust_head_female_05",
	"bust_head_female_06",
	"bust_head_female_07",
	"bust_head_female_08",
	"bust_head_female_09",
	"bust_head_female_10",
	"bust_head_female_11",
	"bust_head_female_12",
	"bust_head_female_13",
	"bust_head_female_14",
	"bust_head_female_15",
	"bust_head_female_16"
];

gt.Const.Faces.PrettyFemale <- [
	"bust_head_female_01",
	"bust_head_female_02",
	"bust_head_female_03",
	"bust_head_female_04",
	"bust_head_female_05",
	"bust_head_female_06",
	"bust_head_female_07",
	"bust_head_female_08",
	"bust_head_female_09",
	"bust_head_female_10",
	"bust_head_female_11",
	"bust_head_female_12",
	"bust_head_female_13",
	"bust_head_female_14",
	"bust_head_female_15",
	"bust_head_female_16"
];

gt.Const.Faces.Donkey <- [
	"bust_head_donkey_01"
];

gt.Const.Faces.Horse <- [
	"bust_head_100",
	"bust_head_101",
	"bust_head_102",
	"bust_head_103",
	"bust_head_104",
	"bust_head_105",
	"bust_head_106",
	"bust_head_107"

];

gt.Const.Faces.OldFemale <- [
	"bust_head_female_08",
	"bust_head_female_11",
	"bust_head_female_15"
];

gt.Const.Faces.Berserker <- [
	"bust_head_berserker_01",
	"bust_head_berserker_02"
];


gt.Const.Faces.SmartMale <- [
	"bust_head_01",
	"bust_head_04",
	"bust_head_05",
	"bust_head_06",
	"bust_head_07",
	"bust_head_08",
	"bust_head_09",
	"bust_head_12",
	"bust_head_13",
	"bust_head_14"
];
gt.Const.Faces.WildMale <- [
	"bust_head_02",
	"bust_head_03",
	"bust_head_09",
	"bust_head_10",
	"bust_head_11",
	"bust_head_12",
	"bust_head_14",
	"bust_head_15",
	"bust_head_16",
	"bust_head_19",
	"bust_head_20"
];
gt.Const.Faces.WildFemale <- [
	"bust_head_female_01",
	"bust_head_female_02",
	"bust_head_female_03",
	"bust_head_female_04",
	"bust_head_female_05",
	"bust_head_female_06",
	"bust_head_female_07",
	"bust_head_female_08",
	"bust_head_female_09",
	"bust_head_female_10",
	"bust_head_female_11",
	"bust_head_female_12",
	"bust_head_female_13",
	"bust_head_female_14",
	"bust_head_female_15",
	"bust_head_female_16"
];

gt.Const.Faces.Necromancer <- [
	"bust_head_necro_01",
	"bust_head_necro_02",
	"bust_head_necro_female_01",
	"bust_head_necro_female_02"
];
gt.Const.Faces.NecromancerMale <- [
	"bust_head_necro_01",
	"bust_head_necro_02"
];
gt.Const.Faces.NecromancerFemale <- [
	"bust_head_necro_female_01",
	"bust_head_necro_female_02"
];
gt.Const.Hair.BarberMale <- [
	"",
	"shaved",
	"01",
	"02",
	"03",
	"04",
	"05",
	"06",
	"07",
	"08",
	"09",
	"10",
	"11",
	"12",
	"13",
	"14",
	"15",
	"16",
	"17",
	"18",
	"19",
	"20",
	"21"
];
gt.Const.Hair.AllMale <- [
	"shaved",
	"01",
	"02",
	"03",
	"04",
	"05",
	"06",
	"07",
	"08",
	"09",
	"10",
	"11",
	"13",
	"14",
	"15",
	"16",
	"20",
	"21",
	"22"
];

gt.Const.Hair.Berserker <- [
	"22",
	"03",
	"08",
	"18"
];

gt.Const.Hair.None <- [
	""
];


gt.Const.Hair.BarberFemale <- [
	"01",
	"02",
	"03",
	"04",
	"05",
	"06",
	"07",
	"08",
	"10",
	"19",
	"20",
	"21",
	"23",
	"24",
	"25",
	"26",
	"27",
	"28",
	"29",
	"30"
];


gt.Const.Hair.AllFemale <- [
	"01",
	"02",
	"03",
	"04",
	"05",
	"06",
	"07",
	"08",
	"10",
	"19",
	"20",
	"21",
	"23",
	"24",
	"25",
	"26",
	"27",
	"28",
	"29",
	"30"
];

gt.Const.Hair.CommonMale <- [
	"shaved",
	"01",
	"02",
	"04",
	"05",
	"06",
	"07",
	"08",
	"10",
	"13",
	"14",
	"15",
	"16",
	"20"
];
gt.Const.Hair.TidyMale <- [
	"shaved",
	"01",
	"02",
	"04",
	"05",
	"06",
	"07",
	"08",
	"10",
	"13",
	"14",
	"15",
	"16",
	"19",
	"20"
];
gt.Const.Hair.UntidyMale <- [
	"shaved",
	"02",
	"03",
	"04",
	"05",
	"08",
	"09",
	"10",
	"11",
	"13",
	"15",
	"16",
	"17",
	"18",
	"21"
];
gt.Const.Hair.WildMale <- [
	"03",
	"08",
	"18",
	"21",
	"shaved"
];
gt.Const.Hair.YoungMale <- [
	"shaved",
	"01",
	"04",
	"05",
	"06",
	"07",
	"08",
	"09",
	"10",
	"11",
	"20"
];
gt.Const.Hair.Military <- [
	"shaved"
];
gt.Const.Hair.Monk <- [
	"12",
	"13",
	"14",
	"15",
	"16"
];
gt.Const.Hair.Vampire <- [
	"zombie_01",
	"zombie_02",
	"zombie_03",
	"zombie_05",
	"zombie_06",
	"zombie_07"
];
gt.Const.Hair.ZombieOnly <- [
	"zombie_01",
	"zombie_02",
	"zombie_03",
	"zombie_04",
	"zombie_05",
	"zombie_06",
	"zombie_07"
];
gt.Const.Hair.Zombie <- [
	"zombie_01",
	"zombie_02",
	"zombie_03",
	"zombie_04",
	"zombie_05",
	"zombie_06",
	"zombie_07",
	"09",
	"13",
	"15"
];
gt.Const.Hair.Necromancer <- [
	"shaved",
	"02",
	"04",
	"08",
	"10",
	"13",
	"15",
	"16",
	"17",
	"18"
];

gt.Const.Hair.Horse <- [
	"horse_hair_black",
	"horse_hair_brown",
	"horse_hair_chestnut",
	"horse_hair_grey",
	"horse_hair_honey",
	"horse_hair_ruddy",
	"horse_hair_tan",
	"horse_hair_white"
];

gt.Const.Beards.Barber <- [
	"",
	"01",
	"02",
	"03",
	"04",
	"05",
	"06",
	"07",
	"08",
	"09",
	"10",
	"11",
	"12",
	"13",
	"14",
	"15",
	"16",
	"17",
	"18"
	// "19"
];
gt.Const.Beards.All <- [
	"01",
	"02",
	"03",
	"04",
	"05",
	"06",
	"07",
	"08",
	"09",
	"10",
	"11",
	"12",
	"13",
	"14",
	"15",
	"16",
	"17",
	"18"
	// "19"
];

gt.Const.Beards.Berserker <- [
	"18",
	"14"
];

gt.Const.Beards.BarberFemale <- [
	""
];

gt.Const.Beards.Female <- [
	""
];

gt.Const.Beards.Tidy <- [
	"01",
	"02",
	"03",
	"06",
	"10",
	"11",
	"16"
];
gt.Const.Beards.Untidy <- [
	"01",
	"03",
	"04",
	"05",
	"07",
	"08",
	"09",
	"14",
	"17",
	"18"
];
gt.Const.Beards.Raider <- [
	"01",
	"03",
	"04",
	"05",
	"07",
	"08",
	"09",
	"12",
	"13",
	"14",
	"15"
];
gt.Const.Beards.Wild <- [
	"14"
];
gt.Const.Beards.WildExtended <- [
	"12",
	"13",
	"14",
	"15",
	"17"
];
gt.Const.Beards.Monk <- [
	"01",
	"05",
	"07",
	"09"
];
gt.Const.Beards.ZombieOnly <- [
	"zombie_01",
	"zombie_02",
	"zombie_03",
	"zombie_04"
];
gt.Const.Beards.Zombie <- [
	"zombie_01",
	"zombie_02",
	"zombie_03",
	"zombie_04",
	"01",
	"02",
	"03",
	"04",
	"05",
	"06",
	"07",
	"08",
	"09",
	"10",
	"11"
];
gt.Const.Beards.ZombieExtended <- [
	"zombie_01",
	"zombie_02",
	"zombie_03",
	"zombie_04",
	"01",
	"02",
	"03",
	"04",
	"05",
	"06",
	"07",
	"08",
	"09",
	"10",
	"11",
	"12",
	"13",
	"14",
	"15"
];
gt.Const.Tattoos.All <- [
	"",
	"tattoo_01",
	"warpaint_01"
];

gt.Const.Hair.HorseBody <- [
	"horse_body_hair_black",
	"horse_body_hair_brown",
	"horse_body_hair_chestnut",
	"horse_body_hair_grey",
	"horse_body_hair_honey",
	"horse_body_hair_ruddy",
	"horse_body_hair_tan",
	"horse_body_hair_white"
];

gt.Const.Tattoos.HorseBody <- [
	"horse_body_pattern_01",
	"horse_body_pattern_02",
	"horse_body_pattern_03",
	"horse_body_pattern_04"
];

gt.Const.Tattoos.HorseFace <- [
	"horse_pattern_ears",
	"horse_pattern_eyes",
	"horse_pattern_face",
	"horse_pattern_forehead",
	"horse_pattern_line",
	"horse_pattern_snout"
];

gt.Const.Tattoos.Wildman <- [];
gt.Const.Tattoos.Cultist <- [];
gt.Const.Bodies.AllHuman <- [
	"bust_naked_body_00",
	"bust_naked_body_01",
	"bust_naked_body_02",
	"bust_naked_body_03"
];

gt.Const.Bodies.AllMale <- [
	"bust_naked_body_00",
	"bust_naked_body_01",
	"bust_naked_body_02"
];

gt.Const.Bodies.AllFemale <- [
	"bust_naked_body_03"
];

gt.Const.Bodies.Horses <- [
	"bust_naked_body_100",
	"bust_naked_body_101",
	"bust_naked_body_102",
	"bust_naked_body_103",
	"bust_naked_body_104",
	"bust_naked_body_105",
	"bust_naked_body_106",
	"bust_naked_body_107"
];