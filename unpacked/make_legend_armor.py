
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
