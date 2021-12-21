local gt = this.getroottable();

if (!("EnemyPerks" in gt.Const))
{
    gt.Const.EnemyPerks <- {};
}

gt.Const.EnemyPerks.Default <- []

gt.Const.EnemyPerks.FreeCompanySpearman <- [ 
    [3, ["perk_legend_specialist_militia_skill", "perk_legend_specialist_militia_damage"], 4],
    [2, "perk_shield_expert", 2],
    [1, "perk_crippling_strikes", 1],
    [1, "perk_fortified_mind", 1],
    [1, "perk_steel_brow", 1],
    [1, "perk_hold_out", 1],
    [1, "perk_underdog", 3],
    [1, "perk_recover", 0]
]

gt.Const.EnemyPerks.FreeCompanyArcher <- [
    [3, ["perk_legend_specialist_shortbow_skill", "perk_legend_specialist_shortbow_damage"], 4],
    [1, "perk_rotation", 2],
    [1, "perk_pathfinder", 1],
    [1, "perk_bullseye", 1],
    [1, "perk_quick_hands", 0],
    [1, "perk_anticipation", 2],
    [1, "perk_relentless", 1],
]