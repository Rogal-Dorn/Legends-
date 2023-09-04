::Const.LegendMod.addLegendItemTypes <- function()
{
	::Const.Items.addNewItemType("HorseArmor");
	::Const.Items.ItemFilter.HorseArmor <- ::Const.Items.ItemType.HorseArmor;
	::Const.Items.addNewItemType("HorseHelmet");
	::Const.Items.addNewItemType("Cultist", "Cultist Item");
	::Const.Items.addNewItemType("Net", "Net Item");

	// new item types to associate with class perks
	// Uses the MSU Item Types feature https://github.com/MSUTeam/MSU/wiki/ItemTypes
	::Const.Items.addNewItemType("Shortbow", "Shortbow Item");
	::Const.Items.addNewItemType("Pitchfork", "Pitchfork Item");

	delete ::Const.LegendMod.addLegendItemTypes;
}
