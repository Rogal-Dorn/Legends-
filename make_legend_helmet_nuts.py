
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
    "hood_cloth_round" :     "Round Cloth Hood",
    "hood_cloth_square" :    "Square Cloth Hood",
    "hood_cloth_wide" :      "Wide Cloth Hood",
    "cloth_long_hood" :      "Long Cloth Hood",
    "cloth_bandana" :        "Cloth Bandana",
    "leather_cap" :          "Leather Cap",

    "ancient_beard_mask" :                  "Ancient Bearded Mask",
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
    "orc_metal_mask" :                      "Metal Orc Mask",
    "orc_strapped_helm" :                   "Strapped Orc Helm", #orc strapped helm awkward to say imo [mwah], same w/ metal orc mask, others are fine?

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

    "antler" :               "Antlers",
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
    "cloth_bandana" :        "A basic light bandana, useful for keeping the sweat out of the face.",
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
    "golden_helm" :                         "A golden helmet and facemask, showing the visage of an emperor from an age long past, imbued with mystical energies. When you hold it into the light, it almost looks as if the face were moving and making expressions of disgust.", #Firm believer thi shoudl be tier 2 not 1 bc it's THE look of the piece [mwah]
    "great_helm" :                           "Great Helm",
    "heavy_plate_helm" :                     "Heavy Plate Helm",
    "heavy_spiked_helm" :                   "Heavy Spiked Helm",
    "horsetail" :                            "Horsetail",
    "kettle_helm" :                          "Kettle Helm",
    "legend_ancient_gladiator" :            "Ancient Gladiator Helm",
    "legend_ancient_legionaire_restored" :  "Restored Ancient Legionaire",
    "legend_frogmouth" :                     "Frogmouth",
    "nordic_helm" :                          "A nordic helmet guarding the face with additional metal plates.",
    "norman_helm" :                         "Norman Helm",
    "orc_double_helm" :                     "Orc Double Helm",
    "orc_great_helm" :                      "Orc Great Helm",
    "orc_horn_mask" :                       "Orc Horn Mask",
    "orc_leather_mask" :                    "Orc Leather Mask",
    "orc_metal_mask" :                      "Orc Metal Mask",
    "orc_strapped_helm" :                   "Orc Strapped Helm",

    "rotten_flat_top_face_mask" :    "A worn and torn closed helmet with complete faceguard. It has obviously been lying outdoors for a while.",
    "rotten_great_helm" :           "This full helm suffers from rusty metal parts and brittle leather inlays but still offers good protection if you ignore its stench.",
    "sallet" :                        "A metal sallet helmet with an extended neckguard, a design uncommon in these lands.",
    "skin_helm" :                   "The Glimpse of Davkul is a gift bestowed upon man by ancient and dark powers, a helmet merged with human skin and bones through the most unspeakable of rituals. A glimpse of a future where man shall become one with creations from a realm beyond. It shall never break, but instead keep regrowing its scarred skin on the spot.", #is the skin helm the davkul thing? not actually sure
    "stag_helm" :                   "A heavy plate helmet with a pair of antlers.",
    "swan_helm" :                   "A heavy ornate helmet, topped with an ornamenta swan.",
    "tailed_conic" :                "Tailed Conic", #
    "viking_helm" :                   "A nordic helmet guarding face and neck with additional metal plates.",
    "sack" :                         "A rough spun cloth bag with two holes in it.",

    "goblin_leaf_helm" :         "Bundles of sticks and leaves loosely tied together.",
    "vampire_crown" :            "The crown of a vampire lord, long dead.",
    "chain_attachment" :         "A light attatchment of chain, useful for basic protection.",
    "cult_hood" :                "A thick leather hood that covers the head and neck but limits vision, typically worn by cultists.",
    "eyemask" :                  "A mask made to cover the wearer\'s eye-dentity.", #unironically proud of this one i swear to god it has to stay [mwah]
    "facemask" :                 "A well made mask that goes over the whole face but limits vision.",
    "faceplate_full" :           "A heavy winged helm that limits vision.",
    "faceplate_gold" :           "An ornate lower-face guard, that is somewhat hard to breathe in.",
    "faceplate_long" :           "An effective but heavy lower-face guard.",
    "faceplate_pointed" :        "A faceplate that extends well past the nose, limits vision and makes kissing much harder.", #good for italians at least
    "faceplate_raised" :         "A faceplate but worn above the head. Offers less protection than wearing it properly but very breathable.",
    "faceplate_short" :          "A lighter faceguard, but doesn't block vision.",
    "faceplate_snub_nose" :      "A faceplate which provides a bit more breathability than others.",
    "faceplate_winged" :         "An ornate halfplate with wings on the side.",
    "goblin_gillie" :            "A collection of brush to obscure the face with.", #Gobbo things could give +rdef multiplier or similar to the hidden stuff
    "goblin_leaves" :            "A collection of leaves made to obscure the wearer.",  #where they attack u less often?
    "headband_nose" :            "A headband with a small indentation for the nose.",
    "headband_side" :            "A headband fashioned to the side of the helmet.",
    "leather_hood_barb" :        "A thick leather helmet fashioned from cured hides. The animals these once belonged to were certainly dangerous game.",
    "nose_plate" :               "A simple nose covering", #also very good for italians

    "antler" :               "Deer antlers, now prepaerd and used for decoration",
    "bear_head" :            "The dried and prepped head of a large bear. Mostly donned for the looks.",
    "beret" :                "A fancy beret often worn by a sergeant.", #idk do segeants wear this lol [mwah]
    "bull_horns" :           "A sturdy pair of horns liberated from a bull.",
    "crown" :                "A well made crown, liberated from royalty.",
    "faction_helmet" :       "A special adornment often reserved for a knight or other high ranking member.",
    "faction_helmet_2" :     "A special issue adornment for a higher faction member.",
    "feather_band" :         "A band across the helmet with a feather in front.",
    "feathered_hat" :        "A fancy feathered hat usually worn by minstrels or nobles.",
    "fencer_hat" :           "A hat adorned by many fencers.",
    "goat_horns" :           "A pair of barbarian horn liberated from northern goats.",
    "headband" :             "A simple headband.",
    "horn_decorations" :     "A pair of grotesque horns used for decoration.",
    "hunter_cap" :           "A thick felt hat decorated with feathers as a hunter\'s trophy.",
    "impaled_head" :         "The impaled head of an orc now rests upon this spike, a fine revenge.",
    "jester_hat" :           "The colorful and iconic headpiece of jesters, entertainers and other traveling folk.",
    "metal_bird" :           "A trophy of a bird made to sit on top of a helmet",
    "noble_buckle" :         "A small ornamental buckle often worn by nobles.",
    "noble_feather" :        "A pretty feather often worn by nobles.",
    "noble_floppy_hat" :     "An older style amongst nobles, still sometimes worn at upper class events.",
    "noble_hat" :            "A trendy hat amongst nobles.",
    "noble_hood" :           "A fashionable hood often worn by nobles.",
    "wreath" :               "A flower crown inspired by empires long ago.",
    "orc_bones" :            "The broken bones of an orc, now fashioned as headwear.",
    "plait" :                "A simple braided rope to be stretched across a helmet.",
    "ponytail" :             "A basic ponytail that attaches to the top of a helmet.",
    "ram_horns" :            "A sturdy pair of horns taken from a ram.", 
    "side_feather" :         "A simple feather that attaches to the side of a helmet and can double as a writing quill.",
    "straw_hat" :            "A crude straw hat to protect against the sun.",
    "top_feather" :          "A feather that attatches to the crest of a helmet.",
    "witchhunter_helm" :     "The iconic addition for every witch hunter to distinguish themself with.",
    "wizard_cowl" :          "An iconic wizard\'s hat, not as hairy as one might have expected.",
    "wolf_helm" :            "An impressive wolf head to attach to yours.",

    "back_crest" :       "An ornamental crest that attaches to the back of a helmet.",
    "back_feathers" :    "Feathers that attach to the back of a helmet.",
    "feather_crest" :    "An ornamental crest made of feathers that attaches to the back of a helmet.", #can you feel the copy/paste lol
    "knotted_tail" :    "A knotted donkey\'s tail that attaches to the top of a helmet.",
    "orc_tail" :         "A collection of orc hairs, now serving as a proud trophy.",
    "wings" :            "Large ornamental wing\'s that stand well above other men."
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

        #print('"' + layer + "/" + fname + '",')

main()
