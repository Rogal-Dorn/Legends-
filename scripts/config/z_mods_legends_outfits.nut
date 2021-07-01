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

]);

foreach( i, v in gt.Const.LegendMod.OutfitObjs )
{
	gt.Const.LegendMod.Outfits[v.ID] <- v;
}