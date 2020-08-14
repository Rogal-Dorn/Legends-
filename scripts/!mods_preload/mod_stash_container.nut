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

	o.onSerialize = function ( _out )
	{
		_out.writeU16(this.m.Items.len());
		_out.writeU16(this.m.Capacity);

		for( local i = 0; i != this.m.Items.len(); i = ++i )
		{
			local item = this.m.Items[i];

			if (item == null)
			{
				_out.writeBool(false);
			}
			else
			{
				_out.writeBool(true);
				_out.writeI32(item.ClassNameHash);
				item.onSerialize(_out);

			}
		}
	}

	o.onDeserialize = function ( _in )
	{
		this.clear();
		local numItems = _in.readU16();
		if (_in.getMetaData().getVersion() >= 52)
		{
			this.m.Capacity = _in.readU16();
		}

		if (this.m.Items.len() < numItems)
		{
			this.m.Items.resize(numItems);
			if (this.m.Capacity == 0)
			{
				this.m.Capacity = numItems;
			}
		}

		for( local i = 0; i < numItems; i = ++i )
		{
			local hasItem = _in.readBool();

			if (hasItem)
			{
				local item = this.new(this.IO.scriptFilenameByHash(_in.readI32()));
				item.onDeserialize(_in);
				this.m.Items[i] = item;
			}
		}
	}


})