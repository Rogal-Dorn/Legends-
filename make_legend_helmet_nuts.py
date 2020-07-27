
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
    {"name": "barb_chain_scarf",    "layer": "hood", "min": 1, "max": 5, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "chain_hood",          "layer": "hood", "min": 1, "max": 4, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "chain_hood_full",     "layer": "hood", "min": 1, "max": 6, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "chain_scarf",         "layer": "hood", "min": 1, "max": 5, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "cloth_scarf",         "layer": "hood", "min": 1, "max": 5, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "goblin_scarf",        "layer": "hood", "min": 1, "max": 4, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "leather_hood",        "layer": "hood", "min": 1, "max": 5, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "padded_hood",         "layer": "hood", "min": 1, "max": 3, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "patched_hood",        "layer": "hood", "min": 1, "max": 1, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "rotten_chain_scarf",  "layer": "hood", "min": 1, "max": 5, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "simple_hood",         "layer": "hood", "min": 1, "max": 5, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "padded_cap",          "layer": "hood", "min": 1, "max": 1, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "hood_cloth_round",    "layer": "hood", "min": 1, "max": 1, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "hood_cloth_square",   "layer": "hood", "min": 1, "max": 1, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "hood_cloth_wide",     "layer": "hood", "min": 1, "max": 2, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "cloth_long_hood",     "layer": "hood", "min": 1, "max": 4, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "cloth_bandana",       "layer": "hood", "min": 1, "max": 5, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "leather_cap",         "layer": "hood", "min": 1, "max": 1, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "bronze_chain",        "layer": "hood", "min": 1, "max": 1, "base": True, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },

    {"name": "ancient_beard_mask",                  "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "ancient_conic_helm",                  "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "ancient_crested",                     "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "ancient_dome",                        "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "ancient_dome_tailed",                 "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "ancient_face_helm",                   "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "ancient_face_plate",                  "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "ancient_kettle",                      "layer": "helm", "min": 1, "max": 3, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "ancient_legionaire",                  "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "ancient_lion_mask",                   "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "ancient_mask",                        "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "ancient_side_hawk",                   "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "ancient_tailed_conic_helm",           "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "barbute",                             "layer": "helm", "min": 1, "max": 7, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "basinet",                             "layer": "helm", "min": 1, "max": 7, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "carthaginian",                        "layer": "helm", "min": 1, "max": 3, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "conic_helm",                          "layer": "helm", "min": 1, "max": 6, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "crude_cylinder_helm",                 "layer": "helm", "min": 1, "max": 2, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "crude_metal_helm",                    "layer": "helm", "min": 1, "max": 3, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "crude_skull_helm",                    "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "flat_top_face_plate",                 "layer": "helm", "min": 1, "max": 6, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "flat_top_helm",                       "layer": "helm", "min": 1, "max": 6, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "goblin_chain_helm",                   "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "goblin_leather_helm",                 "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "goblin_leather_mask",                 "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "goblin_spiked_helm",                  "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "great_helm",                          "layer": "helm", "min": 1, "max": 6, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "heavy_plate_helm",                    "layer": "helm", "min": 1, "max": 2, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "heavy_spiked_helm",                   "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "horsetail",                           "layer": "helm", "min": 1, "max": 6, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "kettle_helm",                         "layer": "helm", "min": 1, "max": 6, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "legend_ancient_gladiator",            "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "legend_ancient_legionaire_restored",  "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "legend_frogmouth",                    "layer": "helm", "min": 1, "max": 3, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "nordic_helm",                         "layer": "helm", "min": 1, "max": 6, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "norman_helm",                         "layer": "helm", "min": 1, "max": 5, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "orc_double_helm",                     "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "orc_great_helm",                      "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "orc_horn_mask",                       "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "orc_leather_mask",                    "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "orc_metal_mask",                      "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "bronze_helm",                         "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "dentist_helmet",                      "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },

    {"name": "cult_hood",                   "layer": "helm", "min": 1, "max": 7, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "rotten_flat_top_face_mask",   "layer": "helm", "min": 1, "max": 5, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "rotten_great_helm",           "layer": "helm", "min": 1, "max": 4, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "sallet",                      "layer": "helm", "min": 1, "max": 6, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "skin_helm",                   "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "stag_helm",                   "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "swan_helm",                   "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "tailed_conic",                "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "viking_helm",                 "layer": "helm", "min": 1, "max": 6, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "sack",                        "layer": "helm", "min": 1, "max": 12, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "leather_hood_barb",           "layer": "helm", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },

    {"name": "golden_helm",             "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "ancient_crown",           "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "goblin_leaf_helm",        "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "vampire_crown",           "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "chain_attachment",        "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "eyemask",                 "layer": "top", "min": 1, "max": 2, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "facemask",                "layer": "top", "min": 1, "max": 6, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "faceplate_full",          "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "faceplate_gold",          "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "faceplate_long",          "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "faceplate_pointed",       "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "faceplate_raised",        "layer": "top", "min": 1, "max": 2, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "faceplate_short",         "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "faceplate_snub_nose",     "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "faceplate_winged",        "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "goblin_gillie",           "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "goblin_leaves",           "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "headband_nose",           "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "headband_side",           "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "nose_plate",              "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "faceplate_curved",        "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "faceplate_flat",          "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "faceplate_full_gold",     "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "faceplate_pointed_slit",  "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "faceplate_sharp",         "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "faceplate_snub_slit",     "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "golden_mask",             "layer": "top", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "warlock_skull",           "layer": "top", "min": 1, "max": 3, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    
    {"name": "antler",              "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "bear_head",           "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "beret",               "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "bull_horns",          "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "crown",               "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "faction_helmet",      "layer": "vanity", "min": 1, "max": 12, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "faction_helmet_2",    "layer": "vanity", "min": 1, "max": 10, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "feather_band",        "layer": "vanity", "min": 1, "max": 2, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "feathered_hat",       "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "fencer_hat",          "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "goat_horns",          "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "headband",            "layer": "vanity", "min": 1, "max": 16, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "horn_decorations",    "layer": "vanity", "min": 1, "max": 2, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "hunter_cap",          "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "impaled_head",        "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "jester_hat",          "layer": "vanity", "min": 1, "max": 65, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "metal_bird",          "layer": "vanity", "min": 1, "max": 2, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "noble_buckle",        "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "noble_feather",       "layer": "vanity", "min": 1, "max": 4, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "noble_floppy_hat",    "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "noble_hat",           "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "noble_hood",          "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "wreath",              "layer": "vanity", "min": 1, "max": 2, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "orc_bones",           "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "plait",               "layer": "vanity", "min": 1, "max": 12, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "ponytail",            "layer": "vanity", "min": 1, "max": 4, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "ram_horns",           "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "side_feather",        "layer": "vanity", "min": 1, "max": 5, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "straw_hat",           "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "top_feather",         "layer": "vanity", "min": 1, "max": 5, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "witchhunter_helm",    "layer": "vanity", "min": 1, "max": 7, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "wizard_cowl",         "layer": "vanity", "min": 1, "max": 20, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "wolf_helm",           "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "white_wolf_helm",     "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "royal_hood",          "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "lindwurm_helm",       "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "redback_helm",        "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "nun_habit",           "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "nach_helm",           "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "mountain_helm",       "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "demon_alp_helm",      "layer": "vanity", "min": 1, "max": 1, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "warlock_hood",        "layer": "vanity", "min": 1, "max": 4, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
     
    {"name": "back_crest",      "layer": "vanity", "lowervanity": True, "min": 1, "max": 4, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "back_feathers",   "layer": "vanity", "lowervanity": True, "min": 1, "max": 4, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "feather_crest",   "layer": "vanity", "lowervanity": True, "min": 1, "max": 5, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "knotted_tail",    "layer": "vanity", "lowervanity": True, "min": 1, "max": 4, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "orc_tail",        "layer": "vanity", "lowervanity": True, "min": 1, "max": 2, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "top_plume",        "layer": "vanity", "lowervanity": True, "min": 1, "max": 2, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 },
    {"name": "wings",           "layer": "vanity", "lowervanity": True, "min": 1, "max": 6, "value" : 200, "con" : 80, "stam" : -4, "vis" : 0 }
]


titles = {
    "barb_chain_scarf" :     "Barb Chain Scarf",
    "chain_hood" :          "Chain Hood",
    "chain_hood_full" :     "Full Chain Hood",
    "chain_scarf" :         "Chain Scarf",
    "cloth_scarf" :         "Cloth Scarf",
    "goblin_scarf" :        "Goblin Scarf",
    "leather_hood" :        "Leather Hood",
    "padded_hood" :         "Padded Hood",
    "patched_hood" :         "Patched Hood",
    "rotten_chain_scarf" :   "Rotten Chain Scarf",
    "simple_hood" :          "Simple Hood",
    "padded_cap" :           "Padded Cap",
    "hood_cloth_round" :     "Round Hood Cloth",
    "hood_cloth_square" :    "Square Hood Cloth",
    "hood_cloth_wide" :      "Wide Hood Cloth",
    "cloth_long_hood" :      "Cloth Long Hood",
    "cloth_bandana" :        "Cloth Bandana",
    "leather_cap" :          "Leather Cap",

    "ancient_beard_mask" :                  "Ancient Beard Mask",
    "ancient_conic_helm" :                  "Ancient Conic Helm",
    "ancient_crested" :                     "Ancient Crested Helm",
    "ancient_crown" :                       "Ancient Crown",
    "ancient_dome" :                        "Ancient Dome",
    "ancient_dome_tailed" :                 "Tailed Ancient Dome",
    "ancient_face_helm" :                   "Ancient Face Helm",
    "ancient_face_plate" :                  "Ancient Face Plate",
    "ancient_kettle" :                       "Ancient Kettle",
    "ancient_legionaire" :                  "Ancient Legionaire Helm",
    "ancient_lion_mask" :                   "Ancient Lion Mask",
    "ancient_mask" :                        "Ancient Mask",
    "ancient_side_hawk" :                   "Ancient Side Hawk",
    "ancient_tailed_conic_helm" :           "Ancient Tailed Conic Helm",
    "barbute" :                              "Barbute",
    "basinet" :                              "Basinet",
    "carthaginian" :                         "Carthaginian",
    "conic_helm" :                           "Conic Helm",
    "crude_cylinder_helm" :                  "Crude Cylinder Helm",
    "crude_metal_helm" :                     "Crude Metal Helm",
    "crude_skull_helm" :                    "Crude Skull Helm",
    "flat_top_face_plate" :                  "Flat Top Face Plate",
    "flat_top_helm" :                        "Flat Top Helm",
    "goblin_chain_helm" :                   "Goblin Chain Helm",
    "goblin_leather_helm" :                 "Goblin Leather Helm",
    "goblin_leather_mask" :                 "Goblin Leather Mask",
    "goblin_spiked_helm" :                  "Goblin Spiked Helm",
    "golden_helm" :                         "Golden Helm",
    "great_helm" :                           "Great Helm",
    "heavy_plate_helm" :                     "Heavy Plate Helm",
    "heavy_spiked_helm" :                   "Heavy Spiked Helm",
    "horsetail" :                            "Horsetail",
    "kettle_helm" :                          "Kettle Helm",
    "legend_ancient_gladiator" :            "Ancient Gladiator Helm",
    "legend_ancient_legionaire_restored" :  "Restored Ancient Legionaire",
    "legend_frogmouth" :                     "Frogmouth",
    "nordic_helm" :                          "Nordic Helm",
    "norman_helm" :                         "Norman Helm",
    "orc_double_helm" :                     "Orc Double Helm",
    "orc_great_helm" :                      "Orc Great Helm",
    "orc_horn_mask" :                       "Orc Horn Mask",
    "orc_leather_mask" :                    "Orc Leather Mask",
    "orc_metal_mask" :                      "Orc Metal Mask",
    "orc_strapped_helm" :                   "Orc Strapped Helm",

    "rotten_flat_top_face_mask" :    "Rotten Flat Top Face Mask",
    "rotten_great_helm" :           "Rotten Great Helm",
    "sallet" :                        "Sallet",
    "skin_helm" :                   "Skin Helm",
    "stag_helm" :                   "Stag Helm",
    "swan_helm" :                   "Swan Helm",
    "tailed_conic" :                "Tailed Conic",
    "viking_helm" :                   "Viking Helm",
    "sack" :                         "Sack",

    "goblin_leaf_helm" :         "Goblin Leaf Helm",
    "vampire_crown" :            "Vampire Crown",
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

    "antler" :               "Antler",
    "bear_head" :            "Bear Head",
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
    "noble_floppy_hat" :     "Noble Floppy Hat",
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

    "back_crest" :       "Back Crest",
    "back_feathers" :    "Back Feathers",
    "feather_crest" :    "Feather Crest",
    "knotted_tail" :    "Knotted Tail",
    "orc_tail" :         "Orc Tail",
    "wings" :            "Wings"
}


descriptions = {
    "barb_chain_scarf" :     "Barb Chain Scarf",
    "chain_hood" :          "Chain Hood",
    "chain_hood_full" :     "Full Chain Hood",
    "chain_scarf" :         "Chain Scarf",
    "cloth_scarf" :         "Cloth Scarf",
    "goblin_scarf" :        "Goblin Scarf",
    "leather_hood" :        "Leather Hood",
    "padded_hood" :         "Padded Hood",
    "patched_hood" :         "Patched Hood",
    "rotten_chain_scarf" :   "Rotten Chain Scarf",
    "simple_hood" :          "Simple Hood",
    "padded_cap" :           "Padded Cap",
    "hood_cloth_round" :     "Round Hood Cloth",
    "hood_cloth_square" :    "Square Hood Cloth",
    "hood_cloth_wide" :      "Wide Hood Cloth",
    "cloth_long_hood" :      "Cloth Long Hood",
    "cloth_bandana" :        "Cloth Bandana",
    "leather_cap" :          "Leather Cap",

    "ancient_beard_mask" :                  "Ancient Beard Mask",
    "ancient_conic_helm" :                  "Ancient Conic Helm",
    "ancient_crested" :                     "Ancient Crested Helm",
    "ancient_crown" :                       "Ancient Crown",
    "ancient_dome" :                        "Ancient Dome",
    "ancient_dome_tailed" :                 "Tailed Ancient Dome",
    "ancient_face_helm" :                   "Ancient Face Helm",
    "ancient_face_plate" :                  "Ancient Face Plate",
    "ancient_kettle" :                       "Ancient Kettle",
    "ancient_legionaire" :                  "Ancient Legionaire Helm",
    "ancient_lion_mask" :                   "Ancient Lion Mask",
    "ancient_mask" :                        "Ancient Mask",
    "ancient_side_hawk" :                   "Ancient Side Hawk",
    "ancient_tailed_conic_helm" :           "Ancient Tailed Conic Helm",
    "barbute" :                              "Barbute",
    "basinet" :                              "Basinet",
    "carthaginian" :                         "Carthaginian",
    "conic_helm" :                           "Conic Helm",
    "crude_cylinder_helm" :                  "Crude Cylinder Helm",
    "crude_metal_helm" :                     "Crude Metal Helm",
    "crude_skull_helm" :                    "Crude Skull Helm",
    "flat_top_face_plate" :                  "Flat Top Face Plate",
    "flat_top_helm" :                        "Flat Top Helm",
    "goblin_chain_helm" :                   "Goblin Chain Helm",
    "goblin_leather_helm" :                 "Goblin Leather Helm",
    "goblin_leather_mask" :                 "Goblin Leather Mask",
    "goblin_spiked_helm" :                  "Goblin Spiked Helm",
    "golden_helm" :                         "Golden Helm",
    "great_helm" :                           "Great Helm",
    "heavy_plate_helm" :                     "Heavy Plate Helm",
    "heavy_spiked_helm" :                   "Heavy Spiked Helm",
    "horsetail" :                            "Horsetail",
    "kettle_helm" :                          "Kettle Helm",
    "legend_ancient_gladiator" :            "Ancient Gladiator Helm",
    "legend_ancient_legionaire_restored" :  "Restored Ancient Legionaire",
    "legend_frogmouth" :                     "Frogmouth",
    "nordic_helm" :                          "Nordic Helm",
    "norman_helm" :                         "Norman Helm",
    "orc_double_helm" :                     "Orc Double Helm",
    "orc_great_helm" :                      "Orc Great Helm",
    "orc_horn_mask" :                       "Orc Horn Mask",
    "orc_leather_mask" :                    "Orc Leather Mask",
    "orc_metal_mask" :                      "Orc Metal Mask",
    "orc_strapped_helm" :                   "Orc Strapped Helm",

    "rotten_flat_top_face_mask" :    "Rotten Flat Top Face Mask",
    "rotten_great_helm" :           "Rotten Great Helm",
    "sallet" :                        "Sallet",
    "skin_helm" :                   "Skin Helm",
    "stag_helm" :                   "Stag Helm",
    "swan_helm" :                   "Swan Helm",
    "tailed_conic" :                "Tailed Conic",
    "viking_helm" :                   "Viking Helm",
    "sack" :                         "Sack",

    "goblin_leaf_helm" :         "Goblin Leaf Helm",
    "vampire_crown" :            "Vampire Crown",
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

    "antler" :               "Antler",
    "bear_head" :            "Bear Head",
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
    "noble_floppy_hat" :     "Noble Floppy Hat",
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

    "back_crest" :       "Back Crest",
    "back_feathers" :    "Back Feathers",
    "feather_crest" :    "Feather Crest",
    "knotted_tail" :    "Knotted Tail",
    "orc_tail" :         "Orc Tail",
    "wings" :            "Wings"
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
            lower = lower
        )
        s = Template(temp)
        text = s.substitute(opts)
        #text.replace("/", "\\")
        F.write(text)
        F.close()


       # print('[0, "' + layer + '/' + fname + '"],')

main()


'''
if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
{
    local hoods = [
        [0, ""],
        [0, "hood/legend_helmet_barb_chain_scarf"],
        [0, "hood/legend_helmet_chain_hood"],
        [0, "hood/legend_helmet_chain_hood_full"],
        [0, "hood/legend_helmet_chain_scarf"],
        [0, "hood/legend_helmet_cloth_scarf"],
        [0, "hood/legend_helmet_goblin_scarf"],
        [0, "hood/legend_helmet_leather_hood"],
        [0, "hood/legend_helmet_padded_hood"],
        [0, "hood/legend_helmet_patched_hood"],
        [0, "hood/legend_helmet_rotten_chain_scarf"],
        [0, "hood/legend_helmet_simple_hood"],
        [0, "hood/legend_helmet_padded_cap"],
        [0, "hood/legend_helmet_hood_cloth_round"],
        [0, "hood/legend_helmet_hood_cloth_square"],
        [0, "hood/legend_helmet_hood_cloth_wide"],
        [0, "hood/legend_helmet_cloth_long_hood"],
        [0, "hood/legend_helmet_cloth_bandana"],
        [0, "hood/legend_helmet_leather_cap"]
    ];
    local helmet = this.Const.World.Common.pickLegendHelmet(hoods)

    if (helmet != null)
    {
        local helms = [
            [0, "helm/legend_helmet_ancient_beard_mask"],
            [0, "helm/legend_helmet_ancient_conic_helm"],
            [0, "helm/legend_helmet_ancient_crested"],
            [0, "helm/legend_helmet_ancient_dome"],
            [0, "helm/legend_helmet_ancient_dome_tailed"],
            [0, "helm/legend_helmet_ancient_face_helm"],
            [0, "helm/legend_helmet_ancient_face_plate"],
            [0, "helm/legend_helmet_ancient_kettle"],
            [0, "helm/legend_helmet_ancient_legionaire"],
            [0, "helm/legend_helmet_ancient_lion_mask"],
            [0, "helm/legend_helmet_ancient_mask"],
            [0, "helm/legend_helmet_ancient_side_hawk"],
            [0, "helm/legend_helmet_ancient_tailed_conic_helm"],
            [0, "helm/legend_helmet_barbute"],
            [0, "helm/legend_helmet_basinet"],
            [0, "helm/legend_helmet_carthaginian"],
            [0, "helm/legend_helmet_conic_helm"],
            [0, "helm/legend_helmet_crude_cylinder_helm"],
            [0, "helm/legend_helmet_crude_metal_helm"],
            [0, "helm/legend_helmet_crude_skull_helm"],
            [0, "helm/legend_helmet_flat_top_face_plate"],
            [0, "helm/legend_helmet_flat_top_helm"],
            [0, "helm/legend_helmet_goblin_chain_helm"],
            [0, "helm/legend_helmet_goblin_leather_helm"],
            [0, "helm/legend_helmet_goblin_leather_mask"],
            [0, "helm/legend_helmet_goblin_spiked_helm"],
            [0, "helm/legend_helmet_great_helm"],
            [0, "helm/legend_helmet_heavy_plate_helm"],
            [0, "helm/legend_helmet_heavy_spiked_helm"],
            [0, "helm/legend_helmet_horsetail"],
            [0, "helm/legend_helmet_kettle_helm"],
            [0, "helm/legend_helmet_legend_ancient_gladiator"],
            [0, "helm/legend_helmet_legend_ancient_legionaire_restored"],
            [0, "helm/legend_helmet_legend_frogmouth"],
            [0, "helm/legend_helmet_nordic_helm"],
            [0, "helm/legend_helmet_norman_helm"],
            [0, "helm/legend_helmet_orc_double_helm"],
            [0, "helm/legend_helmet_orc_great_helm"],
            [0, "helm/legend_helmet_orc_horn_mask"],
            [0, "helm/legend_helmet_orc_leather_mask"],
            [0, "helm/legend_helmet_orc_metal_mask"],
            [0, "helm/legend_helmet_orc_strapped_helm"],
            [0, "helm/legend_helmet_cult_hood"],
            [0, "helm/legend_helmet_rotten_flat_top_face_mask"],
            [0, "helm/legend_helmet_rotten_great_helm"],
            [0, "helm/legend_helmet_sallet"],
            [0, "helm/legend_helmet_skin_helm"],
            [0, "helm/legend_helmet_stag_helm"],
            [0, "helm/legend_helmet_swan_helm"],
            [0, "helm/legend_helmet_tailed_conic"],
            [0, "helm/legend_helmet_viking_helm"],
            [0, "helm/legend_helmet_sack"],
            [0, "helm/legend_helmet_leather_hood_barb"]
        ]

        local helm = this.Const.World.Common.pickLegendHelmet(helms)
        if (helm != null)
        {
            helmet.setUpgrade(helm)
        }

        local tops = [
            [0, "top/legend_helmet_golden_helm"],
            [0, "top/legend_helmet_ancient_crown"],
            [0, "top/legend_helmet_goblin_leaf_helm"],
            [0, "top/legend_helmet_vampire_crown"],
            [0, "top/legend_helmet_chain_attachment"],
            [0, "top/legend_helmet_eyemask"],
            [0, "top/legend_helmet_facemask"],
            [0, "top/legend_helmet_faceplate_full"],
            [0, "top/legend_helmet_faceplate_gold"],
            [0, "top/legend_helmet_faceplate_long"],
            [0, "top/legend_helmet_faceplate_pointed"],
            [0, "top/legend_helmet_faceplate_raised"],
            [0, "top/legend_helmet_faceplate_short"],
            [0, "top/legend_helmet_faceplate_snub_nose"],
            [0, "top/legend_helmet_faceplate_winged"],
            [0, "top/legend_helmet_goblin_gillie"],
            [0, "top/legend_helmet_goblin_leaves"],
            [0, "top/legend_helmet_headband_nose"],
            [0, "top/legend_helmet_headband_side"],
            [0, "top/legend_helmet_nose_plate"]
        ]
        local top = this.Const.World.Common.pickLegendHelmet(tops)
        if (top != null)
        {
            helmet.setUpgrade(top)
        }

        local flairs = [
            [0, "vanity/legend_helmet_antler"],
            [0, "vanity/legend_helmet_bear_head"],
            [0, "vanity/legend_helmet_beret"],
            [0, "vanity/legend_helmet_bull_horns"],
            [0, "vanity/legend_helmet_crown"],
            [0, "vanity/legend_helmet_faction_helmet"],
            [0, "vanity/legend_helmet_faction_helmet_2"],
            [0, "vanity/legend_helmet_feather_band"],
            [0, "vanity/legend_helmet_feathered_hat"],
            [0, "vanity/legend_helmet_fencer_hat"],
            [0, "vanity/legend_helmet_goat_horns"],
            [0, "vanity/legend_helmet_headband"],
            [0, "vanity/legend_helmet_horn_decorations"],
            [0, "vanity/legend_helmet_hunter_cap"],
            [0, "vanity/legend_helmet_impaled_head"],
            [0, "vanity/legend_helmet_jester_hat"],
            [0, "vanity/legend_helmet_metal_bird"],
            [0, "vanity/legend_helmet_noble_buckle"],
            [0, "vanity/legend_helmet_noble_feather"],
            [0, "vanity/legend_helmet_noble_floppy_hat"],
            [0, "vanity/legend_helmet_noble_hat"],
            [0, "vanity/legend_helmet_noble_hood"],
            [0, "vanity/legend_helmet_wreath"],
            [0, "vanity/legend_helmet_orc_bones"],
            [0, "vanity/legend_helmet_plait"],
            [0, "vanity/legend_helmet_ponytail"],
            [0, "vanity/legend_helmet_side_feather"],
            [0, "vanity/legend_helmet_straw_hat"],
            [0, "vanity/legend_helmet_top_feather"],
            [0, "vanity/legend_helmet_witchhunter_helm"],
            [0, "vanity/legend_helmet_wizard_cowl"],
            [0, "vanity/legend_helmet_wolf_helm"],
            [0, "vanity_lower/legend_helmet_back_crest"],
            [0, "vanity_lower/legend_helmet_back_feathers"],
            [0, "vanity_lower/legend_helmet_feather_crest"],
            [0, "vanity_lower/legend_helmet_knotted_tail"],
            [0, "vanity_lower/legend_helmet_orc_tail"],
            [0, "vanity_lower/legend_helmet_wings"]
        ]
        local flair = this.Const.World.Common.pickLegendHelmet(flairs)
        if (flair != null)
        {
            helmet.setUpgrade(flair)
        }
        this.m.Items.equip(helmet);
    }
}

'''
