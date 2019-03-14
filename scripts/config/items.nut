local gt = this.getroottable();

if (!("Items" in gt.Const))
{
	gt.Const.Items <- {};
}

gt.Const.Items.Default <- {
	PlayerQuiver = "bust_quiver_01",
	PlayerNakedBody = "bust_naked_body_01",
	PlayerCorpse = "bust_naked_body_01_dead",
	ShieldDecal = "broken_shield_01",
	GenericItemName = "Generic Item",
	GenericItemIcon = "skills/passive_03.png",
	RaiseShieldOffset = this.createVec(0, 10),
	RaiseShieldDuration = 0.15,
	LowerShieldDuration = 0.4,
	RaiseWeaponDuration = 0.25,
	LowerWeaponDuration = 0.2
};
gt.Const.Items.ItemType <- {
	None = 0,
	Legendary = 1,
	Named = 2,
	Armor = 4,
	Helmet = 8,
	Shield = 16,
	Defensive = 32,
	Weapon = 64,
	OneHanded = 128,
	TwoHanded = 256,
	MeleeWeapon = 512,
	RangedWeapon = 1024,
	Ammo = 2048,
	Tool = 4096,
	Accessory = 8192,
	Usable = 16384,
	Misc = 32768,
	Loot = 65536,
	Crafting = 131072,
	Supply = 262144,
	Food = 524288,
	TradeGood = 1048576,
	MagicStaff = 2097152
};
gt.Const.Items.ItemFilter <- {
	Weapons = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.Accessory | this.Const.Items.ItemType.Tool | this.Const.Items.ItemType.Ammo | this.Const.Items.ItemType.MagicStaff,
	Armor = this.Const.Items.ItemType.Armor | this.Const.Items.ItemType.Helmet | this.Const.Items.ItemType.Shield,
	Misc = this.Const.Items.ItemType.Supply | this.Const.Items.ItemType.Food | this.Const.Items.ItemType.Misc | this.Const.Items.ItemType.TradeGood | this.Const.Items.ItemType.Loot | this.Const.Items.ItemType.Crafting,
	Usable = this.Const.Items.ItemType.Usable,
	All = 1 | 2 | 4 | 8 | 16 | 32 | 64 | 128 | 256 | 512 | 1024 | 2048 | 4096 | 8192 | 16384 | 32768 | 65536 | 131072 | 262144 | 524288 | 1048576
};
gt.Const.Items.AmmoType <- {
	None = 0,
	Arrows = 1,
	Bolts = 2,
	Spears = 4,
	Pebbles = 8,
	Rocks = 16
};
gt.Const.Items.Property <- {
	None = 0,
	IgnoresShieldwall = 8
};
gt.Const.Items.InventoryEventType <- {
	None = 0,
	Equipped = 1,
	PlacedInBag = 2,
	PlacedInStash = 3,
	PlacedOnGround = 4
};
gt.Const.Items.Paint <- {
	Black = 0,
	WhiteBlue = 1,
	WhiteGreenYellow = 2,
	OrangeRed = 3,
	Red = 4
};
gt.Const.Items.ConditionColor <- [
	"#ff1e00",
	"#ff8400",
	"#ffea00",
	"#c0ff00",
	"#ffffff"
];
