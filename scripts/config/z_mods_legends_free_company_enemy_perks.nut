local gt = this.getroottable();

if (!("EnemyPerks" in gt.Const))
{
    gt.Const.EnemyPerks <- {};
}

gt.Const.EnemyPerks.FreeCompanySpearman <- [
    [3, ["perk_legend_specialist_militia_skill", "perk_legend_specialist_militia_damage"], 3],
    [1, "perk_shield_expert", 2],
    [1, "perk_crippling_strikes", 1],
    [1, "perk_fortified_mind", 1],
    [1, "perk_steel_brow", 1]
]