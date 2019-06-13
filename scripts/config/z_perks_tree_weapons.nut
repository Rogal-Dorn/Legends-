local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

gt.Const.Perks.MaceTree <- {
	ID = "Mace",
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


gt.Const.Perks.FlailTree <- {
	ID = "Flail",
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

gt.Const.Perks.HammerTree <- {
	ID = "Hammer",
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

gt.Const.Perks.AxeTree <- {
	ID = "Axe",
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

gt.Const.Perks.CleaverTree <- {
	ID = "Cleaver",
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

gt.Const.Perks.GreatSwordTree <- {
	ID = "GreatSword",
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

gt.Const.Perks.SwordTree <- {
	ID = "Sword",
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

gt.Const.Perks.DaggerTree <- {
	ID = "Dagger",
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
gt.Const.Perks.PolearmTree <- {
	ID = "Polearm",
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

gt.Const.Perks.SpearTree <- {
	ID = "Spear",
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

gt.Const.Perks.CrossbowTree <- {
	ID = "Crossbow",
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

gt.Const.Perks.BowTree <- {
	ID = "Bow",
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

gt.Const.Perks.ThrowingTree <- {
	ID = "Throwing",
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

gt.Const.Perks.SlingsTree <- {
	ID = "Slings",
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

gt.Const.Perks.StavesTree <- {
	ID = "Staves",
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

gt.Const.Perks.WeaponTrees <- {
	Tree = [
		gt.Const.Perks.MaceTree,
		gt.Const.Perks.FlailTree,
		gt.Const.Perks.HammerTree,
		gt.Const.Perks.AxeTree,
		gt.Const.Perks.CleaverTree, 
		gt.Const.Perks.GreatSwordTree,
		gt.Const.Perks.SwordTree,
		gt.Const.Perks.DaggerTree,
		gt.Const.Perks.PolearmTree, 
		gt.Const.Perks.SpearTree,
		gt.Const.Perks.CrossbowTree,
		gt.Const.Perks.BowTree,
		gt.Const.Perks.ThrowingTree,
		gt.Const.Perks.SlingsTree,
		gt.Const.Perks.StavesTree
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