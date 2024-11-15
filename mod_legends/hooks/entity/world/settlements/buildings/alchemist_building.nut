::mods_hookExactClass("entity/world/settlements/buildings/alchemist_building", function(o)
{
	local onUpdateDraftList = o.onUpdateDraftList;
	o.onUpdateDraftList = function ( _list, _gender = null)
	{
		onUpdateDraftList(_list);
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
		_list.push("legend_alchemist_background");
		_list.push("legend_alchemist_background");
	}
});
