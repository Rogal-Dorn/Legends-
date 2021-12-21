local gt = this.getroottable();

if (!("EnemyPerks" in gt.Const))
{
    gt.Const.EnemyPerks <- {};
}

gt.Const.EnemyPerks.FreeCompanySpearman <- [
    [1, "perk_legend_specialist_militia_skill", 2],
    [1, "perk_legend_specialist_militia_damage", 2],
    [1, "perk_shield_expert", 2],
    [1, "perk_crippling_strikes", 1],
    [1, "perk_fortified_mind", 1],
    [1, "perk_steel_brow", 1]
]