::mods_hookExactClass("entity/world/settlements/situations/situation", function(o)
{
	o.m.IsSouthern <- false;

	o.onUpdateDraftList = function ( _draftList, _gender = null)
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
	}

	o.onResolved <- function ( _settlement )
	{
		return this.onRemoved(_settlement);
	}

	o.onUpdateStablesList <- function ( _list )
	{
	}
});
