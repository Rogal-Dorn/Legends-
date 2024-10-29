::mods_hookExactClass("entity/world/settlements/buildings/alchemist_building", function(o)
{
	o.onUpdateDraftList = function ( _draftList, _gender = null)
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
		_list.push("legend_alchemist_background");
		_list.push("legend_alchemist_background");
	}
});
