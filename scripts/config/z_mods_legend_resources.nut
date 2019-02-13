local gt = this.getroottable();

if (!("LegendMod" in gt.Const))
{
	gt.Const.LegendMod <- {};
}

gt.Const.LegendMod.MaxResources <- [
	{
		Food = 300,
		Ammo = 300,
		Medicine = 75,
		ArmorParts = 120
	},
	{
		Food = 250,
		Ammo = 200,
		Medicine = 50,
		ArmorParts = 90
	},
	{
		Food = 200,
		Ammo = 100,
		Medicine = 25,
		ArmorParts = 60
	}
]

gt.Const.LegendMod.StartResources <- [
	{
		Money = 750,
		Ammo = 20,
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
	}
]

gt.Const.LegendMod.getMaxAmmo <- function ( _background )
{
	switch ( _background )
	{
		case "background.poacher":
		case "background.peddler":
		case "background.hunter":
		case "background.bowyer":
			return 15;
			break;

		default:
			return 0;
	}
	return 0;
};

gt.Const.LegendMod.getMaxArmorParts <- function ( _background )
{
	switch ( _background )
	{
		case "background.tailor":
		case "background.peddler":
		case "background.apprentice":
			return 15;
			break;

		default:
			return 0;
	}
	return 0;
};

gt.Const.LegendMod.getMaxMedicine <- function ( _background )
{
	switch ( _background )
	{
		case "background.peddler":
		case "background.monk":
		case "background.butcher":
			return 5;
			break;

		default:
			return 0;
	}
	return 0;
};