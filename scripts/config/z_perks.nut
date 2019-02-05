local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

gt.Const.Perks.PerksTreeAlt <- [
	[
		{
			ID = "perk.fast_adaption",
			Script = "scripts/skills/perks/perk_fast_adaption",
			Name = this.Const.Strings.PerkName.FastAdaption,
			Tooltip = this.Const.Strings.PerkDescription.FastAdaption,
			Icon = "ui/perks/perk_33.png",
			IconDisabled = "ui/perks/perk_33_sw.png"
		}
	],
	[
		{
			ID = "perk.coup_de_grace",
			Script = "scripts/skills/perks/perk_coup_de_grace",
			Name = this.Const.Strings.PerkName.CoupDeGrace,
			Tooltip = this.Const.Strings.PerkDescription.CoupDeGrace,
			Icon = "ui/perks/perk_16.png",
			IconDisabled = "ui/perks/perk_16_sw.png"
		}
	],
	[
		{
			ID = "perk.backstabber",
			Script = "scripts/skills/perks/perk_backstabber",
			Name = this.Const.Strings.PerkName.Backstabber,
			Tooltip = this.Const.Strings.PerkDescription.Backstabber,
			Icon = "ui/perks/perk_59.png",
			IconDisabled = "ui/perks/perk_59_sw.png"
		}
	],
	[
		{
			ID = "perk.mastery.mace",
			Script = "scripts/skills/perks/perk_mastery_mace",
			Name = this.Const.Strings.PerkName.SpecMace,
			Tooltip = this.Const.Strings.PerkDescription.SpecMace,
			Icon = "ui/perks/perk_43.png",
			IconDisabled = "ui/perks/perk_43_sw.png"
		}
	],
	[
		{
			ID = "perk.reach_advantage",
			Script = "scripts/skills/perks/perk_reach_advantage",
			Name = this.Const.Strings.PerkName.ReachAdvantage,
			Tooltip = this.Const.Strings.PerkDescription.ReachAdvantage,
			Icon = "ui/perks/perk_19.png",
			IconDisabled = "ui/perks/perk_19_sw.png"
		}
	],
	[
		{
			ID = "perk.berserk",
			Script = "scripts/skills/perks/perk_berserk",
			Name = this.Const.Strings.PerkName.Berserk,
			Tooltip = this.Const.Strings.PerkDescription.Berserk,
			Icon = "ui/perks/perk_35.png",
			IconDisabled = "ui/perks/perk_35_sw.png"
		}
	],
	[
		{
			ID = "perk.fearsome",
			Script = "scripts/skills/perks/perk_fearsome",
			Name = this.Const.Strings.PerkName.Fearsome,
			Tooltip = this.Const.Strings.PerkDescription.Fearsome,
			Icon = "ui/perks/perk_27.png",
			IconDisabled = "ui/perks/perk_27_sw.png"
		}
	],
	[],
	[],
	[],
	[]
];

gt.Const.Perks.TreeAltLookupMap <- {};

for( local row = 0; row < this.Const.Perks.PerksTreeAlt.len(); row = ++row )
{
	for( local i = 0; i < this.Const.Perks.PerksTreeAlt[row].len(); i = ++i )
	{
		local perk = this.Const.Perks.PerksTreeAlt[row][i];
		perk.Row <- row;
		perk.Unlocks <- row;
		gt.Const.Perks.TreeAltLookupMap[perk.ID] <- perk;
	}
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
		case "background.apprentice":
		case "background.beggar":
		case "background.farmhand":
			return gt.Const.Perks.TreeAltLookupMap;
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
		case "background.apprentice":
		case "background.beggar":
		case "background.farmhand":
			return gt.Const.Perks.PerksTreeAlt;
			break;
		
		default:
			return  gt.Const.Perks.Perks;
	}
	return null;
};
