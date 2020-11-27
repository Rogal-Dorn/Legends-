
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
        ID = "aketon_cap",
        Script = "",
        Sets = [{
            Hoods = [
                [1, "hood/legend_helmet_padded_cap"]
            ],
            Helms = [
            ],
            Tops = [
            ],
            Vanity = [
            ]
        }]
    },{
        ID = "barbute_helmet", //190
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_padded_cap"], //40
            [1, "hood/legend_helmet_leather_hood"], //45
            [1, "hood/legend_helmet_padded_hood"], //50
            [3, "hood/legend_helmet_chain_hood"] //80
        ],
        Helms = [
            [1, "helm/legend_helmet_barbute"] //110
        ],
        Tops = [],
        Vanity = [
            [5, ""],
            [1, "vanity/legend_helmet_feather_band"],
            [1, "vanity/legend_helmet_headband"],
            [1, "vanity/legend_helmet_plait"] //10
        ]
    }]
    },{
        ID = "bascinet_with_mail",
        Script = "",
        Sets = [{
            Hoods = [
                [3, "hood/legend_helmet_open_chain_hood"],
                [2, "hood/legend_helmet_chain_hood"],
                [1, "hood/legend_helmet_chain_hood_full"]
            ],
            Helms = [
                [1, "helm/legend_helmet_basinet"],
                [1, "helm/legend_helmet_horsetail"]
            ],
            Tops = [],
            Vanity = [
                [5, ""],
                [2, "vanity/legend_helmet_plait"]
            ]
        }]
    },{
        ID = "closed_flat_top_helmet", //170
        Script = "",
        Sets = [{
        Hoods = [
            [4, "hood/legend_helmet_simple_hood"], //30
            [1, "hood/legend_helmet_padded_cap"], //40
            [1, "hood/legend_helmet_hood_cloth_wide"], //30
            [1, "hood/legend_helmet_padded_cap"], //40
        ],
        Helms = [
            [1, "helm/legend_helmet_flat_top_face_plate"] //130
        ],
        Tops = [
        ],
        Vanity = [
            [5, ""],
            [1, "vanity/legend_helmet_headband"],
            [1, "vanity/legend_helmet_plait"] //10
        ]
    }]
    },{
        ID = "closed_flat_top_with_mail", //280
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_hood"], //80
            [1, "hood/legend_helmet_chain_hood_full"] //90
        ],
        Helms = [
            [1, "helm/legend_helmet_flat_top_face_plate"] //130
        ],
        Tops = [
            [1, "top/legend_helmet_faceplate_flat"] //45
        ],
        Vanity = [
            [5, ""],
            [1, "vanity/legend_helmet_headband"],
            [1, "vanity/legend_helmet_plait"] //10
        ]
    }]
    },{
        ID = "closed_flat_top_with_neckguard", //180
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_leather_hood"], //45
            [1, "hood/legend_helmet_padded_hood"] //50
        ],
        Helms = [
            [1, "helm/legend_helmet_flat_top_face_plate"] //130
        ],
        Tops = [],
        Vanity = [
            [5, ""],
            [1, "vanity/legend_helmet_headband"],
            [1, "vanity/legend_helmet_plait"] //10
        ]
    }]
    },{
        ID = "closed_mail_coif", //90
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_hood"] //80
        ],
        Helms = [],
        Tops = [
            [1, "top/legend_helmet_chain_attachment"] //40
        ],
        Vanity = [
            [5, ""],
            [1, "vanity/legend_helmet_headband"],
            [1, "vanity/legend_helmet_plait"] //10
        ]
    }]
    },{ //started here
        ID = "conic_helmet_with_closed_mail", //265
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_hood"], //80
            [1, "hood/legend_helmet_chain_hood_full"], //90
        ],
        Helms = [
            [1, "helm/legend_helmet_basinet"], //130
            [1, "helm/legend_helmet_kettle_helm"], //130
            [1, "helm/legend_helmet_conic_helm"], //170
            [1, "helm/legend_helmet_nordic_helm"], //185
        ],
        Tops = [
            [1, "top/legend_helmet_eyemask"], //35
        ],
        Vanity = [
        ]
    }]
    },{
        ID = "conic_helmet_with_faceguard", //280
        Script = "",
        Sets = [{
        Hoods = [
            [4, "hood/legend_helmet_chain_scarf"], //70
            [1, "hood/legend_helmet_chain_hood"], //80
            [1, "hood/legend_helmet_chain_hood_full"], //90
        ],
        Helms = [
            [1, "helm/legend_helmet_basinet"], //130
            [1, "helm/legend_helmet_kettle_helm"], //130
            [1, "helm/legend_helmet_conic_helm"], //170
        ],
        Tops = [
            [1, "top/legend_helmet_faceplate_snub_nose"], //75
            [1, "top/legend_helmet_faceplate_snub_slit"], //80
            [1, "top/legend_helmet_faceplate_sharp"], //85
            [7, "top/legend_helmet_facemask"], //90
        ],
        Vanity = [
        ]
    }]
    },{
        ID = "cultist_hood", //30
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_cloth_scarf"], //10
            [1, "hood/legend_helmet_cloth_cap"],
        ],
        Helms = [
        ],
        Tops = [
        ],
        Vanity = [
            [1, "vanity/legend_helmet_sack"], //20
        ]
    }]
    },{
        ID = "cultist_leather_hood", //60
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_cloth_scarf"], //10
            [1, "hood/legend_helmet_cloth_cap"]
        ],
        Helms = [
        ],
        Tops = [
            [1, "top/legend_helmet_cult_hood"], //50
        ],
        Vanity = [
        ]
    }]
    },{ //avg of 32 dura
        ID = "dark_cowl", //40
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_cloth_cap"] // 10
        ],
        Helms = [],
        Tops = [
            [1, "top/legend_helmet_hood_cloth_round"], //10
            [1, "top/legend_helmet_hood_cloth_wide"], //10
            [1, "top/legend_helmet_hood_cloth_square"], //10
            [1, "top/legend_helmet_cloth_long_hood"], //10
        ],
        Vanity = [
            [1, ""],
            [1, "vanity/legend_helmet_wizard_cowl"]
        ]
    }]
    },{
        ID = "decayed_closed_flat_top_with_mail", //230, -19, -3, 1250
        Script = "",
        Sets = [{
        Hoods = [ //60 need 170
            [3, "hood/legend_helmet_rotten_chain_scarf"], //60, -3, 0
            [1, "hood/legend_helmet_barb_chain_scarf"], //55, -2, 0
        ],
        Helms = [ //150 need 20
            [1, "helm/legend_helmet_rotten_flat_top_face_mask"], //150, -14, -3
        ],
        Tops = [
            [1, "top/legend_helmet_hood_cloth_round"], //10, -1, 0
            [1, "top/legend_helmet_hood_cloth_wide"], //10
            [1, "top/legend_helmet_hood_cloth_square"], //10
            [1, "top/legend_helmet_cloth_long_hood"], //10
        ],
        Vanity = [
        ]
    }]
    },{
        ID = "decayed_closed_flat_top_with_sack", //230, -19, 3
        Script = "",
        Sets = [{
        Hoods = [ //60 need 170
            [3, "hood/legend_helmet_rotten_chain_scarf"], //60, -3, 0
            [1, "hood/legend_helmet_barb_chain_scarf"], //55, -2, 0
        ],
        Helms = [ //150 need 20
            [1, "helm/legend_helmet_rotten_flat_top_face_mask"], //150, -14, -3
        ],
        Tops = [
        ],
        Vanity = [
            [1, "vanity/legend_helmet_sack"], //20, 0, -1
        ]
    }]
    },{
        ID = "decayed_full_helm", //240, -20, -3
        Script = "",
        Sets = [{
        Hoods = [
            [8, "hood/legend_helmet_rotten_chain_scarf"], //60, -3, 0
        ],
        Helms = [
            [1, "helm/legend_helmet_rotten_great_helm"] //160, -15, -3
        ],
        Tops = [
            [4, ""],
            [1, "top/legend_helmet_hood_cloth_round"], //10, -1, 0
            [1, "top/legend_helmet_hood_cloth_wide"], //10
            [1, "top/legend_helmet_hood_cloth_square"], //10
            [1, "top/legend_helmet_cloth_long_hood"], //10
        ],
        Vanity = [
        ]
    }]
    },{
        ID = "decayed_great_helm", //255, -22, -3
        Script = "",
        Sets = [{
        Hoods = [
            [6, "hood/legend_helmet_rotten_chain_scarf"], //60, -3, 0
            [3, "hood/legend_helmet_open_chain_hood"], //60, -3, 0
            [1, "hood/legend_helmet_chain_scarf"], //70, -4, -0
        ],
        Helms = [
            [1, "helm/legend_helmet_rotten_flat_top_face_mask"], //150, -14, -3
            [1, "helm/legend_helmet_rotten_great_helm"] //160, -15, -3
        ],
        Tops = [
        ],
        Vanity = [
            [1, "vanity/legend_helmet_faction_decayed_helmet"], //10, -1, 0
        ]
    }]
    },{ //adds up to 100 only; maybe todo
        ID = "dented_nasal_helmet", //110, -7, -1
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_leather_hood"], //45, -2, 0
            [1, "hood/legend_helmet_padded_hood"], //50, -2, 0
        ],
        Helms = [
            [1, "helm/legend_helmet_norman_helm"], //60, -4, -1
        ],
        Tops = [
        ],
        Vanity = [
        ]
    }]
    },{
        ID = "faction_helm",
        Script = "scripts/items/legend_helmets/helmets/legend_faction_helmet",
        Sets = [{
        Hoods = [
        ],
        Helms = [
        ],
        Tops = [
        ],
        Vanity = [
        ]
    }]
    },{ //
        ID = "feathered_hat", //30
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_cloth_cap"] //10
        ],
        Helms = [
        ],
        Tops = [
        ],
        Vanity = [
            [1, "vanity/legend_helmet_feathered_hat"] //10
        ]
    }]
    },{ //lower than avg dura, todo
        ID = "flat_top_helmet", //125, -7, -1
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_leather_hood"], //45, -2, 0
            [1, "hood/legend_helmet_padded_hood"], //50, -2, 0
        ],
        Helms = [
            [1, "helm/legend_helmet_flat_top_helm"] //75, -5, -1
        ],
        Tops = [
        ],
        Vanity = [
        ]
    }]
    },{
        ID = "flat_top_with_closed_mail", //265, -18, -2, 2600
        Script = "",
        Sets = [{
        Hoods = [ //avg slightly below 70, need 200
            [1, "hood/legend_helmet_chain_scarf"], //70, -4, 0, 250
            [1, "hood/legend_helmet_chain_hood"]//80, -5, 0, 310
        ],
        Helms = [
            [1, "helm/legend_helmet_flat_top_helm"] //75, -5, -1, 450
        ],
        Tops = [
            [1, "top/legend_helmet_chain_attachment"] //50, -4, -1, 410
        ],
        Vanity = [
        ]
    }]
    },{
        ID = "flat_top_with_mail", //230
        Script = "",
        Sets = [{
        Hoods = [ //avg slightly below 70, need 200
            [1, "hood/legend_helmet_chain_scarf"], //70, -4, 0, 250
            [1, "hood/legend_helmet_chain_hood"]//80, -5, 0, 310
        ],
        Helms = [
            [1, "helm/legend_helmet_flat_top_helm"] //75, -5, -1, 450
        ],
        Tops = [
        ],
        Vanity = [
        ]
    }]
    },{
        ID = "full_aketon_cap", //50
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_padded_hood"]
        ],
        Helms = [],
        Tops = [],
        Vanity = []
    }]
    },{
        ID = "full_helm", //300, -20, -3, 3500
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_hood"] //80, -5, 0, 310
        ],
        Helms = [
            [1, "helm/legend_helmet_great_helm"] //220, -15, -3, 3000
        Tops = [],
        Vanity = []
    }]
    },{
        ID = "full_leather_cap", //45
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_leather_hood"] //45
        ],
        Helms = [],
        Tops = [],
        Vanity = []
    }]
    },{
        ID = "greatsword_faction_helm", //160
        Script = "scripts/items/legend_helmets/helmets/legend_faction_helmet",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_padded_cap"] //40
        ],
        Helms = [
            [1, "helm/legend_helmet_norman_helm"] //50
        ],
        Tops = [
            [1, "top/legend_helmet_fencer_hat"] //60
        ],
        Vanity = [
            [1, "vanity/legend_helmet_plait"], //10
            [1, "vanity/legend_helmet_faction_helmet_2"] //10

        ]
    }]
    },{
        ID = "greatsword_hat", //70
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_cloth_bandana"] //15,
            [2, "hood/legend_cloth_cap"] //10
        ],
        Helms = [
        ],
        Tops = [
            [1, "top/legend_helmet_fencer_hat"] //60 if this goes here insteaed then we can actually make the greatsword_hat
        ],
        Vanity = [
            // [1, "vanity/legend_helmet_fencer_hat"] //10
        ]
    }]
    },{
        ID = "headscarf", //20
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_cloth_scarf"] //10
        ],
        Helms = [],
        Tops = [],
        Vanity = []
    }]
    },{
        ID = "hood", //30
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_simple_hood"] //30
        ],
        Helms = [],
        Tops = [],
        Vanity = []
    }]
    },{
        ID = "hunters_hat", //35
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_cloth_cap"], //10
            [1, "hood/legend_helmet_patched_hood"], //25
        ],
        Helms = [],
        Tops = [],
        Vanity = [
            [1, "vanity/legend_helmet_hunter_cap"] //10
        ]
    }]
    },{
        ID = "jesters_hat", //35
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_cloth_cap"], //10
            [1, "hood/legend_helmet_cloth_scarf"], //10
            [1, "hood/legend_helmet_cloth_bandana"], //15
            [1, "hood/legend_helmet_patched_hood"], //25
            [1, "hood/legend_helmet_simple_hood"] //30
        ],
        Helms = [],
        Tops = [],
        Vanity = [
            [1, "vanity/legend_helmet_jester_hat"] //10
        ]
    }]
    },{
        ID = "kettle_hat_with_closed_mail", //250
        Script = "",
        Sets = [{
        Hoods = [ //avg slightly below 70, need 200
            [1, "hood/legend_helmet_chain_scarf"], //70
            [4, "hood/legend_helmet_chain_hood"],//80
        ],
        Helms = [
            [1, "helm/legend_helmet_kettle_helm"] //130
        ],
        Tops = [
            [1, "top/legend_helmet_chain_attachment"], //40
        ],
        Vanity = [
        ]
    }]
    },{
        ID = "kettle_hat_with_mail", //215
        Script = "",
        Sets = [{
        Hoods = [ //avg slightly below 70, need 200
            [1, "hood/legend_helmet_chain_scarf"], //70
            [4, "hood/legend_helmet_chain_hood"],//80
        ],
        Helms = [
            [1, "helm/legend_helmet_kettle_helm"] //130
        ],
        Tops = [
        ],
        Vanity = [
        ]
    }]
    },{
        ID = "kettle_hat", //115
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_cloth_scarf"], //10
            [1, "hood/legend_helmet_cloth_bandana"], //15
            [1, "hood/legend_helmet_patched_hood"], //25
            [1, "hood/legend_helmet_simple_hood"] //30
        ],
        Helms = [
            [1, "helm/legend_helmet_kettle_helm"] //130
        ],
        Tops = [],
        Vanity = [  ]
    }]
    },{
        ID = "legend_frogmouth_helm_crested", //340
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_open_chain_hood"], //65
            [1, "hood/legend_helmet_chain_scarf"], //70
            [1, "hood/legend_helmet_chain_hood"] //80
        ],
        Helms = [
            [1, "helm/legend_helmet_legend_armet"], //260
            [1, "helm/legend_helmet_legend_frogmouth"] //265
        ],
        Tops = [
        ],
        Vanity = [
            [1, "vanity/legend_helmet_side_feather"], //10
            [1, "vanity/legend_helmet_top_feather"] //10
        ]
    }]
    },{
        ID = "legend_frogmouth_helm", //330
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_open_chain_hood"], //65
            [1, "hood/legend_helmet_chain_scarf"], //70
            [1, "hood/legend_helmet_chain_hood"] //80
        ],
        Helms = [
            [1, "helm/legend_helmet_legend_armet"], //260
            [1, "helm/legend_helmet_legend_frogmouth"] //265
        ],
        Tops = [
        ],
        Vanity = [
        ]
    }]
    },{
        ID = "legend_nun_habit", //30
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_cloth_cap"],
            [1, "hood/legend_helmet_cloth_bandana"], //15
            [1, "hood/legend_helmet_patched_hood"] //25
        ],
        Helms = [
        ],
        Tops = [
        ],
        Vanity = [
            [1, "vanity/legend_helmet_nun_habit"] //10
        ]
    }]
    },{ //way under durability
        ID = "legend_seer_hat", //80
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_cloth_scarf"], //10
            [1, "hood/legend_helmet_cloth_bandana"], //15
            [1, "hood/legend_helmet_patched_hood"], //25
        ],
        Helms = [
        ],
        Tops = [
        ],
        Vanity = [
            [1, "vanity/legend_helmet_wizard_cowl"] //10
        ]
    }]
    },{
        ID = "legend_vampire_lord_helmet", //50
        Script = "scripts/items/helmets/legend_vampire_lord_helmet",
        Sets = [{
        Hoods = [
        ],
        Helms = [
        ],
        Tops = [
        ],
        Vanity = [
        ]
    }]
    },{
        ID = "legend_warlock_hood", //100
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_cloth_scarf"], //10
            [1, "hood/legend_helmet_cloth_cap"]
        ],
        Helms = [],
        Tops = [
            [1, "top/legend_helmet_warlock_skull"] //90
        ],
        Vanity = [
            [1, "vanity/legend_helmet_warlock_hood"] //10
        ]
    }]
    },{
        ID = "magician_hat", //50
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_padded_cap"] //40
        ],
        Helms = [],
        Tops = [],
        Vanity = [
            [1, "vanity/legend_helmet_wizard_cowl"] //10
        ]
    }]
    },{
        ID = "mail_coif", //80
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_hood"] //80
        ],
        Helms = [],
        Tops = [],
        Vanity = []
    }]
    },{
        ID = "mouth_piece", //10
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_cloth_scarf"] //10

        ],
        Helms = [],
        Tops = [],
        Vanity = []
    }]
    },{
        ID = "nasal_helmet_with_closed_mail", //240
        Script = "",
        Sets = [{
        Hoods = [ //way below avg
            [1, "hood/legend_helmet_chain_scarf"], //70
            [4, "hood/legend_helmet_chain_hood"],//80
        ],
        Helms = [
            [1, "helm/legend_helmet_norman_helm"] //50
        ],
        Tops = [
            [1, "top/legend_helmet_chain_attachment"], //40
        ],
        Vanity = [
        ]
    }]
    },{
        ID = "nasal_helmet_with_mail", //200
        Script = "",
        Sets = [{
        Hoods = [ //way below avg
            [1, "hood/legend_helmet_chain_scarf"], //70
            [4, "hood/legend_helmet_chain_hood"],//80
        ],
        Helms = [
            [1, "helm/legend_helmet_norman_helm"] //50
        ],
        Tops = [
        ],
        Vanity = [
        ]
    }]
    },{
        ID = "nasal_helmet_with_rusty_mail", //140
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_barb_chain_scarf"], //55
            [1, "hood/legend_helmet_rotten_chain_scarf"] //60
        ],
        Helms = [
            [1, "helm/legend_helmet_norman_helm"] //50
        ],
        Tops = [
        ],
        Vanity = [
        ]
    }]
    },{
        //TODO
        ID = "nasal_helmet", //105
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_patched_hood"], //25
            [1, "hood/legend_helmet_simple_hood"], //30

        ],
        Helms = [
            [1, "helm/legend_helmet_norman_helm"] //50
        ],
        Tops = [
        ],
        Vanity = [
        ]
    }]
    },{
        ID = "necromancer_hat", //30
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_cloth_cap"], // 10
            [1, "hood/legend_helmet_cloth_bandana"] //15
        ],
        Helms = [],
        Tops = [
            [1, "top/legend_helmet_hood_cloth_round"], //10
            [1, "top/legend_helmet_hood_cloth_wide"], //10
            [1, "top/legend_helmet_hood_cloth_square"], //10
            [1, "top/legend_helmet_cloth_long_hood"], //10
        ],
        Vanity = [
            [1, "vanity/legend_helmet_witchhunter_helm"] //10
        ]
    }]
    },{
        ID = "noble_arrow_helm", //300
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_hood"] //80
        ],
        Helms = [
            [1, "helm/legend_helmet_great_helm"], //220
        ],
        Tops = [
        ],
        Vanity = [
            [1, "vanity/legend_helmet_faction_helmet", 2] //10
        ]
    }]
    },{
        ID = "noble_bull_helm", //300
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_hood"] //80
        ],
        Helms = [
            [1, "helm/legend_helmet_great_helm"], //220
        ],
        Tops = [
        ],
        Vanity = [
            [1, "vanity/legend_helmet_faction_helmet", 3] //10
        ]
    }]
    },{
        ID = "noble_castle_helm", //300
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_hood"] //80
        ],
        Helms = [
            [1, "helm/legend_helmet_great_helm"], //220
        ],
        Tops = [
        ],
        Vanity = [
            [1, "vanity/legend_helmet_faction_helmet", 1] //10
        ]
    }]
    },{
        ID = "noble_deer_helm", //300
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_hood"] //80
        ],
        Helms = [
            [1, "helm/legend_helmet_great_helm"], //220
        ],
        Tops = [
        ],
        Vanity = [
            [1, "vanity/legend_helmet_faction_helmet", 8] //10
        ]
    }]
    },{
        ID = "noble_dragon_helm", //300
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_hood"] //80
        ],
        Helms = [
            [1, "helm/legend_helmet_great_helm"], //220
        ],
        Tops = [
        ],
        Vanity = [
            [1, "vanity/legend_helmet_faction_helmet", 10] //10
        ]
    }]
    },{
        ID = "noble_feather_helm", //300
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_hood"] //80
        ],
        Helms = [
            [1, "helm/legend_helmet_great_helm"], //220
        ],
        Tops = [
        ],
        Vanity = [
            [1, "vanity/legend_helmet_faction_helmet", 5] //10
        ]
    }]
    },{
        ID = "noble_fish_helm", //300
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_hood"] //80
        ],
        Helms = [
            [1, "helm/legend_helmet_great_helm"], //220
        ],
        Tops = [
        ],
        Vanity = [
            [1, "vanity/legend_helmet_faction_helmet", 7] //10
        ]
    }]
    },{
        ID = "noble_headgear", //10
        Script = "scripts/items/helmets/noble_headgear",
        Sets = [{
        Hoods = [
        ],
        Helms = [
        ],
        Tops = [
        ],
        Vanity = [
        ]
    }]
    },{
        ID = "noble_lion_helm", //300
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_hood"] //80
        ],
        Helms = [
            [1, "helm/legend_helmet_great_helm"], //220
        ],
        Tops = [
        ],
        Vanity = [
            [1, "vanity/legend_helmet_faction_helmet", 4] //10
        ]
    }]
    },{
        ID = "noble_sun_helm", //300
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_hood"] //80
        ],
        Helms = [
            [1, "helm/legend_helmet_great_helm"], //220
        ],
        Tops = [
        ],
        Vanity = [
            [1, "vanity/legend_helmet_faction_helmet", 9] //10
        ]
    }]
    },{
        ID = "noble_swan_helm", //300
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_hood"] //80
        ],
        Helms = [
            [1, "helm/legend_helmet_great_helm"], //220
        ],
        Tops = [
        ],
        Vanity = [
            [1, "vanity/legend_helmet_faction_helmet", 6] //10
        ]
    }]
    },{
        ID = "nordic_helmet_with_closed_mail", //265
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_scarf"], //70
            [1, "hood/legend_helmet_chain_hood"], //80
            [1, "hood/legend_helmet_chain_hood_full"] //90
        ],
        Helms = [
            [1, "helm/legend_helmet_nordic_helm"] //185
        ],
        Tops = [],
        Vanity = []
    }]
    },{
        ID = "nordic_helmet", //125
        Script = "",
        Sets = [{
        Hoods = [ //way over
            [1, "hood/legend_helmet_simple_hood"] //30
        ],
        Helms = [
            [1, "helm/legend_helmet_nordic_helm"] //185
        ],
        Tops = [],
        Vanity = []
    }]
    },{
        ID = "open_leather_cap", //40
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_leather_cap"] //35
        ],
        Helms = [],
        Tops = [],
        Vanity = []
    }]
    },{
        ID = "padded_flat_top_helmet", //150
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_padded_cap"], //40
            [1, "hood/legend_helmet_padded_hood"] //50
        ],
        Helms = [
            [1, "helm/legend_helmet_flat_top_helm"] //70
        ],
        Tops = [
        ],
        Vanity = []
    }]
    },{
        ID = "padded_kettle_hat", //140
        Script = "",
        Sets = [{
        Hoods = [ //bit over
            [1, "hood/legend_helmet_padded_cap"], //40
            [1, "hood/legend_helmet_padded_hood"] //50
        ],
        Helms = [
            [1, "helm/legend_helmet_kettle_helm"] //130
        ],
        Tops = [],
        Vanity = []
    }]
    },{
        ID = "padded_nasal_helmet", //130
        Script = "",
        Sets = [{
        Hoods = [ //bit over
            [1, "hood/legend_helmet_padded_cap"], //40
            [1, "hood/legend_helmet_padded_hood"] //50
        ],
        Helms = [
            [1, "helm/legend_helmet_norman_helm"] //50
        ],
        Tops = [
        ],
        Vanity = [
        ]
    }]
    },{
        ID = "reinforced_mail_coif", //100
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_hood"], //80
        ],
        Helms = [
        ],
        Tops = [
            [1, "top/legend_helmet_chain_attachment"], //40
            [1, "top/legend_helmet_eyemask"] //35
        ],
        Vanity = []
    }]
    },{
        ID = "rusty_mail_coif", //70
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_hood", 3] //60
        ],
        Helms = [
        ],
        Tops = [
        ],
        Vanity = [
        ]
    }]
    },{
        ID = "sallet_helmet", //120
        Script = "",
        Sets = [{
        Hoods = [
            [2, "hood/legend_helmet_cloth_cap"],
            [1, "hood/legend_helmet_cloth_bandana"] //15
        ],
        Helms = [
            [1, "helm/legend_helmet_sallet"] //185
        ],
        Tops = [],
        Vanity = []
    }]
    },{
        ID = "steppe_helmet_with_mail", //200
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_chain_scarf"], //70
            [1, "hood/legend_helmet_chain_hood"] //80
        ],
        Helms = [
            [1, "helm/legend_helmet_horsetail"] //120
        ],
        Tops = [],
        Vanity = [
            [1, "vanity/legend_helmet_headband"], //10
            [9, ""]
        ]
    }]
    },{
        ID = "straw_hat", //30
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_cloth_cap"],
            [1, "hood/legend_helmet_cloth_scarf"], //10
            [1, "hood/legend_helmet_cloth_bandana"], //15
        ],
        Helms = [
        ],
        Tops = [
        ],
        Vanity = [
            [1, "vanity/legend_helmet_straw_hat"], //10
        ]
    }]
    },{
        ID = "witchhunter_hat", //40
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_cloth_cap"] // 10
        ],
        Helms = [],
        Tops = [
            [1, "top/legend_helmet_hood_cloth_round"], //10
            [1, "top/legend_helmet_hood_cloth_wide"], //10
            [1, "top/legend_helmet_hood_cloth_square"], //10
            [1, "top/legend_helmet_cloth_long_hood"], //10
        ],
        Vanity = [
            [1, "vanity/legend_helmet_witchhunter_helm"] //10
        ]
    }]
    },{
        ID = "wizard_hat", //30
        Script = "",
        Sets = [{
        Hoods = [
            [1, "hood/legend_helmet_cloth_cap"], // 10
            [1, "hood/legend_helmet_cloth_bandana"] //15
        ],
        Helms = [],
        Tops = [],
        Vanity = [
            [1, "vanity/legend_helmet_wizard_cowl"] //10
        ]
    }]
}])

gt.Const.LegendMod.Helmets <- {};


foreach( i, v in gt.Const.LegendMod.HelmObjs )
{
	// local id = "scripts/items/helmets/" + v.ID;
	gt.Const.LegendMod.Helmets[v.ID] <- v;
}

