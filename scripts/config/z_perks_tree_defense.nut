local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

gt.Const.Perks.ShieldTree <- {
	ID = "ShieldTree",
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


gt.Const.Perks.HeavyArmorTree <- {
	ID = "HeavyArmorTree",
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

gt.Const.Perks.MediumArmorTree <- {
	ID = "MediumArmorTree",
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

gt.Const.Perks.LightArmorTree <- {
	ID = "LightArmorTree",
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

gt.Const.Perks.HelmetTree <- {
	ID = "HelmetTree",
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

gt.Const.Perks.DefenseTrees <- {
	Tree = [
		gt.Const.Perks.ShieldTree,
		gt.Const.Perks.HeavyArmorTree,
		gt.Const.Perks.MediumArmorTree,
		gt.Const.Perks.LightArmorTree,
		gt.Const.Perks.HelmetTree
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