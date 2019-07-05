local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

gt.Const.Perks.BeastsTree <- {
	ID = "BeastsTree",
	Tree = [
		[],
		[],
		[
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyGhoul,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyDirewolf,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemySpider
		],
		[],
		[],
		[gt.Const.Perks.PerkDefs.LegendFavouredEnemyLindwurm],
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
		[gt.Const.Perks.PerkDefs.LegendFavouredEnemySchrat],
		[
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyHexen,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyAlps
		]
	]
};

gt.Const.Perks.UndeadTree <- {
	ID = "UndeadTree",
	Tree = [
		[],
		[],
		[],
		[],
		[
		gt.Const.Perks.PerkDefs.LegendFavouredEnemySkeleton,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyZombie
		],
		[],
		[gt.Const.Perks.PerkDefs.LegendFavouredEnemyVampire]
	]
};

gt.Const.Perks.OrcsTree <- {
	ID = "OrcsTree",
	Tree = [
		[],
		[],
		[],
		[],
		[
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyOrk,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyGoblin
		],
		[gt.Const.Perks.PerkDefs.LegendFavouredEnemyUnhold],
		[]
	]
};

gt.Const.Perks.CivilizationTree <- {
	ID = "CivilizationTree",
	Tree = [
		[],
		[],
		[gt.Const.Perks.PerkDefs.LegendFavouredEnemyCaravan],
		[],
		[gt.Const.Perks.PerkDefs.LegendFavouredEnemyMercenary],
		[gt.Const.Perks.PerkDefs.LegendFavouredEnemyNoble],
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
		[gt.Const.Perks.PerkDefs.LegendFavouredEnemyBandit],
		[gt.Const.Perks.PerkDefs.LegendFavouredEnemyBarbarian],
		[]
	]
};

gt.Const.Perks.ArchersTree <- {
	ID = "ArchersTree",
	Tree = [
		[gt.Const.Perks.PerkDefs.Pathfinder],
		[],
		[],
		[],
		[gt.Const.Perks.PerkDefs.Footwork],
		[gt.Const.Perks.PerkDefs.LegendFavouredEnemyArcher],
		[]
	]
};

gt.Const.Perks.SwordmastersTree <- {
	ID = "SwordmastersTree",
	Tree = [
		[],
		[],
		[gt.Const.Perks.PerkDefs.Steadfast],
		[],
		[gt.Const.Perks.PerkDefs.SunderingStrikes],
		[gt.Const.Perks.PerkDefs.LegendFavouredEnemySwordmaster],
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
		gt.Const.Perks.OutlandersTree,
		gt.Const.Perks.ArchersTree,
		gt.Const.Perks.SwordmastersTree
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
		return this.Tree[L[r]];;
	}	
};