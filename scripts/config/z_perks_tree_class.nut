local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

gt.Const.Perks.BeastClassTree <- {
	ID = "BeastClassTree",
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

gt.Const.Perks.BardClassTree <- {
	ID = "BardClassTree",
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

gt.Const.Perks.HealerClassTree <- {
	ID = "HealerClassTree",
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

gt.Const.Perks.FistsClassTree <- {
	ID = "FistsClassTree",
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

gt.Const.Perks.ChefClassTree <- {
	ID = "ChefClassTree",
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

gt.Const.Perks.RepairClassTree <- {
	ID = "RepairClassTree",
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

gt.Const.Perks.ClassTrees <- {
	Tree = [
		gt.Const.Perks.BeastClassTree,
		gt.Const.Perks.BardClassTree,
		gt.Const.Perks.HealerClassTree,
		gt.Const.Perks.FistsClassTree,
		gt.Const.Perks.ChefClassTree, 
		gt.Const.Perks.RepairClassTree
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