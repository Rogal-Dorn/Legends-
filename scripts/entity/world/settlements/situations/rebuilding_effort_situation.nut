this.rebuilding_effort_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {
		Target = ""
	},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.rebuilding_effort";
		this.m.Name = "Rebuilding Effort";
		this.m.Description = "In an effort to rebuild a nearby site, building materials are in high demand and low supply.";
		this.m.Icon = "ui/settlement_status/settlement_effect_15.png";
		this.m.IsStacking = false;
		this.m.ValidDays = 5;
	}

	function getDescription()
	{
		if (this.m.Target != "")
		{
			return "In an effort to rebuild the nearby " + this.m.Target + ", building materials are in high demand and low supply.";
		}
		else
		{
			return this.m.Description;
		}
	}

	function onAdded( _settlement )
	{
		_settlement.resetShop();
		local candidates = [];

		foreach( a in _settlement.getAttachedLocations() )
		{
			if (a.isActive())
			{
				continue;
			}

			candidates.push(a);
		}

		if (candidates.len() != 0)
		{
			this.m.Target = candidates[this.Math.rand(0, candidates.len() - 1)].getRealName();
		}
	}

	function onUpdate( _modifiers )
	{
		_modifiers.BuildingPriceMult *= 1.35000002;
		_modifiers.BuildingRarityMult *= 0.5;
	}

	function onRemoved( _settlement )
	{
		if (this.World.Contracts.getActiveContract() != null && this.World.Contracts.getActiveContract().getID() == "contract.raze_attached_location")
		{
			return;
		}

		local candidates = [];

		foreach( a in _settlement.getAttachedLocations() )
		{
			if (a.isActive())
			{
				continue;
			}

			candidates.push(a);
		}

		if (candidates.len() != 0)
		{
			local a = candidates[this.Math.rand(0, candidates.len() - 1)];
			a.setActive(true);
		}
	}

	function onSerialize( _out )
	{
		this.situation.onSerialize(_out);
		_out.writeString(this.m.Target);
	}

	function onDeserialize( _in )
	{
		this.situation.onDeserialize(_in);
		this.m.Target = _in.readString();
	}

});
