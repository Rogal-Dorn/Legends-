::mods_hookNewObject("contracts/contract_manager", function(o) 
{
	local onDeserialize = o.onDeserialize;
	o.onDeserialize = function( _in )
	{
		onDeserialize(_in);

		foreach( c in this.m.Open )
		{
			if (c.getDescription().len() != 0)
				continue;

			//if (c.m.Flags.has("ContractDescription"))
			//	c.m.Description = c.m.Flags.get("ContractDescription");
			//else
				c.formatDescription();
		}
	}
});