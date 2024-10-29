::mods_hookExactClass("entity/world/settlements/buildings/taxidermist_building", function(o)
{
	local onUpdateDraftList = o.onUpdateDraftList;
	o.onUpdateDraftList = function ( _draftList, _gender = null)
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
		onUpdateDraftList(_draftList, _gender);
	}
});
