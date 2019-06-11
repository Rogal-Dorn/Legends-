local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

local Tree = [
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

gt.Const.Perks.PerksTreeHammer <-gt.Const.Perks.BuildPerkTreeFromTemplate(Tree)


