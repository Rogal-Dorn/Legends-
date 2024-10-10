::mods_hookExactClass("ui/screens/tactical/tactical_combat_result_screen.nut", function(o) {

	o.getStashChangeData <- function ()
	{
		local ret = {
			popup = false,
			deletedNum = 0
		};
		local capacity = this.Stash.getCapacity();
		local current = "State" in ::World ? this.World.State.getPlayer().calculateStashModifier(false) : capacity;

		if (capacity > current)
		{
			for (local i = current - 1 ; i < capacity - 1; i = ++i)
			{
				if (this.Stash.getItemAtIndex(i).item != null)
				{
					ret.deletedNum++;
				}
			}
			ret.popup = ret.deletedNum != 0; 
		}

		return ret;
	}
});
