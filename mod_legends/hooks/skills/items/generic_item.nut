::mods_hookExactClass("skills/items/generic_item", function(o)
{
	o.onUpdate = function ( _properties )
	{
		if (this.m.Item != null && this.m.Item.getContainer() != null)
		{
			this.m.Item.onUpdateProperties(_properties);
		}
		else
		{
			this.removeSelf();
		}
	}

	o.onTurnStart = function ()
	{
		if (this.m.Item != null && this.m.Item.getContainer() != null)
		{
			this.m.Item.onTurnStart();
		}
		else
		{
			this.removeSelf();
		}
	}

});