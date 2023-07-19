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

gt.Const.HairColors.Southern <- [
	"brown",
	"grey",
	"brown",
	"brown",
	"brown"
];

gt.Const.HairColors.SouthernYoung <- [
	"brown"
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
	"bust_head_34",
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
	"bust_head_female_16",
	"bust_head_female_17",
	"bust_head_southern_01",
	"bust_head_southern_02",
	"bust_head_southern_03",
	"bust_head_southern_04",
	"bust_head_southern_05",
	"bust_head_southern_06",
	"bust_head_southern_07",
	"bust_head_southern_08",
	"bust_head_southern_female_01",
	"bust_head_southern_female_02",
	"bust_head_southern_female_03",
	"bust_head_southern_female_04",
	"bust_head_southern_female_05",
	"bust_head_southern_female_06",
	"bust_head_southern_female_07",
	"bust_head_southern_female_08",
	"bust_head_southern_female_09",
	"bust_head_southern_female_10",
	"bust_head_southern_female_11",
	"bust_head_southern_female_12",
	"bust_head_southern_female_13"
];

gt.Const.Faces.AllWhiteHuman <- [
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
	"bust_head_34",
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
	"bust_head_female_16",
	"bust_head_female_17"
];

gt.Const.Faces.AllWhiteMale <- [
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
	"bust_head_34",
	"bust_head_50",
	"bust_head_51"
];

gt.Const.Faces.AllWhiteFemale <- [
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
	"bust_head_34",
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
	"bust_head_female_16",
	"bust_head_female_17"
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
	"bust_head_female_16",
	"bust_head_female_17"
];

gt.Const.Faces.SouthernMale <- [
	"bust_head_southern_01",
	"bust_head_southern_02",
	"bust_head_southern_03",
	"bust_head_southern_04",
	"bust_head_southern_05",
	"bust_head_southern_06",
	"bust_head_southern_07",
	"bust_head_southern_08"
]

gt.Const.Faces.SouthernFemale <- [
	"bust_head_southern_female_01",
	"bust_head_southern_female_02",
	"bust_head_southern_female_03",
	"bust_head_southern_female_04",
	"bust_head_southern_female_05",
	"bust_head_southern_female_06",
	"bust_head_southern_female_07",
	"bust_head_southern_female_08",
	"bust_head_southern_female_09",
	"bust_head_southern_female_10",
	"bust_head_southern_female_11",
	"bust_head_southern_female_12",
	"bust_head_southern_female_13"
]

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


gt.Const.Faces.Barber <- clone this.Const.Faces.AllMale;

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
	"bust_head_female_16",
	"bust_head_female_17"
];

gt.Const.Faces.SouthernMale <- [
	"bust_head_southern_01",
	"bust_head_southern_02",
	"bust_head_southern_03",
	"bust_head_southern_04",
	"bust_head_southern_05",
	"bust_head_southern_06",
	"bust_head_southern_07",
	"bust_head_southern_08"
];

gt.Const.Faces.SouthernFemale <- [
	"bust_head_southern_female_01",
	"bust_head_southern_female_02",
	"bust_head_southern_female_03",
	"bust_head_southern_female_04",
	"bust_head_southern_female_05",
	"bust_head_southern_female_06",
	"bust_head_southern_female_07",
	"bust_head_southern_female_08",
	"bust_head_southern_female_09"
]

gt.Const.Faces.AfricanFemale <- [
	"bust_head_southern_female_10",
	"bust_head_southern_female_11",
	"bust_head_southern_female_12",
	"bust_head_southern_female_13"
]

gt.Const.Faces.AfricanMale <- [
	"bust_head_african_03"
	"bust_head_african_06",
	"bust_head_african_07",
	"bust_head_african_10",
	"bust_head_african_11",
	"bust_head_african_12",
	"bust_head_african_13",
	"bust_head_african_14",
	"bust_head_african_15",
	"bust_head_african_16",
	"bust_head_african_17"
]


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

gt.Const.Faces.Vampire <- [
	"bust_skeleton_head_04",
	"bust_skeleton_head_03"
];


gt.Const.Faces.Skeleton <- [
	"bust_skeleton_head"
];

gt.Const.Hair.Barber <- [
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
	"21",
	"22",
	"23",
	"24",
	"25",
	"26",
	"27",
	"28",
	"29",
	"31",
	"32",
	"southern_01",
	"southern_02",
	"southern_03",
	"southern_04",
	"southern_05",
	"southern_06",
	"southern_07",
	"southern_08"
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
	"22",
	"31",
	"32",
	"southern_01",
	"southern_02",
	"southern_03",
	"southern_04",
	"southern_05",
	"southern_06",
	"southern_07",
	"southern_08"
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
	"21",
	"22",
	"23",
	"24",
	"25",
	"26",
	"27",
	"28",
	"29",
	"31",
	"32",
	"southern_01",
	"southern_02",
	"southern_03",
	"southern_04",
	"southern_05",
	"southern_06",
	"southern_07",
	"southern_08"
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
	"30",
	"31",
	"32"
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
	"31",
	"32",
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
gt.Const.Hair.SouthernMaleOnly <- [
	"southern_01",
	"southern_02",
	"southern_03",
	"southern_04",
	"southern_05",
	"southern_06",
	"southern_07",
	"southern_08"
];
gt.Const.Hair.SouthernMale <- [
	"southern_01",
	"southern_02",
	"southern_03",
	"southern_04",
	"southern_05",
	"southern_06",
	"southern_07",
	"southern_08",
	"10",
	"15",
	"16",
	"19"
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
	"legends_01",
	"legends_02",
	"19"
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
	"legends_01",
	"legends_02",
	"19"
];

gt.Const.Beards.Berserker <- [
	"legends_02"
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
	"16",
	"legends_01",
	"legends_02"
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
	"legends_01",
	"legends_02",
	"19"
];
gt.Const.Beards.SouthernUntidy <- [
	"southern_01",
	"southern_02",
	"southern_01",
	"southern_02",
	"01",
	"05",
	"07",
	"09",
	"14",
	"17",
	"legends_01"
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
	"15",
	"legends_01",
	"legends_02"
];
gt.Const.Beards.Wild <- [
	"14"
];
gt.Const.Beards.WildExtended <- [
	"12",
	"13",
	"14",
	"15",
	"17",
	"19"
];
gt.Const.Beards.Monk <- [
	"01",
	"05",
	"07",
	"09",
	"legends_01"
];
gt.Const.Beards.SouthernOnly <- [
	"southern_01",
	"southern_02"
];
gt.Const.Beards.Southern <- [
	"southern_01",
	"southern_02",
	"southern_01",
	"southern_02",
	"01",
	"06",
	"07",
	"09",
	"legends_01"
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
	"11",
	"legends_01",
	"legends_02"
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
	"15",
	"legends_01",
	"legends_02"
];
gt.Const.Tattoos.All <- [
	"",
	"scar_01",
	"scar_02",
	"tattoo_01",
	"warpaint_01",
	"tattoo_07",
	"tattoo_08"
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
	"bust_female_northern_00",
	"bust_female_northern_01",
	"bust_female_northern_02",
	"bust_female_northwestern_00",	
	"bust_female_northwestern_01",	
	"bust_female_northwestern_02",	
	"bust_female_western_00",
	"bust_female_western_01",
	"bust_female_western_02",
	"bust_female_southwestern_00",	
	"bust_female_southwestern_01",
	"bust_female_southwestern_02",
	"bust_female_southern_00",
	"bust_female_southern_01",	
	"bust_female_southern_02",
	"bust_female_southeastern_00",	
	"bust_female_southeastern_01",	
	"bust_female_southeastern_02",	
	"bust_female_eastern_00",
	"bust_female_eastern_01",
	"bust_female_eastern_02",
	"bust_female_northeastern_00",	
	"bust_female_northeastern_01",
	"bust_female_northeastern_02",	
	"bust_male_northern_00",
	"bust_male_northern_01",
	"bust_male_northern_02",
	"bust_male_northwestern_00",	
	"bust_male_northwestern_01",	
	"bust_male_northwestern_02",	
	"bust_male_western_00",
	"bust_male_western_01",
	"bust_male_western_02",
	"bust_male_southwestern_00",	
	"bust_male_southwestern_01",
	"bust_male_southwestern_02",
	"bust_male_southern_00",
	"bust_male_southern_01",	
	"bust_male_southern_02",
	"bust_male_southeastern_00",	
	"bust_male_southeastern_01",	
	"bust_male_southeastern_02",	
	"bust_male_eastern_00",
	"bust_male_eastern_01",
	"bust_male_eastern_02",
	"bust_male_northeastern_00",	
	"bust_male_northeastern_01",
	"bust_male_northeastern_02"	
];

gt.Const.Bodies.AllMale <- [
	"bust_male_northern_00",
	"bust_male_northern_01",
	"bust_male_northern_02",
	"bust_male_northwestern_00",	
	"bust_male_northwestern_01",	
	"bust_male_northwestern_02",	
	"bust_male_western_00",
	"bust_male_western_01",
	"bust_male_western_02",
	"bust_male_southwestern_00",	
	"bust_male_southwestern_01",
	"bust_male_southwestern_02",
	"bust_male_southern_00",
	"bust_male_southern_01",	
	"bust_male_southern_02",
	"bust_male_southeastern_00",	
	"bust_male_southeastern_01",	
	"bust_male_southeastern_02",	
	"bust_male_eastern_00",
	"bust_male_eastern_01",
	"bust_male_eastern_02",
	"bust_male_northeastern_00",	
	"bust_male_northeastern_01",
	"bust_male_northeastern_02"	
];

gt.Const.Bodies.NorthernMale <- [
	"bust_male_northern_00",
	"bust_male_northern_01",
	"bust_male_northern_02",
	"bust_male_northwestern_00",	
	"bust_male_northwestern_01",	
	"bust_male_northwestern_02",	
	"bust_male_northeastern_00",	
	"bust_male_northeastern_01",
	"bust_male_northeastern_02"	
];
gt.Const.Bodies.NorthWesternMale <- [
	"bust_male_northern_00",
	"bust_male_northern_01",
	"bust_male_northern_02",
	"bust_male_northwestern_00",	
	"bust_male_northwestern_01",	
	"bust_male_northwestern_02",	
	"bust_male_western_00",
	"bust_male_western_01",
	"bust_male_western_02"
];
gt.Const.Bodies.NorthWesternMaleOnly <- [,
	"bust_male_northwestern_00",	
	"bust_male_northwestern_01",	
	"bust_male_northwestern_02"
];
gt.Const.Bodies.WesternMale <- [
	"bust_male_northwestern_00",	
	"bust_male_northwestern_01",	
	"bust_male_northwestern_02",	
	"bust_male_western_00",
	"bust_male_western_01",
	"bust_male_western_02",
	"bust_male_southwestern_00",	
	"bust_male_southwestern_01",
	"bust_male_southwestern_02"
];

gt.Const.Bodies.SouthWesternMale <- [
	"bust_male_southern_00",
	"bust_male_southern_01",	
	"bust_male_southern_02",	
	"bust_male_western_00",
	"bust_male_western_01",
	"bust_male_western_02",
	"bust_male_southwestern_00",	
	"bust_male_southwestern_01",
	"bust_male_southwestern_02"
];

gt.Const.Bodies.SouthernMale <- [
	"bust_male_southwestern_00",	
	"bust_male_southwestern_01",
	"bust_male_southwestern_02",
	"bust_male_southern_00",
	"bust_male_southern_01",	
	"bust_male_southern_02",
	"bust_male_southeastern_00",	
	"bust_male_southeastern_01",	
	"bust_male_southeastern_02"
];

gt.Const.Bodies.SouthEasternMale <- [
	"bust_male_southern_00",
	"bust_male_southern_01",	
	"bust_male_southern_02",	
	"bust_male_eastern_00",
	"bust_male_eastern_01",
	"bust_male_eastern_02",
	"bust_male_southeastern_00",	
	"bust_male_southeastern_01",
	"bust_male_southeastern_02"
];


gt.Const.Bodies.EasternMale <- [
	"bust_male_southeastern_00",	
	"bust_male_southeastern_01",	
	"bust_male_southeastern_02",	
	"bust_male_eastern_00",
	"bust_male_eastern_01",
	"bust_male_eastern_02",
	"bust_male_northeastern_00",	
	"bust_male_northeastern_01",
	"bust_male_northeastern_02"	
];
gt.Const.Bodies.NorthEasternMale <- [
	"bust_male_northern_00",
	"bust_male_northern_01",
	"bust_male_northern_02",
	"bust_male_northeastern_00",	
	"bust_male_northeastern_01",	
	"bust_male_northeastern_02",	
	"bust_male_eastern_00",
	"bust_male_eastern_01",
	"bust_male_eastern_02"
];



gt.Const.Bodies.AllFemale <- [
	"bust_female_northern_00",
	"bust_female_northern_01",
	"bust_female_northern_02",
	"bust_female_northwestern_00",	
	"bust_female_northwestern_01",	
	"bust_female_northwestern_02",	
	"bust_female_western_00",
	"bust_female_western_01",
	"bust_female_western_02",
	"bust_female_southwestern_00",	
	"bust_female_southwestern_01",
	"bust_female_southwestern_02",
	"bust_female_southern_00",
	"bust_female_southern_01",	
	"bust_female_southern_02",
	"bust_female_southeastern_00",	
	"bust_female_southeastern_01",	
	"bust_female_southeastern_02",	
	"bust_female_eastern_00",
	"bust_female_eastern_01",
	"bust_female_eastern_02",
	"bust_female_northeastern_00",	
	"bust_female_northeastern_01",
	"bust_female_northeastern_02"	
];

gt.Const.Bodies.NorthernFemale <- [
	"bust_female_northern_00",
	"bust_female_northern_01",
	"bust_female_northern_02",
	"bust_female_northwestern_00",	
	"bust_female_northwestern_01",	
	"bust_female_northwestern_02",	
	"bust_female_northeastern_00",	
	"bust_female_northeastern_01",
	"bust_female_northeastern_02"	
];
gt.Const.Bodies.NorthWesternFemale <- [
	"bust_female_northern_00",
	"bust_female_northern_01",
	"bust_female_northern_02",
	"bust_female_northwestern_00",	
	"bust_female_northwestern_01",	
	"bust_female_northwestern_02",	
	"bust_female_western_00",
	"bust_female_western_01",
	"bust_female_western_02"
];

gt.Const.Bodies.WesternFemale <- [
	"bust_female_northwestern_00",	
	"bust_female_northwestern_01",	
	"bust_female_northwestern_02",	
	"bust_female_western_00",
	"bust_female_western_01",
	"bust_female_western_02",
	"bust_female_southwestern_00",	
	"bust_female_southwestern_01",
	"bust_female_southwestern_02"
];

gt.Const.Bodies.SouthWesternFemale <- [
	"bust_female_southern_00",
	"bust_female_southern_01",	
	"bust_female_southern_02",	
	"bust_female_western_00",
	"bust_female_western_01",
	"bust_female_western_02",
	"bust_female_southwestern_00",	
	"bust_female_southwestern_01",
	"bust_female_southwestern_02"
];

gt.Const.Bodies.SouthernFemale <- [
	"bust_female_southwestern_00",	
	"bust_female_southwestern_01",
	"bust_female_southwestern_02",
	"bust_female_southern_00",
	"bust_female_southern_01",	
	"bust_female_southern_02",
	"bust_female_southeastern_00",	
	"bust_female_southeastern_01",	
	"bust_female_southeastern_02"
];

gt.Const.Bodies.SouthEasternFemale <- [
	"bust_female_southern_00",
	"bust_female_southern_01",	
	"bust_female_southern_02",	
	"bust_female_eastern_00",
	"bust_female_eastern_01",
	"bust_female_eastern_02",
	"bust_female_southeastern_00",	
	"bust_female_southeastern_01",
	"bust_female_southeastern_02"
];

gt.Const.Bodies.EasternFemale <- [
	"bust_female_southeastern_00",	
	"bust_female_southeastern_01",	
	"bust_female_southeastern_02",	
	"bust_female_eastern_00",
	"bust_female_eastern_01",
	"bust_female_eastern_02",
	"bust_female_northeastern_00",	
	"bust_female_northeastern_01",
	"bust_female_northeastern_02"	
];
gt.Const.Bodies.NorthEasternFemale <- [
	"bust_female_northern_00",
	"bust_female_northern_01",
	"bust_female_northern_02",
	"bust_female_northeastern_00",	
	"bust_female_northeastern_01",	
	"bust_female_northeastern_02",	
	"bust_female_eastern_00",
	"bust_female_eastern_01",
	"bust_female_eastern_02"
];



gt.Const.Bodies.Skinny <- [
	"bust_male_northern_00",
	"bust_male_northwestern_00",		
	"bust_male_western_00",
	"bust_male_southwestern_00",	
	"bust_male_southern_00",
	"bust_male_southeastern_00",		
	"bust_male_eastern_00",
	"bust_male_northeastern_00",
	"bust_female_northern_00",
	"bust_female_northwestern_00",	
	"bust_female_western_00",
	"bust_female_southwestern_00",	
	"bust_female_southern_00",
	"bust_female_southeastern_00",	
	"bust_female_eastern_00",
	"bust_female_northeastern_00"
];
gt.Const.Bodies.MaleSkinny <- [
	"bust_male_northern_00",
	"bust_male_northwestern_00",		
	"bust_male_western_00",
	"bust_male_southwestern_00",	
	"bust_male_southern_00",
	"bust_male_southeastern_00",		
	"bust_male_eastern_00",
	"bust_male_northeastern_00"
];
gt.Const.Bodies.FemaleSkinny <- [
	"bust_female_northern_00",
	"bust_female_northwestern_00",	
	"bust_female_western_00",
	"bust_female_southwestern_00",	
	"bust_female_southern_00",
	"bust_female_southeastern_00",	
	"bust_female_eastern_00",
	"bust_female_northeastern_00"
];
gt.Const.Bodies.NorthernSkinny <- [
	"bust_female_northern_00",
	"bust_female_northwestern_00",
	"bust_female_northeastern_00",
	"bust_female_northern_00",
	"bust_female_northwestern_00",
	"bust_female_northeastern_00"
];
gt.Const.Bodies.NorthernMaleSkinny <- [
	"bust_female_northern_00",
	"bust_female_northwestern_00",
	"bust_female_northeastern_00"
];
gt.Const.Bodies.NorthernFemaleSkinny <- [
	"bust_female_northern_00",
	"bust_female_northwestern_00",
	"bust_female_northeastern_00"
];
gt.Const.Bodies.SouthernSkinny <- [
	"bust_male_southwestern_00",	
	"bust_male_southern_00",
	"bust_male_southeastern_00",
	"bust_female_southwestern_00",	
	"bust_female_southern_00",
	"bust_female_southeastern_00"
];
gt.Const.Bodies.SouthernMaleSkinny <- [
	"bust_male_southwestern_00",	
	"bust_male_southern_00",
	"bust_male_southeastern_00"
];
gt.Const.Bodies.SouthernFemaleSkinny <- [
	"bust_female_southwestern_00",	
	"bust_female_southern_00",
	"bust_female_southeastern_00"
];
gt.Const.Bodies.EasternSkinny <- [
	"bust_male_southeastern_00",		
	"bust_male_eastern_00",
	"bust_male_northeastern_00",
	"bust_female_southeastern_00",	
	"bust_female_eastern_00",
	"bust_female_northeastern_00"
];
gt.Const.Bodies.EasternMaleSkinny <- [
	"bust_male_southeastern_00",		
	"bust_male_eastern_00",
	"bust_male_northeastern_00"
];
gt.Const.Bodies.EasternFemaleSkinny <- [
	"bust_female_southeastern_00",	
	"bust_female_eastern_00",
	"bust_female_northeastern_00"
];
gt.Const.Bodies.WesternSkinny <- [
	"bust_male_northwestern_00",		
	"bust_male_western_00",
	"bust_male_southwestern_00",
	"bust_female_northwestern_00",	
	"bust_female_western_00",
	"bust_female_southwestern_00",	
];
gt.Const.Bodies.WesternMaleSkinny <- [
	"bust_male_northwestern_00",		
	"bust_male_western_00",
	"bust_male_southwestern_00"
];
gt.Const.Bodies.WesternFemaleSkinny <- [
	"bust_female_northwestern_00",	
	"bust_female_western_00",
	"bust_female_southwestern_00"
];



gt.Const.Bodies.Muscular <- [
	"bust_male_northern_01",
	"bust_male_northwestern_01",		
	"bust_male_western_01",
	"bust_male_southwestern_01",	
	"bust_male_southern_01",
	"bust_male_southeastern_01",		
	"bust_male_eastern_01",
	"bust_male_northeastern_01",
	"bust_female_northern_01",
	"bust_female_northwestern_01",	
	"bust_female_western_01",
	"bust_female_southwestern_01",	
	"bust_female_southern_01",
	"bust_female_southeastern_01",	
	"bust_female_eastern_01",
	"bust_female_northeastern_01"
];
gt.Const.Bodies.MaleMuscular <- [
	"bust_male_northern_01",
	"bust_male_northwestern_01",		
	"bust_male_western_01",
	"bust_male_southwestern_01",	
	"bust_male_southern_01",
	"bust_male_southeastern_01",		
	"bust_male_eastern_01",
	"bust_male_northeastern_01"
];
gt.Const.Bodies.FemaleMuscular <- [
	"bust_female_northern_01",
	"bust_female_northwestern_01",	
	"bust_female_western_01",
	"bust_female_southwestern_01",	
	"bust_female_southern_01",
	"bust_female_southeastern_01",	
	"bust_female_eastern_01",
	"bust_female_northeastern_01"
];
gt.Const.Bodies.NorthernMuscular <- [
	"bust_female_northern_01",
	"bust_female_northwestern_01",
	"bust_female_northeastern_01",
	"bust_female_northern_01",
	"bust_female_northwestern_01",
	"bust_female_northeastern_01"
];
gt.Const.Bodies.NorthernMaleMuscular <- [
	"bust_female_northern_01",
	"bust_female_northwestern_01",
	"bust_female_northeastern_01"
];
gt.Const.Bodies.NorthernFemaleMuscular <- [
	"bust_female_northern_01",
	"bust_female_northwestern_01",
	"bust_female_northeastern_01"
];
gt.Const.Bodies.SouthernMuscular <- [
	"bust_male_southwestern_01",	
	"bust_male_southern_01",
	"bust_male_southeastern_01",
	"bust_female_southwestern_01",	
	"bust_female_southern_01",
	"bust_female_southeastern_01"
];
gt.Const.Bodies.SouthernMaleMuscular <- [
	"bust_male_southwestern_01",	
	"bust_male_southern_01",
	"bust_male_southeastern_01"
];
gt.Const.Bodies.SouthernFemaleMuscular <- [
	"bust_female_southwestern_01",	
	"bust_female_southern_01",
	"bust_female_southeastern_01"
];
gt.Const.Bodies.EasternMuscular <- [
	"bust_male_southeastern_01",		
	"bust_male_eastern_01",
	"bust_male_northeastern_01",
	"bust_female_southeastern_01",	
	"bust_female_eastern_01",
	"bust_female_northeastern_01"
];
gt.Const.Bodies.EasternMaleMuscular <- [
	"bust_male_southeastern_01",		
	"bust_male_eastern_01",
	"bust_male_northeastern_01"
];
gt.Const.Bodies.EasternFemaleMuscular <- [
	"bust_female_southeastern_01",	
	"bust_female_eastern_01",
	"bust_female_northeastern_01"
];
gt.Const.Bodies.WesternMuscular <- [
	"bust_male_northwestern_01",		
	"bust_male_western_01",
	"bust_male_southwestern_01",
	"bust_female_northwestern_01",	
	"bust_female_western_01",
	"bust_female_southwestern_01",	
];
gt.Const.Bodies.WesternMaleMuscular <- [
	"bust_male_northwestern_01",		
	"bust_male_western_01",
	"bust_male_southwestern_01"
];
gt.Const.Bodies.WesternFemaleMuscular <- [
	"bust_female_northwestern_01",	
	"bust_female_western_01",
	"bust_female_southwestern_01"
];


gt.Const.Bodies.Thick <- [
	"bust_male_northern_02",
	"bust_male_northwestern_02",		
	"bust_male_western_02",
	"bust_male_southwestern_02",	
	"bust_male_southern_02",
	"bust_male_southeastern_02",		
	"bust_male_eastern_02",
	"bust_male_northeastern_02",
	"bust_female_northern_02",
	"bust_female_northwestern_02",	
	"bust_female_western_02",
	"bust_female_southwestern_02",	
	"bust_female_southern_02",
	"bust_female_southeastern_02",	
	"bust_female_eastern_02",
	"bust_female_northeastern_02"
];
gt.Const.Bodies.MaleThick <- [
	"bust_male_northern_02",
	"bust_male_northwestern_02",		
	"bust_male_western_02",
	"bust_male_southwestern_02",	
	"bust_male_southern_02",
	"bust_male_southeastern_02",		
	"bust_male_eastern_02",
	"bust_male_northeastern_02"
];
gt.Const.Bodies.FemaleThick <- [
	"bust_female_northern_02",
	"bust_female_northwestern_02",	
	"bust_female_western_02",
	"bust_female_southwestern_02",	
	"bust_female_southern_02",
	"bust_female_southeastern_02",	
	"bust_female_eastern_02",
	"bust_female_northeastern_02"
];
gt.Const.Bodies.NorthernThick <- [
	"bust_female_northern_02",
	"bust_female_northwestern_02",
	"bust_female_northeastern_02",
	"bust_female_northern_02",
	"bust_female_northwestern_02",
	"bust_female_northeastern_02"
];
gt.Const.Bodies.NorthernMaleThick <- [
	"bust_female_northern_02",
	"bust_female_northwestern_02",
	"bust_female_northeastern_02"
];
gt.Const.Bodies.NorthernFemaleThick <- [
	"bust_female_northern_02",
	"bust_female_northwestern_02",
	"bust_female_northeastern_02"
];
gt.Const.Bodies.SouthernThick <- [
	"bust_male_southwestern_02",	
	"bust_male_southern_02",
	"bust_male_southeastern_02",
	"bust_female_southwestern_02",	
	"bust_female_southern_02",
	"bust_female_southeastern_02"
];
gt.Const.Bodies.SouthernMaleThick <- [
	"bust_male_southwestern_02",	
	"bust_male_southern_02",
	"bust_male_southeastern_02"
];
gt.Const.Bodies.SouthernFemaleThick <- [
	"bust_female_southwestern_02",	
	"bust_female_southern_02",
	"bust_female_southeastern_02"
];
gt.Const.Bodies.EasternThick <- [
	"bust_male_southeastern_02",		
	"bust_male_eastern_02",
	"bust_male_northeastern_02",
	"bust_female_southeastern_02",	
	"bust_female_eastern_02",
	"bust_female_northeastern_02"
];
gt.Const.Bodies.EasternMaleThick <- [
	"bust_male_southeastern_02",		
	"bust_male_eastern_02",
	"bust_male_northeastern_02"
];
gt.Const.Bodies.EasternFemaleThick <- [
	"bust_female_southeastern_02",	
	"bust_female_eastern_02",
	"bust_female_northeastern_02"
];
gt.Const.Bodies.WesternThick <- [
	"bust_male_northwestern_02",		
	"bust_male_western_02",
	"bust_male_southwestern_02",
	"bust_female_northwestern_02",	
	"bust_female_western_02",
	"bust_female_southwestern_02",	
];
gt.Const.Bodies.WesternMaleThick <- [
	"bust_male_northwestern_02",		
	"bust_male_western_02",
	"bust_male_southwestern_02"
];
gt.Const.Bodies.WesternFemaleThick <- [
	"bust_female_northwestern_02",	
	"bust_female_western_02",
	"bust_female_southwestern_02"
];


gt.Const.Bodies.Gladiator <- [
	"bust_male_southwestern_01",	
	"bust_male_southern_01",
	"bust_male_southeastern_01"
];
gt.Const.Bodies.SouthernSlave <- [
	"bust_male_southern_01",
];
gt.Const.Bodies.NorthernSlave <- [
	"bust_male_northern_01",
];


//this is a dummy for dlc
gt.Const.Bodies.Barber <- [

];

gt.Const.Bodies.BarberSouthernFemale <- [
	"bust_female_southwestern_00",	
	"bust_female_southwestern_01",
	"bust_female_southwestern_02",
	"bust_female_southern_00",
	"bust_female_southern_01",	
	"bust_female_southern_02",
	"bust_female_southeastern_00",	
	"bust_female_southeastern_01",	
	"bust_female_southeastern_02"
]
gt.Const.Bodies.BarberNorthernFemale <- [
	"bust_female_northern_00",
	"bust_female_northern_01",
	"bust_female_northern_02",
	"bust_female_northwestern_00",	
	"bust_female_northwestern_01",	
	"bust_female_northwestern_02",	
	"bust_female_western_00",
	"bust_female_western_01",
	"bust_female_western_02"
]
gt.Const.Bodies.BarberSouthernMale <- [
	"bust_male_southwestern_00",	
	"bust_male_southwestern_01",
	"bust_male_southwestern_02",
	"bust_male_southern_00",
	"bust_male_southern_01",	
	"bust_male_southern_02",
	"bust_male_southeastern_00",	
	"bust_male_southeastern_01",
	"bust_male_southeastern_02"
]
gt.Const.Bodies.BarberNorthernMale <- [
	"bust_male_northern_00",
	"bust_male_northern_01",
	"bust_male_northern_02",
	"bust_male_northwestern_00",	
	"bust_male_northwestern_01",	
	"bust_male_northwestern_02",	
	"bust_male_western_00",
	"bust_male_western_01",
	"bust_male_western_02"
]


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

gt.Const.Bodies.Donkeys <- [
	"bust_naked_body_05"
]

gt.Const.Bodies.LegendTattos <- [
	"bust_naked_body_04"
]


gt.Const.Hair.SouthernFemale <- [
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
	"30"
]

gt.Const.HairColors.African <- [
	"black",
	"brown",
	"grey"
]

gt.Const.Bodies.AfricanFemale <- [
	"bust_female_southern_00",
	"bust_female_southern_01",	
	"bust_female_southern_02"
]

gt.Const.Bodies.AfricanMale <- [
	"bust_male_southern_00",
	"bust_male_southern_01",	
	"bust_male_southern_02"
]

gt.Const.Bodies.AfricanFemaleSkinny <- [
	"bust_female_southern_00",
]
gt.Const.Bodies.AfricanFemaleMuscular <- [
	"bust_female_southern_01",
]
gt.Const.Bodies.AfricanFemaleThick <- [
	"bust_female_southern_02"
]

gt.Const.Bodies.AfricanGladiator <- [
	"bust_male_southern_00",
	"bust_male_southern_01",	
	"bust_male_southern_02"
]
gt.Const.Bodies.AfricanSlave <- [
	"bust_male_southern_00",
]
