::Const.Factions.GreaterEvilStrengthOnTownDestroyed = 0.0; //was 20, set to 0 due to greenskin crisis becoming uncontrollable. Currently a quick fix and will need to be looked at further!! (28/11/21 by Luft)

::Const.FactionType.FreeCompany <- 16;
::Const.FactionType.DummyFaction <- 17;
::Const.FactionType.COUNT = 18;

::Const.Faction.FreeCompany <- 16;
::Const.Faction.DummyFaction <- 17;
::Const.Faction.COUNT = 18;

::Const.FactionColor.push(::createColor("#ffffff"));

::Const.FactionBase.push("bust_base_militia");

// too much effort and will be confusing to hook
::Const.FactionAlliance = [
	[
		this.Const.Faction.None,
		this.Const.Faction.Player,
		this.Const.Faction.PlayerAnimals,
		this.Const.Faction.Enemy,
		this.Const.Faction.Civilian,
		this.Const.Faction.NobleHouse,
		this.Const.Faction.Bandits,
		this.Const.Faction.Beasts,
		this.Const.Faction.Undead,
		this.Const.Faction.Orcs,
		this.Const.Faction.Goblins
	],
	[
		this.Const.Faction.Player,
		this.Const.Faction.PlayerAnimals,
		this.Const.Faction.Civilian,
		this.Const.Faction.NobleHouse
	],
	[
		this.Const.Faction.PlayerAnimals,
		this.Const.Faction.Player,
		this.Const.Faction.Civilian,
		this.Const.Faction.NobleHouse
	],
	[
		this.Const.Faction.Enemy
	],
	[
		this.Const.Faction.Civilian,
		this.Const.Faction.NobleHouse,
		this.Const.Faction.Player,
		this.Const.Faction.PlayerAnimals,
		this.Const.Faction.FreeCompany
	],
	[
		this.Const.Faction.NobleHouse,
		this.Const.Faction.Civilian,
		this.Const.Faction.Player,
		this.Const.Faction.PlayerAnimals,
		this.Const.Faction.FreeCompany
	],
	[
		this.Const.Faction.Bandits
	],
	[
		this.Const.Faction.Beasts,
		this.Const.Faction.Undead
	],
	[
		this.Const.Faction.Undead,
		this.Const.Faction.Beasts,
		this.Const.Faction.Zombies
	],
	[
		this.Const.Faction.Zombies,
		this.Const.Faction.Beasts,
		this.Const.Faction.Undead
	],
	[
		this.Const.Faction.Orcs
	],
	[
		this.Const.Faction.Goblins
	],
	[
		this.Const.Faction.Barbarians
	],
	[
		this.Const.Faction.NobleHouse,
		this.Const.Faction.Civilian,
		this.Const.Faction.Player,
		this.Const.Faction.PlayerAnimals,
		this.Const.Faction.FreeCompany
	],
	[
		this.Const.Faction.OrientalBandits
	],
	[
		this.Const.Faction.Arena
	],
	[
		this.Const.Faction.FreeCompany,
		this.Const.Faction.Civilian,
		this.Const.Faction.OrientalCityState,
		this.Const.Faction.NobleHouse,
	],
	[ // DummyFaction

	]
];
