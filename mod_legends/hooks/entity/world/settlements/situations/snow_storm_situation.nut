::mods_hookExactClass("entity/world/settlements/situations/snow_storms_situation", function(o)
{
	local onAdded = o.onAdded;
	o.onAdded = function ( _settlement )
	{
		if(::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * -0.05);
		}
		onAdded( _settlement );
	}

	local onUpdateDraftList = o.onUpdateDraftList;
	o.onUpdateDraftList = function ( _draftList, _gender = null)
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
		onUpdateDraftList(_draftList, _gender);
	}
});
