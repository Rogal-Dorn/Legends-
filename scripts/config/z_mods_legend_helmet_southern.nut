
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
    ID = "oriental/assassin_face_mask", //140
    Script = "",
    Sets = [{
    Hoods = [
		[1, "hood/legend_helmet_southern_niqaab"] //100
    ],
    Helms = [
    ],
    Tops = [
    ],
    Vanity = [
		[5, "vanity/legend_helmet_southern_turban_open"], //10
    ]
}]
},{
    ID = "oriental/assassin_head_wrap", //40
    Script = "",
    Sets = [{
    Hoods = [
		[1, "hood/legend_helmet_southern_niqaab"], //100
    ],
    Helms = [
    ],
    Tops = [
    ],
    Vanity = [
		[5, "vanity/legend_helmet_southern_turban_open"], //10
    ]
}]
},{
    ID = "oriental/blade_dancer_head_wrap", //60
    Script = "",
    Sets = [{
    Hoods = [
		[1, "hood/legend_helmet_southern_niqaab"], //100
    ],
    Helms = [
    ],
    Tops = [
    ],
    Vanity = [
		[1, "vanity/legend_helmet_southern_feathered_turban"], //100
    ]
}]
},{
    ID = "oriental/desert_stalker_head_wrap", //45
    Script = "",
    Sets = [{
    Hoods = [
		[1, "hood/legend_helmet_southern_niqaab"], //100
    ],
    Helms = [
    ],
    Tops = [
    ],
    Vanity = [
		[1, "vanity/legend_helmet_southern_feathered_turban"], //100
    ]
}]
},{
    ID = "oriental/engineer_hat", //30
    Script = "",
    Sets = [{
    Hoods = [
        [1, "hood/legend_helmet_southern_cap"], //100
        [1, "hood/legend_helmet_southern_cap_dark"] //100

    ],
    Helms = [
    ],
    Tops = [
    ],
    Vanity = [
		[1, "vanity/legend_helmet_southern_silk_headscarf"], //10
    ]
}]
},{
    ID = "oriental/gladiator_helmet", //225
    Script = "",
    Sets = [{
    Hoods = [
		[1, "hood/legend_helmet_padded_cap"], //40
    ],
    Helms = [
		[4, "helm/legend_helmet_southern_gladiator_helm_crested"], //130
		[1, "helm/legend_helmet_southern_gladiator_helm_split"], //130
		[1, "helm/legend_helmet_southern_gladiator_helm_masked"], //130
    ],
    Tops = [
    ],
    Vanity = [
    ]
}]
},{
    ID = "oriental/gunner_hat", //30
    Script = "",
    Sets = [{
    Hoods = [
        [1, "hood/legend_helmet_southern_cap"], //100
        [1, "hood/legend_helmet_southern_cap_dark"] //100
    ],
    Helms = [
    ],
    Tops = [
    ],
    Vanity = [
		[1, "vanity/legend_helmet_southern_helm_tailed"], //10
    ]
}]
},{
    ID = "oriental/heavy_lamellar_helmet", //255
    Script = "",
    Sets = [{
    Hoods = [
        [1, "hood/legend_helmet_open_chain_hood"], //65
        [1, "hood/legend_helmet_chain_hood"], //80
		[5, "hood/legend_helmet_southern_chain_hood"], //80
    ],
    Helms = [
		[1, "helm/legend_helmet_southern_helmet_nasal"], //185
    ],
    Tops = [
    ],
    Vanity = [
		[1, ""], //30
		[1, "vanity/legend_helmet_southern_top_tail"], //10
    ]
}]
},{
    ID = "oriental/leather_head_wrap", //40
    Script = "",
    Sets = [{
    Hoods = [
        [1, "hood/legend_helmet_southern_cap"], //100
        [1, "hood/legend_helmet_southern_cap_dark"] //100
    ],
    Helms = [
    ],
    Tops = [
    ],
    Vanity = [
        [1, "vanity/legend_helmet_headband"], //10
		[15, "vanity/legend_helmet_southern_headband"], //15
		[4, "vanity/legend_helmet_southern_patterned_headband"], //15
    ]
}]
},{
    ID = "oriental/nomad_head_wrap", //30
    Script = "",
    Sets = [{
    Hoods = [
		[1, "hood/legend_helmet_southern_turban_light_hood"] //100
    ],
    Helms = [
    ],
    Tops = [
    ],
    Vanity = [
		[1, "vanity/legend_helmet_southern_turban_light"], //10
    ]
}]
},{
    ID = "oriental/nomad_leather_cap", //50
    Script = "",
    Sets = [{
    Hoods = [
        [1, "hood/legend_helmet_southern_cap"], //100
        [1, "hood/legend_helmet_southern_cap_dark"] //100
    ],
    Helms = [
    ],
    Tops = [
    ],
    Vanity = [
        [1, "vanity/legend_helmet_headband"], //10
		[4, "vanity/legend_helmet_southern_headband"], //15
		[15, "vanity/legend_helmet_southern_patterned_headband"] //15
    ]
}]
},{
    ID = "oriental/nomad_light_helmet", //70
    Script = "",
    Sets = [{
    Hoods = [
        [1, "hood/legend_helmet_southern_cap"], //100
        [1, "hood/legend_helmet_southern_cap_dark"], //100
        [4, "hood/legend_helmet_southern_turban_light_hood"] //100

    ],
    Helms = [
        [1, "helm/legend_helmet_norman_helm"], //50
        [1, "helm/legend_helmet_barbute"], //110
        [1, "helm/legend_helmet_basinet"], //130
        [1, "helm/legend_helmet_conic_helm"], //170
		[5, "helm/legend_helmet_southern_cap_smooth"], //160
		[1, "helm/legend_helmet_southern_cap_spiked"] //160

    ],
    Tops = [
    ],
    Vanity = [
		[1, "vanity/legend_helmet_southern_turban_full"] //10

    ]
}]
},{
    ID = "oriental/nomad_reinforced_helmet", //125
    Script = "",
    Sets = [{
    Hoods = [
        [1, "hood/legend_helmet_open_chain_hood"], //65
		[1, "hood/legend_helmet_southern_open_chain_hood"] //65
    ],
    Helms = [
    ],
    Tops = [
    ],
    Vanity = [
		[3, "vanity/legend_helmet_southern_patterned_headband"], //10
		[17, "vanity/legend_helmet_southern_patterned_headwrap"], //10
    ]
}]
},{
    ID = "oriental/southern_head_wrap", //30
    Script = "",
    Sets = [{
    Hoods = [
        [1, "hood/legend_helmet_southern_cap"], //100
        [1, "hood/legend_helmet_southern_cap_dark"] //100
    ],
    Helms = [
    ],
    Tops = [
    ],
    Vanity = [
		[1, "vanity_lower/legend_helmet_southern_turban_feather"] //10
    ]
}]
},{
    ID = "oriental/southern_helmet_with_coif", //200
    Script = "",
    Sets = [{
    Hoods = [
        [1, "hood/legend_helmet_open_chain_hood"], //65
		[1, "hood/legend_helmet_southern_open_chain_hood"] //6
    ],
    Helms = [
		[1, "helm/legend_helmet_southern_peaked_helm"] //170
    ],
    Tops = [
    ],
    Vanity = [
    ]
}]
},{
    ID = "oriental/spiked_skull_cap_with_mail", //125
    Script = "",
    Sets = [{
    Hoods = [
		[1, "hood/legend_helmet_southern_open_chain_hood"] //6
    ],
    Helms = [
		[1, "helm/legend_helmet_southern_cap_smooth"], //160
		[5, "helm/legend_helmet_southern_cap_spiked"] //160
    ],
    Tops = [
    ],
    Vanity = [
    ]
}]
},{
    ID = "oriental/turban_helmet", //290
    Script = "",
    Sets = [{
    Hoods = [
        [1, "hood/legend_helmet_chain_hood_full"], //90
    ],
    Helms = [
		[1, "helm/legend_helmet_southern_peaked_nasal_helm"] //160
    ],
    Tops = [
    ],
    Vanity = [
    ]
}]
},{
    ID = "oriental/vizier_headgear", //10
    Script = "",
    Sets = [{
    Hoods = [
		[3, "hood/legend_helmet_southern_niqaab"], //100
		[1, "hood/legend_helmet_southern_turban_light_hood"] //100
    ],
    Helms = [
    ],
    Tops = [
    ],
    Vanity = [
		[1, "vanity/legend_helmet_southern_noble_crown"], //10
		[1, "vanity/legend_helmet_southern_noble_hat"], //10
		[1, "vanity/legend_helmet_southern_noble_turban"] //10
    ]
}]
},{
    ID = "oriental/wrapped_southern_helmet", //10
    Script = "",
    Sets = [{
    Hoods = [
        [3, "hood/legend_helmet_southern_niqaab"], //100
    ],
    Helms = [
		[5, "helm/legend_helmet_southern_cap_smooth"], //160
		[1, "helm/legend_helmet_southern_cap_spiked"] //160
    ],
    Tops = [
    ],
    Vanity = [
    ]
}]
}])