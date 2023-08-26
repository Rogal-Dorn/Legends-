::Const.LegendMod.addLegendItemTypes <- function()
{
	::Const.Items.addNewItemType("HorseArmor");
	::Const.Items.ItemFilter.HorseArmor <- ::Const.Items.ItemType.HorseArmor;
	::Const.Items.addNewItemType("HorseHelmet");
	::Const.Items.addNewItemType("Cultist", "Cultist Item");

	// new weapon types
	::Const.Items.addNewWeaponType("Butcher", "Butcher Knife");
	::Const.Items.addNewWeaponType("Blacksmith", "Blacksmith Hammer");
	::Const.Items.addNewWeaponType("Knife");
	::Const.Items.addNewWeaponType("Net");
	::Const.Items.addNewWeaponType("Ninetails");
	::Const.Items.addNewWeaponType("Shortbow");
	::Const.Items.addNewWeaponType("Shovel");
	::Const.Items.addNewWeaponType("Sickle");
	::Const.Items.addNewWeaponType("Pickaxe");
	::Const.Items.addNewWeaponType("Pitchfork");
	::Const.Items.addNewWeaponType("Woodaxe");

	delete ::Const.LegendMod.addLegendItemTypes;
}
