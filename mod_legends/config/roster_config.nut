local gt = this.getroottable();

gt.Const.Roster <- {
	function getSizeForTier( _tier )
	{
		return gt.Const.Roster.Size[_tier];
	}

	function getInCombatSizeForTier( _tier )
	{
		return gt.Const.Roster.InCombatSize[_tier];
	}

	function getTierForSize( _size )
	{
		foreach (i, size in gt.Const.Roster.Size)
		{
			if (size >= _size)
			{
				return gt.Const.Roster.Tier[i];
			}
		}
	}

	function getTierForInCombatSize( _size )
	{
		foreach (i, size in gt.Const.Roster.InCombatSize)
		{
			if (size >= _size)
			{
				return gt.Const.Roster.Tier[i];
			}
		}
	}

	function createReputationTiers( _startingReputation )
	{
		local tiers = [];

		foreach (rep in gt.Const.BusinessReputation)
		{
			if (rep > _startingReputation && tiers.len() < gt.Const.Roster.Tier.len())
			{
				tiers.push(rep);
			}
		}

		// If Reputation tiers are fewer in number than Roster Tiers, add more Reputation Tiers 
		// with steps of half of the last tier until the two arrays are equal in length
		for (local i = 0; i < gt.Const.Roster.Tier.len() - tiers.len(); i++)
		{
			local lastReputation = tiers[tiers.len() - 1];
			tiers.push(lastReputation + lastReputation/2);
		}

		return tiers;
	}
};

gt.Const.Roster.Tier <- [
	0,
	1,
	2, // Default starting tier
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10
];

gt.Const.Roster.Size <- [
	1, 
	3,  
	6,  // Default starting size
	8,  
	10, 
	12,
	15, 
	18, 
	21, 
	25, 
	27, 
];

gt.Const.Roster.InCombatSize <- [
	1,
	3,  
	6,  // Default starting size
	8,  
	10, 
	12, 
	14, 
	16, 
	18,
	20, 
	22, 
];

gt.Const.Roster.DefaultTierMax <- gt.Const.Roster.Tier[gt.Const.Roster.Tier.len() - 2];
gt.Const.Roster.DefaultTier <- 2;

gt.Const.Roster.DefaultReputationTiers <- gt.Const.Roster.createReputationTiers(250);

