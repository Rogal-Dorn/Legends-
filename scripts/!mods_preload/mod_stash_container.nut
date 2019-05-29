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

	o.getItemByInstanceID = function( _instanceID )
	{
		for( local i = 0; i < this.m.Items.len(); i = ++i )
		{

			if (this.m.Items[i] != null && this.m.Items[i].getInstanceID() == _instanceID)
			{
				return {
					item = this.m.Items[i],
					index = i
				};
			}

			if (this.m.Items[i] != null && this.m.Items[i].getOldInstanceID() == _instanceID)
			{
				return {
					item = this.m.Items[i],
					index = i
				};
			}
		}

		this.logInfo("couldn't find Instance ID! . Items length = " + this.m.Items.len());

		return null;
	}


})