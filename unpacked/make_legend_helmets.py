
from string import Template
from shutil import copyfile
import os

Layer = '<sprite id="$name" offsetY="35" ic="FF242D3A" width="104" height="142" img="$name_path" left="-44" right="50" top="-53" bottom="13" />\n'
LayerDamaged = '<sprite id="$damaged" offsetY="35" ic="FF242C39" width="104" height="142" img="$damaged_path" left="-47" right="45" top="-64" bottom="14" />\n'
LayerDead = '<sprite id="$dead" offsetX="6" offsetY="10" f="64FE" ic="FF222933" width="131" height="125" img="$dead_path" left="-57" right="59" top="-53" bottom="55" />\n'

layers = [
    {"name": "barb_chain_scarf", "layer": "hood", "min": 1, "max": 5, "base": True},
    {"name": "chain_hood", "layer": "hood", "min": 1, "max": 4, "base": True},
    {"name": "chain_hood_full", "layer": "hood", "min": 1, "max": 6, "base": True},
    {"name": "chain_scarf", "layer": "hood", "min": 1, "max": 5, "base": True},
    {"name": "cloth_scarf", "layer": "hood", "min": 1, "max": 5, "base": True},
    {"name": "goblin_scarf", "layer": "hood", "min": 1, "max": 4, "base": True},
    {"name": "leather_hood", "layer": "hood", "min": 1, "max": 5, "base": True},
    {"name": "padded_hood", "layer": "hood", "min": 1, "max": 3, "base": True},
    {"name": "patched_hood", "layer": "hood", "min": 1, "max": 1, "base": True},
    {"name": "rotten_chain_scarf", "layer": "hood", "min": 1, "max": 5, "base": True},
    {"name": "simple_hood", "layer": "hood", "min": 1, "max": 5, "base": True},

    {"name": "ancient_beard_mask", "layer": "helm", "min": 1, "max": 1},
    {"name": "ancient_conic_helm", "layer": "helm", "min": 1, "max": 1},
    {"name": "ancient_crested", "layer": "helm", "min": 1, "max": 1},
    {"name": "ancient_crown", "layer": "helm", "min": 1, "max": 1},
    {"name": "ancient_dome", "layer": "helm", "min": 1, "max": 1},
    {"name": "ancient_dome_tailed", "layer": "helm", "min": 1, "max": 1},
    {"name": "ancient_face_helm", "layer": "helm", "min": 1, "max": 1},
    {"name": "ancient_face_plate", "layer": "helm", "min": 1, "max": 1},
    {"name": "ancient_kettle", "layer": "helm", "min": 1, "max": 3},
    {"name": "ancient_legionaire", "layer": "helm", "min": 1, "max": 1},
    {"name": "ancient_lion_mask", "layer": "helm", "min": 1, "max": 1},
    {"name": "ancient_mask", "layer": "helm", "min": 1, "max": 1},
    {"name": "ancient_side_hawk", "layer": "helm", "min": 1, "max": 1},
    {"name": "ancient_tailed_conic_helm", "layer": "helm", "min": 1, "max": 1},
    {"name": "barbute", "layer": "helm", "min": 1, "max": 7},
    {"name": "basinet", "layer": "helm", "min": 1, "max": 7},
    {"name": "carthaginian", "layer": "helm", "min": 1, "max": 3},
    {"name": "cloth_bandana", "layer": "helm", "min": 1, "max": 5},
    {"name": "conic_helm", "layer": "helm", "min": 1, "max": 6},
    {"name": "crude_cylinder_helm", "layer": "helm", "min": 1, "max": 2},
    {"name": "crude_metal_helm", "layer": "helm", "min": 1, "max": 3},
    {"name": "crude_skull_helm", "layer": "helm", "min": 1, "max": 1},
    {"name": "flat_top_face_plate", "layer": "helm", "min": 1, "max": 6},
    {"name": "flat_top_helm", "layer": "helm", "min": 1, "max": 6},
    {"name": "goblin_chain_helm", "layer": "helm", "min": 1, "max": 1},
    {"name": "goblin_leaf_helm", "layer": "helm", "min": 1, "max": 1},
    {"name": "goblin_leather_helm", "layer": "helm", "min": 1, "max": 1},
    {"name": "goblin_leather_mask", "layer": "helm", "min": 1, "max": 1},
    {"name": "gobline_spiked_helm", "layer": "helm", "min": 1, "max": 1},
    {"name": "golden_helm", "layer": "helm", "min": 1, "max": 1},
    {"name": "great_helm", "layer": "helm", "min": 1, "max": 6},
    {"name": "heavy_plate_helm", "layer": "helm", "min": 1, "max": 2},
    {"name": "heavy_spiked_helm", "layer": "helm", "min": 1, "max": 1},
    {"name": "horsetail", "layer": "helm", "min": 1, "max": 6},
    {"name": "kettle_helm", "layer": "helm", "min": 1, "max": 6},
    {"name": "leather_cap", "layer": "helm", "min": 1, "max": 1},
    {"name": "legend_ancient_gladiator", "layer": "helm", "min": 1, "max": 1},
    {"name": "legend_ancient_legionaire_restored", "layer": "helm", "min": 1, "max": 1},
    {"name": "legend_frogmouth", "layer": "helm", "min": 1, "max": 3},
    {"name": "nordic_helm", "layer": "helm", "min": 1, "max": 6},
    {"name": "norman_helm", "layer": "helm", "min": 1, "max": 5},
    {"name": "orc_double_helm", "layer": "helm", "min": 1, "max": 1},
    {"name": "orc_great_helm", "layer": "helm", "min": 1, "max": 1},
    {"name": "orc_horn_mask", "layer": "helm", "min": 1, "max": 1},
    {"name": "orc_leather_mask", "layer": "helm", "min": 1, "max": 1},
    {"name": "orc_metal_mask", "layer": "helm", "min": 1, "max": 1},
    {"name": "orc_strapped_helm", "layer": "helm", "min": 1, "max": 1},
    {"name": "padded_cap", "layer": "helm", "min": 1, "max": 1},
    {"name": "rotten_flat_top_face_mask", "layer": "helm", "min": 1, "max": 5},
    {"name": "rotten_great_helm", "layer": "helm", "min": 1, "max": 4},
    {"name": "sallet", "layer": "helm", "min": 1, "max": 6},
    {"name": "skin_helm", "layer": "helm", "min": 1, "max": 1},
    {"name": "stag_helm", "layer": "helm", "min": 1, "max": 1},
    {"name": "swan_helm", "layer": "helm", "min": 1, "max": 1},
    {"name": "tailed_conic", "layer": "helm", "min": 1, "max": 1},
    {"name": "vampire_crown", "layer": "helm", "min": 1, "max": 1},
    {"name": "viking_helm", "layer": "helm", "min": 1, "max": 6},

    {"name": "chain_attachment", "layer": "top", "min": 1, "max": 1},
    {"name": "cult_hood", "layer": "top", "min": 1, "max": 7},
    {"name": "eye_mask", "layer": "top", "min": 1, "max": 2},
    {"name": "facemask", "layer": "top", "min": 1, "max": 6},
    {"name": "faceplate_full", "layer": "top", "min": 1, "max": 1},
    {"name": "faceplate_gold", "layer": "top", "min": 1, "max": 1},
    {"name": "faceplate_long", "layer": "top", "min": 1, "max": 1},
    {"name": "faceplate_pointed", "layer": "top", "min": 1, "max": 1},
    {"name": "faceplate_raised", "layer": "top", "min": 1, "max": 2},
    {"name": "faceplate_short", "layer": "top", "min": 1, "max": 1},
    {"name": "faceplate_snub_nose", "layer": "top", "min": 1, "max": 1},
    {"name": "faceplate_winged", "layer": "top", "min": 1, "max": 1},
    {"name": "goblin_gillie", "layer": "top", "min": 1, "max": 1},
    {"name": "goblin_leaves", "layer": "top", "min": 1, "max": 1},
    {"name": "headband_nose", "layer": "top", "min": 1, "max": 1},
    {"name": "headband_side", "layer": "top", "min": 1, "max": 1},
    {"name": "hood_cloth_round", "layer": "top", "min": 1, "max": 1},
    {"name": "hood_cloth_square", "layer": "top", "min": 1, "max": 1},
    {"name": "hood_cloth_wide", "layer": "top", "min": 1, "max": 2},
    {"name": "leather_hood_barb", "layer": "top", "min": 1, "max": 1},
    {"name": "nose_plate", "layer": "top", "min": 1, "max": 1},

    {"name": "antler", "layer": "vanity", "min": 1, "max": 1},
    {"name": "bear_head", "layer": "vanity", "min": 1, "max": 1},
    {"name": "beret", "layer": "vanity", "min": 1, "max": 1},
    {"name": "bull_horns", "layer": "vanity", "min": 1, "max": 1},
    {"name": "cloth_long_hood", "layer": "vanity", "min": 1, "max": 4},
    {"name": "crown", "layer": "vanity", "min": 1, "max": 1},
    {"name": "faction_helmet", "layer": "vanity", "min": 1, "max": 13},
    {"name": "faction_helmet_2", "layer": "vanity", "min": 1, "max": 10},
    {"name": "feather_band", "layer": "vanity", "min": 1, "max": 2},
    {"name": "feathered_hat", "layer": "vanity", "min": 1, "max": 2},
    {"name": "goat_horns", "layer": "vanity", "min": 1, "max": 1},
    {"name": "headband", "layer": "vanity", "min": 1, "max": 16},
    {"name": "horn_decorations", "layer": "vanity", "min": 1, "max": 2},
    {"name": "hunter_cap", "layer": "vanity", "min": 1, "max": 1},
    {"name": "impaled_head", "layer": "vanity", "min": 1, "max": 1},
    {"name": "jester_hat", "layer": "vanity", "min": 1, "max": 65},
    {"name": "metal_bird", "layer": "vanity", "min": 1, "max": 2},
    {"name": "noble_buckle", "layer": "vanity", "min": 1, "max": 1},
    {"name": "noble_feather", "layer": "vanity", "min": 1, "max": 4},
    {"name": "noble_floppy_hat", "layer": "vanity", "min": 1, "max": 1},
    {"name": "noble_hat", "layer": "vanity", "min": 1, "max": 1},
    {"name": "noble_hood", "layer": "vanity", "min": 1, "max": 1},
    {"name": "olivebranch", "layer": "vanity", "min": 1, "max": 2},
    {"name": "orc_bones", "layer": "vanity", "min": 1, "max": 1},
    {"name": "plait", "layer": "vanity", "min": 1, "max": 12},
    {"name": "poneytail", "layer": "vanity", "min": 1, "max": 4},
    {"name": "ram_horns", "layer": "vanity", "min": 1, "max": 1},
    {"name": "sack", "layer": "vanity", "min": 1, "max": 12},
    {"name": "side_feather", "layer": "vanity", "min": 1, "max": 5},
    {"name": "straw_hat", "layer": "vanity", "min": 1, "max": 1},
    {"name": "top_feather", "layer": "vanity", "min": 1, "max": 5},
    {"name": "witchhunter_helm", "layer": "vanity", "min": 1, "max": 7},
    {"name": "wizard_cowl", "layer": "vanity", "min": 1, "max": 20},
    {"name": "wolf_helm", "layer": "vanity", "min": 1, "max": 1},

    {"name": "back_crest", "layer": "vanity", "lowervanity": True, "min": 1, "max": 4},
    {"name": "back_feathers", "layer": "vanity", "lowervanity": True, "min": 1, "max": 4},
    {"name": "feather_crest", "layer": "vanity", "lowervanity": True, "min": 1, "max": 5},
    {"name": "knotted_tail", "layer": "vanity", "lowervanity": True, "min": 1, "max": 4},
    {"name": "orc_tail", "layer": "vanity", "lowervanity": True, "min": 1, "max": 2},
    {"name": "wings", "layer": "vanity", "lowervanity": True, "min": 1, "max": 6}

]

helmets = r"""
<sprite id="legend_frogmouth_01" offsetY="35" ic="FF383D5F" width="184" height="222" img="entity\legend_helmets\legend_frogmouth_01.png" left="-41" right="43" top="-28" bottom="106" />
<sprite id="legend_frogmouth_01_damaged" offsetY="35" ic="FF353857" width="184" height="222" img="entity\legend_helmets\legend_frogmouth_01_damaged.png" left="-41" right="43" top="-29" bottom="105" />
<sprite id="legend_frogmouth_01_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF353957" width="191" height="185" img="entity\legend_helmets\legend_frogmouth_01_dead.png" left="-88" right="22" top="-92" bottom="10" />
<sprite id="runed_legend_frogmouth_01" offsetY="35" ic="FF383D5F" width="184" height="222" img="entity\legend_helmets\runed_legend_frogmouth_01.png" left="-41" right="43" top="-28" bottom="106" />
<sprite id="runed_legend_frogmouth_01_damaged" offsetY="35" ic="FF353857" width="184" height="222" img="entity\legend_helmets\runed_legend_frogmouth_01_damaged.png" left="-41" right="43" top="-29" bottom="105" />
<sprite id="runed_legend_frogmouth_01_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF353957" width="191" height="185" img="entity\legend_helmets\runed_legend_frogmouth_01_dead.png" left="-88" right="22" top="-92" bottom="10" />
<sprite id="legend_frogmouth_02" offsetY="35" ic="FF383D5F" width="184" height="222" img="entity\legend_helmets\legend_frogmouth_02.png" left="-41" right="43" top="-28" bottom="106" />
<sprite id="legend_frogmouth_02_damaged" offsetY="35" ic="FF353857" width="184" height="222" img="entity\legend_helmets\legend_frogmouth_02_damaged.png" left="-41" right="43" top="-29" bottom="105" />
<sprite id="legend_frogmouth_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF353957" width="191" height="185" img="entity\legend_helmets\legend_frogmouth_02_dead.png" left="-88" right="22" top="-92" bottom="10" />
<sprite id="runed_legend_frogmouth_02" offsetY="35" ic="FF383D5F" width="184" height="222" img="entity\legend_helmets\runed_legend_frogmouth_02.png" left="-41" right="43" top="-28" bottom="106" />
<sprite id="runed_legend_frogmouth_02_damaged" offsetY="35" ic="FF353857" width="184" height="222" img="entity\legend_helmets\runed_legend_frogmouth_02_damaged.png" left="-41" right="43" top="-29" bottom="105" />
<sprite id="runed_legend_frogmouth_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF353957" width="191" height="185" img="entity\legend_helmets\runed_legend_frogmouth_02_dead.png" left="-88" right="22" top="-92" bottom="10" />
<sprite id="legend_frogmouth_03" offsetY="35" ic="FF383D5F" width="184" height="222" img="entity\legend_helmets\legend_frogmouth_03.png" left="-41" right="43" top="-28" bottom="106" />
<sprite id="legend_frogmouth_03_damaged" offsetY="35" ic="FF353857" width="184" height="222" img="entity\legend_helmets\legend_frogmouth_03_damaged.png" left="-41" right="43" top="-29" bottom="105" />
<sprite id="legend_frogmouth_03_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF353957" width="191" height="185" img="entity\legend_helmets\legend_frogmouth_03_dead.png" left="-88" right="22" top="-92" bottom="10" />
<sprite id="runed_legend_frogmouth_03" offsetY="35" ic="FF383D5F" width="184" height="222" img="entity\legend_helmets\runed_legend_frogmouth_03.png" left="-41" right="43" top="-28" bottom="106" />
<sprite id="runed_legend_frogmouth_03_damaged" offsetY="35" ic="FF353857" width="184" height="222" img="entity\legend_helmets\runed_legend_frogmouth_03_damaged.png" left="-41" right="43" top="-29" bottom="105" />
<sprite id="runed_legend_frogmouth_03_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF353957" width="191" height="185" img="entity\legend_helmets\runed_legend_frogmouth_03_dead.png" left="-88" right="22" top="-92" bottom="10" />
<sprite id="legend_frogmouth_04" offsetY="35" ic="FF383D5F" width="184" height="222" img="entity\legend_helmets\legend_frogmouth_04.png" left="-41" right="43" top="-28" bottom="106" />
<sprite id="legend_frogmouth_04_damaged" offsetY="35" ic="FF353857" width="184" height="222" img="entity\legend_helmets\legend_frogmouth_04_damaged.png" left="-41" right="43" top="-29" bottom="105" />
<sprite id="legend_frogmouth_04_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF353957" width="191" height="185" img="entity\legend_helmets\legend_frogmouth_04_dead.png" left="-88" right="22" top="-92" bottom="10" />
<sprite id="runed_legend_frogmouth_04" offsetY="35" ic="FF383D5F" width="184" height="222" img="entity\legend_helmets\runed_legend_frogmouth_04.png" left="-41" right="43" top="-28" bottom="106" />
<sprite id="runed_legend_frogmouth_04_damaged" offsetY="35" ic="FF353857" width="184" height="222" img="entity\legend_helmets\runed_legend_frogmouth_04_damaged.png" left="-41" right="43" top="-29" bottom="105" />
<sprite id="runed_legend_frogmouth_04_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF353957" width="191" height="185" img="entity\legend_helmets\runed_legend_frogmouth_04_dead.png" left="-88" right="22" top="-92" bottom="10" />
<sprite id="legend_ancient_gladiator" offsetY="35" ic="FF383D5F" width="184" height="222" img="entity\legend_helmets\legend_ancient_gladiator.png" left="-41" right="43" top="-28" bottom="106" />
<sprite id="legend_ancient_gladiator_damaged" offsetY="35" ic="FF353857" width="184" height="222" img="entity\legend_helmets\legend_ancient_gladiator_damaged.png" left="-41" right="43" top="-29" bottom="105" />
<sprite id="legend_ancient_gladiator_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF353957" width="191" height="185" img="entity\legend_helmets\legend_ancient_gladiator_dead.png" left="-88" right="22" top="-92" bottom="10" />
<sprite id="runed_legend_ancient_gladiator" offsetY="35" ic="FF383D5F" width="184" height="222" img="entity\legend_helmets\runed_legend_ancient_gladiator.png" left="-41" right="43" top="-28" bottom="106" />
<sprite id="runed_legend_ancient_gladiator_damaged" offsetY="35" ic="FF353857" width="184" height="222" img="entity\legend_helmets\runed_legend_ancient_gladiator_damaged.png" left="-41" right="43" top="-29" bottom="105" />
<sprite id="runed_legend_ancient_gladiator_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF353957" width="191" height="185" img="entity\legend_helmets\runed_legend_ancient_gladiator_dead.png" left="-88" right="22" top="-92" bottom="10" />
<sprite id="legend_ancient_legionaire_restored" offsetY="35" ic="FF383D5F" width="184" height="222" img="entity\legend_helmets\legend_ancient_legionaire_restored.png" left="-41" right="43" top="-28" bottom="106" />
<sprite id="legend_ancient_legionaire_restored_damaged" offsetY="35" ic="FF353857" width="184" height="222" img="entity\legend_helmets\legend_ancient_legionaire_restored_damaged.png" left="-41" right="43" top="-29" bottom="105" />
<sprite id="legend_ancient_legionaire_restored_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF353957" width="191" height="185" img="entity\legend_helmets\legend_ancient_legionaire_restored_dead.png" left="-88" right="22" top="-92" bottom="10" />
<sprite id="runed_legend_ancient_legionaire_restored" offsetY="35" ic="FF383D5F" width="184" height="222" img="entity\legend_helmets\runed_legend_ancient_legionaire_restored.png" left="-41" right="43" top="-28" bottom="106" />
<sprite id="runed_legend_ancient_legionaire_restored_damaged" offsetY="35" ic="FF353857" width="184" height="222" img="entity\legend_helmets\runed_legend_ancient_legionaire_restored_damaged.png" left="-41" right="43" top="-29" bottom="105" />
<sprite id="runed_legend_ancient_legionaire_restored_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF353957" width="191" height="185" img="entity\legend_helmets\runed_legend_ancient_legionaire_restored_dead.png" left="-88" right="22" top="-92" bottom="10" />
<sprite id="wizard_cowl_02" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_02.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_02_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_02_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_02_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_02" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_02.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_02_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_02_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_02_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_03" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_03.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_03_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_03_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_03_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_03_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_03" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_03.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_03_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_03_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_03_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_03_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_04" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_04.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_04_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_04_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_04_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_04_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_04" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_04.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_04_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_04_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_04_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_04_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_05" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_05.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_05_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_05_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_05_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_05_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_05" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_05.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_05_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_05_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_05_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_05_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_06" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_06.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_06_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_06_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_06_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_06_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_06" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_06.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_06_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_06_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_06_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_06_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_07" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_07.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_07_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_07_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_07_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_07_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_07" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_07.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_07_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_07_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_07_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_07_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_08" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_08.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_08_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_08_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_08_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_08_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_08" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_08.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_08_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_08_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_08_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_08_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_09" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_09.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_09_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_09_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_09_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_09_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_09" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_09.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_09_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_09_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_09_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_09_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_10" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_10.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_10_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_10_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_10_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_10_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_10" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_10.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_10_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_10_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_10_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_10_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_11" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_11.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_11_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_11_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_11_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_11_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_11" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_11.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_11_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_11_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_11_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_11_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_12" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_12.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_12_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_12_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_12_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_12_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_12" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_12.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_12_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_12_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_12_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_12_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_13" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_13.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_13_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_13_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_13_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_13_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_13" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_13.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_13_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_13_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_13_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_13_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_14" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_14.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_14_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_14_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_14_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_14_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_14" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_14.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_14_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_14_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_14_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_14_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_15" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_15.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_15_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_15_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_15_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_15_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_15" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_15.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_15_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_15_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_15_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_15_dead.png" left="-57" right="25" top="-63" bottom="3" />
 <sprite id="wizard_cowl_16" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_16.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_16_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_16_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_16_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_16_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_16" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_16.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_16_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_16_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_16_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_16_dead.png" left="-57" right="25" top="-63" bottom="3" />
 <sprite id="wizard_cowl_17" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_17.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_17_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_17_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_17_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_17_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_17" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_17.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_17_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_17_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_17_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_17_dead.png" left="-57" right="25" top="-63" bottom="3" />
 <sprite id="wizard_cowl_18" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_18.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_18_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_18_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_18_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_18_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_18" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_18.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_18_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_18_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_18_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_18_dead.png" left="-57" right="25" top="-63" bottom="3" />
 <sprite id="wizard_cowl_19" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_19.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_19_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_19_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_19_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_19_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_19" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_19.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_19_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_19_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_19_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_19_dead.png" left="-57" right="25" top="-63" bottom="3" />
 <sprite id="wizard_cowl_20" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_20.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_20_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_20_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_20_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\wizard_cowl_20_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_20" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_20.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_20_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\legend_helmets\runed_wizard_cowl_20_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_20_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\legend_helmets\runed_wizard_cowl_20_dead.png" left="-57" right="25" top="-63" bottom="3" />
 <sprite id="jester_hat_01" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_01.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_01_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_01_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_01_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_01_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_01" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_01.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_01_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_01_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_01_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_01_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_02" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_02.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_02_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_02_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_02_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_02" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_02.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_02_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_02_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_02_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_03" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_03.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_03_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_03_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_03_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_03_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_03" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_03.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_03_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_03_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_03_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_03_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_04" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_04.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_04_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_04_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_04_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_04_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_04" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_04.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_04_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_04_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_04_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_04_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_05" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_05.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_05_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_05_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_05_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_05_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_05" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_05.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_05_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_05_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_05_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_05_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_06" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_06.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_06_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_06_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_06_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_06_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_06" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_06.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_06_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_06_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_06_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_06_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_07" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_07.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_07_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_07_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_07_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_07_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_07" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_07.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_07_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_07_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_07_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_07_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_08" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_08.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_08_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_08_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_08_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_08_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_08" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_08.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_08_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_08_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_08_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_08_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_09" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_09.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_09_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_09_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_09_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_09_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_09" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_09.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_09_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_09_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_09_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_09_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_10" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_10.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_10_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_10_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_10_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_10_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_10" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_10.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_10_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_10_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_10_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_10_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_11" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_11.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_11_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_11_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_11_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_11_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_11" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_11.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_11_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_11_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_11_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_11_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_12" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_12.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_12_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_12_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_12_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_12_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_12" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_12.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_12_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_12_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_12_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_12_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_13" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_13.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_13_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_13_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_13_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_13_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_13" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_13.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_13_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_13_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_13_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_13_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_14" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_14.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_14_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_14_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_14_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_14_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_14" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_14.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_14_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_14_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_14_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_14_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_15" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_15.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_15_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_15_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_15_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_15_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_15" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_15.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_15_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_15_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_15_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_15_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_16" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_16.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_16_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_16_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_16_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_16_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_16" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_16.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_16_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_16_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_16_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_16_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_17" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_17.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_17_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_17_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_17_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_17_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_17" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_17.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_17_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_17_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_17_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_17_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_18" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_18.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_18_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_18_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_18_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_18_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_18" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_18.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_18_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_18_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_18_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_18_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_19" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_19.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_19_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_19_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_19_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_19_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_19" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_19.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_19_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_19_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_19_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_19_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_20" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_20.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_20_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_20_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_20_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_20_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_20" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_20.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_20_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_20_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_20_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_20_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_21" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_21.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_21_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_21_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_21_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_21_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_21" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_21.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_21_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_21_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_21_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_21_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_22" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_22.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_22_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_22_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_22_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_22_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_22" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_22.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_22_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_22_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_22_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_22_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_23" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_23.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_23_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_23_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_23_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_23_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_23" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_23.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_23_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_23_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_23_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_23_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_24" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_24.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_24_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_24_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_24_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_24_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_24" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_24.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_24_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_24_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_24_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_24_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_25" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_25.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_25_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_25_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_25_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_25_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_25" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_25.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_25_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_25_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_25_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_25_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_26" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_26.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_26_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_26_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_26_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_26_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_26" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_26.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_26_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_26_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_26_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_26_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_27" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_27.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_27_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_27_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_27_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_27_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_27" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_27.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_27_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_27_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_27_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_27_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_28" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_28.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_28_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_28_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_28_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_28_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_28" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_28.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_28_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_28_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_28_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_28_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_29" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_29.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_29_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_29_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_29_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_29_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_29" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_29.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_29_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_29_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_29_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_29_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_30" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_30.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_30_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_30_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_30_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_30_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_30" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_30.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_30_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_30_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_30_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_30_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_31" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_31.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_31_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_31_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_31_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_31_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_31" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_31.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_31_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_31_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_31_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_31_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_32" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_32.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_32_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_32_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_32_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_32_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_32" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_32.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_32_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_32_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_32_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_32_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_33" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_33.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_33_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_33_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_33_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_33_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_33" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_33.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_33_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_33_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_33_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_33_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_34" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_34.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_34_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_34_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_34_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_34_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_34" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_34.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_34_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_34_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_34_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_34_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_35" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_35.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_35_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_35_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_35_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_35_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_35" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_35.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_35_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_35_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_35_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_35_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_36" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_36.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_36_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_36_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_36_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_36_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_36" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_36.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_36_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_36_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_36_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_36_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_37" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_37.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_37_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_37_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_37_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_37_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_37" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_37.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_37_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_37_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_37_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_37_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_38" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_38.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_38_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_38_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_38_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_38_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_38" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_38.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_38_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_38_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_38_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_38_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_39" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_39.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_39_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_39_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_39_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_39_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_39" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_39.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_39_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_39_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_39_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_39_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_40" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_40.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_40_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_40_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_40_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_40_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_40" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_40.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_40_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_40_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_40_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_40_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_41" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_41.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_41_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_41_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_41_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_41_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_41" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_41.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_41_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_41_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_41_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_41_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_42" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_42.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_42_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_42_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_42_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_42_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_42" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_42.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_42_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_42_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_42_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_42_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_43" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_43.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_43_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_43_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_43_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_43_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_43" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_43.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_43_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_43_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_43_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_43_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_44" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_44.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_44_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_44_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_44_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_44_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_44" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_44.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_44_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_44_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_44_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_44_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_45" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_45.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_45_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_45_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_45_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_45_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_45" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_45.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_45_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_45_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_45_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_45_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_46" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_46.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_46_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_46_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_46_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_46_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_46" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_46.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_46_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_46_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_46_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_46_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_47" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_47.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_47_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_47_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_47_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_47_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_47" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_47.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_47_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_47_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_47_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_47_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_48" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_48.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_48_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_48_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_48_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_48_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_48" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_48.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_48_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_48_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_48_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_48_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_49" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_49.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_49_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_49_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_49_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_49_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_49" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_49.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_49_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_49_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_49_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_49_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_50" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_50.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_50_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_50_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_50_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_50_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_50" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_50.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_50_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_50_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_50_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_50_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_51" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_51.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_51_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_51_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_51_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_51_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_51" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_51.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_51_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_51_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_51_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_51_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_52" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_52.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_52_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_52_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_52_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_52_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_52" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_52.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_52_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_52_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_52_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_52_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_53" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_53.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_53_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_53_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_53_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_53_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_53" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_53.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_53_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_53_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_53_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_53_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_54" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_54.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_54_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_54_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_54_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_54_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_54" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_54.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_54_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_54_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_54_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_54_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_55" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_55.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_55_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_55_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_55_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_55_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_55" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_55.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_55_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_55_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_55_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_55_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_56" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_56.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_56_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_56_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_56_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_56_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_56" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_56.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_56_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_56_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_56_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_56_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_57" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_57.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_57_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_57_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_57_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_57_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_57" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_57.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_57_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_57_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_57_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_57_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_58" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_58.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_58_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_58_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_58_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_58_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_58" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_58.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_58_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_58_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_58_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_58_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_59" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_59.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_59_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_59_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_59_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_59_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_59" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_59.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_59_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_59_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_59_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_59_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_60" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_60.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_60_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_60_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_60_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_60_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_60" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_60.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_60_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_60_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_60_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_60_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_61" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_61.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_61_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_61_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_61_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_61_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_61" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_61.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_61_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_61_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_61_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_61_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_62" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_62.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_62_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_62_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_62_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_62_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_62" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_62.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_62_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_62_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_62_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_62_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_63" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_63.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_63_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_63_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_63_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_63_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_63" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_63.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_63_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_63_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_63_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_63_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_64" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_64.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_64_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_64_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_64_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_64_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_64" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_64.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_64_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_64_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_64_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_64_dead.png" left="-70" right="20" top="-76" bottom="4" />
  <sprite id="witchhunter_helm_01" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\legend_helmets\witchhunter_helm_01.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_01_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\legend_helmets\witchhunter_helm_01_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_01_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\legend_helmets\witchhunter_helm_01_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="runed_witchhunter_helm_01" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\legend_helmets\runed_witchhunter_helm_01.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_01_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\legend_helmets\runed_witchhunter_helm_01_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_01_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\legend_helmets\runed_witchhunter_helm_01_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="witchhunter_helm_02" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\legend_helmets\witchhunter_helm_02.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_02_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\legend_helmets\witchhunter_helm_02_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\legend_helmets\witchhunter_helm_02_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="runed_witchhunter_helm_02" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\legend_helmets\runed_witchhunter_helm_02.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_02_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\legend_helmets\runed_witchhunter_helm_02_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\legend_helmets\runed_witchhunter_helm_02_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="witchhunter_helm_03" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\legend_helmets\witchhunter_helm_03.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_03_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\legend_helmets\witchhunter_helm_03_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_03_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\legend_helmets\witchhunter_helm_03_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="runed_witchhunter_helm_03" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\legend_helmets\runed_witchhunter_helm_03.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_03_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\legend_helmets\runed_witchhunter_helm_03_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_03_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\legend_helmets\runed_witchhunter_helm_03_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="witchhunter_helm_04" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\legend_helmets\witchhunter_helm_04.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_04_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\legend_helmets\witchhunter_helm_04_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_04_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\legend_helmets\witchhunter_helm_04_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="runed_witchhunter_helm_04" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\legend_helmets\runed_witchhunter_helm_04.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_04_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\legend_helmets\runed_witchhunter_helm_04_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_04_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\legend_helmets\runed_witchhunter_helm_04_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="witchhunter_helm_05" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\legend_helmets\witchhunter_helm_05.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_05_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\legend_helmets\witchhunter_helm_05_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_05_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\legend_helmets\witchhunter_helm_05_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="runed_witchhunter_helm_05" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\legend_helmets\runed_witchhunter_helm_05.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_05_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\legend_helmets\runed_witchhunter_helm_05_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_05_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\legend_helmets\runed_witchhunter_helm_05_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="witchhunter_helm_06" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\legend_helmets\witchhunter_helm_06.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_06_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\legend_helmets\witchhunter_helm_06_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_06_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\legend_helmets\witchhunter_helm_06_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="runed_witchhunter_helm_06" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\legend_helmets\runed_witchhunter_helm_06.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_06_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\legend_helmets\runed_witchhunter_helm_06_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_06_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\legend_helmets\runed_witchhunter_helm_06_dead.png" left="-49" right="25" top="-63" bottom="5" />

  <sprite id="jester_helm_01" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\jester_helm_01.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="jester_helm_01_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\jester_helm_01_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="jester_helm_01_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\jester_helm_01_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="runed_jester_helm_01" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\runed_jester_helm_01.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="runed_jester_helm_01_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\runed_jester_helm_01_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="runed_jester_helm_01_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\runed_jester_helm_01_dead.png" left="-80" right="22" top="-76" bottom="8" />

  <sprite id="jester_helm_02" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\jester_helm_02.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="jester_helm_02_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\jester_helm_02_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="jester_helm_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\jester_helm_02_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="runed_jester_helm_02" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\runed_jester_helm_02.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="runed_jester_helm_02_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\runed_jester_helm_02_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="runed_jester_helm_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\runed_jester_helm_02_dead.png" left="-80" right="22" top="-76" bottom="8" />

  <sprite id="jester_helm_03" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\jester_helm_03.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="jester_helm_03_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\jester_helm_03_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="jester_helm_03_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\jester_helm_03_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="runed_jester_helm_03" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\runed_jester_helm_03.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="runed_jester_helm_03_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\runed_jester_helm_03_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="runed_jester_helm_03_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\runed_jester_helm_03_dead.png" left="-80" right="22" top="-76" bottom="8" />

  <sprite id="jester_helm_04" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\jester_helm_04.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="jester_helm_04_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\jester_helm_04_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="jester_helm_04_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\jester_helm_04_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="runed_jester_helm_04" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\runed_jester_helm_04.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="runed_jester_helm_04_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\runed_jester_helm_04_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="runed_jester_helm_04_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\runed_jester_helm_04_dead.png" left="-80" right="22" top="-76" bottom="8" />

  <sprite id="jester_helm_05" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\jester_helm_05.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="jester_helm_05_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\jester_helm_05_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="jester_helm_05_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\jester_helm_05_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="runed_jester_helm_05" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\runed_jester_helm_05.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="runed_jester_helm_05_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\runed_jester_helm_05_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="runed_jester_helm_05_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\runed_jester_helm_05_dead.png" left="-80" right="22" top="-76" bottom="8" />

  <sprite id="jester_helm_06" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\jester_helm_06.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="jester_helm_06_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\jester_helm_06_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="jester_helm_06_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\jester_helm_06_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="runed_jester_helm_06" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\runed_jester_helm_06.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="runed_jester_helm_06_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\runed_jester_helm_06_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="runed_jester_helm_06_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\runed_jester_helm_06_dead.png" left="-80" right="22" top="-76" bottom="8" />

  <sprite id="jester_padded_01" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\jester_padded_01.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="jester_padded_01_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\jester_padded_01_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="jester_padded_01_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\jester_padded_01_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="runed_jester_padded_01" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_01.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="runed_jester_padded_01_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_01_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="runed_jester_padded_01_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\runed_jester_padded_01_dead.png" left="-80" right="22" top="-76" bottom="8" />

  <sprite id="jester_padded_02" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\jester_padded_02.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="jester_padded_02_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\jester_padded_02_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="jester_padded_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\jester_padded_02_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="runed_jester_padded_02" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_02.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="runed_jester_padded_02_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_02_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="runed_jester_padded_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\runed_jester_padded_02_dead.png" left="-80" right="22" top="-76" bottom="8" />

  <sprite id="jester_padded_03" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\jester_padded_03.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="jester_padded_03_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\jester_padded_03_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="jester_padded_03_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\jester_padded_03_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="runed_jester_padded_03" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_03.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="runed_jester_padded_03_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_03_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="runed_jester_padded_03_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\runed_jester_padded_03_dead.png" left="-80" right="22" top="-76" bottom="8" />

  <sprite id="jester_padded_04" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\jester_padded_04.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="jester_padded_04_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\jester_padded_04_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="jester_padded_04_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\jester_padded_04_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="runed_jester_padded_04" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_04.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="runed_jester_padded_04_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_04_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="runed_jester_padded_04_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\runed_jester_padded_04_dead.png" left="-80" right="22" top="-76" bottom="8" />

  <sprite id="jester_padded_05" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\jester_padded_05.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="jester_padded_05_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\jester_padded_05_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="jester_padded_05_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\jester_padded_05_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="runed_jester_padded_05" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_05.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="runed_jester_padded_05_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_05_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="runed_jester_padded_05_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\runed_jester_padded_05_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="jester_padded_06" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\jester_padded_06.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="jester_padded_06_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\jester_padded_06_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="jester_padded_06_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\jester_padded_06_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="runed_jester_padded_06" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_06.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="runed_jester_padded_06_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_06_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="runed_jester_padded_06_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\runed_jester_padded_06_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="jester_padded_07" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\jester_padded_07.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="jester_padded_07_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\jester_padded_07_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="jester_padded_07_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\jester_padded_07_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="runed_jester_padded_07" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_07.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="runed_jester_padded_07_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_07_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="runed_jester_padded_07_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\runed_jester_padded_07_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="jester_padded_08" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\jester_padded_08.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="jester_padded_08_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\jester_padded_08_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="jester_padded_08_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\jester_padded_08_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="runed_jester_padded_08" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_08.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="runed_jester_padded_08_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_08_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="runed_jester_padded_08_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\runed_jester_padded_08_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="jester_padded_09" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\jester_padded_09.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="jester_padded_09_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\jester_padded_09_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="jester_padded_09_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\jester_padded_09_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="runed_jester_padded_09" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_09.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="runed_jester_padded_09_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_09_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="runed_jester_padded_09_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\runed_jester_padded_09_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="jester_padded_10" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\jester_padded_10.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="jester_padded_10_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\jester_padded_10_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="jester_padded_10_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\jester_padded_10_dead.png" left="-80" right="22" top="-76" bottom="8" />
  <sprite id="runed_jester_padded_10" offsetY="35" ic="FF2E5B82" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_10.png" left="-34" right="42" top="-28" bottom="100" />
  <sprite id="runed_jester_padded_10_damaged" offsetY="35" ic="FF2E5374" width="184" height="222" img="entity\legend_helmets\runed_jester_padded_10_damaged.png" left="-34" right="42" top="-29" bottom="87" />
  <sprite id="runed_jester_padded_10_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF305374" width="191" height="185" img="entity\legend_helmets\runed_jester_padded_10_dead.png" left="-80" right="22" top="-76" bottom="8" />
"""

def main():
    mfile = os.path.join(os.path.dirname(os.path.abspath(__file__)), "legend_helmets/metadata.xml")
    F = open(mfile, "w")
    F.write('<brush name="gfx/legend_helmets.png" version="17">\n')
    L = [Layer, LayerDamaged, LayerDead]
    for d in layers:
        R = L
        names = [d["name"]]
        if "min" in d:
            names = []
            for i in range(d["min"], d["max"] + 1):
                ind = "0" + str(i) if i < 10 else str(i)
                names.append(d["name"] + "_" + ind)

        layer = d["layer"]

        if "lowervanity" in d:
            layer += "_lower"

        for t in R:
            for name in names:
                opts = dict(
                    name="legendhelms_" + name,
                    damaged= "legendhelms_" + name + "_damaged",
                    dead= "legendhelms_" + name + "_dead",
                    name_path=os.path.join("entity", "legend_helmets", layer, name + ".png"),
                    damaged_path=os.path.join("entity", "legend_helmets", layer, name + "_damaged.png"),
                    dead_path=os.path.join("entity", "legend_helmets", layer, name + "_dead.png")
                )
                s = Template(t)
                text = s.substitute(opts)
                text.replace("/", "\\")
                F.write(text)

    F.write(helmets)

    F.write('</brush>\n')
    F.close()


main()
