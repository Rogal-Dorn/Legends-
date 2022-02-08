local modID = "mod_mediumArmorRework";

::mods_registerMod(modID, 1.4, "Medium Armor Rework (MAR) 1.4.8");

::mods_queue(modID, "mod_legends,mod_MSU", function ()
{
	local gt = this.getroottable();	

	local perkDefObjects = [
		{
			ID = "perk.mar_in_the_zone",
			Script = "scripts/skills/perks/perk_mar_in_the_zone",
			Name = this.Const.Strings.PerkName.MARInTheZone,
			Tooltip = this.Const.Strings.PerkDescription.MARInTheZone,
			Icon = "ui/perks/in_the_zone.png",
			IconDisabled = "ui/perks/in_the_zone_bw.png",
			Const = "MARInTheZone"
		}
	];

	gt.Const.Perks.addPerkDefObjects(perkDefObjects);

	gt.Const.Perks.MediumArmorTree.Tree.clear();
	while (gt.Const.Perks.MediumArmorTree.Tree.len() < 7)
	{
		gt.Const.Perks.MediumArmorTree.Tree.push([]);
	}
	gt.Const.Perks.MediumArmorTree.Tree[1] = [gt.Const.Perks.PerkDefs.LegendBalance];
	gt.Const.Perks.MediumArmorTree.Tree[2] = [gt.Const.Perks.PerkDefs.LegendMatchingSet];
	gt.Const.Perks.MediumArmorTree.Tree[5] = [gt.Const.Perks.PerkDefs.LegendLithe];
	gt.Const.Perks.MediumArmorTree.Tree[6] = [gt.Const.Perks.PerkDefs.MARInTheZone];
});
