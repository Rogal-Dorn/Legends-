::mods_hookExactClass("factions/actions/build_undead_camp_action", function(o) 
{
	local onUpdate = o.onUpdate;
	function onUpdate( _faction )
	{
		onUpdate();

		if (this.World.Assets.getOrigin().getID() == "scenario.legends_inquisition")
		{
			this.m.Score = 10;
		}		
		
	}
});