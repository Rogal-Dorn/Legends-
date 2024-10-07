::mods_hookExactClass("skills/traits/fat_trait", function(o)
{	
	local onAdded = o.onAdded;
	function onAdded()
	{
		local actor = this.getContainer().getActor();
		if (actor.getBackground().getID() == "background.legend_donkey")
			return;

		onAdded();
	}
});
