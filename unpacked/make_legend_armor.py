
from string import Template
from shutil import copyfile
import os

Layer = '<sprite id="$name" offsetY="35" ic="FF242D3A" width="104" height="142" img="$name_path" left="-44" right="50" top="-53" bottom="13" />\n'
LayerDamaged = '<sprite id="$damaged" offsetY="35" ic="FF242C39" width="104" height="142" img="$damaged_path" left="-47" right="45" top="-64" bottom="14" />\n'
LayerDead = '<sprite id="$dead" offsetX="6" offsetY="10" f="64FE" ic="FF222933" width="131" height="125" img="$dead_path" left="-57" right="59" top="-53" bottom="55" />\n'
LayerArrow = '<sprite id="$arrow" offsetX="6" offsetY="10" f="64FB" ic="FF495055" width="131" height="114" img="$arrow_path" left="0" right="28" top="-8" bottom="30" />\n'
LayerJavelin = '<sprite id="$javelin" offsetX="6" offsetY="10" f="64FB" ic="FF151C29" width="131" height="134" img="$javelin_path" left="-11" right="35" top="-5" bottom="67" />\n'

layers = [
    {"name": "bust_legend_apron", "layer": "cloth", "min": 1, "max": 10, "base": True},
    {"name": "bust_legend_gambeson",  "layer": "cloth", "min": 0, "max": 70, "base": True},
    {"name": "bust_legend_gambeson_named",  "layer": "cloth", "min": 1, "max": 1, "base": True},
    {"name": "bust_legend_gambeson_wolf",  "layer": "cloth", "base": True},
    {"name": "bust_legend_robes",  "layer": "cloth", "min": 1, "max": 3, "base": True},
    {"name": "bust_legend_robes",  "layer": "cloth", "min": 6, "max": 7, "base": True},
    {"name": "bust_legend_robes",  "layer": "cloth", "min": 11, "max": 18, "base": True},
    {"name": "bust_legend_sackcloth",  "layer": "cloth", "min": 1, "max": 25, "base": True},
    {"name": "bust_thick_tunic",  "layer": "cloth", "min": 1, "max": 24, "base": True},
    {"name": "bust_legend_tunic",  "layer": "cloth", "min": 1, "max": 34, "base": True},
    {"name": "bust_legend_dark_tunic",  "layer": "cloth", "min": 1, "max": 2, "base": True},
    {"name": "bust_legend_gambeson_wolf", "layer": "cloth", "base": True},
    {"name": "bust_ancient_cloth",  "layer": "cloth", "min": 1, "max": 4, "base": True},
    {"name": "bust_ancient_cloth_restored",  "layer": "cloth", "min": 1, "max": 5, "base": True},
	{"name": "bust_peasant_dress",  "layer": "cloth", "min": 1, "max": 11, "base": True},
	{"name": "bust_wizard_robe",  "layer": "cloth", "min": 1, "max": 11, "base": True},
	
    {"name": "bust_legend_ancient_double_mail", "layer": "chain"},
    {"name": "bust_legend_ancient_mail", "layer": "chain"},
    {"name": "bust_legend_basic_mail", "layer": "chain"},
    {"name": "bust_legend_hauberk_full", "layer": "chain"},
    {"name": "bust_legend_hauberk_full_named", "layer": "chain", "min": 1, "max" : 1},
    {"name": "bust_legend_hauberk_sleevless", "layer": "chain"},
    {"name": "bust_legend_hauberk", "layer": "chain"},
    {"name": "bust_legend_mail_shirt_2", "layer": "chain"},
    {"name": "bust_legend_mail_shirt", "layer": "chain"},
    {"name": "bust_legend_reinforced_mail_shirt", "layer": "chain"},
    {"name": "bust_legend_reinforced_mail", "layer": "chain"},
    {"name": "bust_legend_reinforced_rotten_mail_shirt", "layer": "chain"},
    {"name": "bust_legend_reinforced_worn_mail_shirt", "layer": "chain"},
    {"name": "bust_legend_reinforced_worn_mail", "layer": "chain"},
    {"name": "bust_legend_rusty_mail_shirt", "layer": "chain",  "min": 1, "max": 11 },
    {"name": "bust_legend_short_mail", "layer": "chain"},

    {"name": "bust_legend_leather_brigandine_hardened_full", "layer": "plate"},
    {"name": "bust_legend_leather_brigandine_hardened", "layer": "plate"},
    {"name": "bust_legend_leather_brigandine", "layer": "plate"},
    {"name": "bust_legend_leather_brigandine_named", "layer": "plate", "min": 1, "max": 5},
    {"name": "bust_legend_leather_jacket", "layer": "plate", "min": 1, "max": 9},
    {"name": "bust_legend_leather_jacket_simple", "layer": "plate", "min": 1, "max": 6},
    {"name": "bust_legend_leather_jacket_named", "layer": "plate", "min": 1, "max": 2},
	{"name": "bust_legend_leather_jacket_named_02", "layer": "plate", "min": 1, "max": 16},
    {"name": "bust_legend_leather_lamellar_harness_heavy", "layer": "plate"},
    {"name": "bust_legend_leather_lamellar_harness_reinforced", "layer": "plate"},
    {"name": "bust_legend_leather_lamellar_heavy", "layer": "plate"},
    {"name": "bust_legend_leather_lamellar_heavy_named", "layer": "plate", "min": 1, "max": 1},
    {"name": "bust_legend_leather_lamellar_reinforced", "layer": "plate"},
    {"name": "bust_legend_leather_lamellar", "layer": "plate"},
    {"name": "bust_legend_leather_noble", "layer": "plate", "min": 1, "max": 6},
    {"name": "bust_legend_leather_padded", "layer": "plate"},
    {"name": "bust_legend_leather_riveted", "layer": "plate", "min": 1, "max": 9},
    {"name": "bust_legend_leather_riveted_light", "layer": "plate"},
    {"name": "bust_legend_leather_scale", "layer": "plate"},
    {"name": "bust_legend_plate_ancient_chest", "layer": "plate"},
    {"name": "bust_legend_plate_ancient_chest_restored", "layer": "plate"},
    {"name": "bust_legend_plate_ancient_gladiator", "layer": "plate"},
    {"name": "bust_legend_plate_ancient_harness", "layer": "plate"},
    {"name": "bust_legend_plate_ancient_mail", "layer": "plate"},
    {"name": "bust_legend_plate_ancient_scale_coat", "layer": "plate"},
    {"name": "bust_legend_plate_ancient_scale_harness", "layer": "plate"},
    {"name": "bust_legend_plate_ancient_scale", "layer": "plate"},
    {"name": "bust_legend_plate_chest_rotten", "layer": "plate"},
    {"name": "bust_legend_plate_chest", "layer": "plate"},
    {"name": "bust_legend_plate_cuirass", "layer": "plate"},
    {"name": "bust_legend_plate_full", "layer": "plate"},
    {"name": "bust_legend_plate_full_greaves", "layer": "plate"},
    {"name": "bust_legend_plate_full_greaves_painted", "layer": "plate"},
    {"name": "bust_legend_scale_coat_rotten", "layer": "plate"},
    {"name": "bust_legend_scale_coat", "layer": "plate"},
    {"name": "bust_legend_scale_coat_named", "layer": "plate", "min": 1, "max": 1},
    {"name": "bust_legend_scale_shirt", "layer": "plate"},
    {"name": "bust_legend_scale", "layer": "plate"},

    {"name": "legend_tabard",  "layer": "tabard", "min": 1, "max": 20},
    {"name": "legend_tabard",  "layer": "tabard", "min": 101, "max": 113},
    {"name": "legend_tabard_named", "layer": "tabard", "min": 1, "max": 12},

    {"name": "cloak",  "layer": "cloak", "min": 1, "max": 36},
    {"name": "cloak_rich",  "layer": "cloak", "min": 1, "max": 5},
    {"name": "cloak_spider", "layer": "cloak"},
    {"name": "sash",  "layer": "cloak", "min": 1, "max": 1},

    {"name": "bust_legend_runed", "layer": "rune"}
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
<sprite id="wizard_cowl_02" offsetY="35" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\legend_helmets\wizard_cowl_02.png" left="-41" right="43" top="-28" bottom="106" />
<sprite id="wizard_cowl_02_damaged" offsetY="35" ic="FF353857" width="184" height="222" img="entity\legend_helmets\wizard_cowl_02_damaged.png" left="-41" right="43" top="-29" bottom="105" />
<sprite id="wizard_cowl_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF353957" width="191" height="185" img="entity\legend_helmets\wizard_cowl_02_dead.png" left="-88" right="22" top="-92" bottom="10" />
<sprite id="runed_wizard_cowl_02" offsetY="35" ic="FF383D5F" width="184" height="222" img="entity\legend_helmets\runed_wizard_cowl_02.png" left="-41" right="43" top="-28" bottom="106" />
<sprite id="runed_wizard_cowl_02_damaged" offsetY="35" ic="FF353857" width="184" height="222" img="entity\legend_helmets\runed_wizard_cowl_02_damaged.png" left="-41" right="43" top="-29" bottom="105" />
<sprite id="runed_wizard_cowl_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF353957" width="191" height="185" img="entity\legend_helmets\runed_wizard_cowl_02_dead.png" left="-88" right="22" top="-92" bottom="10" />


<sprite id="wizard_cowl_02" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_02.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_02_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_02_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_02_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_02" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_02.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_02_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_02_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_02_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_03" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_03.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_03_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_03_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_03_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_03_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_03" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_03.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_03_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_03_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_03_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_03_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_04" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_04.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_04_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_04_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_04_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_04_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_04" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_04.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_04_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_04_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_04_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_04_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_05" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_05.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_05_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_05_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_05_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_05_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_05" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_05.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_05_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_05_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_05_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_05_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_06" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_06.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_06_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_06_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_06_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_06_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_06" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_06.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_06_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_06_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_06_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_06_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_07" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_07.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_07_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_07_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_07_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_07_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_07" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_07.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_07_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_07_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_07_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_07_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_08" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_08.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_08_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_08_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_08_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_08_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_08" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_08.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_08_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_08_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_08_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_08_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_09" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_09.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_09_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_09_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_09_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_09_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_09" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_09.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_09_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_09_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_09_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_09_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_10" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_10.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_10_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_10_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_10_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_10_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_10" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_10.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_10_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_10_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_10_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_10_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_11" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_11.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_11_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_11_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_11_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_11_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_11" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_11.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_11_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_11_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_11_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_11_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_12" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_12.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_12_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_12_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_12_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_12_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_12" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_12.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_12_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_12_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_12_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_12_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_13" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_13.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_13_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_13_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_13_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_13_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_13" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_13.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_13_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_13_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_13_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_13_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_14" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_14.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_14_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_14_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_14_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_14_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_14" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_14.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_14_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_14_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_14_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_14_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="wizard_cowl_15" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_15.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_15_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_15_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_15_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_15_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_15" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_15.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_15_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_15_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_15_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_15_dead.png" left="-57" right="25" top="-63" bottom="3" />
 <sprite id="wizard_cowl_16" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_16.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_16_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_16_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_16_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_16_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_16" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_16.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_16_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_16_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_16_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_16_dead.png" left="-57" right="25" top="-63" bottom="3" />
 <sprite id="wizard_cowl_17" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_17.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_17_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_17_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_17_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_17_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_17" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_17.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_17_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_17_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_17_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_17_dead.png" left="-57" right="25" top="-63" bottom="3" />
 <sprite id="wizard_cowl_18" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_18.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_18_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_18_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_18_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_18_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_18" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_18.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_18_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_18_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_18_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_18_dead.png" left="-57" right="25" top="-63" bottom="3" />
 <sprite id="wizard_cowl_19" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_19.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_19_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_19_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_19_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_19_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_19" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_19.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_19_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_19_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_19_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_19_dead.png" left="-57" right="25" top="-63" bottom="3" />
 <sprite id="wizard_cowl_20" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\wizard_cowl_20.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="wizard_cowl_20_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\wizard_cowl_20_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="wizard_cowl_20_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\wizard_cowl_20_dead.png" left="-57" right="25" top="-63" bottom="3" />
<sprite id="runed_wizard_cowl_20" offsetY="35" ic="FF403F3F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_20.png" left="-39" right="45" top="-36" bottom="60" />
<sprite id="runed_wizard_cowl_20_damaged" offsetY="35" ic="FF41403F" width="104" height="142" img="entity\helmets\runed_wizard_cowl_20_damaged.png" left="-37" right="45" top="-29" bottom="61" />
<sprite id="runed_wizard_cowl_20_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF444343" width="131" height="125" img="entity\helmets\runed_wizard_cowl_20_dead.png" left="-57" right="25" top="-63" bottom="3" />
 
 <sprite id="jester_hat_01" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_01.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_01_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_01_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_01_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_01_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_01" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_01.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_01_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_01_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_01_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_01_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_02" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_02.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_02_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_02_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_02_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_02" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_02.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_02_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_02_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_02_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_03" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_03.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_03_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_03_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_03_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_03_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_03" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_03.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_03_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_03_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_03_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_03_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_04" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_04.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_04_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_04_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_04_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_04_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_04" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_04.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_04_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_04_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_04_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_04_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_05" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_05.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_05_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_05_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_05_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_05_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_05" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_05.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_05_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_05_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_05_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_05_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_06" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_06.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_06_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_06_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_06_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_06_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_06" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_06.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_06_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_06_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_06_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_06_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_07" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_07.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_07_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_07_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_07_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_07_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_07" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_07.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_07_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_07_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_07_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_07_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_08" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_08.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_08_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_08_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_08_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_08_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_08" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_08.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_08_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_08_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_08_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_08_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_09" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_09.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_09_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_09_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_09_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_09_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_09" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_09.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_09_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_09_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_09_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_09_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_10" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_10.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_10_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_10_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_10_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_10_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_10" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_10.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_10_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_10_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_10_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_10_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_11" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_11.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_11_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_11_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_11_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_11_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_11" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_11.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_11_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_11_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_11_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_11_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_12" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_12.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_12_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_12_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_12_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_12_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_12" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_12.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_12_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_12_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_12_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_12_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_13" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_13.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_13_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_13_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_13_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_13_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_13" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_13.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_13_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_13_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_13_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_13_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_14" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_14.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_14_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_14_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_14_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_14_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_14" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_14.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_14_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_14_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_14_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_14_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_15" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_15.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_15_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_15_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_15_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_15_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_15" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_15.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_15_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_15_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_15_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_15_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_16" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_16.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_16_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_16_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_16_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_16_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_16" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_16.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_16_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_16_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_16_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_16_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_17" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_17.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_17_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_17_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_17_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_17_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_17" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_17.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_17_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_17_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_17_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_17_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_18" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_18.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_18_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_18_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_18_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_18_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_18" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_18.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_18_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_18_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_18_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_18_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_19" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_19.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_19_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_19_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_19_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_19_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_19" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_19.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_19_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_19_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_19_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_19_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_20" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_20.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_20_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_20_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_20_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_20_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_20" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_20.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_20_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_20_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_20_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_20_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_21" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_21.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_21_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_21_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_21_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_21_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_21" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_21.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_21_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_21_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_21_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_21_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_22" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_22.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_22_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_22_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_22_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_22_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_22" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_22.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_22_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_22_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_22_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_22_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_23" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_23.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_23_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_23_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_23_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_23_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_23" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_23.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_23_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_23_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_23_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_23_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_24" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_24.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_24_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_24_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_24_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_24_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_24" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_24.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_24_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_24_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_24_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_24_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_25" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_25.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_25_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_25_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_25_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_25_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_25" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_25.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_25_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_25_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_25_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_25_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_26" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_26.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_26_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_26_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_26_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_26_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_26" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_26.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_26_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_26_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_26_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_26_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_27" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_27.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_27_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_27_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_27_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_27_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_27" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_27.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_27_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_27_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_27_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_27_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_28" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_28.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_28_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_28_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_28_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_28_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_28" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_28.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_28_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_28_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_28_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_28_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_29" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_29.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_29_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_29_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_29_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_29_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_29" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_29.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_29_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_29_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_29_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_29_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_30" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_30.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_30_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_30_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_30_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_30_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_30" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_30.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_30_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_30_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_30_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_30_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_31" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_31.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_31_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_31_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_31_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_31_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_31" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_31.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_31_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_31_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_31_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_31_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_32" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_32.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_32_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_32_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_32_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_32_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_32" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_32.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_32_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_32_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_32_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_32_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_33" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_33.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_33_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_33_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_33_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_33_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_33" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_33.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_33_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_33_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_33_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_33_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_34" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_34.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_34_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_34_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_34_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_34_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_34" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_34.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_34_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_34_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_34_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_34_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_35" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_35.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_35_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_35_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_35_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_35_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_35" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_35.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_35_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_35_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_35_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_35_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_36" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_36.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_36_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_36_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_36_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_36_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_36" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_36.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_36_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_36_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_36_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_36_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_37" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_37.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_37_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_37_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_37_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_37_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_37" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_37.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_37_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_37_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_37_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_37_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_38" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_38.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_38_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_38_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_38_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_38_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_38" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_38.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_38_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_38_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_38_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_38_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_39" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_39.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_39_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_39_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_39_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_39_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_39" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_39.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_39_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_39_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_39_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_39_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_40" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_40.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_40_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_40_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_40_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_40_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_40" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_40.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_40_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_40_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_40_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_40_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_41" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_41.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_41_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_41_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_41_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_41_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_41" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_41.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_41_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_41_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_41_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_41_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_42" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_42.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_42_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_42_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_42_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_42_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_42" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_42.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_42_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_42_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_42_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_42_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_43" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_43.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_43_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_43_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_43_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_43_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_43" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_43.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_43_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_43_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_43_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_43_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_44" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_44.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_44_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_44_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_44_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_44_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_44" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_44.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_44_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_44_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_44_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_44_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_45" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_45.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_45_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_45_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_45_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_45_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_45" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_45.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_45_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_45_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_45_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_45_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_46" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_46.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_46_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_46_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_46_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_46_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_46" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_46.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_46_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_46_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_46_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_46_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_47" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_47.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_47_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_47_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_47_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_47_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_47" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_47.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_47_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_47_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_47_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_47_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_48" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_48.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_48_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_48_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_48_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_48_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_48" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_48.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_48_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_48_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_48_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_48_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_49" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_49.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_49_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_49_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_49_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_49_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_49" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_49.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_49_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_49_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_49_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_49_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_50" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_50.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_50_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_50_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_50_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_50_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_50" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_50.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_50_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_50_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_50_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_50_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_51" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_51.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_51_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_51_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_51_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_51_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_51" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_51.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_51_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_51_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_51_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_51_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_52" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_52.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_52_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_52_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_52_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_52_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_52" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_52.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_52_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_52_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_52_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_52_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_53" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_53.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_53_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_53_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_53_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_53_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_53" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_53.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_53_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_53_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_53_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_53_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_54" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_54.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_54_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_54_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_54_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_54_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_54" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_54.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_54_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_54_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_54_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_54_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_55" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_55.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_55_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_55_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_55_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_55_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_55" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_55.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_55_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_55_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_55_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_55_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_56" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_56.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_56_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_56_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_56_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_56_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_56" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_56.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_56_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_56_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_56_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_56_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_57" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_57.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_57_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_57_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_57_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_57_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_57" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_57.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_57_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_57_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_57_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_57_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_58" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_58.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_58_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_58_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_58_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_58_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_58" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_58.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_58_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_58_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_58_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_58_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_59" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_59.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_59_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_59_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_59_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_59_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_59" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_59.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_59_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_59_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_59_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_59_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_60" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_60.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_60_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_60_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_60_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_60_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_60" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_60.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_60_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_60_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_60_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_60_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_61" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_61.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_61_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_61_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_61_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_61_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_61" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_61.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_61_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_61_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_61_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_61_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_62" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_62.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_62_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_62_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_62_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_62_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_62" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_62.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_62_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_62_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_62_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_62_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_63" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_63.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_63_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_63_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_63_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_63_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_63" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_63.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_63_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_63_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_63_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_63_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="jester_hat_64" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_64.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_64_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_64_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="jester_hat_64_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_64_86_dead.png" left="-70" right="20" top="-76" bottom="4" />
 <sprite id="runed_jester_hat_64" offsetY="35" ic="FF5D5D5B" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_64.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_64_damaged" offsetY="35" ic="FF555552" width="104" height="142" img="entity\legend_helmets\runed_jester_hat_64_damaged.png" left="-38" right="50" top="-14" bottom="70" />
 <sprite id="runed_jester_hat_64_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF585854" width="191" height="185" img="entity\legend_helmets\runed_jester_hat_64_86_dead.png" left="-70" right="20" top="-76" bottom="4" />

  <sprite id="witchhunter_helm_01" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\helmets\witchhunter_helm_01.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_01_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\helmets\witchhunter_helm_01_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_01_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\helmets\witchhunter_helm_01_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="runed_witchhunter_helm_01" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\helmets\runed_witchhunter_helm_01.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_01_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\helmets\runed_witchhunter_helm_01_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_01_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\helmets\runed_witchhunter_helm_01_dead.png" left="-49" right="25" top="-63" bottom="5" />
 
  <sprite id="witchhunter_helm_02" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\helmets\witchhunter_helm_02.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_02_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\helmets\witchhunter_helm_02_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\helmets\witchhunter_helm_02_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="runed_witchhunter_helm_02" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\helmets\runed_witchhunter_helm_02.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_02_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\helmets\runed_witchhunter_helm_02_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_02_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\helmets\runed_witchhunter_helm_02_dead.png" left="-49" right="25" top="-63" bottom="5" />
  
  <sprite id="witchhunter_helm_03" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\helmets\witchhunter_helm_03.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_03_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\helmets\witchhunter_helm_03_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_03_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\helmets\witchhunter_helm_03_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="runed_witchhunter_helm_03" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\helmets\runed_witchhunter_helm_03.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_03_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\helmets\runed_witchhunter_helm_03_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_03_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\helmets\runed_witchhunter_helm_03_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="witchhunter_helm_04" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\helmets\witchhunter_helm_04.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_04_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\helmets\witchhunter_helm_04_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_04_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\helmets\witchhunter_helm_04_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="runed_witchhunter_helm_04" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\helmets\runed_witchhunter_helm_04.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_04_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\helmets\runed_witchhunter_helm_04_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_04_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\helmets\runed_witchhunter_helm_04_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="witchhunter_helm_05" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\helmets\witchhunter_helm_05.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_05_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\helmets\witchhunter_helm_05_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_05_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\helmets\witchhunter_helm_05_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="runed_witchhunter_helm_05" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\helmets\runed_witchhunter_helm_05.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_05_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\helmets\runed_witchhunter_helm_05_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_05_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\helmets\runed_witchhunter_helm_05_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="witchhunter_helm_06" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\helmets\witchhunter_helm_06.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_06_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\helmets\witchhunter_helm_06_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="witchhunter_helm_06_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\helmets\witchhunter_helm_06_dead.png" left="-49" right="25" top="-63" bottom="5" />
  <sprite id="runed_witchhunter_helm_06" offsetY="35" ic="FF19212F" width="104" height="142" img="entity\helmets\runed_witchhunter_helm_06.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_06_damaged" offsetY="35" ic="FF1A212E" width="104" height="142" img="entity\helmets\runed_witchhunter_helm_06_damaged.png" left="-29" right="31" top="-32" bottom="50" />
  <sprite id="runed_witchhunter_helm_06_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF1A212E" width="131" height="125" img="entity\helmets\runed_witchhunter_helm_06_dead.png" left="-49" right="25" top="-63" bottom="5" />
 

"""

def main():
    mfile = os.path.join(os.path.dirname(os.path.abspath(__file__)), "legend_armor/metadata.xml")
    F = open(mfile, "w")
    F.write('<brush name="gfx/legend_armor.png" version="17">\n')
    L = [Layer, LayerDamaged, LayerDead]
    LBase = [Layer, LayerDamaged, LayerDead, LayerArrow, LayerJavelin]
    for d in layers:
        R = L
        if "base" in d:
            R = LBase

        names = [d["name"]]
        if "min" in d:
            names = []
            for i in range(d["min"], d["max"] + 1):
                ind = "0" + str(i) if i < 10 else str(i)
                names.append(d["name"] + "_" + ind)

        for t in R:
            for name in names:
                opts = dict(
                    name=name,
                    damaged=name + "_damaged",
                    dead=name + "_dead",
                    arrow=name + "_dead_arrows",
                    javelin=name + "_dead_javelin",
                    name_path=os.path.join("entity", "legend_armor", d["layer"], name + ".png"),
                    damaged_path=os.path.join("entity", "legend_armor", d["layer"], name + "_damaged.png"),
                    dead_path=os.path.join("entity", "legend_armor", d["layer"], name + "_dead.png"),
                    arrow_path=os.path.join("entity", "legend_armor", d["layer"], name + "_dead_arrows.png"),
                    javelin_path=os.path.join("entity", "legend_armor", d["layer"], name + "_dead_javelin.png")
                )
                s = Template(t)
                text = s.substitute(opts)
                text.replace("/", "\\")
                F.write(text)

                if "base" in d:
                    srcF = os.path.join(os.path.dirname(os.path.abspath(__file__)), "dead_arrows.png")
                    destF = os.path.join(os.path.dirname(os.path.abspath(__file__)), "legend_armor", opts["arrow_path"])
                    if not os.path.exists(destF):
                        copyfile(srcF, destF)
                    srcF = os.path.join(os.path.dirname(os.path.abspath(__file__)), "dead_javelin.png")
                    destF = os.path.join(os.path.dirname(os.path.abspath(__file__)), "legend_armor", opts["javelin_path"])
                    if not os.path.exists(destF):
                        copyfile(srcF, destF)

    F.write(helmets)

    F.write('</brush>\n')
    F.close()


main()
