::mods_hookExactClass("entity/world/settlements/buildings/temple_oriental_building", function(o)
{
	local onUpdateDraftList = o.onUpdateDraftList;
	o.onUpdateDraftList = function ( _draftList, _gender = null)
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
		_list.push("legend_dervish_background");
		onUpdateDraftList(_draftList, _gender);
	}
});
