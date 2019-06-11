local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

local HammerTree = [
	[ gt.Const.Perks.PerkDefs.LegendSpecialistHammerSkill ],
	[],
	[ gt.Const.Perks.PerkDefs.LegendSpecialistHammerDamage ],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[]	
];

local trees = gt.Const.Perks.BuildPerkTreeFromTemplate(HammerTree);
gt.Const.Perks.PerksTreeHammer <- trees.Tree;
gt.Const.Perks.TreeHammerLookupMap <- trees.Map;

