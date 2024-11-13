::mods_hookExactClass("entity/world/settlements/situations/draught_situation", function(o)
{
	local onAdded = o.onAdded;
	o.onAdded = function ( _settlement )
	{
		if(::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * -0.01);
		}
		onAdded( _settlement );
	}

	local onUpdateDraftList = o.onUpdateDraftList;
	o.onUpdateDraftList = function ( _draftList, _gender = null)
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
		if  (this.World.Assets.getOrigin().getID() == "scenario.legends_necro" || this.World.Assets.getOrigin().getID() == "scenario.legends_solo_necro")
		{
			_draftList.push("legend_puppet_background");
		}
		onUpdateDraftList(_draftList, _gender);
	}
});
