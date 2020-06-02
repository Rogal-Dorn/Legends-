local gt = this.getroottable();

if (!("LegendMod" in gt.Const))
{
	gt.Const.LegendMod <- {};
}

gt.Const.LegendMod.MaxResources <- [
	{
		Food = 300,
		Ammo = 30,
		Medicine = 20,
		ArmorParts = 20,
		Stash = 60
	},
	{
		Food = 250,
		Ammo = 20,
		Medicine = 10,
		ArmorParts = 10,
		Stash = 30
	},
	{
		Food = 200,
		Ammo = 10,
		Medicine = 5,
		ArmorParts = 5,
		Stash = 15
	},
	{
		Food = 50,
		Ammo =  0,
		Medicine = 0,
		ArmorParts = 0,
		Stash = 5
	}
]

gt.Const.LegendMod.StartResources <- [
	{
		Money = 750,
		Ammo = 15,
		Medicine = 10,
		ArmorParts = 10
	},
	{
		Money = 500,
		Ammo = 10,
		Medicine = 5,
		ArmorParts = 5
	},
	{
		Money = 250,
		Ammo = 0,
		Medicine = 0,
		ArmorParts = 0
	},
	{
		Money = 0,
		Ammo = 0,
		Medicine = 0,
		ArmorParts = 0
	}
]

gt.Const.LegendMod.ResourceModifiers <- {
	Ammo = [8, 13, 21, 34, 55],
	ArmorParts = [3, 5, 8, 13, 21, 34],
	Meds = [5, 8, 13, 21, 34],
	Stash = [3, 5, 8, 13, 21, 34],
	Healing = [0.0, 0.10, 0.30. 0.50],
	Injury = [0.0, 0.10, 0.30, 0.50],
	Repair = [0.0, 0.10, 0.30, 0.50, 1.0],
	Salvage = [0.0, 0.10, 0.30, 0.50],
	Crafting = [0.0, 0.50, 0.75, 1.0],
	Barter = [0.0, 0.005, 0.01, 0.02, 0.03],
	ToolConsumption = [0.0, 0.05, 0.10, 0.20],
	MedConsumption = [0.0, 0.05, 0.10, 0.20],
	Hunting = [0.0, 0.1, 0.2, 0.3], // = BasePoints + BasePoints * Modifier
	Fletching = [0.0, 0.1, 0.2, 0.3], // = BasePoints + BasePoints * Modifier
	Scout = [0.0, 0.1, 0.2, 0.3], // = BasePoints + BasePoints * Modifier
	Gather = [0., 0.30, 0.50, 1.0], // = BasePoints + BasePoints * Modifier
	Training = [0.0, 0.1, 0.2, 0.3] // = BasePoints + BasePoints * Modifier
}
