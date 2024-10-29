::mods_hookExactClass("entity/world/settlements/situations/mirage_sightings_situation", function(o)
{
	local onAdded = o.onAdded;
	o.onAdded = function ( _settlement )
	{
		if(::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * -0.025);
		}
		onAdded( _settlement );
	}

	o.onResolved <- function ( _settlement )
	{
		if(::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * 0.125);
		}
	}

	o.onUpdateDraftList <- function ( _draftList, _gender = null)
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";

		local r;
		if ( this.World.Assets.getOrigin().getID() == "scenario.legends_seer")
		{
			r = this.Math.rand(0, 5);
			if (r == 1)
			{
				_draftList.push("legend_illusionist_background");
			}
		}
		else
		{
			r = this.Math.rand(0, 9);
			if (r == 1)
			{
				_draftList.push("legend_illusionist_background");
			}
		}
	}
});
