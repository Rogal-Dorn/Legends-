local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

gt.Const.Perks.BeastsTree <- {
	ID = "BeastsTree",
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

gt.Const.Perks.MysticTree <- {
	ID = "MysticTree",
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

gt.Const.Perks.UndeadTree <- {
	ID = "UndeadTree",
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

gt.Const.Perks.OrcsTree <- {
	ID = "OrcsTree",
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

gt.Const.Perks.CivilizationTree <- {
	ID = "CivilizationTree",
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

gt.Const.Perks.OutlandersTree <- {
	ID = "OutlandersTree",
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


gt.Const.Perks.EnemyTrees <- {
	Tree = [
		gt.Const.Perks.BeastsTree,
		gt.Const.Perks.MysticTree,
		gt.Const.Perks.UndeadTree,
		gt.Const.Perks.OrcsTree,
		gt.Const.Perks.CivilizationTree, 
		gt.Const.Perks.OutlandersTree
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