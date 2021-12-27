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
{
    ID = "brown_monk_outfit_00",
    Body = [
        [1, "brown_monk_armor_00"]
    ],
    Helmet = [
        [1, "brown_monk_helmet_00"]
    ]
},
{
    ID = "dark_southern_outfit_00",
    Body = [
        [1, "dark_southern_armor_00"]
    ],
    Helmet = [
        [1, "dark_southern_helmet_00"]
    ]
},
{
    ID = "white_nomad_leader_outfit_00",
    Body = [
        [1, "white_nomad_leader_armor_00"]
    ],
    Helmet = [
        [1, "white_nomad_leader_helmet_00"]
    ]
},
{
  ID = "traze_northern_mercenary_outfit_00" //00 unneeded but nice if you want to add a second one in the future maybe
  Body = [ 
      [1, "traze_northern_mercenary_armor"] 
    ],
  Helmet = [ 
      [1, "traze_northern_mercenary_cap"] 
    ]
},
{
  ID = "mercenary_archer_outfit_00" //00 unneeded but nice if you want to add a second one in the future maybe
  Body = [ 
      [1, "mercenary_archer_armor_00"],
      [1, "mercenary_archer_armor_01"]
    ],
  Helmet = [ 
      [1, "mercenary_archer_helmet_00"] 
    ]
},
{
  ID = "mercenary_infantry_outfit_00" 
  Body = [ 
      [1, "mercenary_infantry_armor_00"]
    ],
  Helmet = [ 
      [1, "mercenary_infantry_helmet_00"] 
    ]
},
{
  ID = "mercenary_infantry_outfit_01" 
  Body = [ 
      [1, "mercenary_infantry_armor_01"]
    ],
  Helmet = [ 
      [1, "mercenary_infantry_helmet_01"] 
    ]
},
{
  ID = "mercenary_crossbow_outfit_00" 
  Body = [ 
      [1, "mercenary_crossbow_armor_00"]
    ],
  Helmet = [ 
      [1, "mercenary_crossbow_helmet_00"], 
      [1, "mercenary_crossbow_helmet_01"],
      [1, "mercenary_crossbow_helmet_02"] 
    ]
},
{
  ID = "mercenary_spearman_outfit_00" 
  Body = [ 
      [1, "mercenary_spearman_armor_00"]
    ],
  Helmet = [ 
      [1, "mercenary_spearman_helmet_00"]
    ]
},
{
  ID = "mercenary_spearman_outfit_01" 
  Body = [ 
      [1, "mercenary_spearman_armor_01"]
    ],
  Helmet = [ 
      [1, "mercenary_spearman_helmet_01"]
    ]
},
{
  ID = "mercenary_leader_outfit_uncommon_00" 
  Body = [ 
      [1, "mercenary_leader_armor_uncommon_00"]
    ],
  Helmet = [ 
      [1, "mercenary_leader_helmet_uncommon_00"]
    ]
},
{
  ID = "mercenary_leader_outfit_00" 
  Body = [ 
      [1, "mercenary_leader_armor_00"]
    ],
  Helmet = [ 
      [1, "mercenary_leader_helmet_00"]
    ]
},
{
  ID = "mercenary_leader_outfit_gilded_00" 
  Body = [ 
      [1, "mercenary_leader_armor_gilded_00"]
    ],
  Helmet = [ 
      [1, "mercenary_leader_helmet_gilded_00"]
    ]
},
{
  ID = "mercenary_longbow_outfit_00"  //todo lazy
  Body = [
      [1, "mercenary_longbow_armor_00"]
    ],
  Helmet = [ 
      [1, "mercenary_longbow_helmet_00"]
    ]
},
{
  ID = "mercenary_billman_outfit_00"
  Body = [
      [1, "mercenary_billman_armor_00"]
    ],
  Helmet = [ 
      [1, "mercenary_billman_helmet_00"]
    ]
},


]);

foreach( i, v in gt.Const.LegendMod.OutfitObjs )
{
	gt.Const.LegendMod.Outfits[v.ID] <- v;
}