
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
    {"name": "bust_legend_plate_full_greaves_named", "layer": "plate", "min" : 1 , "max" : 3},
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

    F.write('</brush>\n')
    F.close()


main()
