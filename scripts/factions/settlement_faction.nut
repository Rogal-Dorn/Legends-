this.settlement_faction <- this.inherit("scripts/factions/faction", {
	m = {
		MaxConcurrentContracts = 1
	},
	function addPlayerRelation( _r, _reason = "" )
	{
		if (_r > 0 && this.World.Ambitions.hasActiveAmbition() && this.World.Ambitions.getActiveAmbition().getID() == "ambition.allied_civilians")
		{
			_r = _r * 1.25;
		}

		if (_r > 0 && this.m.Settlements.len() != 0)
		{
			_r = _r * (1.0 - (this.m.Settlements[0].getSize() - 1) * 0.15);
		}

		this.faction.addPlayerRelation(_r, _reason);

		if (_r < 0)
		{
			foreach( s in this.m.Settlements )
			{
				local owner = s.getOwner();

				if (owner != null && owner.getID() != this.getID())
				{
					owner.addPlayerRelationEx(_r * 0.25);
				}
			}
		}

		if (this.m.PlayerRelation > 70.0)
		{
			this.updateAchievement("MakingFriends", 1, 1);
		}
	}

	function create()
	{
		this.faction.create();
		this.m.Type = this.Const.FactionType.Settlement;
		this.m.Base = "world_base_08";
		this.m.TacticalBase = "bust_base_militia";
		this.m.CombatMusic = this.Const.Music.CivilianTracks;
		this.m.RelationDecayPerDay = this.Const.World.Assets.RelationDecayPerDayCivilian;
		this.m.IsHiddenIfNeutral = true;
	}

	function onUpdateRoster()
	{
		for( local roster = this.getRoster(); roster.getSize() < 3;  )
		{
			local character = roster.create("scripts/entity/tactical/humans/councilman");
			character.setAppearance();

			if (character.getTitle() != "")
			{
				local currentRoster = roster.getAll();

				foreach( c in currentRoster )
				{
					if (c.getID() != character.getID() && character.getTitle() == c.getTitle())
					{
						character.setTitle("");
						break;
					}
				}
			}

			if (character.getTitle() == "")
			{
				character.setTitle("of " + this.m.Name);
			}

			character.assignRandomEquipment();
		}
	}

	// Contract Overhaul: This is the vanilla method that we have overloaded. It will be deprecated
	// function isReadyForContract()
	// {
	// 	if (this.m.Settlements.len() == 0)
	// 	{
	// 		return false;
	// 	}

	// 	this.m.MaxConcurrentContracts = this.getSettlements()[0].getSize();
	// 	local delay = 5.0 - (this.getSettlements()[0].getSize() - 1);
	// 	return this.m.Contracts.len() < this.m.MaxConcurrentContracts && (this.m.LastContractTime == 0 || this.World.getTime().Days <= 1 || this.Time.getVirtualTimeF() > this.m.LastContractTime + this.World.getTime().SecondsPerDay * delay);
	// }

	// Contract Overhaul: This is the overloaded method we have added. We now take the contract's Category into account
	// Hanter: commented out the logWarning stuff because it seems to cause crashes (probably because this method gets called a LOT)
	// Instead of commenting out the logging code, we could probably use the MSU logging debug flags feature and make it configurable in the Mod Menu
	// https://github.com/MSUTeam/MSU/wiki/Debug
	function isReadyForContract( _category = null )
	{

		if (this.m.Settlements.len() == 0)
		{
			return false;
		}

		local tier = this.getSettlements()[0].getSize() - 1;		
		if ( _category == null || !(_category in this.Const.Contracts.CategoryLimits))
		{
			// First give a warning if the Category is null or unrecognised
			// this.logWarning("Contract Overhaul: Category={" + _category + "} is null or unrecognised");

			// If there's no Category (e.g. a contract from a submod, or something we missed) or if the Category is not recognised, then only check if there is enough room in the Wildcard slot
			if(this.m.ContractsByCategory["Wildcard"].len() >= this.Const.Contracts.CategoryLimits["Wildcard"][tier])
			{
				// local warning = "";
				// warning += "Contract Overhaul: Check isReadyForContract(" + _category + ") for settlement: " + this.getSettlements()[0].getName() + " (size=" + this.getSettlements()[0].getSize() + ")";
				// warning += " --> no Category was given or the Category is not recognised, and the Wildcard slots were full (" + this.m.ContractsByCategory["Wildcard"].len() + " existing contracts)";
				// this.logWarning(warning);
				return false;
			}
		}
		else
		{
			// There's no room for new contracts if BOTH the contract's potential corresponding Category slots AND the settlement's Wildcard slots are full
			if (this.m.ContractsByCategory[_category].len() >= this.Const.Contracts.CategoryLimits[_category][tier] && this.m.ContractsByCategory["Wildcard"].len() >= this.Const.Contracts.CategoryLimits["Wildcard"][tier])
			{
				// local warning = "";
				// warning += "Contract Overhaul: Check isReadyForContract(" + _category + ") for settlement: " + this.getSettlements()[0].getName() + " (size=" + this.getSettlements()[0].getSize() + ")";
				// warning += " --> both Category and Wildcard slots were full (" + this.m.ContractsByCategory[_category].len() + "," + this.m.ContractsByCategory["Wildcard"].len() + " existing contracts)";
				return false;
			}
		}

		// The remaining checks are based on time-related cooldowns
		local delay = 5.0 - (this.getSettlements()[0].getSize() - 1);
		return this.m.LastContractTime == 0 || this.World.getTime().Days <= 1 || this.Time.getVirtualTimeF() > this.m.LastContractTime + this.World.getTime().SecondsPerDay * delay;
			
	}

	function onSerialize( _out )
	{
		this.faction.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.faction.onDeserialize(_in);
	}

});

