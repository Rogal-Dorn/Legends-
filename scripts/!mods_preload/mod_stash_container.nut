::mods_hookNewObject("items/stash_container", function(o) {
    o.hasItem <- function( _id )
	{
		foreach(item in this.m.Items)
		{
			if (item == null)
			{
				continue;
			}
			
			if (item.getID() == _id)
			{
				return true
			} 
		}
		return false;
	}

})