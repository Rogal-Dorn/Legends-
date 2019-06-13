local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

gt.Const.Perks.AgileTree <- {
	ID = "AgileTree",
	Tree = [
		[gt.Const.Perks.PerkDefs.Stun],
		[gt.Const.Perks.PerkDefs.Daze],
		[],
		[gt.Const.Perks.PerkDefs.SpecMace],
		[],
		[],//gt.Const.Perks.PerkDefs.DefensiveStun],
		[]
	]
};


gt.Const.Perks.IndestructibleTree <- {
	ID = "IndestructibleTree",
	Tree = [
		[],
		[],
		[],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.MartyrTree <- {
	ID = "MartyrTree",
	Tree = [
		[],
		[],
		[],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.ViciousTree <- {
	ID = "ViciousTree",
	Tree = [
		[],
		[],
		[],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.DeviousTree <- {
	ID = "DeviousTree",
	Tree = [
		[],
		[],
		[],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.InspirationalTree <- {
	ID = "InspirationalTree",
	Tree = [
		[],
		[],
		[],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.IntelligentTree <- {
	ID = "IntelligentTree",
	Tree = [
		[],
		[],
		[],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.FastTree <- {
	ID = "FastTree",
	Tree = [
		[],
		[],
		[],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.LargeTree <- {
	ID = "LargeTree",
	Tree = [
		[],
		[],
		[],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.OrganisedTree <- {
	ID = "OrganisedTree",
	Tree = [
		[],
		[],
		[],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.SturdyTree <- {
	ID = "SturdyTree",
	Tree = [
		[],
		[],
		[],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.FitTree <- {
	ID = "FitTree",
	Tree = [
		[],
		[],
		[],
		[],
		[],
		[],
		[]
	]
};

gt.Const.Perks.TrainedTree <- {
	ID = "TrainedTree",
	Tree = [
		[],
		[],
		[],
		[],
		[],
		[],
		[]
	]
};


gt.Const.Perks.TraitsTrees <- {
	Tree = [
		gt.Const.Perks.AgileTree,
		gt.Const.Perks.IndestructibleTree,
		gt.Const.Perks.MartyrTree,
		gt.Const.Perks.ViciousTree,
		gt.Const.Perks.DeviousTree, 
		gt.Const.Perks.InspirationalTree,
		gt.Const.Perks.IntelligentTree,
		gt.Const.Perks.FastTree,
		gt.Const.Perks.LargeTree, 
		gt.Const.Perks.OrganisedTree,
		gt.Const.Perks.SturdyTree,
		gt.Const.Perks.FitTree,
		gt.Const.Perks.TrainedTree
	],
	function getRandom(_exclude) 
	{
		local L = [];
		foreach (i, t in this.Tree)
		{
			if (_exclude.find(t.ID))
			{
				continue;
			}
			L.push(i);
		}

		local r = this.Math.rand(0, L.len() - 1)
		return this.Tree[r];
	}
};