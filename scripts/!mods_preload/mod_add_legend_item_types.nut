::Const.LegendMod.addLegendItemTypes <- function()
{
	::Const.Items.addNewItemType("HorseArmor");
	::Const.Items.ItemFilter.HorseArmor <- ::Const.Items.ItemType.HorseArmor;
	::Const.Items.addNewItemType("HorseHelmet");
	::Const.Items.addNewItemType("Cultist", "Cultist Item");
	::Const.Items.addNewItemType("Net", "Net Item");

	// new item types to associate with class perks
	// Uses the MSU Item Types feature https://github.com/MSUTeam/MSU/wiki/ItemTypes
	::Const.Items.addNewItemType("Butcher", "Butcher Knife Item");
	::Const.Items.addNewItemType("Blacksmith", "Blacksmith Hammer Item");
	::Const.Items.addNewItemType("Knife", "Knife Item");
	::Const.Items.addNewItemType("Ninetails", "Ninetails Item");
	::Const.Items.addNewItemType("Shortbow", "Shortbow Item");
	::Const.Items.addNewItemType("Shovel", "Shovel Item");
	::Const.Items.addNewItemType("Sickle", "Sickle Item");
	::Const.Items.addNewItemType("Scythe", "Scythe Item");
	::Const.Items.addNewItemType("Pickaxe", "Pickaxe Item");
	::Const.Items.addNewItemType("Pitchfork", "Pitchfork Item");
	::Const.Items.addNewItemType("Woodaxe", "Woodaxe Item");
	::Const.Items.addNewItemType("Militia", "Militia Item");

	delete ::Const.LegendMod.addLegendItemTypes;
}
