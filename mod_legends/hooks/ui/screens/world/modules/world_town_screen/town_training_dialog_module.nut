::mods_hookExactClass("ui/screens/world/modules/world_town_screen/town_training_dialog_module", function(o) {

	local queryRosterInformation = o.queryRosterInformation; 
	o.queryRosterInformation = function()
	{
		local result = queryRosterInformation();
		result.SubTitle = "Have your men train for combat and learn from veterans";
		
		return result;
	}
});
