
from string import Template
from shutil import copyfile
import os

Normal = '<sprite id="$name" offsetY="$offsetY" ic="FF4E5053" width="$w" height="$h" img="$img" left="$left" right="$right" top="$top" bottom="$bottom" />\n'
Full = '<sprite id="$name" offsetX="$offsetX" offsetY="$offsetY" f="64F6" f1="$f1" f2="$f2" ic="FF313D49" width="$w" height="$h" img="$img" left="$left" right="$right" top="$top" bottom="$bottom" />\n'

#Moving Brush:
#DOWN :  bigger negative
#UP : smaller negative
brush_only_layers = [
    {"template": [Normal], "entity":"goblins", "name": "bust_goblin_04_helmet",                      "min" : 4, "max" : 15, "w": 60, "h": 80,  "left": -36, "right" :24, "top": -28, "bottom": 52, "offsetY" : 35},
    {"template": [Normal], "entity":"goblins", "name": "bust_goblin_04_helmet", "suffix": "damaged", "min" : 4, "max" : 15, "w": 60, "h": 80,  "left": -36, "right" :24, "top": -28, "bottom": 52, "offsetY" : 35},
    {"template": [Normal], "entity":"goblins", "name": "bust_goblin_04_helmet", "suffix": "dead", "img":"bust_goblin_04_helmet_00_dead", "min" : 4, "max" : 15, "w": 125, "h": 114,  "left": -10, "right" :46, "top": -46, "bottom": 4, "offsetY" : 15},

    {"template": [Normal], "entity":"goblins", "name": "bust_goblin_01_helmet",                      "min" : 4, "max" : 20, "w": 60, "h": 80,  "left": -36, "right" :24, "top": -28, "bottom": 52, "offsetY" : 35},
    {"template": [Normal], "entity":"goblins", "name": "bust_goblin_01_helmet", "suffix": "damaged", "min" : 4, "max" : 20, "w": 60, "h": 80,  "left": -36, "right" :24, "top": -28, "bottom": 52, "offsetY" : 35},
    {"template": [Normal], "entity":"goblins", "name": "bust_goblin_01_helmet", "suffix": "dead", "img":"bust_goblin_04_helmet_00_dead", "min" : 4, "max" : 20, "w": 125, "h": 114,  "left": -10, "right" :46, "top": -46, "bottom": 4, "offsetY" : 15},

    {"template": [Normal], "entity":"goblins", "name": "bust_goblin_02_helmet",                      "min" : 20, "max" : 26, "w": 60, "h": 80,  "left": -36, "right" :24, "top": -28, "bottom": 52, "offsetY" : 35},
    {"template": [Normal], "entity":"goblins", "name": "bust_goblin_02_helmet", "suffix": "damaged", "min" : 20, "max" : 26, "w": 60, "h": 80,  "left": -36, "right" :24, "top": -28, "bottom": 52, "offsetY" : 35},
    {"template": [Normal], "entity":"goblins", "name": "bust_goblin_02_helmet", "suffix": "dead", "img":"bust_goblin_04_helmet_00_dead", "min" : 20, "max" : 26, "w": 125, "h": 114,  "left": -10, "right" :46, "top": -46, "bottom": 4, "offsetY" : 15},

    {"template": [Normal], "entity":"undead", "name": "mummy_head",                   "min" : 1, "max" : 9, "w": 104, "h": 142, "left": -17, "right" :29, "top": -14, "bottom": 48, "offsetY" : 35},
    {"template": [Full],   "entity":"undead", "name": "mummy_head", "suffix": "dead", "min" : 1, "max" : 9, "w": 191, "h": 185, "left": -45, "right" :11, "top": -53, "bottom": 3, "offsetY" : 10, "offsetX" : 6, "f1":-15, "f2": -15},

    {"template": [Normal], "entity":"goblins", "name": "bust_kobold",                      "min" : 1, "max" : 5, "w": 66, "h": 68, "left": -33, "right" :33, "top": -51, "bottom": 17, "offsetY" : 35},
    {"template": [Normal], "entity":"goblins", "name": "bust_kobold", "suffix": "damaged", "min" : 1, "max" : 5, "w": 66, "h": 66, "left": -33, "right" :33, "top": -51, "bottom": 17, "offsetY" : 35},
    {"template": [Normal], "entity":"goblins", "name": "bust_kobold", "suffix": "dead",    "min" : 1, "max" : 5, "w": 118, "h": 94, "left": -59, "right" :59, "top": -67, "bottom": 27, "offsetY" : 35},

    {"template": [Normal], "entity":"goblins", "name": "head_kobold",                      "min" : 1, "max" : 5, "w": 82, "h": 64, "left": -41, "right" :41, "top": -32, "bottom": 32, "offsetY" : 35},
    {"template": [Normal], "entity":"goblins", "name": "head_kobold", "suffix": "dead",    "min" : 1, "max" : 5, "w": 70, "h": 50, "left": -45, "right" :25, "top": -65, "bottom": -15, "offsetY" : 35},

]


enemies = r"""

<sprite id="legend_orc_behemoth_body_01" offsetX="-5" offsetY="35" ic="FF555758" width="174" height="214" img="entity\orcs\legend_orc_behemoth_body_01.png" left="-68" right="82" top="-81" bottom="90" />
<sprite id="legend_orc_behemoth_body_01_bloodied" offsetX="-5" offsetY="35" ic="FF171844" width="174" height="214" img="entity\orcs\legend_orc_behemoth_body_01_bloodied.png" left="-68" right="82" top="-81" bottom="90" />
<sprite id="legend_orc_behemoth_body_01_dead" offsetY="30" f="6403" ic="FF3F4149" width="169" height="139" img="entity\orcs\legend_orc_behemoth_body_01_dead.png" left="-84" right="85" top="-70" bottom="62" />
<sprite id="legend_orc_behemoth_body_01_dead_arrows" offsetY="30" f="6402" ic="FF444B4F" width="169" height="139" img="entity\orcs\legend_orc_behemoth_body_01_dead_arrows.png" left="-19" right="53" top="-19" bottom="37" />
<sprite id="legend_orc_behemoth_body_01_dead_javelin" offsetY="30" f="6402" ic="FF141B29" width="169" height="139" img="entity\orcs\legend_orc_behemoth_body_01_dead_javelin.png" left="-14" right="78" top="-2" bottom="54" />

<sprite id="legend_orc_behemoth_head_01" offsetX="-5" offsetY="35" f1="-30" f2="10" ic="FF636C75" width="174" height="214" img="entity\orcs\legend_orc_behemoth_head_01.png" left="-68" right="36" top="-13" bottom="71" />
<sprite id="legend_orc_behemoth_head_01_bloodied" offsetX="-5" offsetY="35" f1="-30" f2="10" ic="FF636C75" width="174" height="214" img="entity\orcs\legend_orc_behemoth_head_01_bloodied.png" left="-68" right="36" top="-13" bottom="71" />
<sprite id="legend_orc_behemoth_head_01_dead" offsetY="30" f="6401" f1="40" f2="-20" ic="FF5B636F" width="169" height="139" img="entity\orcs\legend_orc_behemoth_head_01_dead.png" left="-17" right="85" top="-70" bottom="14" />
<sprite id="legend_orc_behemoth_head_01_dead_bloodpool" offsetY="30" f="6420" f1="40" f2="-20" width="169" height="139" img="entity\orcs\legend_orc_behemoth_head_01_dead_bloodpool.png" left="-20" right="82" top="-62" bottom="16" />

<sprite id="legend_orc_behemoth_guts" offsetY="30" f="6402" ic="FF191B63" width="169" height="139" img="entity\orcs\legend_orc_behemoth_guts.png" left="-48" right="40" top="-9" bottom="47" />

<sprite id="legend_orc_behemoth_armour_01" offsetX="-5" offsetY="35" ic="FF555758" width="174" height="214" img="entity\orcs\legend_orc_behemoth_armour_01.png" left="-68" right="72" top="-81" bottom="90" />
<sprite id="legend_orc_behemoth_armour_01_damaged" offsetX="-5" offsetY="35" ic="FF171844" width="174" height="214" img="entity\orcs\legend_orc_behemoth_armour_01_damaged.png" left="-68" right="72" top="-81" bottom="90" />
<sprite id="legend_orc_behemoth_armour_01_dead" offsetY="30" f="6403" ic="FF3F4149" width="169" height="139" img="entity\orcs\legend_orc_behemoth_armour_01_dead.png" left="-84" right="85" top="-70" bottom="62" />
<sprite id="legend_orc_behemoth_armour_01_dead_arrows" offsetX="-5" offsetY="20" f="6401" ic="FF41484D" width="238" height="186" img="entity\orcs\legend_orc_behemoth_armour_01_dead_arrows.png" left="-37" right="35" top="4" bottom="60" />
<sprite id="legend_orc_behemoth_armour_01_dead_guts" offsetX="-5" offsetY="20" f="6401" ic="FF101042" width="238" height="186" img="entity\orcs\legend_orc_behemoth_armour_01_dead_guts.png" left="-52" right="24" top="10" bottom="60" />
<sprite id="legend_orc_behemoth_armour_01_dead_javelin" offsetX="-5" offsetY="20" f="6401" ic="FF131A27" width="238" height="186" img="entity\orcs\legend_orc_behemoth_armour_01_dead_javelin.png" left="-47" right="25" top="-7" bottom="89" />

<sprite id="legend_orc_behemoth_helmet_01" offsetX="-5" offsetY="35" f1="-30" f2="10" ic="FF636C75" width="174" height="214" img="entity\orcs\legend_orc_behemoth_helmet_01.png" left="-68" right="36" top="-13" bottom="71" />
<sprite id="legend_orc_behemoth_helmet_01_damaged" offsetX="-5" offsetY="35" f1="-30" f2="10" ic="FF636C75" width="174" height="214" img="entity\orcs\legend_orc_behemoth_helmet_01_damaged.png" left="-68" right="36" top="-13" bottom="71" />
<sprite id="legend_orc_behemoth_helmet_01_dead" offsetY="30" f="6401" f1="40" f2="-20" ic="FF5B636F" width="169" height="139" img="entity\orcs\legend_orc_behemoth_helmet_01_dead.png" left="-17" right="85" top="-70" bottom="14" />

<sprite id="bust_orc_elite_armor_01" offsetY="35" ic="FF1A2028" width="174" height="214" img="entity\orcs\bust_orc_elite_armor_01.png" top="-68" bottom="48" />
<sprite id="bust_orc_elite_armor_01_damaged" offsetY="35" ic="FF1A2028" width="174" height="214" img="entity\orcs\bust_orc_elite_armor_01_damaged.png" top="-68" bottom="48" />
<sprite id="bust_orc_elite_armor_01_dead" offsetX="-5" offsetY="20" f="6402" ic="FF202730" width="238" height="186" img="entity\orcs\bust_orc_elite_armor_01_dead.png" left="-79" right="99" top="-77" bottom="93" />
<sprite id="bust_orc_elite_armor_01_dead_arrows" offsetX="-5" offsetY="20" f="6401" ic="FF41484D" width="238" height="186" img="entity\orcs\bust_orc_elite_armor_01_dead_arrows.png" left="-37" right="35" top="4" bottom="60" />
<sprite id="bust_orc_elite_armor_01_dead_guts" offsetX="-5" offsetY="20" f="6401" ic="FF101042" width="238" height="186" img="entity\orcs\bust_orc_elite_armor_01_dead_guts.png" left="-52" right="24" top="10" bottom="60" />
<sprite id="bust_orc_elite_armor_01_dead_javelin" offsetX="-5" offsetY="20" f="6401" ic="FF131A27" width="238" height="186" img="entity\orcs\bust_orc_elite_armor_01_dead_javelin.png" left="-47" right="25" top="-7" bottom="89" />

<sprite id="bust_orc_elite_helmet_01" offsetY="35" ic="FF33383F" width="174" height="214" img="entity\orcs\bust_orc_elite_helmet_01.png" left="-42" right="12" top="-18" bottom="58" />
<sprite id="bust_orc_elite_helmet_01_damaged" offsetY="35" ic="FF343940" width="174" height="214" img="entity\orcs\bust_orc_elite_helmet_01_damaged.png" left="-41" right="15" top="-18" bottom="58" />
<sprite id="bust_orc_elite_helmet_01_dead" offsetX="-5" offsetY="20" f="64FF" f1="40" f2="-15" ic="FF303439" width="238" height="186" img="entity\orcs\bust_orc_elite_helmet_01_dead.png" left="10" right="76" top="-52" bottom="18" />

<sprite id="bust_warden_01" offsetY="35" b7="0" ic="FFBF9151" width="104" height="142" img="entity\undead\bust_warden_01.png" left="-50" right="52" top="-69" bottom="45" />
<sprite id="bust_banshee_01" offsetY="35" b7="0" ic="FFBF9151" width="104" height="142" img="entity\undead\bust_banshee_01.png" left="-37" right="65" top="-56" bottom="58" />

<sprite id="bust_direwolf_white_01_body" offsetY="35" ic="FF1B2126" width="104" height="142" img="entity\beasts\bust_direwolf_white_01_body.png" top="-62" bottom="38" />
<sprite id="bust_direwolf_white_01_body_dead" offsetX="4" offsetY="24" f="6403" ic="FF1B1E2A" width="179" height="154" img="entity\beasts\bust_direwolf_white_01_body_dead.png" left="-84" right="82" top="-61" bottom="59" />
<sprite id="bust_direwolf_white_01_head" offsetY="35" ic="FF242930" width="104" height="142" img="entity\beasts\bust_direwolf_white_01_head.png" left="-52" right="24" top="-46" bottom="40" />
<sprite id="bust_direwolf_white_01_head_dead" offsetX="4" offsetY="24" f="6401" ic="FF222630" width="179" height="154" img="entity\beasts\bust_direwolf_white_01_head_dead.png" left="-41" right="35" top="-61" bottom="7" />
<sprite id="bust_direwolf_white_head_bloodpool" offsetX="4" offsetY="24" f="6420" width="179" height="154" img="entity\beasts\bust_direwolf_white_head_bloodpool.png" left="-54" right="44" top="-69" bottom="15" />
<sprite id="bust_direwolf_white_injured" offsetY="35" ic="FF111131" width="104" height="142" img="entity\beasts\bust_direwolf_white_injured.png" left="-42" right="30" top="-36" bottom="26" />
<sprite id="bust_direwolf_white_01_body_dead_arrows" offsetX="4" offsetY="24" f="6402" ic="FF474D52" width="179" height="154" img="entity\beasts\bust_direwolf_white_01_body_dead_arrows.png" left="-5" right="33" top="-16" bottom="32" />
<sprite id="bust_direwolf_white_01_body_dead_javelin" offsetX="4" offsetY="24" f="6402" ic="FF151C29" width="179" height="154" img="entity\beasts\bust_direwolf_white_01_body_dead_javelin.png" left="-2" right="44" top="-11" bottom="61" />
<sprite id="bust_ghoulskin_01_injured" offsetY="35" ic="FF131231" width="104" height="142" img="entity\beasts\bust_ghoulskin_01_injured.png" left="-25" right="35" top="-44" bottom="14" />
<sprite id="bust_ghoulskin_02_head_03" offsetY="35" ic="FF31363A" width="104" height="142" img="entity\beasts\bust_ghoulskin_02_head_01.png" left="-43" right="35" top="-34" bottom="46" />
<sprite id="bust_ghoulskin_02_head_03_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF373E45" width="169" height="139" img="entity\beasts\bust_ghoulskin_02_head_01_dead.png" left="-9" right="73" top="-70" bottom="14" />
<sprite id="bust_ghoulskin_02_head_01" offsetY="35" ic="FF353C40" width="104" height="142" img="entity\beasts\bust_ghoulskin_02_head_02.png" left="-43" right="35" top="-34" bottom="48" />
<sprite id="bust_ghoulskin_02_head_01_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF2E343A" width="169" height="139" img="entity\beasts\bust_ghoulskin_02_head_02_dead.png" left="-5" right="75" top="-69" bottom="31" />
<sprite id="bust_ghoulskin_02_head_02" offsetY="35" ic="FF32383D" width="104" height="142" img="entity\beasts\bust_ghoulskin_02_head_03.png" left="-42" right="34" top="-37" bottom="53" />
<sprite id="bust_ghoulskin_02_head_02_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF2D3237" width="169" height="139" img="entity\beasts\bust_ghoulskin_02_head_03_dead.png" left="-4" right="72" top="-70" bottom="10" />
<sprite id="bust_ghoulskin_02_injured" offsetY="35" ic="FF131231" width="104" height="142" img="entity\beasts\bust_ghoulskin_02_injured.png" left="-25" right="37" top="-41" bottom="19" />
<sprite id="bust_ghoulskin_03_head_01" offsetY="35" ic="FF343C45" width="174" height="214" img="entity\beasts\bust_ghoulskin_03_head_01.png" left="-66" right="46" top="-51" bottom="63" />
<sprite id="bust_ghoulskin_03_head_01_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF2A323C" width="169" height="139" img="entity\beasts\bust_ghoulskin_03_head_01_dead.png" left="-13" right="71" top="-65" bottom="21" />
<sprite id="bust_ghoulskin_03_head_02" offsetY="35" ic="FF303942" width="174" height="214" img="entity\beasts\bust_ghoulskin_03_head_02.png" left="-58" right="46" top="-51" bottom="61" />
<sprite id="bust_ghoulskin_03_head_02_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF2D3540" width="169" height="139" img="entity\beasts\bust_ghoulskin_03_head_02_dead.png" left="-17" right="71" top="-70" bottom="18" />
<sprite id="bust_ghoulskin_03_head_03" offsetY="35" ic="FF2D353E" width="174" height="214" img="entity\beasts\bust_ghoulskin_03_head_03.png" left="-60" right="48" top="-48" bottom="58" />
<sprite id="bust_ghoulskin_03_head_03_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF313943" width="169" height="139" img="entity\beasts\bust_ghoulskin_03_head_03_dead.png" left="-17" right="71" top="-70" bottom="24" />
<sprite id="bust_ghoulskin_03_injured" offsetY="35" ic="FF121232" width="174" height="214" img="entity\beasts\bust_ghoulskin_03_injured.png" left="-35" right="47" top="-52" bottom="26" />
<sprite id="bust_ghoulskin_04_head_01" offsetY="35" ic="FF343D42" width="174" height="214" img="entity\beasts\bust_ghoulskin_04_head_01.png" left="-67" right="55" top="-37" bottom="61" />
<sprite id="bust_ghoulskin_04_head_01_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF323A41" width="169" height="139" img="entity\beasts\bust_ghoulskin_04_head_01_dead.png" left="-10" right="74" top="-70" bottom="28" />
<sprite id="bust_ghoulskin_04_head_02" offsetY="35" ic="FF323C41" width="174" height="214" img="entity\beasts\bust_ghoulskin_04_head_02.png" left="-57" right="49" top="-37" bottom="63" />
<sprite id="bust_ghoulskin_04_head_02_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF2E343B" width="169" height="139" img="entity\beasts\bust_ghoulskin_04_head_02_dead.png" left="-9" right="71" top="-70" bottom="20" />
<sprite id="bust_ghoulskin_04_head_03" offsetY="35" ic="FF30393F" width="174" height="214" img="entity\beasts\bust_ghoulskin_04_head_03.png" left="-57" right="49" top="-37" bottom="61" />
<sprite id="bust_ghoulskin_04_head_03_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF2F353C" width="169" height="139" img="entity\beasts\bust_ghoulskin_04_head_03_dead.png" left="-8" right="70" top="-70" bottom="20" />
<sprite id="bust_ghoulskin_04_injured" offsetY="35" ic="FF141436" width="174" height="214" img="entity\beasts\bust_ghoulskin_04_injured.png" left="-45" right="47" top="-72" bottom="24" />
<sprite id="bust_ghoulskin_body_01" offsetY="35" ic="FF2A2D2F" width="104" height="142" img="entity\beasts\bust_ghoulskin_body_01.png" left="-38" right="46" top="-56" bottom="34" />
<sprite id="bust_ghoulskin_body_01_dead" offsetX="5" offsetY="20" f="6403" ic="FF252930" width="169" height="139" img="entity\beasts\bust_ghoulskin_body_01_dead.png" left="-65" right="69" top="-54" bottom="52" />
<sprite id="bust_ghoulskin_body_02" offsetY="35" ic="FF303538" width="104" height="142" img="entity\beasts\bust_ghoulskin_body_02.png" left="-43" right="45" top="-50" bottom="26" />
<sprite id="bust_ghoulskin_body_02_dead" offsetX="5" offsetY="20" f="6403" ic="FF282C35" width="169" height="139" img="entity\beasts\bust_ghoulskin_body_02_dead.png" left="-79" right="85" top="-62" bottom="54" />
<sprite id="bust_ghoulskin_body_03" offsetY="35" ic="FF2F3435" width="174" height="214" img="entity\beasts\bust_ghoulskin_body_03.png" left="-47" right="61" top="-65" bottom="31" />
<sprite id="bust_ghoulskin_body_03_dead" offsetX="5" offsetY="20" f="6403" ic="FF282C35" width="169" height="139" img="entity\beasts\bust_ghoulskin_body_03_dead.png" left="-84" right="85" top="-63" bottom="61" />
<sprite id="bust_ghoulskin_body_04" offsetY="35" ic="FF313737" width="174" height="214" img="entity\beasts\bust_ghoulskin_body_04.png" left="-60" right="62" top="-69" bottom="31" />
<sprite id="bust_ghoulskin_body_04_dead" offsetX="5" offsetY="20" f="6403" ic="FF2C303C" width="169" height="139" img="entity\beasts\bust_ghoulskin_body_04_dead.png" left="-84" right="85" top="-68" bottom="64" />
<sprite id="bust_ghoulskin_head_01" offsetY="35" ic="FF3A3F41" width="104" height="142" img="entity\beasts\bust_ghoulskin_head_01.png" left="-37" right="17" top="-35" bottom="29" />
<sprite id="bust_ghoulskin_head_01_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF35393E" width="169" height="139" img="entity\beasts\bust_ghoulskin_head_01_dead.png" left="-3" right="61" top="-44" bottom="2" />
<sprite id="bust_ghoulskin_02_head_03_bloodpool" offsetX="5" offsetY="20" f="6420" f1="30" f2="-15" width="169" height="139" img="entity\beasts\bust_ghoulskin_02_head_01_bloodpool.png" left="-35" right="77" top="-70" bottom="32" />
<sprite id="bust_ghoulskin_02_head_01_bloodpool" offsetX="5" offsetY="20" f="6420" f1="30" f2="-15" width="169" height="139" img="entity\beasts\bust_ghoulskin_02_head_02_bloodpool.png" left="-27" right="85" top="-70" bottom="30" />
<sprite id="bust_ghoulskin_02_head_02_bloodpool" offsetX="5" offsetY="20" f="6420" f1="30" f2="-15" width="169" height="139" img="entity\beasts\bust_ghoulskin_02_head_03_bloodpool.png" left="-22" right="70" top="-70" bottom="24" />
<sprite id="bust_ghoulskin_03_head_01_bloodpool" offsetX="5" offsetY="20" f="6420" f1="30" f2="-15" width="169" height="139" img="entity\beasts\bust_ghoulskin_03_head_01_bloodpool.png" left="-29" right="73" top="-70" bottom="30" />
<sprite id="bust_ghoulskin_03_head_02_bloodpool" offsetX="5" offsetY="20" f="6420" f1="30" f2="-15" width="169" height="139" img="entity\beasts\bust_ghoulskin_03_head_02_bloodpool.png" left="-29" right="79" top="-70" bottom="24" />
<sprite id="bust_ghoulskin_03_head_03_bloodpool" offsetX="5" offsetY="20" f="6420" f1="30" f2="-15" width="169" height="139" img="entity\beasts\bust_ghoulskin_03_head_03_bloodpool.png" left="-34" right="80" top="-70" bottom="30" />
<sprite id="bust_ghoulskin_04_head_01_bloodpool" offsetX="5" offsetY="20" f="6420" f1="30" f2="-15" width="169" height="139" img="entity\beasts\bust_ghoulskin_04_head_01_bloodpool.png" left="-27" right="81" top="-70" bottom="34" />
<sprite id="bust_ghoulskin_04_head_02_bloodpool" offsetX="5" offsetY="20" f="6420" f1="30" f2="-15" width="169" height="139" img="entity\beasts\bust_ghoulskin_04_head_02_bloodpool.png" left="-26" right="78" top="-70" bottom="28" />
<sprite id="bust_ghoulskin_04_head_03_bloodpool" offsetX="5" offsetY="20" f="6420" f1="30" f2="-15" width="169" height="139" img="entity\beasts\bust_ghoulskin_04_head_03_bloodpool.png" left="-26" right="72" top="-70" bottom="26" />
<sprite id="bust_ghoulskin_body_01_dead_arrows" offsetX="5" offsetY="20" f="6402" ic="FF495054" width="169" height="139" img="entity\beasts\bust_ghoulskin_body_01_dead_arrows.png" left="-16" right="22" top="-25" bottom="35" />
<sprite id="bust_ghoulskin_body_01_dead_javelin" offsetX="5" offsetY="20" f="6402" ic="FF151C29" width="169" height="139" img="entity\beasts\bust_ghoulskin_body_01_dead_javelin.png" left="2" right="48" top="-9" bottom="63" />
<sprite id="bust_ghoulskin_body_02_dead_arrows" offsetX="5" offsetY="20" f="6402" ic="FF444A50" width="169" height="139" img="entity\beasts\bust_ghoulskin_body_02_dead_arrows.png" left="-27" right="23" top="-17" bottom="37" />
<sprite id="bust_ghoulskin_body_02_dead_javelin" offsetX="5" offsetY="20" f="6402" ic="FF151C29" width="169" height="139" img="entity\beasts\bust_ghoulskin_body_02_dead_javelin.png" left="-3" right="43" top="-8" bottom="64" />
<sprite id="bust_ghoulskin_body_03_dead_arrows" offsetX="5" offsetY="20" f="6402" ic="FF444A4F" width="169" height="139" img="entity\beasts\bust_ghoulskin_body_03_dead_arrows.png" left="-30" right="18" top="-12" bottom="42" />
<sprite id="bust_ghoulskin_body_03_dead_javelin" offsetX="5" offsetY="20" f="6402" ic="FF131A2A" width="169" height="139" img="entity\beasts\bust_ghoulskin_body_03_dead_javelin.png" left="-33" right="13" top="-29" bottom="47" />
<sprite id="bust_ghoulskin_body_04_dead_arrows" offsetX="5" offsetY="20" f="6402" ic="FF474E53" width="169" height="139" img="entity\beasts\bust_ghoulskin_body_04_dead_arrows.png" left="-45" right="47" top="-2" bottom="58" />
<sprite id="bust_ghoulskin_body_04_dead_javelin" offsetX="5" offsetY="20" f="6402" ic="FF13192A" width="169" height="139" img="entity\beasts\bust_ghoulskin_body_04_dead_javelin.png" left="-11" right="33" top="-16" bottom="60" />
<sprite id="bust_ghoulskin_head_01_bloodpool" offsetX="5" offsetY="20" f="6420" f1="30" f2="-15" width="169" height="139" img="entity\beasts\bust_ghoulskin_head_01_bloodpool.png" left="-11" right="65" top="-50" bottom="10" />
<sprite id="bust_stollwurm_body_01" offsetX="-2" offsetY="45" ic="FF24554E" width="104" height="142" img="entity\beasts\bust_stollwurm_body_01.png" left="-39" right="47" top="-69" bottom="71" />
<sprite id="bust_stollwurm_body_01_dead" offsetX="5" offsetY="20" f="6403" ic="FF295850" width="179" height="154" img="entity\beasts\bust_stollwurm_body_01_dead.png" left="-74" right="76" top="-50" bottom="48" />
<sprite id="bust_stollwurm_body_01_injured" offsetX="-2" offsetY="45" ic="FF5E9C89" width="104" height="142" img="entity\beasts\bust_stollwurm_body_01_injured.png" left="-48" right="44" top="-55" bottom="69" />
<sprite id="bust_stollwurm_head_01" offsetX="-2" offsetY="45" ic="FF315B61" width="104" height="142" img="entity\beasts\bust_stollwurm_head_01.png" left="-52" right="18" top="-34" bottom="64" />
<sprite id="bust_stollwurm_head_01_dead" offsetX="5" offsetY="20" f="6401" f1="-5" f2="-25" ic="FF315E5F" width="179" height="154" img="entity\beasts\bust_stollwurm_head_01_dead.png" left="-70" right="30" top="-47" bottom="11" />
<sprite id="bust_stollwurm_tail_01" offsetY="35" ic="FF265651" width="104" height="142" img="entity\beasts\bust_stollwurm_tail_01.png" left="-38" right="44" top="-51" bottom="53" />
<sprite id="bust_stollwurm_tail_01_dead" offsetX="5" offsetY="20" f="6403" ic="FF28534D" width="179" height="154" img="entity\beasts\bust_stollwurm_tail_01_dead.png" left="-65" right="59" top="-36" bottom="44" />
<sprite id="bust_stollwurm_tail_01_injured" offsetY="35" ic="FF589B7A" width="104" height="142" img="entity\beasts\bust_stollwurm_tail_01_injured.png" left="-24" right="30" top="-45" bottom="53" />
<sprite id="bust_stollwurm_head_01_bloodpool" offsetX="5" offsetY="20" f="6420" f1="-5" f2="-25" width="179" height="154" img="entity\beasts\bust_stollwurm_head_01_bloodpool.png" left="-78" right="32" top="-61" bottom="7" />
<sprite id="bust_stollwurm_body_01_dead_arrows" offsetX="5" offsetY="20" f="6402" ic="FF474C4F" width="179" height="154" img="entity\beasts\bust_stollwurm_body_01_dead_arrows.png" left="-31" right="47" top="-2" bottom="48" />
<sprite id="bust_stollwurm_body_01_dead_javelin" offsetX="5" offsetY="20" f="6402" ic="FF141B27" width="179" height="154" img="entity\beasts\bust_stollwurm_body_01_dead_javelin.png" left="-55" right="41" top="13" bottom="75" />
<sprite id="bust_unhold_rock_02_injured" offsetX="-5" offsetY="35" ic="FF181946" width="174" height="214" img="entity\beasts\bust_unhold_rock_02_injured.png" left="-78" right="50" top="-48" bottom="62" />
<sprite id="bust_unhold_rock_body_02" offsetX="-5" offsetY="35" ic="FF272C3A" width="174" height="214" img="entity\beasts\bust_unhold_rock_body_02.png" left="-64" right="70" top="-67" bottom="83" />
<sprite id="bust_unhold_rock_body_02_dead" offsetY="30" f="6403" ic="FF23283B" width="169" height="139" img="entity\beasts\bust_unhold_rock_body_02_dead.png" left="-83" right="79" top="-70" bottom="62" />
<sprite id="bust_unhold_rock_head_02" offsetX="-5" offsetY="35" f1="-30" f2="10" ic="FF39455B" width="174" height="214" img="entity\beasts\bust_unhold_rock_head_02.png" left="-69" right="21" top="-24" bottom="68" />
<sprite id="bust_unhold_rock_head_02_dead" offsetY="30" f1="40" f2="-20" ic="FF343E56" width="169" height="139" img="entity\beasts\bust_unhold_rock_head_02_dead.png" left="4" right="76" top="-62" bottom="8" />
<sprite id="bust_unhold_rock_head_02_dead_bloodpool" offsetY="30" f="6420" f1="40" f2="-20" width="169" height="139" img="entity\beasts\bust_unhold_rock_head_02_dead_bloodpool.png" left="-9" right="85" top="-64" bottom="16" />
<sprite id="bust_unhold_rock_body_02_dead_arrows" offsetY="30" f="6401" ic="FF444B4F" width="169" height="139" img="entity\beasts\bust_unhold_rock_body_01_dead_arrows.png" left="-19" right="53" top="-19" bottom="37" />
<sprite id="bust_unhold_rock_body_02_dead_javelin" offsetY="30" f="6401" ic="FF141B29" width="169" height="139" img="entity\beasts\bust_unhold_rock_body_01_dead_javelin.png" left="-14" right="78" top="-2" bottom="54" />
<sprite id="bust_spider_redback_body_01" offsetY="35" ic="FF212E38" width="174" height="214" img="entity\beasts\bust_spider_redback_body_01.png" left="-41" right="71" top="-53" bottom="43" />
<sprite id="bust_spider_redback_body_01_dead" offsetY="30" f="6403" ic="FF1A262B" width="169" height="139" img="entity\beasts\bust_spider_redback_body_01_dead.png" left="-71" right="81" top="-64" bottom="50" />
<sprite id="bust_spider_redback_body_02" offsetY="35" ic="FF212E37" width="174" height="214" img="entity\beasts\bust_spider_redback_body_02.png" left="-41" right="71" top="-53" bottom="43" />
<sprite id="bust_spider_redback_body_03" offsetY="35" ic="FF212E38" width="174" height="214" img="entity\beasts\bust_spider_redback_body_03.png" left="-41" right="71" top="-53" bottom="43" />
<sprite id="bust_spider_redback_body_04" offsetY="35" ic="FF19232B" width="174" height="214" img="entity\beasts\bust_spider_redback_body_04.png" left="-41" right="71" top="-53" bottom="43" />
<sprite id="bust_spider_redback_head_01" offsetY="35" ic="FF25394B" width="174" height="214" img="entity\beasts\bust_spider_redback_head_01.png" left="-39" right="5" top="-64" bottom="-12" />
<sprite id="bust_spider_redback_head_01_dead" offsetY="30" f="6401" f1="30" f2="-25" ic="FF20313D" width="169" height="139" img="entity\beasts\bust_spider_redback_head_01_dead.png" left="2" right="66" top="-62" bottom="6" />
<sprite id="bust_spider_redback_legs_front" offsetY="35" ic="FF171C20" width="174" height="214" img="entity\beasts\bust_spider_redback_front.png" left="-7" right="61" top="-54" bottom="16" />
<sprite id="bust_spider_redback_legs_back" offsetY="35" ic="FF12171C" width="174" height="214" img="entity\beasts\bust_spider_redback_legs_back.png" left="-47" right="17" top="-52" bottom="32" />


<sprite id="demon_alp_head" offsetX="-5" offsetY="35" ic="FF203653" width="174" height="214" img="entity\beasts\demon_alp_head.png" left="-58" right="38" top="-16" bottom="98" />
<sprite id="demon_alp_head_dead" offsetY="35" ic="FF1E324C" width="185" height="157" img="entity\beasts\demon_alp_head_dead.png" left="-31" right="93" top="-70" bottom="28" />
<sprite id="demon_alp_wounds" offsetX="-5" offsetY="35" ic="FF36586C" width="174" height="214" img="entity\beasts\demon_alp_wounds.png" left="-32" right="50" top="-47" bottom="23" />



<sprite id="bust_demonalp_01_injured" offsetY="35" ic="FF242636" width="174" height="214" img="entity\beasts\bust_demonalp_01_injured.png" left="-39" right="53" top="-45" bottom="51" />
<sprite id="bust_demonalp_body_01" offsetY="35" ic="FF697792" width="174" height="214" img="entity\beasts\bust_demonalp_body_01.png" left="-50" right="48" top="-55" bottom="23" />
<sprite id="bust_demonalp_body_01_dead" offsetY="20" f="6403" ic="FF515C75" width="169" height="139" img="entity\beasts\bust_demonalp_body_01_dead.png" left="-72" right="80" top="-61" bottom="39" />
<sprite id="bust_demonalp_body_01_dead_arrows" offsetY="20" f="6402" ic="FF40484C" width="169" height="139" img="entity\beasts\bust_demonalp_body_01_dead_arrows.png" left="-30" right="26" top="-15" bottom="37" />
<sprite id="bust_demonalp_body_01_dead_javelin" offsetY="20" f="6402" ic="FF151C29" width="169" height="139" img="entity\beasts\bust_demonalp_body_01_dead_javelin.png" left="7" right="35" top="-10" bottom="48" />
<sprite id="bust_demonalp_guts" offsetY="18" f="6402" ic="FF4C546D" width="169" height="139" img="entity\beasts\bust_demonalp_guts.png" left="-30" right="32" top="-27" bottom="29" />
<sprite id="bust_demonalp_head_01_dead" offsetY="20" f="6401" f1="30" f2="-25" ic="FF61718A" width="169" height="139" img="entity\beasts\bust_demonalp_head_01_dead.png" left="-17" right="59" top="-58" bottom="6" />
<sprite id="bust_demonalp_head_01_bloodpool" offsetY="20" f="6420" f1="30" f2="-25" width="169" height="139" img="entity\beasts\bust_demonalp_head_01_dead_bloodpool.png" left="-3" right="59" top="-66" bottom="0" />
<sprite id="bust_demonalp_head_02" offsetY="35" ic="FF7284A0" width="174" height="214" img="entity\beasts\bust_demonalp_head_02.png" left="-44" right="24" top="-30" bottom="52" />
<sprite id="bust_demonalp_head_02_dead" offsetY="20" f="6401" f1="30" f2="-25" ic="FF677792" width="169" height="139" img="entity\beasts\bust_demonalp_head_02_dead.png" left="-4" right="60" top="-68" bottom="14" />
<sprite id="bust_demonalp_head_02_bloodpool" offsetY="20" f="6420" f1="30" f2="-25" width="169" height="139" img="entity\beasts\bust_demonalp_head_02_dead_bloodpool.png" left="-2" right="58" top="-60" bottom="18" />
<sprite id="bust_demonalp_head_03" offsetY="35" ic="FF788BA4" width="174" height="214" img="entity\beasts\bust_demonalp_head_03.png" left="-49" right="21" top="-24" bottom="44" />
<sprite id="bust_demonalp_head_03_dead" offsetY="20" f="6401" f1="30" f2="-25" ic="FF6D7D95" width="169" height="139" img="entity\beasts\bust_demonalp_head_03_dead.png" left="-21" right="67" top="-61" bottom="13" />
<sprite id="bust_demonalp_head_03_bloodpool" offsetY="20" f="6420" f1="30" f2="-25" width="169" height="139" img="entity\beasts\bust_demonalp_head_03_dead_bloodpool.png" left="-9" right="63" top="-66" bottom="10" />
<sprite id="bust_demonalp_head_01" offsetY="35" ic="FF6E819D" width="174" height="214" img="entity\beasts\bust_demonalp_head_01.png" left="-51" right="53" top="-22" bottom="58" />
<sprite id="bust_demonalp_shadow_01" offsetY="35" ic="FF000000" width="174" height="214" img="entity\beasts\bust_demonalp_shadow_01.png" left="-51" right="53" top="-55" bottom="59" />
<sprite id="bust_demonalp_shadow_02" offsetY="35" ic="FF000000" width="174" height="214" img="entity\beasts\bust_demonalp_shadow_02.png" left="-50" right="48" top="-55" bottom="51" />
<sprite id="bust_demonalp_shadow_03" offsetY="35" ic="FF000000" width="174" height="214" img="entity\beasts\bust_demonalp_shadow_03.png" left="-50" right="48" top="-55" bottom="43" />

<sprite id="bust_hexenleader_head_01" offsetY="35" ic="FF566984" width="140" height="248" img="entity\beasts\bust_hexenleader_head_01.png" left="-42" right="14" top="-28" bottom="40" />
<sprite id="bust_hexenleader_head_01_dead" offsetX="-6" offsetY="6" f="6401" f1="-5" f2="-10" ic="FF52627F" width="179" height="154" img="entity\beasts\bust_hexenleader_head_01_dead.png" left="-42" right="26" top="-33" bottom="27" />
<sprite id="bust_hexenleader_head_01_bloodpool" offsetY="20" f="6420" f1="30" f2="-25" width="169" height="139" img="entity\beasts\bust_hexenleader_head_01_bloodpool.png" left="-9" right="63" top="-66" bottom="10" />

<sprite id="bust_hexenleader_body_01" offsetY="35" ic="FF1A1C1F" width="140" height="248" img="entity\beasts\bust_hexenleader_body_01.png" top="-66" bottom="36" />
<sprite id="bust_hexenleader_body_01_damaged" offsetY="35" ic="FF1B1F24" width="140" height="248" img="entity\beasts\bust_hexenleader_body_01_damaged.png" left="-47" right="51" top="-66" bottom="36" />
<sprite id="bust_hexenleader_body_01_dead" offsetX="-6" offsetY="6" f="6402" ic="FF1C2029" width="179" height="154" img="entity\beasts\bust_hexenleader_body_01_dead.png" left="-60" right="66" top="-55" bottom="65" />
<sprite id="bust_hexenleader_body_01_dead_arrows" offsetY="20" f="6402" ic="FF40484C" width="169" height="139" img="entity\beasts\bust_hexenleader_body_01_dead_arrows.png" left="-30" right="26" top="-15" bottom="37" />
<sprite id="bust_hexenleader_body_01_dead_javelin" offsetY="20" f="6402" ic="FF151C29" width="169" height="139" img="entity\beasts\bust_hexenleader_body_01_dead_javelin.png" left="7" right="35" top="-10" bottom="48" />

<sprite id="bust_schrat_green_01_injured" offsetX="-5" offsetY="35" ic="FF36586C" width="174" height="214" img="entity\beasts\bust_schrat_green_01_injured.png" left="-32" right="50" top="-47" bottom="23" />
<sprite id="bust_schrat_green_body_01" offsetX="-5" offsetY="35" f="6402" ic="FF1E384E" width="174" height="214" img="entity\beasts\bust_schrat_green_body_01.png" left="-65" right="77" top="-57" bottom="95" />
<sprite id="bust_schrat_green_body_01_dead" offsetY="35" ic="FF1D344A" width="185" height="157" img="entity\beasts\bust_schrat_green_body_01_dead.png" left="-91" right="93" top="-79" bottom="73" />
<sprite id="bust_schrat_green_body_01_dead_arrows" offsetY="35" f="6401" ic="FF40484C" width="185" height="157" img="entity\beasts\bust_schrat_green_body_01_dead_arrows.png" left="-36" right="20" top="-9" bottom="43" />
<sprite id="bust_schrat_green_body_01_dead_javelin" offsetY="35" f="6401" ic="FF151C29" width="185" height="157" img="entity\beasts\bust_schrat_green_body_01_dead_javelin.png" left="8" right="36" top="12" bottom="70" />
<sprite id="bust_schrat_green_body_small_01" offsetY="35" ic="FF253A56" width="174" height="214" img="entity\beasts\bust_schrat_green_body_small_01.png" left="-35" right="25" />
<sprite id="bust_schrat_green_body_small_01_dead" offsetY="20" f="6402" ic="FF253D58" width="185" height="157" img="entity\beasts\bust_schrat_green_body_small_01_dead.png" left="-42" right="60" top="-61" bottom="21" />
<sprite id="bust_schrat_green_body_small_01_injured" offsetY="35" ic="FF273E59" width="174" height="214" img="entity\beasts\bust_schrat_green_body_small_01_injured.png" left="-31" right="25" top="-44" bottom="48" />
<sprite id="bust_schrat_green_head_01" offsetX="-5" offsetY="35" ic="FF203653" width="174" height="214" img="entity\beasts\bust_schrat_green_head_01.png" left="-58" right="38" top="-16" bottom="98" />
<sprite id="bust_schrat_green_head_01_dead" offsetY="35" ic="FF1E324C" width="185" height="157" img="entity\beasts\bust_schrat_green_head_01_dead.png" left="-31" right="93" top="-70" bottom="28" />
<sprite id="bust_schrat_green_head_02" offsetX="-5" offsetY="35" ic="FF20334C" width="174" height="214" img="entity\beasts\bust_schrat_green_head_02.png" left="-50" right="38" top="-15" bottom="107" />
<sprite id="bust_schrat_green_head_02_dead" offsetY="35" ic="FF223650" width="185" height="157" img="entity\beasts\bust_schrat_green_head_02_dead.png" left="-23" right="93" top="-65" bottom="33" />
<sprite id="bust_schrat_green_head_small_01_dead" offsetY="20" ic="FF243957" width="185" height="157" img="entity\beasts\bust_schrat_green_head_small_01_dead.png" left="10" right="54" top="-61" bottom="-11" />
<sprite id="bust_schrat_green_shield_01" offsetY="35" ic="FF253C59" width="174" height="214" img="entity\beasts\bust_schrat_green_shield_01.png" left="12" right="72" top="-54" bottom="24" />
<sprite id="bust_schrat_green_shield_01_damaged" offsetY="35" ic="FF273F5C" width="174" height="214" img="entity\beasts\bust_schrat_green_shield_01_damaged.png" left="12" right="72" top="-54" bottom="24" />
<sprite id="bust_schrat_green_shield_01_dead" offsetY="35" ic="FF253B58" width="185" height="157" img="entity\beasts\bust_schrat_green_shield_01_dead.png" left="-9" right="75" top="-24" bottom="36" />

<sprite id="bust_vampire_lord_body_03" offsetY="35" ic="FF313E48" width="104" height="142" img="entity\undead\bust_vampire_lord_body_03.png" left="-40" right="52" top="-51" bottom="23" />
<sprite id="bust_vampire_lord_body_02" offsetY="35" ic="FF3F5061" width="104" height="142" img="entity\undead\bust_vampire_lord_body_02.png" left="-40" right="52" top="-50" bottom="46" />
<sprite id="bust_vampire_lord_body_01" offsetY="35" ic="FF5B6878" width="104" height="142" img="entity\undead\bust_vampire_lord_body_01.png" left="-42" right="40" top="-49" bottom="9" />
<sprite id="bust_vampire_lord_head_04" offsetY="35" ic="FF495564" width="44" height="74" img="entity\undead\bust_vampire_lord_head_04.png" left="-17" right="27" top="-30" bottom="44" />
<sprite id="bust_vampire_lord_head_03" offsetY="35" ic="FF323E47" width="104" height="142" img="entity\undead\bust_vampire_lord_head_03.png" left="-17" right="29" top="-14" bottom="48" />
<sprite id="bust_vampire_lord_head_02" offsetY="35" ic="FF3E4C5A" width="104" height="142" img="entity\undead\bust_vampire_lord_head_02.png" left="-17" right="29" top="-12" bottom="48" />
<sprite id="bust_vampire_lord_head_01" offsetY="35" ic="FF495564" width="104" height="142" img="entity\undead\bust_vampire_lord_head_01.png" left="-17" right="27" top="-30" bottom="44" />
<sprite id="bust_body_vampire_lord_armor_01" offsetY="39" ic="FF29598E" width="104" height="142" img="entity\undead\armor\bust_body_vampire_lord_armor_01.png" left="-25" right="35" top="-41" bottom="7" />
<sprite id="bust_body_vampire_lord_armor_01_damaged" offsetY="39" ic="FF265384" width="104" height="142" img="entity\undead\armor\bust_body_vampire_lord_armor_01_damaged.png" left="-25" right="35" top="-41" bottom="7" />
<sprite id="bust_body_vampire_lord_armor_01_dead" offsetX="6" offsetY="10" f="64FE" ic="FF285789" width="191" height="185" img="entity\undead\armor\bust_body_vampire_lord_armor_01_dead.png" left="-31" right="25" top="-43" bottom="9" />
<sprite id="bust_body_vampire_lord_armor_01_dead_arrows" offsetX="6" offsetY="10" f="64FB" ic="FF464D51" width="191" height="185" img="entity\undead\armor\bust_body_vampire_lord_armor_01_dead_arrows.png" left="-22" right="34" top="-9" bottom="39" />
<sprite id="bust_body_vampire_lord_armor_01_dead_javelin" offsetX="6" offsetY="10" f="64FB" ic="FF141C29" width="191" height="185" img="entity\undead\armor\bust_body_vampire_lord_armor_01_dead_javelin.png" left="-17" right="15" top="1" bottom="63" />
<sprite id="bust_helmet_vampire_lord_01" offsetX="-2" offsetY="35" ic="FF2E3C51" width="184" height="222" img="entity\undead\helmets\bust_helmet_vampire_lord_01.png" left="-27" right="37" top="11" bottom="55" />
<sprite id="bust_helmet_vampire_lord_01_damaged" offsetY="35" ic="FF2C3B51" width="184" height="222" img="entity\undead\helmets\bust_helmet_vampire_lord_01_damaged.png" left="-28" right="36" top="10" bottom="80" />
<sprite id="bust_helmet_vampire_lord_01_dead" offsetX="6" offsetY="10" f="64F0" f1="-15" f2="-15" ic="FF2D3C52" width="191" height="185" img="entity\undead\helmets\bust_helmet_vampire_lord_01_dead.png" left="-63" right="3" top="-74" bottom="-8" />
<sprite id="bust_vampire_lord_hair_01" offsetY="35" ic="FF69798B" width="120" height="248" img="entity\undead\bust_vampire_lord_hair_01.png" left="-16" right="28" top="-4" bottom="48" />
<sprite id="bust_vampire_lord_hair_01_dead" offsetX="-6" offsetY="6" f1="-5" f2="-10" ic="FF768697" width="179" height="154" img="entity\undead\bust_vampire_lord_hair_01_dead.png" left="-12" right="36" top="-25" bottom="27" />
<sprite id="bust_vampire_lord_dead" offsetY="12" ic="FF465E6A" img="entity\undead\bust_vampire_lord_dead.png" left="-58" right="59" />
<sprite id="bust_vampire_lady_head_01" offsetY="35" ic="FF495564" width="44" height="74" img="entity\undead\bust_vampire_lady_head_01.png" left="-17" right="27" top="-30" bottom="44" />
<sprite id="bust_vampire_lady_body_01" offsetY="35" ic="FF5B6878" width="104" height="142" img="entity\undead\bust_vampire_lady_body_01.png" left="-42" right="40" top="-49" bottom="9" />
<sprite id="bust_vampire_lady_head_02" offsetY="35" ic="FF495564" width="44" height="74" img="entity\undead\bust_vampire_lady_head_02.png" left="-17" right="27" top="-30" bottom="44" />
<sprite id="bust_vampire_lady_body_02" offsetY="35" ic="FF5B6878" width="104" height="142" img="entity\undead\bust_vampire_lady_body_02.png" left="-42" right="40" top="-49" bottom="9" />



<sprite id="bust_demon_hound_01" offsetY="35" offsetX="-10" ic="FF192432" width="106" height="99" img="entity\undead\bust_demon_hound_01.png" left="-55" right="51" top="-54" bottom="45" />
<sprite id="bust_demon_hound_02" offsetY="35" offsetX="-10" ic="FF192432" width="106" height="99" img="entity\undead\bust_demon_hound_02.png" left="-55" right="51" top="-54" bottom="45" />
<sprite id="bust_demon_hound_03" offsetY="35" offsetX="-10" ic="FF192432" width="106" height="99" img="entity\undead\bust_demon_hound_03.png" left="-55" right="51" top="-54" bottom="45" />
<sprite id="bust_demon_hound_spirit_01" offsetY="35" offsetX="-1" ic="FF192432" width="109" height="110" img="entity\undead\bust_demon_hound_spirit_01.png" left="-51" right="59" top="-60" bottom="51" />
<sprite id="bust_demon_hound_spirit_02" offsetY="36" offsetX="-10" ic="FF192432" width="109" height="110" img="entity\undead\bust_demon_hound_spirit_02.png" left="-51" right="59" top="-49" bottom="61" />
<sprite id="bust_demon_hound_spirit_03" offsetY="36" offsetX="-6" ic="FF192432" width="109" height="110" img="entity\undead\bust_demon_hound_spirit_03.png" left="-51" right="59" top="-49" bottom="61" />
<sprite id="bust_demon_hound_injury" offsetY="35" offsetX="-10" ic="FF192432" width="106" height="99" img="entity\undead\bust_demon_hound_injury.png" left="-55" right="51" top="-54" bottom="45" />
<sprite id="bust_demon_hound_dead" offsetY="12" ic="FF465E6A" img="entity\undead\bust_demon_hound_dead.png" left="-58" right="59" />
<sprite id="bust_demon_hound_head_dead" offsetY="12" ic="FF465E6A" img="entity\undead\bust_demon_hound_head_dead.png" left="-58" right="59" />
<sprite id="bust_demon_hound_essence" offsetY="0" offsetX="0" ic="FF192432" width="34" height="93" img="entity\undead\bust_demon_hound_essence.png" left="0" right="34" top="0" bottom="93" />


<sprite id="bear_01" offsetX="-5" offsetY="35" ic="FF272C3A" width="174" height="214" img="entity\beasts\bear_01.png" left="-64" right="70" top="-67" bottom="83" />
<sprite id="bear_01_injured" offsetX="-5" offsetY="35" ic="FF272C3A" width="174" height="214" img="entity\beasts\bear_01_injured.png" left="-64" right="70" top="-67" bottom="83" />
<sprite id="bear_head_01" offsetX="-5" offsetY="35" ic="FF272C3A" width="174" height="214" img="entity\beasts\bear_head_01.png" left="-64" right="70" top="-67" bottom="83" />
<sprite id="bear_01_dead" offsetY="30" f="6403" ic="FF23283B" width="169" height="139" img="entity\beasts\bear_01_dead.png" left="-83" right="79" top="-70" bottom="62" />
<sprite id="bear_01_dead_bloodpool" offsetY="30" f="6420" f1="40" f2="-20" width="169" height="139" img="entity\beasts\bear_01_dead_bloodpool.png" left="-9" right="85" top="-64" bottom="16" />
<sprite id="bear_01_dead_arrows" offsetY="30" f="6401" ic="FF444B4F" width="169" height="139" img="entity\beasts\bear_01_dead_arrows.png" left="-19" right="53" top="-19" bottom="37" />
<sprite id="bear_01_dead_javelin" offsetY="30" f="6401" ic="FF141B29" width="169" height="139" img="entity\beasts\bear_01_dead_javelin.png" left="-14" right="78" top="-2" bottom="54" />
<sprite id="bear_head_01_dead" offsetY="30" f1="40" f2="-20" ic="FF343E56" width="169" height="139" img="entity\beasts\bear_head_01_dead.png" left="4" right="76" top="-62" bottom="8" />


<sprite id="legend_catapult" offsetX="-5" offsetY="35" ic="FF555758" width="174" height="214" img="entity\catapult.png" left="-68" right="82" top="-81" bottom="90" />
<sprite id="legend_catapult_damaged" offsetX="-5" offsetY="35" ic="FF171844" width="174" height="214" img="entity\catapult_damaged.png" left="-68" right="82" top="-81" bottom="90" />
<sprite id="legend_catapult_dead" offsetY="30" f="6403" ic="FF3F4149" width="169" height="139" img="entity\catapult_dead.png" left="-84" right="85" top="-70" bottom="62" />
<sprite id="legend_catapult_dead_arrows" offsetY="30" f="6402" ic="FF444B4F" width="169" height="139" img="entity\catapult_dead_arrows.png" left="-19" right="53" top="-19" bottom="37" />
<sprite id="legend_catapult_dead_javelin" offsetY="30" f="6402" ic="FF141B29" width="169" height="139" img="entity\catapult_dead_javelin.png" left="-14" right="78" top="-2" bottom="54" />

 <sprite id="bust_schrat_body_01_injured" offsetX="-5" offsetY="35" ic="FF36586C" width="174" height="214" img="entity\beasts\bust_schrat_body_01_injured.png" left="-32" right="50" top="-47" bottom="23" />

<sprite id="were_boar_body" offsetY="35" ic="FF2F3435" width="174" height="214" img="entity\beasts\were_boar_body.png" left="-47" right="61" top="-65" bottom="31" />
<sprite id="were_boar_body_injured" offsetX="-5" offsetY="35" ic="FF272C3A" width="130" height="172" img="entity\beasts\were_injury.png" left="-64" right="70" top="-67" bottom="83" />
<sprite id="were_boar_head" offsetY="35" ic="FF30393F" width="174" height="214" img="entity\beasts\were_boar_head.png" left="-57" right="49" top="-37" bottom="61" />
<sprite id="were_boar_head_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF2F353C" width="169" height="139" img="entity\beasts\were_boar_head_dead.png" left="-8" right="70" top="-70" bottom="20" />
<sprite id="were_boar_body_dead" offsetY="30" f="6403" ic="FF23283B" width="164" height="116" img="entity\beasts\were_boar_dead.png" left="-83" right="79" top="-70" bottom="62" />
<sprite id="were_boar_dead_bloodpool" offsetY="30" f="6420" f1="40" f2="-20" width="169" height="139" img="entity\beasts\bear_01_dead_bloodpool.png" left="-9" right="85" top="-64" bottom="16" />
<sprite id="were_boar_dead_arrows" offsetY="30" f="6401" ic="FF444B4F" width="169" height="139" img="entity\beasts\bear_01_dead_arrows.png" left="-19" right="53" top="-19" bottom="37" />
<sprite id="were_boar_dead_javelin" offsetY="30" f="6401" ic="FF141B29" width="169" height="139" img="entity\beasts\bear_01_dead_javelin.png" left="-14" right="78" top="-2" bottom="54" />

<sprite id="were_bear_body" offsetY="35" ic="FF2F3435" width="174" height="214" img="entity\beasts\were_bear_body.png" left="-47" right="61" top="-65" bottom="31" />
<sprite id="were_bear_body_injured" offsetX="-5" offsetY="35" ic="FF272C3A" width="130" height="172" img="entity\beasts\were_injury.png" left="-64" right="70" top="-67" bottom="83" />
<sprite id="were_bear_head" offsetY="35" ic="FF30393F" width="174" height="214" img="entity\beasts\were_bear_head.png" left="-57" right="49" top="-37" bottom="61" />
<sprite id="were_bear_head_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF2F353C" width="169" height="139" img="entity\beasts\were_bear_head_dead.png" left="-8" right="70" top="-70" bottom="20" />
<sprite id="were_bear_body_dead" offsetY="30" f="6403" ic="FF23283B" width="164" height="116" img="entity\beasts\were_bear_dead.png" left="-83" right="79" top="-70" bottom="62" />
<sprite id="were_bear_dead_bloodpool" offsetY="30" f="6420" f1="40" f2="-20" width="169" height="139" img="entity\beasts\bear_01_dead_bloodpool.png" left="-9" right="85" top="-64" bottom="16" />
<sprite id="were_bear_dead_arrows" offsetY="30" f="6401" ic="FF444B4F" width="169" height="139" img="entity\beasts\bear_01_dead_arrows.png" left="-19" right="53" top="-19" bottom="37" />
<sprite id="were_bear_dead_javelin" offsetY="30" f="6401" ic="FF141B29" width="169" height="139" img="entity\beasts\bear_01_dead_javelin.png" left="-14" right="78" top="-2" bottom="54" />

<sprite id="were_wolf_body" offsetY="35" ic="FF2F3435" width="174" height="214" img="entity\beasts\were_wolf_body.png" left="-47" right="61" top="-65" bottom="31" />
<sprite id="were_wolf_body_injured" offsetX="-5" offsetY="35" ic="FF272C3A" width="130" height="172" img="entity\beasts\were_injury.png" left="-64" right="70" top="-67" bottom="83" />
<sprite id="were_wolf_head_01" offsetY="35" ic="FF30393F" width="174" height="214" img="entity\beasts\were_wolf_head_01.png" left="-57" right="49" top="-37" bottom="61" />
<sprite id="were_wolf_head_01_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF2F353C" width="169" height="139" img="entity\beasts\were_wolf_head_01_dead.png" left="-8" right="70" top="-70" bottom="20" />
<sprite id="were_wolf_head_02" offsetY="35" ic="FF30393F" width="174" height="214" img="entity\beasts\were_wolf_head_02.png" left="-57" right="49" top="-37" bottom="61" />
<sprite id="were_wolf_head_02_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF2F353C" width="169" height="139" img="entity\beasts\were_wolf_head_02_dead.png" left="-8" right="70" top="-70" bottom="20" />
<sprite id="were_wolf_head_03" offsetY="35" ic="FF30393F" width="174" height="214" img="entity\beasts\were_wolf_head_03.png" left="-57" right="49" top="-37" bottom="61" />
<sprite id="were_wolf_head_03_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF2F353C" width="169" height="139" img="entity\beasts\were_wolf_head_03_dead.png" left="-8" right="70" top="-70" bottom="20" />
<sprite id="were_wolf_body_dead" offsetY="30" f="6403" ic="FF23283B" width="164" height="116" img="entity\beasts\were_wolf_dead.png" left="-83" right="79" top="-70" bottom="62" />
<sprite id="were_wolf_dead_bloodpool" offsetY="30" f="6420" f1="40" f2="-20" width="169" height="139" img="entity\beasts\bear_01_dead_bloodpool.png" left="-9" right="85" top="-64" bottom="16" />
<sprite id="were_wolf_dead_arrows" offsetY="30" f="6401" ic="FF444B4F" width="169" height="139" img="entity\beasts\bear_01_dead_arrows.png" left="-19" right="53" top="-19" bottom="37" />
<sprite id="were_wolf_dead_javelin" offsetY="30" f="6401" ic="FF141B29" width="169" height="139" img="entity\beasts\bear_01_dead_javelin.png" left="-14" right="78" top="-2" bottom="54" />
<sprite id="were_wolf_head_dead" offsetY="30" f1="40" f2="-20" ic="FF343E56" width="200" height="150" img="entity\beasts\bust_direwolf_01_head_dead.png" left="4" right="76" top="-62" bottom="8" />

<sprite id="bust_rat_head_01" offsetY="35" ic="FF353C40" width="104" height="142" img="entity\beasts\bust_rat_head_01.png" left="-43" right="35" top="-34" bottom="48" />
<sprite id="bust_rat_head_01_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF2E343A" width="169" height="139" img="entity\beasts\bust_rat_head_02_dead.png" left="-5" right="75" top="-69" bottom="31" />
<sprite id="bust_rat_body_01" offsetY="35" ic="FF2A2D2F" width="104" height="142" img="entity\beasts\bust_rat_body_01.png" left="-38" right="46" top="-56" bottom="34" />
<sprite id="bust_rat_body_01_dead" offsetX="5" offsetY="20" f="6403" ic="FF252930" width="169" height="139" img="entity\beasts\bust_rat_body_01_dead.png" left="-65" right="69" top="-54" bottom="52" />
<sprite id="bust_rat_01_injured" offsetY="35" ic="FF131231" width="104" height="142" img="entity\beasts\bust_rat_injured.png" left="-25" right="35" top="-44" bottom="14" />
<sprite id="bust_rat_head_02" offsetY="35" ic="FF353C40" width="104" height="142" img="entity\beasts\bust_rat_head_02.png" left="-43" right="35" top="-34" bottom="48" />
<sprite id="bust_rat_head_02_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF2E343A" width="169" height="139" img="entity\beasts\bust_rat_head_02_dead.png" left="-5" right="75" top="-69" bottom="31" />
<sprite id="bust_rat_body_02" offsetY="35" ic="FF2A2D2F" width="104" height="142" img="entity\beasts\bust_rat_body_02.png" left="-38" right="46" top="-56" bottom="34" />
<sprite id="bust_rat_body_02_dead" offsetX="5" offsetY="20" f="6403" ic="FF252930" width="169" height="139" img="entity\beasts\bust_rat_body_02_dead.png" left="-65" right="69" top="-54" bottom="52" />
<sprite id="bust_rat_02_injured" offsetY="35" ic="FF131231" width="104" height="142" img="entity\beasts\bust_rat_injured.png" left="-25" right="35" top="-44" bottom="14" />
<sprite id="bust_rat_head_03" offsetY="35" ic="FF353C40" width="104" height="142" img="entity\beasts\bust_rat_head_03.png" left="-43" right="35" top="-34" bottom="48" />
<sprite id="bust_rat_head_03_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF2E343A" width="169" height="139" img="entity\beasts\bust_rat_head_03_dead.png" left="-5" right="75" top="-69" bottom="31" />
<sprite id="bust_rat_body_03" offsetY="35" ic="FF2A2D2F" width="104" height="142" img="entity\beasts\bust_rat_body_03.png" left="-38" right="46" top="-56" bottom="34" />
<sprite id="bust_rat_body_03_dead" offsetX="5" offsetY="20" f="6403" ic="FF252930" width="169" height="139" img="entity\beasts\bust_rat_body_03_dead.png" left="-65" right="69" top="-54" bottom="52" />
<sprite id="bust_rat_03_injured" offsetY="35" ic="FF131231" width="104" height="142" img="entity\beasts\bust_rat_injured.png" left="-25" right="35" top="-44" bottom="14" />
<sprite id="bust_rat_head_04" offsetY="35" ic="FF353C40" width="104" height="142" img="entity\beasts\bust_rat_head_04.png" left="-43" right="35" top="-34" bottom="48" />
<sprite id="bust_rat_head_04_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF2E343A" width="169" height="139" img="entity\beasts\bust_rat_head_04_dead.png" left="-5" right="75" top="-69" bottom="31" />
<sprite id="bust_rat_body_04" offsetY="35" ic="FF2A2D2F" width="104" height="142" img="entity\beasts\bust_rat_body_04.png" left="-38" right="46" top="-56" bottom="34" />
<sprite id="bust_rat_body_04_dead" offsetX="5" offsetY="20" f="6403" ic="FF252930" width="169" height="139" img="entity\beasts\bust_rat_body_04_dead.png" left="-65" right="69" top="-54" bottom="52" />
<sprite id="bust_rat_04_injured" offsetY="35" ic="FF131231" width="104" height="142" img="entity\beasts\bust_rat_injured.png" left="-25" right="35" top="-44" bottom="14" />
<sprite id="bust_rat_head_05" offsetY="35" ic="FF353C40" width="104" height="142" img="entity\beasts\bust_rat_head_05.png" left="-43" right="35" top="-34" bottom="48" />
<sprite id="bust_rat_head_05_dead" offsetX="5" offsetY="20" f="6401" f1="30" f2="-15" ic="FF2E343A" width="169" height="139" img="entity\beasts\bust_rat_head_05_dead.png" left="-5" right="75" top="-69" bottom="31" />
<sprite id="bust_rat_body_05" offsetY="35" ic="FF2A2D2F" width="104" height="142" img="entity\beasts\bust_rat_body_05.png" left="-38" right="46" top="-56" bottom="34" />
<sprite id="bust_rat_body_05_dead" offsetX="5" offsetY="20" f="6403" ic="FF252930" width="169" height="139" img="entity\beasts\bust_rat_body_05_dead.png" left="-65" right="69" top="-54" bottom="52" />
<sprite id="bust_rat_05_injured" offsetY="35" ic="FF131231" width="104" height="142" img="entity\beasts\bust_rat_injured.png" left="-25" right="35" top="-44" bottom="14" />

<sprite id="bust_nacht_body_01" offsetX="-5" offsetY="35" f="6402" ic="FF1E384E" width="174" height="214" img="entity\beasts\natchbodyadapt1.png" left="-65" right="77" top="-57" bottom="95" />
<sprite id="bust_nacht_body_02" offsetX="-5" offsetY="35" f="6402" ic="FF1E384E" width="174" height="214" img="entity\beasts\natchbodyadapt2.png" left="-65" right="77" top="-57" bottom="95" />
<sprite id="bust_nacht_body_03" offsetX="-5" offsetY="35" f="6402" ic="FF1E384E" width="174" height="214" img="entity\beasts\natchbodyadapt3.png" left="-65" right="77" top="-57" bottom="95" />
<sprite id="bust_nacht_head_01" offsetX="-5" offsetY="35" ic="FF203653" width="174" height="214" img="entity\beasts\natchheadadapt1.png" left="-58" right="38" top="-16" bottom="98" />
<sprite id="bust_nacht_head_02" offsetX="-5" offsetY="35" ic="FF203653" width="174" height="214" img="entity\beasts\natchheadadapt2.png" left="-58" right="38" top="-16" bottom="98" />


<sprite id="mummy_dead" offsetY="12" ic="FF465E6A" img="entity\undead\mummy_dead.png" left="-58" right="59" />
<sprite id="mummy_body_01" offsetY="35" ic="FF313E48" width="104" height="142" img="entity\undead\mummy_body_01.png" left="-40" right="52" top="-51" bottom="23" />

<sprite id="mummy_bandages_01" offsetY="35" ic="FF1A242E" width="104" height="142" img="entity\undead\armor\mummy_bandages_01.png" left="-42" right="44" top="-50" bottom="10" />
<sprite id="mummy_bandages_01_damaged" offsetY="35" ic="FF19222C" width="104" height="142" img="entity\undead\armor\mummy_bandages_01_damaged.png" left="-42" right="44" top="-50" bottom="10" />
<sprite id="mummy_bandages_01_dead" offsetX="6" offsetY="10" f="64FE" ic="FF1B252F" width="191" height="185" img="entity\undead\armor\mummy_bandages_01_dead.png" left="-41" right="43" top="-45" bottom="11" />
<sprite id="mummy_bandages_02" offsetY="35" ic="FF1A222C" width="104" height="142" img="entity\undead\armor\mummy_bandages_02.png" left="-37" right="39" top="-50" bottom="8" />
<sprite id="mummy_bandages_02_damaged" offsetY="35" ic="FF19222B" width="104" height="142" img="entity\undead\armor\mummy_bandages_02_damaged.png" left="-37" right="39" top="-50" bottom="8" />
<sprite id="mummy_bandages_02_dead" offsetX="6" offsetY="10" f="64FE" ic="FF1B242E" width="191" height="185" img="entity\undead\armor\mummy_bandages_02_dead.png" left="-35" right="33" top="-44" bottom="16" />

<sprite id="mummy_dress_01" offsetY="35" ic="FF1A242E" width="104" height="142" img="entity\undead\armor\mummy_dress_01.png" left="-42" right="44" top="-50" bottom="10" />
<sprite id="mummy_dress_01_damaged" offsetY="35" ic="FF19222C" width="104" height="142" img="entity\undead\armor\mummy_dress_01_damaged.png" left="-42" right="44" top="-50" bottom="10" />
<sprite id="mummy_dress_01_dead" offsetX="6" offsetY="10" f="64FE" ic="FF1B252F" width="191" height="185" img="entity\undead\armor\mummy_dress_01_dead.png" left="-41" right="43" top="-45" bottom="11" />

<sprite id="mummy_plate_01" offsetY="35" ic="FF1A242E" width="104" height="142" img="entity\undead\armor\mummy_plate_01.png" left="-42" right="44" top="-50" bottom="10" />
<sprite id="mummy_plate_01_damaged" offsetY="35" ic="FF19222C" width="104" height="142" img="entity\undead\armor\mummy_plate_01_damaged.png" left="-42" right="44" top="-50" bottom="10" />
<sprite id="mummy_plate_01_dead" offsetX="6" offsetY="10" f="64FE" ic="FF1B252F" width="191" height="185" img="entity\undead\armor\mummy_plate_01_dead.png" left="-41" right="43" top="-45" bottom="11" />

<sprite id="mummy_royal_plate_01" offsetY="35" ic="FF1A242E" width="104" height="142" img="entity\undead\armor\mummy_royal_plate_01.png" left="-42" right="44" top="-50" bottom="10" />
<sprite id="mummy_royal_plate_01_damaged" offsetY="35" ic="FF19222C" width="104" height="142" img="entity\undead\armor\mummy_royal_plate_01_damaged.png" left="-42" right="44" top="-50" bottom="10" />
<sprite id="mummy_royal_plate_01_dead" offsetX="6" offsetY="10" f="64FE" ic="FF1B252F" width="191" height="185" img="entity\undead\armor\mummy_royal_plate_01_dead.png" left="-41" right="43" top="-45" bottom="11" />

<sprite id="bust_unhold_body_04_injured" offsetX="-5" offsetY="35" ic="FF181946" width="174" height="214" img="entity\beasts\bust_unhold_body_04_injured.png" left="-78" right="50" top="-48" bottom="62" />
<sprite id="bust_unhold_body_04" offsetX="-5" offsetY="35" ic="FF272C3A" width="174" height="214" img="entity\beasts\bust_unhold_body_04.png" left="-64" right="70" top="-67" bottom="83" />
<sprite id="bust_unhold_body_04_dead" offsetY="30" f="6403" ic="FF23283B" width="169" height="139" img="entity\beasts\bust_unhold_body_04_dead.png" left="-83" right="79" top="-70" bottom="62" />
<sprite id="bust_unhold_head_04" offsetX="-5" offsetY="35" f1="-30" f2="10" ic="FF39455B" width="174" height="214" img="entity\beasts\bust_unhold_head_04.png" left="-69" right="21" top="-24" bottom="68" />
<sprite id="bust_unhold_head_04_dead" offsetY="30" f1="40" f2="-20" ic="FF343E56" width="169" height="139" img="entity\beasts\bust_unhold_head_04_dead.png" left="4" right="76" top="-62" bottom="8" />
<sprite id="bust_unhold_head_04_dead_bloodpool" offsetY="30" f="6420" f1="40" f2="-20" width="169" height="139" img="entity\beasts\bust_unhold_head_04_dead_bloodpool.png" left="-9" right="85" top="-64" bottom="16" />
<sprite id="bust_unhold_body_04_dead_arrows" offsetY="30" f="6401" ic="FF444B4F" width="169" height="139" img="entity\beasts\bust_unhold_rock_body_01_dead_arrows.png" left="-19" right="53" top="-19" bottom="37" />
<sprite id="bust_unhold_body_04_dead_javelin" offsetY="30" f="6401" ic="FF141B29" width="169" height="139" img="entity\beasts\bust_unhold_rock_body_01_dead_javelin.png" left="-14" right="78" top="-2" bottom="54" />
<sprite id="bust_unhold_head_05" offsetX="-5" offsetY="35" f1="-30" f2="10" ic="FF39455B" width="174" height="214" img="entity\beasts\bust_unhold_head_05.png" left="-69" right="21" top="-24" bottom="68" />
<sprite id="bust_unhold_head_05_dead" offsetY="30" f1="40" f2="-20" ic="FF343E56" width="169" height="139" img="entity\beasts\bust_unhold_head_05_dead.png" left="4" right="76" top="-62" bottom="8" />
<sprite id="bust_unhold_head_05_dead_bloodpool" offsetY="30" f="6420" f1="40" f2="-20" width="169" height="139" img="entity\beasts\bust_unhold_head_04_dead_bloodpool.png" left="-9" right="85" top="-64" bottom="16" />
<sprite id="bust_unhold_head_06" offsetX="-5" offsetY="35" f1="-30" f2="10" ic="FF39455B" width="174" height="214" img="entity\beasts\bust_unhold_head_06.png" left="-69" right="21" top="-24" bottom="68" />
<sprite id="bust_unhold_head_06_dead" offsetY="30" f1="40" f2="-20" ic="FF343E56" width="169" height="139" img="entity\beasts\bust_unhold_head_06_dead.png" left="4" right="76" top="-62" bottom="8" />
<sprite id="bust_unhold_head_06_dead_bloodpool" offsetY="30" f="6420" f1="40" f2="-20" width="169" height="139" img="entity\beasts\bust_unhold_head_04_dead_bloodpool.png" left="-9" right="85" top="-64" bottom="16" />

<sprite id="bust_skeleton_body_01_injured" offsetY="35" ic="FF3C6073" width="104" height="142" img="entity\undead\bust_skeleton_body_injured.png" left="-37" right="33" top="-45" bottom="3" />
<sprite id="bust_skeleton_body_02_injured" offsetY="35" ic="FF3C6073" width="104" height="142" img="entity\undead\bust_skeleton_body_injured.png" left="-37" right="33" top="-45" bottom="3" />
"""

def makeBrushes():
    dirpath = os.path.join(os.path.dirname(os.path.abspath(__file__)), "unpacked", "legend_enemies")
    if not os.path.exists(dirpath):
        os.makedirs(dirpath)

    filepath = os.path.join(dirpath, "metadata.xml")
    F = open(filepath, "w")
    F.write('<brush name="gfx/legend_enemies.png" version="17">\n')
    F.write(enemies)

    for d in brush_only_layers:
        names = [d["name"]]
        if "min" in d:
            names = []
            for i in range(d["min"], d["max"] + 1):
                ind = "0" + str(i) if i < 10 else str(i)
                names.append(d["name"] + "_" + ind)

        for t in d["template"]:
            for name in names:
                if "suffix" in d:
                    name = name + "_" + d["suffix"]

                img = name
                if "img" in d :
                    img = d["img"]

                offsetX = 0
                if "offsetX" in d:
                    offsetX = d["offsetX"]

                f1 = 0
                if "f1" in d:
                    f1 = d["f1"]

                f2 = 0
                if "f2" in d:
                    f2 = d["f2"]

                opts = dict(
                    name=name,
                    w=d["w"],
                    h=d["h"],
                    left=d["left"],
                    right=d["right"],
                    top=d["top"],
                    bottom=d["bottom"],
                    offsetY=d["offsetY"],
                    offsetX=offsetX,
                    f1=f1,
                    f2=f2,
                    img=os.path.join("entity", d["entity"], img + ".png")
                    #dead_path=os.path.join("..", "entity", "goblins", name + "_dead.png")
                )
                s = Template(t)
                text = s.substitute(opts)
                text.replace("/", "\\")
                F.write(text)
    F.write('</brush>')
    F.close()

def main():
    makeBrushes()

main()



