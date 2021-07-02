local gt = this.getroottable();

gt.Const.LegendMod.Outfits <- {};

if (!("LegendMod" in gt.Const))
{
	gt.Const.LegendMod <- {};
}

if (!("OutfitObjs" in gt.Const.LegendMod))
{
    gt.Const.LegendMod.OutfitObjs <- [];
}

gt.Const.LegendMod.OutfitObjs.extend([

{
    ID = "northern_mercenary_outfit_00",
    Body = [
        [1, "northern_mercenary_armor_00"]
    ],
    Helmet = [
        [1, "northern_mercenary_helmet_00"]
    ]
},
{
    ID = "northern_mercenary_outfit_01",
    Body = [
        [1, "northern_mercenary_armor_01"]
    ],
    Helmet = [
        [1, "northern_mercenary_helmet_01"]
    ]
},
{
    ID = "northern_mercenary_outfit_02",
    Body = [
        [1, "northern_mercenary_armor_02"]
    ],
    Helmet = [
        [1, "northern_mercenary_helmet_02"]
    ]
},
{
    ID = "barbarian_chosen_outfit_00",
    Body = [
        [1, "barbarian_chosen_armor_00"]
    ],
    Helmet = [
        [1, "barbarian_chosen_helmet_00"]
    ]
},
{
    ID = "barbarian_chosen_outfit_01",
    Body = [
        [1, "barbarian_chosen_armor_01"]
    ],
    Helmet = [
        [1, "barbarian_chosen_helmet_01"]
    ]
},
{
    ID = "barbarian_chosen_outfit_02",
    Body = [
        [1, "barbarian_chosen_armor_00"],
        [1, "barbarian_chosen_armor_01"]
    ],
    Helmet = [
        [1, "barbarian_chosen_helmet_02"],
    ]
},
{
    ID = "southern_knight_outfit_00",
    Body = [
        [1, "southern_knight_armor"]
    ],
    Helmet = [
        [1, "southern_knight_helmet"]
    ]
},
{
    ID = "brown_hedgeknight_outfit_00",
    Body = [
        [1, "brown_hedgeknight_armor"]
    ],
    Helmet = [
        [1, "brown_hedgeknight_helmet"]
    ]
},
{
    ID = "red_bandit_leader_outfit_00",
    Body = [
        [1, "red_bandit_leader_armor"]
    ],
    Helmet = [
        [1, "red_bandit_leader_helmet"]
    ]
},

]);

foreach( i, v in gt.Const.LegendMod.OutfitObjs )
{
	gt.Const.LegendMod.Outfits[v.ID] <- v;
}