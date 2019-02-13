local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}


gt.Const.Perks.findByBackground <- function ( _perkID, _background )
{
	if ( _perkID == null || _background == null)
	{
		return null;
	}

	local perkMap = gt.Const.Perks.getPerksMap(_background);

	if (_perkID in perkMap)
	{
		return perkMap[_perkID];
	}

	return null;
};

gt.Const.Perks.getPerksMap <- function ( _background )
{
	switch ( _background )
	{
		case "background.legend_commander_witch":
			return gt.Const.Perks.TreeSeerLookupMap;
			break;
		case "background.legend_commander_crusader":
			return gt.Const.Perks.TreeCrusaderLookupMap;
			break;
		case "background.legend_commander_ranger":
			return gt.Const.Perks.TreeRangerLookupMap;
			break;
		case "background.legend_commander_necro":
			return gt.Const.Perks.TreeNecromancerLookupMap;
			break;
		case "background.legend_commander_noble":
			return gt.Const.Perks.TreeNobleLookupMap;
			break;
		case "background.legend_commander_beggar":
			return gt.Const.Perks.TreeBeggarLookupMap;
			break;			
		default:
			return  gt.Const.Perks.LookupMap;
	}
	return null;
};

gt.Const.Perks.getPerksTree <- function ( _background )
{
	switch ( _background )
	{
		case "background.legend_commander_witch":
			return gt.Const.Perks.PerksTreeSeer;
			break;
		case "background.legend_commander_crusader":
			return gt.Const.Perks.PerksTreeCrusader;
			break;
		case "background.legend_commander_ranger":
			return gt.Const.Perks.PerksTreeRanger;
			break;
		case "background.legend_commander_necro":
			return gt.Const.Perks.PerksTreeNecromancer;
			break;
		case "background.legend_commander_noble":
			return gt.Const.Perks.PerksTreeNoble;
			break;
		case "background.legend_commander_beggar":
			return gt.Const.Perks.PerksTreeBeggar;
			break;			
		default:
			return  gt.Const.Perks.Perks;
	}
	return null;
};
