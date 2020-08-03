
from string import Template
from shutil import copyfile
import os


BaseLayer = '''
this.$name <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "$id";
		this.m.Name = "$title";
		this.m.Description = "$desc";
		this.m.Variant = 1;
		this.m.Variants = $variants;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = $value;
		this.m.Condition = $condition;
		this.m.ConditionMax = $condition;
		this.m.StaminaModifier = $stamina;
		this.m.Vision = $vision;
		this.m.HideHair = $hair;
		this.m.HideBeard = $beard;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "$brush" + "_" + variant;
		this.m.SpriteDamaged = "$brush" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "$brush" + "_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "legend_helmets/$icon" + "_" + variant + ".png"
	}
});
'''

Layer = '''
this.$name <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.$type;
		this.m.ID = "$id";
		this.m.Name = "$title";
		this.m.Description = "$desc";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variant = 1;
		this.m.Variants = $variants;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = $value;
		this.m.Condition = $condition;
		this.m.ConditionMax = $condition;
		this.m.StaminaModifier = $stamina;
		this.m.Vision = $vision;
		this.m.IsLowerVanity = $lower;
		this.m.HideHair = $hair;
		this.m.HideBeard = $beard;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "$brush" + "_" + variant;
		this.m.SpriteDamaged = "$brush" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "$brush" + "_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "legend_helmets/$icon" + "_" + variant + ".png";
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});
'''

layers = [
    {"name": "barb_chain_scarf",    "layer": "hood", "min": 1, "max": 5, "base": True, "value" : 165, "con" : 55, "stam" : -2, "vis" : 0,  "hair" : "false", "beard" :"true" },
    {"name": "chain_hood",          "layer": "hood", "min": 1, "max": 4, "base": True, "value" : 310, "con" : 80, "stam" : -4, "vis" : -1,  "hair" : "true", "beard" :"false" },
    {"name": "chain_hood_full",     "layer": "hood", "min": 1, "max": 6, "base": True, "value" : 375, "con" : 90, "stam" : -6, "vis" : -2,  "hair" : "true", "beard" :"true" },
    {"name": "chain_scarf",         "layer": "hood", "min": 1, "max": 5, "base": True, "value" : 250, "con" : 70, "stam" : -4, "vis" : 0,  "hair" : "false", "beard" :"true" },
    {"name": "cloth_scarf",         "layer": "hood", "min": 1, "max": 5, "base": True, "value" : 10, "con" : 10, "stam" : 0, "vis" : 0,  "hair" : "false", "beard" :"true" },
    {"name": "goblin_scarf",        "layer": "hood", "min": 1, "max": 4, "base": True, "value" : 5, "con" : 5, "stam" : 0, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "leather_hood",        "layer": "hood", "min": 1, "max": 5, "base": True, "value" : 115, "con" : 45, "stam" : -2, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "padded_hood",         "layer": "hood", "min": 1, "max": 3, "base": True, "value" : 140, "con" : 50, "stam" : -2, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "patched_hood",        "layer": "hood", "min": 1, "max": 1, "base": True, "value" : 45, "con" : 25, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "rotten_chain_scarf",  "layer": "hood", "min": 1, "max": 5, "base": True, "value" : 190, "con" : 60, "stam" : -2, "vis" : 0,  "hair" : "false", "beard" :"true" },
    {"name": "simple_hood",         "layer": "hood", "min": 1, "max": 5, "base": True, "value" : 60, "con" : 30, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "padded_cap",          "layer": "hood", "min": 1, "max": 1, "base": True, "value" : 95, "con" : 40, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "hood_cloth_round",    "layer": "hood", "min": 1, "max": 1, "base": True, "value" : 60, "con" : 30, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "hood_cloth_wide",     "layer": "hood", "min": 1, "max": 2, "base": True, "value" : 60, "con" : 30, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "cloth_long_hood",     "layer": "hood", "min": 1, "max": 4, "base": True, "value" : 60, "con" : 30, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "cloth_bandana",       "layer": "hood", "min": 1, "max": 5, "base": True, "value" : 20, "con" : 15, "stam" : 0, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "leather_cap",         "layer": "hood", "min": 1, "max": 1, "base": True, "value" : 80, "con" : 35, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "bronze_chain",        "layer": "hood", "min": 1, "max": 1, "base": True, "value" : 450, "con" : 100, "stam" : -7, "vis" : 0,  "hair" : "false", "beard" :"false" },

    {"name": "ancient_beard_mask",                  "layer": "helm", "min": 1, "max": 1, "value" : 1000, "con" : 100, "stam" : -8, "vis" : -3,  "hair" : "true", "beard" :"true" },
    {"name": "ancient_conic_helm",                  "layer": "helm", "min": 1, "max": 1, "value" : 100, "con" : 15, "stam" : -3, "vis" : -1,  "hair" : "true", "beard" :"false" },
    {"name": "ancient_crested",                     "layer": "helm", "min": 1, "max": 1, "value" : 1000, "con" : 100, "stam" : -8, "vis" : -3,  "hair" : "true", "beard" :"false" },
    {"name": "ancient_dome",                        "layer": "helm", "min": 1, "max": 1, "value" : 100, "con" : 15, "stam" : -3, "vis" : -1,  "hair" : "true", "beard" :"false" },
    {"name": "ancient_dome_tailed",                 "layer": "helm", "min": 1, "max": 1, "value" : 100, "con" : 15, "stam" : -3, "vis" : -1,  "hair" : "true", "beard" :"false" },
    {"name": "ancient_face_helm",                   "layer": "helm", "min": 1, "max": 1, "value" : 1000, "con" : 100, "stam" : -8, "vis" : -3,  "hair" : "true", "beard" :"false" },
    {"name": "ancient_face_plate",                  "layer": "helm", "min": 1, "max": 1, "value" : 300, "con" : 50, "stam" : -5, "vis" : -2,  "hair" : "true", "beard" :"false" },
    {"name": "ancient_kettle",                      "layer": "helm", "min": 1, "max": 3, "value" : 100, "con" : 15, "stam" : -3, "vis" : -1,  "hair" : "true", "beard" :"false" },
    {"name": "ancient_legionaire",                  "layer": "helm", "min": 1, "max": 1, "value" : 300, "con" : 50, "stam" : -5, "vis" : -2,  "hair" : "true", "beard" :"false" },
    {"name": "ancient_lion_mask",                   "layer": "helm", "min": 1, "max": 1, "value" : 1000, "con" : 100, "stam" : -8, "vis" : -3,  "hair" : "true", "beard" :"true" },
    {"name": "ancient_mask",                        "layer": "helm", "min": 1, "max": 1, "value" : 1000, "con" : 100, "stam" : -8, "vis" : -3,  "hair" : "true", "beard" :"true" },
    {"name": "ancient_side_hawk",                   "layer": "helm", "min": 1, "max": 1, "value" : 300, "con" : 50, "stam" : -5, "vis" : -2,  "hair" : "true", "beard" :"false" },
    {"name": "ancient_tailed_conic_helm",           "layer": "helm", "min": 1, "max": 1, "value" : 300, "con" : 50, "stam" : -5, "vis" : -2,  "hair" : "true", "beard" :"false" },
    {"name": "barbute",                             "layer": "helm", "min": 1, "max": 7, "value" : 2600, "con" : 110, "stam" : -3, "vis" : -2,  "hair" : "true", "beard" :"false" },
    {"name": "basinet",                             "layer": "helm", "min": 1, "max": 7, "value" : 1400, "con" : 130, "stam" : -7, "vis" : -2,  "hair" : "true", "beard" :"false" },
    {"name": "carthaginian",                        "layer": "helm", "min": 1, "max": 3, "value" : 5000, "con" : 160, "stam" : -6, "vis" : -2,  "hair" : "true", "beard" :"false" },
    {"name": "conic_helm",                          "layer": "helm", "min": 1, "max": 6, "value" : 2600, "con" : 170, "stam" : -9, "vis" : -2,  "hair" : "true", "beard" :"false" },
    {"name": "crude_cylinder_helm",                 "layer": "helm", "min": 1, "max": 2, "value" : 800, "con" : 110, "stam" : -10, "vis" : -2,  "hair" : "true", "beard" :"false" },
    {"name": "crude_metal_helm",                    "layer": "helm", "min": 1, "max": 3, "value" : 550, "con" : 65, "stam" : -6, "vis" : -1,  "hair" : "true", "beard" :"false" },
    {"name": "crude_skull_helm",                    "layer": "helm", "min": 1, "max": 1, "value" : 5000, "con" : 130, "stam" : -7, "vis" : -2,  "hair" : "true", "beard" :"false" },
    {"name": "flat_top_face_plate",                 "layer": "helm", "min": 1, "max": 6, "value" : 2000, "con" : 130, "stam" : -4, "vis" : -2,  "hair" : "true", "beard" :"true" },
    {"name": "flat_top_helm",                       "layer": "helm", "min": 1, "max": 6, "value" : 800, "con" : 70, "stam" : -3, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "great_helm",                          "layer": "helm", "min": 1, "max": 6, "value" : 3500, "con" : 220, "stam" : -12, "vis" : -3,  "hair" : "true", "beard" :"false" },
    {"name": "heavy_plate_helm",                    "layer": "helm", "min": 1, "max": 2, "value" : 1300, "con" : 170, "stam" : -15, "vis" : -3,  "hair" : "true", "beard" :"false" },
    {"name": "heavy_spiked_helm",                   "layer": "helm", "min": 1, "max": 1, "value" : 5000, "con" : 150, "stam" : -9, "vis" : -2,  "hair" : "true", "beard" :"true" },
    {"name": "horsetail",                           "layer": "helm", "min": 1, "max": 6, "value" : 1250, "con" : 120, "stam" : -4, "vis" : -2,  "hair" : "true", "beard" :"false" },
    {"name": "kettle_helm",                         "layer": "helm", "min": 1, "max": 6, "value" : 1600, "con" : 130, "stam" : -6, "vis" : -2,  "hair" : "true", "beard" :"false" },
    {"name": "legend_ancient_gladiator",            "layer": "helm", "min": 1, "max": 1, "value" : 1300, "con" : 115, "stam" : -6, "vis" : -3,  "hair" : "true", "beard" :"true" },
    {"name": "legend_ancient_legionaire_restored",  "layer": "helm", "min": 1, "max": 1, "value" : 2000, "con" : 60, "stam" : -3, "vis" : -2,  "hair" : "true", "beard" :"false" },
    {"name": "legend_frogmouth",                    "layer": "helm", "min": 1, "max": 1, "value" : 6000, "con" : 265, "stam" : -13, "vis" : -3,  "hair" : "true", "beard" :"true" },
    {"name": "legend_frogmouth_close",              "layer": "helm", "min": 1, "max": 2, "value" : 6000, "con" : 260, "stam" : -13, "vis" : -2,  "hair" : "true", "beard" :"true" },
    {"name": "nordic_helm",                         "layer": "helm", "min": 1, "max": 6, "value" : 2600, "con" : 185, "stam" : -10, "vis" : -1,  "hair" : "true", "beard" :"false" },
    {"name": "norman_helm",                         "layer": "helm", "min": 1, "max": 5, "value" : 550, "con" : 50, "stam" : -2, "vis" : -1,  "hair" : "true", "beard" :"false" },
    {"name": "orc_double_helm",                     "layer": "helm", "min": 1, "max": 1, "value" : 1600, "con" : 220, "stam" : -20, "vis" : -3,  "hair" : "true", "beard" :"false" },
    {"name": "orc_great_helm",                      "layer": "helm", "min": 1, "max": 1, "value" : 3000, "con" : 420, "stam" : -35, "vis" : -4,  "hair" : "true", "beard" :"false" },
    {"name": "orc_strapped_helm",                   "layer": "helm", "min": 1, "max": 1, "value" : 1000, "con" : 160, "stam" : -27, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "bronze_helm",                         "layer": "helm", "min": 1, "max": 1, "value" : 2400, "con" : 190, "stam" : -9, "vis" : -2,  "hair" : "true", "beard" :"false" },
    {"name": "dentist_helmet",                      "layer": "helm", "min": 1, "max": 1, "value" : 1900, "con" : 160, "stam" : -11, "vis" : -3,  "hair" : "true", "beard" :"true" },

    {"name": "rotten_flat_top_face_mask",   "layer": "helm", "min": 1, "max": 5, "value" : 1250, "con" : 150, "stam" : -12, "vis" : -3,  "hair" : "true", "beard" :"true" },
    {"name": "rotten_great_helm",           "layer": "helm", "min": 1, "max": 4, "value" : 1500, "con" : 160, "stam" : -13, "vis" : -3,  "hair" : "true", "beard" :"true" },
    {"name": "sallet",                      "layer": "helm", "min": 1, "max": 6, "value" : 7000, "con" : 185, "stam" : -9, "vis" : -1,  "hair" : "true", "beard" :"false" },
    {"name": "skin_helm",                   "layer": "helm", "min": 1, "max": 1, "value" : 20000, "con" : 190, "stam" : -6, "vis" : 0,  "hair" : "true", "beard" :"true" },
    {"name": "stag_helm",                   "layer": "helm", "min": 1, "max": 1, "value" : 3000, "con" : 230, "stam" : -11, "vis" : -3,  "hair" : "true", "beard" :"true" },
    {"name": "swan_helm",                   "layer": "helm", "min": 1, "max": 1, "value" : 3000, "con" : 230, "stam" : -11, "vis" : -3,  "hair" : "true", "beard" :"true" },
    {"name": "tailed_conic",                "layer": "helm", "min": 1, "max": 1, "value" : 2200, "con" : 185, "stam" : -15, "vis" : -2,  "hair" : "true", "beard" :"false" },
    {"name": "viking_helm",                 "layer": "helm", "min": 1, "max": 6, "value" : 500, "con" : 45, "stam" : -2, "vis" : -1,  "hair" : "true", "beard" :"false" },


    {"name": "orc_horn_mask",                       "layer": "top", "min": 1, "max": 1, "value" : 300, "con" : 60, "stam" : -7, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "orc_leather_mask",                    "layer": "top", "min": 1, "max": 1, "value" : 100, "con" : 35, "stam" : -5, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "orc_metal_mask",                      "layer": "top", "min": 1, "max": 1, "value" : 800, "con" : 120, "stam" : -16, "vis" : -3,  "hair" : "true", "beard" :"false" },

    {"name": "goblin_chain_helm",                   "layer": "top", "min": 1, "max": 1, "value" : 780, "con" : 70, "stam" : -6, "vis" : -1,  "hair" : "true", "beard" :"false" },
    {"name": "goblin_leather_helm",                 "layer": "top", "min": 1, "max": 1, "value" : 375, "con" : 45, "stam" : -3, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "goblin_leather_mask",                 "layer": "top", "min": 1, "max": 1, "value" : 310, "con" : 40, "stam" : -2, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "goblin_spiked_helm",                  "layer": "top", "min": 1, "max": 1, "value" : 1200, "con" : 90, "stam" : -8, "vis" : -2,  "hair" : "true", "beard" :"false" },


    {"name": "cult_hood",               "layer": "top", "min": 1, "max": 7, "value" : 600, "con" : 65, "stam" : -3, "vis" : -1,  "hair" : "true", "beard" :"false" },
    {"name": "leather_hood_barb",       "layer": "top", "min": 1, "max": 1, "value" : 720, "con" : 105, "stam" : -12, "vis" : -3,  "hair" : "true", "beard" :"false" },
    {"name": "golden_helm",             "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0,  "hair" : "true", "beard" :"true" },
    {"name": "ancient_crown",           "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "goblin_leaf_helm",        "layer": "top", "min": 1, "max": 1, "value" : 30, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "vampire_crown",           "layer": "top", "min": 1, "max": 1, "value" : 500, "con" : 30, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "chain_attachment",        "layer": "top", "min": 1, "max": 1, "value" : 310, "con" : 40, "stam" : -3, "vis" : -1,  "hair" : "false", "beard" :"true" },
    {"name": "eyemask",                 "layer": "top", "min": 1, "max": 2, "value" : 250, "con" : 335, "stam" : -3, "vis" : -1,  "hair" : "false", "beard" :"false" },
    {"name": "facemask",                "layer": "top", "min": 1, "max": 6, "value" : 1200, "con" : 90, "stam" : -7, "vis" : -2,  "hair" : "false", "beard" :"true" },
    {"name": "faceplate_full",          "layer": "top", "min": 1, "max": 1, "value" : 1700, "con" : 110, "stam" : -9, "vis" : -3,  "hair" : "false", "beard" :"true" },
    {"name": "faceplate_gold",          "layer": "top", "min": 1, "max": 1, "value" : 1551, "con" : 105, "stam" : -8, "vis" : -2,  "hair" : "false", "beard" :"true" },
    {"name": "faceplate_long",          "layer": "top", "min": 1, "max": 1, "value" : 700, "con" : 65, "stam" : -5, "vis" : -2,  "hair" : "false", "beard" :"true" },
    {"name": "faceplate_pointed",       "layer": "top", "min": 1, "max": 1, "value" : 1320, "con" : 95, "stam" : -7, "vis" : -2,  "hair" : "false", "beard" :"true" },
    {"name": "faceplate_raised",        "layer": "top", "min": 1, "max": 2, "value" : 525, "con" : 55, "stam" : -4, "vis" : -2,  "hair" : "false", "beard" :"true" },
    {"name": "faceplate_short",         "layer": "top", "min": 1, "max": 1, "value" : 610, "con" : 60, "stam" : -4, "vis" : -2,  "hair" : "false", "beard" :"true" },
    {"name": "faceplate_snub_nose",     "layer": "top", "min": 1, "max": 1, "value" : 880, "con" : 75, "stam" : -6, "vis" : -2,  "hair" : "false", "beard" :"true" },
    {"name": "faceplate_winged",        "layer": "top", "min": 1, "max": 1, "value" : 780, "con" : 70, "stam" : -5, "vis" : -2,  "hair" : "false", "beard" :"true" },
    {"name": "goblin_gillie",           "layer": "top", "min": 1, "max": 1, "value" : 140, "con" : 25, "stam" : -2, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "goblin_leaves",           "layer": "top", "min": 1, "max": 1, "value" : 10, "con" : 5, "stam" : -4, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "headband_nose",           "layer": "top", "min": 1, "max": 1, "value" : 190, "con" : 30, "stam" : -2, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "headband_side",           "layer": "top", "min": 1, "max": 1, "value" : 95, "con" : 20, "stam" : -2, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "nose_plate",              "layer": "top", "min": 1, "max": 1, "value" : 60, "con" : 15, "stam" : -2, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "faceplate_curved",        "layer": "top", "min": 1, "max": 1, "value" : 450, "con" : 50, "stam" : -3, "vis" : -2,  "hair" : "false", "beard" :"false" },
    {"name": "faceplate_flat",          "layer": "top", "min": 1, "max": 1, "value" : 375, "con" : 45, "stam" : -3, "vis" : -2,  "hair" : "false", "beard" :"false" },
    {"name": "faceplate_full_gold",     "layer": "top", "min": 1, "max": 1, "value" : 1800, "con" : 115, "stam" : -9, "vis" : -3,  "hair" : "false", "beard" :"false" },
    {"name": "faceplate_pointed_slit",  "layer": "top", "min": 1, "max": 1, "value" : 1430, "con" : 100, "stam" : -7, "vis" : -2,  "hair" : "false", "beard" :"false" },
    {"name": "faceplate_sharp",         "layer": "top", "min": 1, "max": 1, "value" : 1090, "con" : 85, "stam" : -7, "vis" : -2,  "hair" : "false", "beard" :"false" },
    {"name": "faceplate_snub_slit",     "layer": "top", "min": 1, "max": 1, "value" : 980, "con" : 80, "stam" : -6, "vis" : -2,  "hair" : "false", "beard" :"false" },
    {"name": "golden_mask",             "layer": "top", "min": 1, "max": 1, "value" : 3000, "con" : 100, "stam" : -6, "vis" : 0,  "hair" : "false", "beard" :"true" },
    {"name": "warlock_skull",           "layer": "top", "min": 1, "max": 3, "value" : 2000, "con" : 90, "stam" : -4, "vis" : 0,  "hair" : "false", "beard" :"true" },


    {"name": "hood_cloth_square",   "layer": "vanity", "min": 1, "max": 1, "value" : 60, "con" : 30, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "sack",                "layer": "vanity", "min": 1, "max": 12, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0,  "hair" : "true", "beard" :"true" },
    {"name": "antler",              "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "bear_head",           "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "beret",               "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "bull_horns",          "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "crown",               "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "faction_helmet",      "layer": "vanity", "min": 1, "max": 12, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "faction_helmet_2",    "layer": "vanity", "min": 1, "max": 10, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "feather_band",        "layer": "vanity", "min": 1, "max": 2, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "feathered_hat",       "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "fencer_hat",          "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "goat_horns",          "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "headband",            "layer": "vanity", "min": 1, "max": 16, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "horn_decorations",    "layer": "vanity", "min": 1, "max": 2, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "hunter_cap",          "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "impaled_head",        "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "jester_hat",          "layer": "vanity", "min": 1, "max": 65, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "metal_bird",          "layer": "vanity", "min": 1, "max": 2, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "noble_buckle",        "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "noble_feather",       "layer": "vanity", "min": 1, "max": 4, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "noble_floppy_hat",    "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "noble_hat",           "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "noble_hood",          "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "wreath",              "layer": "vanity", "min": 1, "max": 2, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "orc_bones",           "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "plait",               "layer": "vanity", "min": 1, "max": 12, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "ponytail",            "layer": "vanity", "min": 1, "max": 4, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "ram_horns",           "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "side_feather",        "layer": "vanity", "min": 1, "max": 5, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "straw_hat",           "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "top_feather",         "layer": "vanity", "min": 1, "max": 5, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "witchhunter_helm",    "layer": "vanity", "min": 1, "max": 7, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "wizard_cowl",         "layer": "vanity", "min": 1, "max": 20, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "wolf_helm",           "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "white_wolf_helm",     "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "royal_hood",          "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "lindwurm_helm",       "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "redback_helm",        "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "nun_habit",           "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "nach_helm",           "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "mountain_helm",       "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "demon_alp_helm",      "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },
    {"name": "warlock_hood",        "layer": "vanity", "min": 1, "max": 4, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "true", "beard" :"false" },

    {"name": "back_crest",      "layer": "vanity", "lowervanity": True, "min": 1, "max": 4, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "back_feathers",   "layer": "vanity", "lowervanity": True, "min": 1, "max": 4, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "feather_crest",   "layer": "vanity", "lowervanity": True, "min": 1, "max": 5, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "knotted_tail",    "layer": "vanity", "lowervanity": True, "min": 1, "max": 4, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "orc_tail",        "layer": "vanity", "lowervanity": True, "min": 1, "max": 2, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "top_plume",       "layer": "vanity", "lowervanity": True, "min": 1, "max": 2, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" },
    {"name": "wings",           "layer": "vanity", "lowervanity": True, "min": 1, "max": 6, "value" : 200, "con" : 10, "stam" : -1, "vis" : 0,  "hair" : "false", "beard" :"false" }
]


titles = {
    "barb_chain_scarf" :     "Rusted Aventail",
    "chain_hood" :          "Mail Coif",
    "chain_hood_full" :     "Full Mail Coif",
    "chain_scarf" :         "Aventail",
    "cloth_scarf" :         "Cloth Scarf",
    "goblin_scarf" :        "Goblin Scarf",
    "leather_hood" :        "Leather Hood",
    "padded_hood" :         "Full Aketon Cap",
    "patched_hood" :         "Patched Hood",
    "rotten_chain_scarf" :   "Rotten Aventail",
    "simple_hood" :          "Simple Hood",
    "padded_cap" :           "Aketon Cap",
    "hood_cloth_round" :     "Round Hood Cloth",
    "hood_cloth_square" :    "Square Hood Cloth",
    "hood_cloth_wide" :      "Wide Hood Cloth",
    "cloth_long_hood" :      "Cloth Long Hood",
    "cloth_bandana" :        "Headscarf",
    "leather_cap" :          "Leather Cap",

    "ancient_beard_mask" :                  "Ancient Bearded Mask",
    "ancient_conic_helm" :                  "Ancient Conic Helm",
    "ancient_crested" :                     "Ancient Crested Helm",
    "ancient_crown" :                       "Ancient Diadem",
    "ancient_dome" :                        "Ancient Dome",
    "ancient_dome_tailed" :                 "Tailed Ancient Dome",
    "ancient_face_helm" :                   "Ancient Face Helm",
    "ancient_face_plate" :                  "Ancient Face Plate",
    "ancient_kettle" :                       "Ancient Kettle",
    "ancient_legionaire" :                  "Ancient Legionaire Helm",
    "ancient_lion_mask" :                   "Ancient Lion Mask",
    "ancient_mask" :                        "Ancient Mask",
    "ancient_side_hawk" :                   "Ancient Side Hawk",
    "ancient_tailed_conic_helm" :           "Tailed Ancient Conic Helm",
    "barbute" :                              "Barbute",
    "basinet" :                              "Basinet",
    "carthaginian" :                         "Carthaginian Helm",
    "conic_helm" :                           "Conic Helm",
    "crude_cylinder_helm" :                  "Crude Cylinder Helm",
    "crude_metal_helm" :                     "Crude Metal Helm",
    "crude_skull_helm" :                    "Crude Skull Helm",
    "flat_top_face_plate" :                  "Flat Top Face Plate",
    "flat_top_helm" :                        "Flat Top Helm",
    "goblin_chain_helm" :                   "Goblin Chain Helm",
    "goblin_leather_helm" :                 "Leather Goblin Helm",
    "goblin_leather_mask" :                 "Leather Goblin Mask",
    "goblin_spiked_helm" :                  "Spiked Goblin Helm",
    "golden_helm" :                         "Golden Helm",
    "great_helm" :                           "Great Helm",
    "heavy_plate_helm" :                     "Heavy Plate Helm",
    "heavy_spiked_helm" :                   "Heavy Spiked Helm",
    "horsetail" :                            "Steppe Helm",
    "kettle_helm" :                          "Kettle Helm",
    "legend_ancient_gladiator" :            "Ancient Gladiator Helm",
    "legend_ancient_legionaire_restored" :  "Restored Ancient Legionaire",
    "legend_frogmouth" :                     "Frogmouth",
    "legend_frogmouth_close" :               "Close Helm",
    "nordic_helm" :                          "Nordic Helm",
    "norman_helm" :                         "Nasal Helmet",
    "orc_double_helm" :                     "Orc Looted Kettle Hat",
    "orc_great_helm" :                      "Orc Great Helm",
    "orc_horn_mask" :                       "Orc Horn Mask",
    "orc_leather_mask" :                    "Orc Leather Mask",
    "orc_metal_mask" :                      "Orc Metal Plated Mask",
    "orc_strapped_helm" :                   "Orc Looted Nasal Helm",

    "rotten_flat_top_face_mask" :    "Rotten Flat Top Face Mask",
    "rotten_great_helm" :           "Rotten Great Helm",
    "sallet" :                        "Sallet",
    "skin_helm" :                   "Glimpse of Davkul",
    "stag_helm" :                   "Stag Helm",
    "swan_helm" :                   "Swan Helm",
    "tailed_conic" :                "Feathered Nasal Helmet",
    "viking_helm" :                   "Viking Helm",
    "sack" :                         "Sack",

    "goblin_leaf_helm" :         "Goblin Leaf Helm",
    "vampire_crown" :            "Ancient Crown",
    "chain_attachment" :         "Chain Attachment",
    "cult_hood" :                "Cult Hood",
    "eyemask" :                  "Eyemask",
    "facemask" :                 "Facemask",
    "faceplate_full" :           "Full Faceplate",
    "faceplate_gold" :           "Gold Faceplate",
    "faceplate_long" :           "Long Faceplate",
    "faceplate_pointed" :        "Pointed Faceplate",
    "faceplate_raised" :         "Raised Faceplate",
    "faceplate_short" :          "Short Faceplate",
    "faceplate_snub_nose" :      "Snub Nose Faceplate",
    "faceplate_winged" :         "Winged Faceplate",
    "goblin_gillie" :            "Goblin Gillie",
    "goblin_leaves" :            "Goblin Leaves",
    "headband_nose" :            "Headband Nose",
    "headband_side" :            "Headband Side",
    "leather_hood_barb" :        "Leather Hood Barb",
    "nose_plate" :               "Nose Plate",

    "antler" :               "Antlers",
    "bear_head" :            "Bear Headpiece",
    "beret" :                "Beret",
    "bull_horns" :           "Bull Horns",
    "crown" :                "Crown",
    "faction_helmet" :       "Faction Helmet",
    "faction_helmet_2" :     "Faction Helmet",
    "feather_band" :         "Feather Band",
    "feathered_hat" :        "Feathered Hat",
    "fencer_hat" :           "Fencer Hat",
    "goat_horns" :           "Goat Horns",
    "headband" :             "Headband",
    "horn_decorations" :     "Horn Decorations",
    "hunter_cap" :           "Hunter Cap",
    "impaled_head" :         "Impaled Head",
    "jester_hat" :           "Jester Hat",
    "metal_bird" :           "Metal Bird",
    "noble_buckle" :         "Noble Buckle",
    "noble_feather" :        "Noble Feather",
    "noble_floppy_hat" :     "Floppy Noble Hat",
    "noble_hat" :            "Noble Hat",
    "noble_hood" :           "Noble Hood",
    "wreath" :               "Wreath",
    "orc_bones" :            "Orc Bones",
    "plait" :                "Plait",
    "ponytail" :             "Ponytail",
    "ram_horns" :            "Ram Horns",
    "side_feather" :         "Side Feather",
    "straw_hat" :            "Straw Hat",
    "top_feather" :          "Top Feather",
    "witchhunter_helm" :     "Witchhunter Helm",
    "wizard_cowl" :          "Wizard Cowl",
    "wolf_helm" :            "Wolf Helm",

    "back_crest" :       "Crest",
    "back_feathers" :    "Feathers",
    "feather_crest" :    "Feather Crest",
    "knotted_tail" :    "Knotted Tail",
    "orc_tail" :         "Orc Tail",
    "wings" :            "Wings",

    "bronze_chain" : "Bronze Chain",
    "bronze_helm" : "Bronze Helm",
    "dentist_helmet" : "Dentist Helmet",
    "faceplate_curved" : "Curved Faceplate",
    "faceplate_flat" : "Flat Faceplate",
    "faceplate_full_gold" : "Golden Full Faceplate",
    "faceplate_pointed_slit" : "Slit Pointed Faceplate",
    "faceplate_sharp": "Sharp Faceplate",
    "faceplate_snub_slit" : "Slitted Snub Faceplate",
    "golden_mask" :  "Golden Mask",
    "warlock_skull" : "Warlock Skill Helm",
    "white_wolf_helm" : "White Wolf Helm",
    "royal_hood" : "Royal Hood",
    "lindwurm_helm" : "Lindwurm Helm",
    "redback_helm" : "Redback Helm",
    "nun_habit" : "Nun Habit",
    "nach_helm" : "Nacho Helm",
    "mountain_helm" : "Mountain Helm",
    "demon_alp_helm" : "Demon Alp Helm",
    "warlock_hood" : "Warlock Hood",
    "top_plume" : "Top Plume"
}


descriptions = {
    "barb_chain_scarf" :     "A rusty mail aventail that still offers good protection - it leaves horrible stains though.",
    "chain_hood" :          "A sturdy chain hood",
    "chain_hood_full" :     "A mail coif that also protects the neck.",
    "chain_scarf" :         "A mail aventail that extends from below the eyeline to cover the neck",
    "cloth_scarf" :         "Cloth Scarf",
    "goblin_scarf" :        "Goblin Scarf",
    "leather_hood" :        "A closed leather cap that protects the head and neck. Padded for extra protection.",
    "padded_hood" :         "A large padded cloth cap also covering the neck.",
    "patched_hood" :         "Patched Hood",
    "rotten_chain_scarf" :   "A rotten mail aventail that extends from below the eyeline to cover the neck",
    "simple_hood" :          "A simple hood to protect against weather and scratches.",
    "padded_cap" :           "A padded cloth cap.",
    "hood_cloth_round" :     "A simple hood to protect against weather and scratches.",
    "hood_cloth_square" :    "A simple hood to protect against weather and scratches.",
    "hood_cloth_wide" :      "A simple hood to protect against weather and scratches.",
    "cloth_long_hood" :      "A simple hood to protect against weather and scratches.",
    "cloth_bandana" :        "A thick piece of cloth wrapped around the head.",
    "leather_cap" :          "A sturdy leather cap that is not covering the ears and neck.",

    "ancient_beard_mask" :                  "Bearded Mask of an ancient honor guard",
    "ancient_conic_helm" :                  "Conic Helm of an ancient household guard",
    "ancient_crested" :                     "Crested Helm of an ancient honor guard",
    "ancient_crown" :                       "An ancient crown from ages past",
    "ancient_dome" :                        "A domed helm of an ancient household guard",
    "ancient_dome_tailed" :                 "A domed and tailed helm of an ancient household guard",
    "ancient_face_helm" :                   "A helm of an ancient honor guard",
    "ancient_face_plate" :                  "The protective helm of an ancient legionary",
    "ancient_kettle" :                       "A kettle helm from an ancient honor guard",
    "ancient_legionaire" :                  "The helm of an ancient legionary",
    "ancient_lion_mask" :                   "A Lion Mask of an ancient honor guard",
    "ancient_mask" :                        "A masked helm of an ancient honor guard",
    "ancient_side_hawk" :                   "The conic helm of an ancient legionary",
    "ancient_tailed_conic_helm" :           "The tailed conic helm of an ancient legionary",
    "barbute" :                              "A sturdy yet light barbute helmet, a design uncommon in these lands, made from especially light and durable steel.",
    "basinet" :                              "A well made metal bascinet",
    "carthaginian" :                         "A sturdy alloy helmet of foreign design",
    "conic_helm" :                           "A heavy conic helmet",
    "crude_cylinder_helm" :                  "This heavy metal helmet also protects the wearers face, albeit at the cost of visibility.",
    "crude_metal_helm" :                     "Although crudely made and rusty, this metal helmet is a durable and sturdy piece of armor.",
    "crude_skull_helm" :                    "A heavy helmet typical of the northern barbarians with a skull-like facemask. This piece is as massive as it is impressive.",
    "flat_top_face_plate" :                  "A flat full-metal helmet with faceplate.",
    "flat_top_helm" :                        "A flat full-metal helmet with noseguard.",
    "goblin_chain_helm" :                   "A chainlink helm of goblin design.",
    "goblin_leather_helm" :                 "A basic leather helm of goblin design",
    "goblin_leather_mask" :                 "A simple goblin face covering",
    "goblin_spiked_helm" :                  "The distinctive spiked helm of a goblin overseer",
    "golden_helm" :                         "A golden helmet and facemask, showing the visage of an emperor from an age long past, imbued with mystical energies. When you hold it into the light, it almost looks as if the face were moving and making expressions of disgust.",
    "great_helm" :                           "A closed metal helm with breathing holes. Great in the way of protection but hard to breathe in and limiting the field of view.",
    "heavy_plate_helm" :                     "This heavy helmet usually has ornamental horns attached. This is a sign of high standing and reputation within barbarian warbands.",
    "heavy_spiked_helm" :                   "his helmet must have belonged to a distinct warrior of the barbarians. Its size and design appear alien to all southern folks.",
    "horsetail" :                            "A nasal helmet witch an attached mail neck guard fashioned in the way of the steppe folks.",
    "kettle_helm" :                          "A full-metal helmet with a broad rim.",
    "legend_ancient_gladiator" :            "The distinctive helm of an ancient gladiator",
    "legend_ancient_legionaire_restored" :  "A restored helm from a long dead legionaire",
    "legend_frogmouth" :                     "A gloriously frogmouth helm of excellent construction",
    "legend_frogmouth_close" :               "A finely crafted close helm of outstanding workmanship",
    "nordic_helm" :                          "A nordic helmet guarding face and neck with additional metal plates.",
    "norman_helm" :                         "A metal helmet with added noseguard.",
    "orc_double_helm" :                     "A simplistic orc helm made from two kettle hats tied together",
    "orc_great_helm" :                      "The distinctive helm of an orc warlord",
    "orc_horn_mask" :                       "A rough horned facemask worn by young orcs",
    "orc_leather_mask" :                    "A basic leather mask worn by young orcs",
    "orc_metal_mask" :                      "A simple construction of metal plates, worn by young orcs",
    "orc_strapped_helm" :                   "An orc helm made of a looted nasal helm",

    "rotten_flat_top_face_mask" :    "Rotten Flat Top Face Mask",
    "rotten_great_helm" :           "Rotten Great Helm",
    "sallet" :                        "A metal sallet helmet with an extended neckguard, a design uncommon in these lands. It is well crafted to offer maximum protection with minimum weight, and without impairing vision.",
    "skin_helm" :                   "The Glimpse of Davkul is a gift bestowed upon man by ancient and dark powers, a helmet merged with human skin and bones through the most unspeakable of rituals. A glimpse of a future where man shall become one with creations from a realm beyond. It shall never break, but instead keep regrowing its scarred skin on the spot.",
    "stag_helm" :                   "The helm of a noble house champion bearing the design of the stag, unparralled craftmanship but quite unweildy",
    "swan_helm" :                   "The helm of a noble house champion bearing the design of the swan, beautiful design but quite impractical",
    "tailed_conic" :                "A hardened nasal helmet with a unique neckguard made from leather scales.",
    "viking_helm" :                   "A nordic helmet guarding face and neck with additional metal plates",
    "sack" :                         "A rough hewn hession sack",

    "goblin_leaf_helm" :         "A goblin helm made for blending in with cover",
    "vampire_crown" :            "A crown of ancient design, relic of a bygone era in a far away land.",
    "chain_attachment" :         "Chain Attachment",
    "cult_hood" :                "Cult Hood",
    "eyemask" :                  "Eyemask",
    "facemask" :                 "Facemask",
    "faceplate_full" :           "Full Faceplate",
    "faceplate_gold" :           "Gold Faceplate",
    "faceplate_long" :           "Long Faceplate",
    "faceplate_pointed" :        "Pointed Faceplate",
    "faceplate_raised" :         "Raised Faceplate",
    "faceplate_short" :          "Short Faceplate",
    "faceplate_snub_nose" :      "Snub Nose Faceplate",
    "faceplate_winged" :         "Winged Faceplate",
    "goblin_gillie" :            "Goblin Gillie",
    "goblin_leaves" :            "Goblin Leaves",
    "headband_nose" :            "Headband Nose",
    "headband_side" :            "Headband Side",
    "leather_hood_barb" :        "Leather Hood Barb",
    "nose_plate" :               "Nose Plate",

    "antler" :               "The wide antlers of a beast, often a mark of distinction in northern tribes",
    "bear_head" :            "The dried and prepped head of a large bear. Offers some protection, but is mostly donned for the looks.",
    "beret" :                "A beret typically worn by nobles",
    "bull_horns" :           "The horns of a wild beast, used as a sign of prowess in northern tribes.",
    "crown" :                "An ornately designed symbol of authority",
    "faction_helmet" :       "The helmet of a noble house",
    "faction_helmet_2" :     "The helmet of a noble house",
    "feather_band" :         "A band holding a feather, purely for decoration",
    "feathered_hat" :        "A feathered hat as is the latest fashion among the courtisans",
    "fencer_hat" :           "The floppy hat of a swordsman",
    "goat_horns" :           "The tall horns of a barbarian beastmaster",
    "headband" :             "A simple leather headband from a northern tribe",
    "horn_decorations" :     "Decorative horns, fashionable in the northern tribes",
    "hunter_cap" :           "The distinctive hat of a game hunter",
    "impaled_head" :         "A rotting and withered human head, quite disgusting",
    "jester_hat" :           "The quintisential hat of performing folk in noble court",
    "metal_bird" :           "An ancient metal bird statue",
    "noble_buckle" :         "A decorative buckle used on noble hats",
    "noble_feather" :        "A decorative feature found on the hats of nobles",
    "noble_floppy_hat" :     "A fashionable hat for aristocrats",
    "noble_hat" :            "A fashionable hat for courtesans",
    "noble_hood" :           "A hood made of high quality materials",
    "wreath" :               "A metallic wreath in the ancient style",
    "orc_bones" :            "Decorative bones, fashionable among orcs",
    "plait" :                "A decorative plait used to adorn helms.",
    "ponytail" :             "A long tail of hair used to adorn helms",
    "ram_horns" :            "The horns of a wild beast, used as a sign of competency in northern tribes.",
    "side_feather" :         "A decorative feather used on hats",
    "straw_hat" :            "A simple straw hat, often used by farmers and peasants",
    "top_feather" :          "A decorative feather used on hats",
    "witchhunter_helm" :     "A tough leather hat that provides decent protection against scratches.",
    "wizard_cowl" :          "A pointy hat with a broad rim.",
    "wolf_helm" :            "An impressive wolf head covering",

    "back_crest" :       "A huge crest of feathers arrayed behind a helm",
    "back_feathers" :    "A set of feathers displayed behind a helm",
    "feather_crest" :    "A fan of feathers displayed behind a helm",
    "knotted_tail" :    "A knotted pony tail, used as a sign of prowess in foreign lands",
    "orc_tail" :         "A knotted tail of hair used as decoration by an orc, there is still a scalp attached",
    "wings" :            "A set of feathers arrayed on supports to form wings",

    "bronze_chain" : "Bronze Chain",
    "bronze_helm" : "Bronze Helm",
    "dentist_helmet" : "Dentist Helmet",
    "faceplate_curved" : "Curved Faceplate",
    "faceplate_flat" : "Flat Faceplate",
    "faceplate_full_gold" : "Golden Full Faceplate",
    "faceplate_pointed_slit" : "Slit Pointed Faceplate",
    "faceplate_sharp": "Sharp Faceplate",
    "faceplate_snub_slit" : "Slitted Snub Faceplate",
    "golden_mask"  : "An exquisit golden mask from distant royalty, exceptional craftmanship",
    "warlock_skull" : "Warlock Skill Helm",
    "white_wolf_helm" : "The trophy of a white wolf head.",
    "royal_hood" : "The ornate hood of distant royalty, made from the finest materials.",
    "lindwurm_helm" : "Lindwurm Helm",
    "redback_helm" : "A sturdy yet light helmet made from the carapace of a redback spider.",
    "nun_habit" : "A characteristic head covering of the convent",
    "nach_helm" : "A trophy made from the face of a skin ghoul.",
    "mountain_helm" : "A helmet crafted from the skin and skull of a mighty rock unhold, the beast may be dead, but it continues to mend itself even after death",
    "demon_alp_helm" : "A trophy made from the face of a demon",
    "warlock_hood" : "Warlock Hood",
    "top_plume" : "Top Plume"
}

def main():

    for d in layers:

        layer = d["layer"]

        lower = "false"
        temp = Layer
        if "base" in d:
            temp = BaseLayer
        if "lowervanity" in d:
            layer += "_lower"
            lower = "true"

        fname = "legend_helmet_" + d["name"]
        dirpath = os.path.join(os.path.dirname(os.path.abspath(__file__)), "scripts", "items", "legend_helmets", layer)
        if not os.path.exists(dirpath):
            os.makedirs(dirpath)

        filepath = os.path.join(dirpath, fname + ".nut")
        F = open(filepath, "w")
        variants = []
        for x in range(d["max"]):
            variants.append(x+1)

        title = titles[d["name"]]
        desc = descriptions[d["name"]]

        opts = dict(
            test="true",
            name=fname,
            title=title,
            desc=desc,
            condition = d["con"],
            value = d["value"],
            stamina = d["stam"],
            vision = d["vis"],
            id="armor.head." + fname,
            variants = variants,
            layer = layer,
            type= d["layer"].capitalize(),
            brush = "legendhelms_" + d["name"],
            icon = "inventory_" + d["name"],
            lower = lower,
            hair = d["hair"],
            beard = d["beard"]
        )
        s = Template(temp)
        text = s.substitute(opts)
        #text.replace("/", "\\")
        F.write(text)
        F.close()

        print('[0, "' + layer + '/' + fname + '"],')

main()


# '''
# if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
# {
#     local hoods = [
#         [0, ""],
        # [0, "hood/legend_helmet_barb_chain_scarf"],
        # [0, "hood/legend_helmet_chain_hood"],
        # [0, "hood/legend_helmet_chain_hood_full"],
        # [0, "hood/legend_helmet_chain_scarf"],
        # [0, "hood/legend_helmet_cloth_scarf"],
        # [0, "hood/legend_helmet_goblin_scarf"],
        # [0, "hood/legend_helmet_leather_hood"],
        # [0, "hood/legend_helmet_padded_hood"],
        # [0, "hood/legend_helmet_patched_hood"],
        # [0, "hood/legend_helmet_rotten_chain_scarf"],
        # [0, "hood/legend_helmet_simple_hood"],
        # [0, "hood/legend_helmet_padded_cap"],
        # [0, "hood/legend_helmet_hood_cloth_round"],
        # [0, "hood/legend_helmet_hood_cloth_wide"],
        # [0, "hood/legend_helmet_cloth_long_hood"],
        # [0, "hood/legend_helmet_cloth_bandana"],
        # [0, "hood/legend_helmet_leather_cap"],
        # [0, "hood/legend_helmet_bronze_chain"]
#     ];
#     local helmet = this.Const.World.Common.pickLegendHelmet(hoods)

#     if (helmet != null)
#     {
#         local helms = [
        # [0, ""]
        # [0, "helm/legend_helmet_ancient_beard_mask"],
        # [0, "helm/legend_helmet_ancient_conic_helm"],
        # [0, "helm/legend_helmet_ancient_crested"],
        # [0, "helm/legend_helmet_ancient_dome"],
        # [0, "helm/legend_helmet_ancient_dome_tailed"],
        # [0, "helm/legend_helmet_ancient_face_helm"],
        # [0, "helm/legend_helmet_ancient_face_plate"],
        # [0, "helm/legend_helmet_ancient_kettle"],
        # [0, "helm/legend_helmet_ancient_legionaire"],
        # [0, "helm/legend_helmet_ancient_lion_mask"],
        # [0, "helm/legend_helmet_ancient_mask"],
        # [0, "helm/legend_helmet_ancient_side_hawk"],
        # [0, "helm/legend_helmet_ancient_tailed_conic_helm"],
        # [0, "helm/legend_helmet_barbute"],
        # [0, "helm/legend_helmet_basinet"],
        # [0, "helm/legend_helmet_carthaginian"],
        # [0, "helm/legend_helmet_conic_helm"],
        # [0, "helm/legend_helmet_crude_cylinder_helm"],
        # [0, "helm/legend_helmet_crude_metal_helm"],
        # [0, "helm/legend_helmet_crude_skull_helm"],
        # [0, "helm/legend_helmet_flat_top_face_plate"],
        # [0, "helm/legend_helmet_flat_top_helm"],
        # [0, "helm/legend_helmet_great_helm"],
        # [0, "helm/legend_helmet_heavy_plate_helm"],
        # [0, "helm/legend_helmet_heavy_spiked_helm"],
        # [0, "helm/legend_helmet_horsetail"],
        # [0, "helm/legend_helmet_kettle_helm"],
        # [0, "helm/legend_helmet_legend_ancient_gladiator"],
        # [0, "helm/legend_helmet_legend_ancient_legionaire_restored"],
        # [0, "helm/legend_helmet_legend_frogmouth"],
        # [0, "helm/legend_helmet_legend_frogmouth_close"],
        # [0, "helm/legend_helmet_nordic_helm"],
        # [0, "helm/legend_helmet_norman_helm"],
        # [0, "helm/legend_helmet_orc_double_helm"],
        # [0, "helm/legend_helmet_orc_great_helm"],
        # [0, "helm/legend_helmet_orc_strapped_helm"],
        # [0, "helm/legend_helmet_bronze_helm"],
        # [0, "helm/legend_helmet_dentist_helmet"],
        # [0, "helm/legend_helmet_rotten_flat_top_face_mask"],
        # [0, "helm/legend_helmet_rotten_great_helm"],
        # [0, "helm/legend_helmet_sallet"],
        # [0, "helm/legend_helmet_skin_helm"],
        # [0, "helm/legend_helmet_stag_helm"],
        # [0, "helm/legend_helmet_swan_helm"],
        # [0, "helm/legend_helmet_tailed_conic"],
        # [0, "helm/legend_helmet_viking_helm"]
#         ]

#         local helm = this.Const.World.Common.pickLegendHelmet(helms)
#         if (helm != null)
#         {
#             helmet.setUpgrade(helm)
#         }

#         local tops = [
        # [0, ""],
        # [0, "top/legend_helmet_orc_horn_mask"],
        # [0, "top/legend_helmet_orc_leather_mask"],
        # [0, "top/legend_helmet_orc_metal_mask"],
        # [0, "top/legend_helmet_goblin_chain_helm"],
        # [0, "top/legend_helmet_goblin_leather_helm"],
        # [0, "top/legend_helmet_goblin_leather_mask"],
        # [0, "top/legend_helmet_goblin_spiked_helm"],
        # [0, "top/legend_helmet_cult_hood"],
        # [0, "top/legend_helmet_leather_hood_barb"],
        # [0, "top/legend_helmet_golden_helm"],
        # [0, "top/legend_helmet_ancient_crown"],
        # [0, "top/legend_helmet_goblin_leaf_helm"],
        # [0, "top/legend_helmet_vampire_crown"],
        # [0, "top/legend_helmet_chain_attachment"],
        # [0, "top/legend_helmet_eyemask"],
        # [0, "top/legend_helmet_facemask"],
        # [0, "top/legend_helmet_faceplate_full"],
        # [0, "top/legend_helmet_faceplate_gold"],
        # [0, "top/legend_helmet_faceplate_long"],
        # [0, "top/legend_helmet_faceplate_pointed"],
        # [0, "top/legend_helmet_faceplate_raised"],
        # [0, "top/legend_helmet_faceplate_short"],
        # [0, "top/legend_helmet_faceplate_snub_nose"],
        # [0, "top/legend_helmet_faceplate_winged"],
        # [0, "top/legend_helmet_goblin_gillie"],
        # [0, "top/legend_helmet_goblin_leaves"],
        # [0, "top/legend_helmet_headband_nose"],
        # [0, "top/legend_helmet_headband_side"],
        # [0, "top/legend_helmet_nose_plate"],
        # [0, "top/legend_helmet_faceplate_curved"],
        # [0, "top/legend_helmet_faceplate_flat"],
        # [0, "top/legend_helmet_faceplate_full_gold"],
        # [0, "top/legend_helmet_faceplate_pointed_slit"],
        # [0, "top/legend_helmet_faceplate_sharp"],
        # [0, "top/legend_helmet_faceplate_snub_slit"],
        # [0, "top/legend_helmet_golden_mask"],
        # [0, "top/legend_helmet_warlock_skull"],
#         ]
#         local top = this.Const.World.Common.pickLegendHelmet(tops)
#         if (top != null)
#         {
#             helmet.setUpgrade(top)
#         }

#         local flairs = [
        # [0, ""],
        # [0, "vanity/legend_helmet_hood_cloth_square"],
        # [0, "vanity/legend_helmet_sack"],
        # [0, "vanity/legend_helmet_antler"],
        # [0, "vanity/legend_helmet_bear_head"],
        # [0, "vanity/legend_helmet_beret"],
        # [0, "vanity/legend_helmet_bull_horns"],
        # [0, "vanity/legend_helmet_crown"],
        # [0, "vanity/legend_helmet_faction_helmet"],
        # [0, "vanity/legend_helmet_faction_helmet_2"],
        # [0, "vanity/legend_helmet_feather_band"],
        # [0, "vanity/legend_helmet_feathered_hat"],
        # [0, "vanity/legend_helmet_fencer_hat"],
        # [0, "vanity/legend_helmet_goat_horns"],
        # [0, "vanity/legend_helmet_headband"],
        # [0, "vanity/legend_helmet_horn_decorations"],
        # [0, "vanity/legend_helmet_hunter_cap"],
        # [0, "vanity/legend_helmet_impaled_head"],
        # [0, "vanity/legend_helmet_jester_hat"],
        # [0, "vanity/legend_helmet_metal_bird"],
        # [0, "vanity/legend_helmet_noble_buckle"],
        # [0, "vanity/legend_helmet_noble_feather"],
        # [0, "vanity/legend_helmet_noble_floppy_hat"],
        # [0, "vanity/legend_helmet_noble_hat"],
        # [0, "vanity/legend_helmet_noble_hood"],
        # [0, "vanity/legend_helmet_wreath"],
        # [0, "vanity/legend_helmet_orc_bones"],
        # [0, "vanity/legend_helmet_plait"],
        # [0, "vanity/legend_helmet_ponytail"],
        # [0, "vanity/legend_helmet_ram_horns"],
        # [0, "vanity/legend_helmet_side_feather"],
        # [0, "vanity/legend_helmet_straw_hat"],
        # [0, "vanity/legend_helmet_top_feather"],
        # [0, "vanity/legend_helmet_witchhunter_helm"],
        # [0, "vanity/legend_helmet_wizard_cowl"],
        # [0, "vanity/legend_helmet_wolf_helm"],
        # [0, "vanity/legend_helmet_white_wolf_helm"],
        # [0, "vanity/legend_helmet_royal_hood"],
        # [0, "vanity/legend_helmet_lindwurm_helm"],
        # [0, "vanity/legend_helmet_redback_helm"],
        # [0, "vanity/legend_helmet_nun_habit"],
        # [0, "vanity/legend_helmet_nach_helm"],
        # [0, "vanity/legend_helmet_wolf_helm"],
        # [0, "vanity/legend_helmet_white_wolf_helm"],
        # [0, "vanity/legend_helmet_royal_hood"],
        # [0, "vanity/legend_helmet_lindwurm_helm"],
        # [0, "vanity/legend_helmet_redback_helm"],
        # [0, "vanity/legend_helmet_nun_habit"],
        # [0, "vanity/legend_helmet_nach_helm"],
        # [0, "vanity/legend_helmet_mountain_helm"],
        # [0, "vanity/legend_helmet_demon_alp_helm"],
        # [0, "vanity/legend_helmet_warlock_hood"],
        # [0, "vanity_lower/legend_helmet_back_crest"],
        # [0, "vanity_lower/legend_helmet_back_feathers"],
        # [0, "vanity/legend_helmet_mountain_helm"],
        # [0, "vanity/legend_helmet_demon_alp_helm"],
        # [0, "vanity/legend_helmet_warlock_hood"],
        # [0, "vanity_lower/legend_helmet_back_crest"],
        # [0, "vanity_lower/legend_helmet_back_feathers"],
        # [0, "vanity/legend_helmet_mountain_helm"],
        # [0, "vanity/legend_helmet_demon_alp_helm"],
        # [0, "vanity/legend_helmet_warlock_hood"],
        # [0, "vanity_lower/legend_helmet_back_crest"],
        # [0, "vanity_lower/legend_helmet_back_feathers"],
        # [0, "vanity_lower/legend_helmet_feather_crest"],
        # [0, "vanity_lower/legend_helmet_knotted_tail"],
        # [0, "vanity_lower/legend_helmet_orc_tail"],
        # [0, "vanity_lower/legend_helmet_top_plume"],
        # [0, "vanity_lower/legend_helmet_wings"],
#         ]
#         local flair = this.Const.World.Common.pickLegendHelmet(flairs)
#         if (flair != null)
#         {
#             helmet.setUpgrade(flair)
#         }
#         this.m.Items.equip(helmet);
#     }
# }

# '''
