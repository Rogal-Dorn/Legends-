
local gt = this.getroottable();

if (!("LegendMod" in gt.Const))
{
	gt.Const.LegendMod <- {};
}

if (!("HelmObjs" in gt.Const.LegendMod))
{
    gt.Const.LegendMod.HelmObjs <- [];
}

gt.Const.LegendMod.HelmObjs.extend([
{
    ID = "legendary/emperors_countenance", //400.0
    Script = "scripts/items/helmets/legendary/emperors_countenance", //should this just be a script
    Sets = []
},{
    ID = "legendary/fangshire", //60
    Script = "scripts/items/helmets/legendary/fangshire",
    Sets = []
},{
    ID = "legendary/ijirok_helmet", //310.0
    Script = "scripts/items/helmets/legendary/ijirok_helmet",
    Sets = []
},{
    ID = "legendary/legend_demonalp_helmet", //160
    Script = "scripts/items/helmets/legendary/legend_demonalp_helmet",
    Sets = []
},{
    ID = "legendary/legend_mountain_helmet", //300.0
    Script = "scripts/items/helmets/legendary/legend_mountain_helmet",
    Sets = []
},{
    ID = "legendary/legend_redback_helmet", //200
    Script = "scripts/items/helmets/legendary/legend_redback_helmet",
    Sets = []
},{
    ID = "legendary/legend_skin_helmet", //160
    Script = "scripts/items/helmets/legendary/legend_skin_helmet",
    Sets = []
},{
    ID = "legendary/legend_stollwurm_helmet", //320
    Script = "scripts/items/helmets/legendary/legend_stollwurm_helmet",
    Sets = []
},{
    ID = "legendary/legend_white_wolf_helmet", //260
    Script = "scripts/items/helmets/legendary/legend_white_wolf_helmet",
    Sets = []
},{
    ID = "legendary/mask_of_davkul", //270.0
    Script = "scripts/items/helmets/legendary/mask_of_davkul",
    Sets = []
}])