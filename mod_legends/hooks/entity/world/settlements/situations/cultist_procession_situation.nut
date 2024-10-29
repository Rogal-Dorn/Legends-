::mods_hookExactClass("entity/world/settlements/situations/cultist_procession_situation", function(o)
{
	o.onUpdateDraftList <- function ( _draftList, _gender = null)
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("flagellant_background");
		_draftList.push("butcher_background");

		if  ( this.World.Assets.getOrigin().getID() == "scenario.cultists")
		{
			_draftList.push("legend_husk_background");
			_draftList.push("legend_husk_background");
			_draftList.push("legend_lurker_background");
			_draftList.push("legend_lurker_background");
			_draftList.push("legend_lurker_background");
			_draftList.push("legend_lurker_background");
			_draftList.push("legend_magister_background");
		}

		if(this.LegendsMod.Configs().LegendMagicEnabled())
		{
			local r;
			if  ( this.World.Assets.getOrigin().getID() == "scenario.legends_seer")
			{
				r = this.Math.rand(0, 2);
				if (r == 1)
				{
				 _draftList.push("legend_ancient_summoner_background");
				}
			}
			else
			{
				r = this.Math.rand(0, 5);
				if (r == 1)
				{
				  _draftList.push("legend_ancient_summoner_background");
				}
			}

			if  ( this.World.Assets.getOrigin().getID() == "scenario.legends_warlock")
			{
			 	_draftList.push("legend_ancient_summoner_background");
			}
		}
	}
});
