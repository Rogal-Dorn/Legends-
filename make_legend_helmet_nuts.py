
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
		this.m.Name = "$rname";
		this.m.Description = "TODO $name";
        this.m.Variant = 1;
		this.m.Variants = $variants;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 200;
		this.m.Condition = 80;
		this.m.ConditionMax = 80;
		this.m.StaminaModifier = -4;
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
		this.m.Name = "$rname";
		this.m.Description = "TODO $name";
        this.m.ArmorDescription = this.m.Description;
        this.m.Variant = 1;
		this.m.Variants = $variants;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 200;
		this.m.Condition = 80;
		this.m.ConditionMax = 80;
		this.m.StaminaModifier = -4;
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

LowerVanityLayer = '''
this.$name <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
        this.m.Type = this.Const.Items.HelmetUpgrades.$type;
		this.m.ID = "$id";
		this.m.Name = "$rname";
		this.m.Description = "TODO $name";
        this.m.ArmorDescription = this.m.Description;
        this.m.Variant = 1;
		this.m.Variants = $variants;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 200;
		this.m.Condition = 80;
		this.m.ConditionMax = 80;
		this.m.StaminaModifier = -4;
        this.m.IsLowerVanity = true;
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
    {"name": "barb_chain_scarf",    "layer": "hood", "min": 1, "max": 5, "base": True, "title": "Barb Chain Scarf"},
    {"name": "chain_hood",          "layer": "hood", "min": 1, "max": 4, "base": True, "title": "Chain Hood"},
    {"name": "chain_hood_full",     "layer": "hood", "min": 1, "max": 6, "base": True, "title": "Full Chain Hood"},
    {"name": "chain_scarf",         "layer": "hood", "min": 1, "max": 5, "base": True, "title": "Chain Scarf"},
    {"name": "cloth_scarf",         "layer": "hood", "min": 1, "max": 5, "base": True, "title": "Cloth Scarf"},
    {"name": "goblin_scarf",        "layer": "hood", "min": 1, "max": 4, "base": True, "title": "Goblin Scarf"},
    {"name": "leather_hood",        "layer": "top", "min": 1, "max": 5, "base": True, "title": "Leather Hood"},
    {"name": "padded_hood",         "layer": "hood", "min": 1, "max": 3, "base": True, "title": "Padded Hood"},
    {"name": "patched_hood",        "layer": "hood", "min": 1, "max": 1, "base": True, "title": "Patched Hood"},
    {"name": "rotten_chain_scarf",  "layer": "hood", "min": 1, "max": 5, "base": True, "title": "Rotten Chain Scarf"},
    {"name": "simple_hood",         "layer": "hood", "min": 1, "max": 5, "base": True, "title": "Simple Hood"},
    {"name": "padded_cap",          "layer": "hood", "min": 1, "max": 1, "base": True, "title": "Padded Cap"},
    {"name": "hood_cloth_round",    "layer": "hood", "min": 1, "max": 1, "base": True, "title": "Round Hood Cloth"},
    {"name": "hood_cloth_square",   "layer": "hood", "min": 1, "max": 1, "base": True, "title": "Square Hood Cloth"},
    {"name": "hood_cloth_wide",     "layer": "hood", "min": 1, "max": 2, "base": True, "title": "Wide Hood Cloth"},
    {"name": "cloth_long_hood",     "layer": "hood", "min": 1, "max": 4, "base": True, "title": "Cloth Long Hood"},
    {"name": "cloth_bandana",       "layer": "hood", "min": 1, "max": 5, "base": True, "title": "Cloth Bandana"},
    {"name": "leather_cap",         "layer": "hood", "min": 1, "max": 1, "base": True, "title": "Leather Cap"},

    {"name": "ancient_beard_mask",                  "layer": "helm", "min": 1, "max": 1, "title": "Ancient Beard Mask"},
    {"name": "ancient_conic_helm",                  "layer": "helm", "min": 1, "max": 1, "title": "Ancient Conic Helm"},
    {"name": "ancient_crested",                     "layer": "helm", "min": 1, "max": 1, "title": "Ancient Crested Helm"},
    {"name": "ancient_crown",                       "layer": "top", "min": 1, "max": 1, "title": "Ancient Crown"},
    {"name": "ancient_dome",                        "layer": "helm", "min": 1, "max": 1, "title": "Ancient Dome"},
    {"name": "ancient_dome_tailed",                 "layer": "helm", "min": 1, "max": 1, "title": "Tailed Ancient Dome"},
    {"name": "ancient_face_helm",                   "layer": "helm", "min": 1, "max": 1, "title": "Ancient Face Helm"},
    {"name": "ancient_face_plate",                  "layer": "helm", "min": 1, "max": 1, "title": "Ancient Face Plate"},
    {"name": "ancient_kettle",                      "layer": "helm", "min": 1, "max": 3, "title": "Ancient Kettle"},
    {"name": "ancient_legionaire",                  "layer": "helm", "min": 1, "max": 1, "title": "Ancient Legionaire Helm"},
    {"name": "ancient_lion_mask",                   "layer": "helm", "min": 1, "max": 1, "title": "Ancient Lion Mask"},
    {"name": "ancient_mask",                        "layer": "helm", "min": 1, "max": 1, "title": "Ancient Mask"},
    {"name": "ancient_side_hawk",                   "layer": "helm", "min": 1, "max": 1, "title": "Ancient Side Hawk"},
    {"name": "ancient_tailed_conic_helm",           "layer": "helm", "min": 1, "max": 1, "title": "Ancient Tailed Conic Helm"},
    {"name": "barbute",                             "layer": "helm", "min": 1, "max": 7, "title": "Barbute"},
    {"name": "basinet",                             "layer": "helm", "min": 1, "max": 7, "title": "Basinet"},
    {"name": "carthaginian",                        "layer": "helm", "min": 1, "max": 3, "title": "Carthaginian"},
    {"name": "conic_helm",                          "layer": "helm", "min": 1, "max": 6, "title": "Conic Helm"},
    {"name": "crude_cylinder_helm",                 "layer": "helm", "min": 1, "max": 2, "title": "Crude Cylinder Helm"},
    {"name": "crude_metal_helm",                    "layer": "helm", "min": 1, "max": 3, "title": "Crude Metal Helm"},
    {"name": "crude_skull_helm",                    "layer": "helm", "min": 1, "max": 1, "title": "Crude Skull Helm"},
    {"name": "flat_top_face_plate",                 "layer": "helm", "min": 1, "max": 6, "title": "Flat Top Face Plate"},
    {"name": "flat_top_helm",                       "layer": "helm", "min": 1, "max": 6, "title": "Flat Top Helm"},
    {"name": "goblin_chain_helm",                   "layer": "helm", "min": 1, "max": 1, "title": "Goblin Chain Helm"},
    {"name": "goblin_leather_helm",                 "layer": "helm", "min": 1, "max": 1, "title": "Goblin Leather Helm"},
    {"name": "goblin_leather_mask",                 "layer": "helm", "min": 1, "max": 1, "title": "Goblin Leather Mask"},
    {"name": "goblin_spiked_helm",                  "layer": "helm", "min": 1, "max": 1, "title": "Goblin Spiked Helm"},
    {"name": "golden_helm",                         "layer": "helm", "min": 1, "max": 1, "title": "Golden Helm"},
    {"name": "great_helm",                          "layer": "helm", "min": 1, "max": 6, "title": "Great Helm"},
    {"name": "heavy_plate_helm",                    "layer": "helm", "min": 1, "max": 2, "title": "Heavy Plate Helm"},
    {"name": "heavy_spiked_helm",                   "layer": "helm", "min": 1, "max": 1, "title": "Heavy Spiked Helm"},
    {"name": "horsetail",                           "layer": "helm", "min": 1, "max": 6, "title": "Horsetail"},
    {"name": "kettle_helm",                         "layer": "helm", "min": 1, "max": 6, "title": "Kettle Helm"},
    {"name": "legend_ancient_gladiator",            "layer": "helm", "min": 1, "max": 1, "title": "Ancient Gladiator Helm"},
    {"name": "legend_ancient_legionaire_restored",  "layer": "helm", "min": 1, "max": 1, "title": "Restored Ancient Legionaire"},
    {"name": "legend_frogmouth",                    "layer": "helm", "min": 1, "max": 3, "title": "Frogmouth"},
    {"name": "nordic_helm",                         "layer": "helm", "min": 1, "max": 6, "title": "Nordic Helm"},
    {"name": "norman_helm",                         "layer": "helm", "min": 1, "max": 5, "title": "Norman Helm"},
    {"name": "orc_double_helm",                     "layer": "helm", "min": 1, "max": 1, "title": "Orc Double Helm"},
    {"name": "orc_great_helm",                      "layer": "helm", "min": 1, "max": 1, "title": "Orc Great Helm"},
    {"name": "orc_horn_mask",                       "layer": "helm", "min": 1, "max": 1, "title": "Orc Horn Mask"},
    {"name": "orc_leather_mask",                    "layer": "helm", "min": 1, "max": 1, "title": "Orc Leather Mask"},
    {"name": "orc_metal_mask",                      "layer": "helm", "min": 1, "max": 1, "title": "Orc Metal Mask"},
    {"name": "orc_strapped_helm",                   "layer": "helm", "min": 1, "max": 1, "title": "Orc Strapped Helm"},

    {"name": "rotten_flat_top_face_mask",   "layer": "helm", "min": 1, "max": 5,  "title": "Rotten Flat Top Face Mask"},
    {"name": "rotten_great_helm",           "layer": "helm", "min": 1, "max": 4,  "title": "Rotten Great Helm"},
    {"name": "sallet",                      "layer": "helm", "min": 1, "max": 6,  "title": "Sallet"},
    {"name": "skin_helm",                   "layer": "helm", "min": 1, "max": 1,  "title": "Skin Helm"},
    {"name": "stag_helm",                   "layer": "helm", "min": 1, "max": 1,  "title": "Stag Helm"},
    {"name": "swan_helm",                   "layer": "helm", "min": 1, "max": 1,  "title": "Swan Helm"},
    {"name": "tailed_conic",                "layer": "helm", "min": 1, "max": 1,  "title": "Tailed Conic"},
    {"name": "viking_helm",                 "layer": "helm", "min": 1, "max": 6,  "title": "Viking Helm"},
    {"name": "sack",                        "layer": "helm", "min": 1, "max": 12, "title": "Sack"},

    {"name": "goblin_leaf_helm",        "layer": "top", "min": 1, "max": 1, "title": "Goblin Leaf Helm"},
    {"name": "vampire_crown",           "layer": "top", "min": 1, "max": 1, "title": "Vampire Crown"},
    {"name": "chain_attachment",        "layer": "top", "min": 1, "max": 1, "title": "Chain Attachment"},
    {"name": "cult_hood",               "layer": "helm", "min": 1, "max": 7, "title": "Cult Hood"},
    {"name": "eyemask",                 "layer": "top", "min": 1, "max": 2, "title": "Eyemask"},
    {"name": "facemask",                "layer": "top", "min": 1, "max": 6, "title": "Facemask"},
    {"name": "faceplate_full",          "layer": "top", "min": 1, "max": 1, "title": "Full Faceplate"},
    {"name": "faceplate_gold",          "layer": "top", "min": 1, "max": 1, "title": "Gold Faceplate"},
    {"name": "faceplate_long",          "layer": "top", "min": 1, "max": 1, "title": "Long Faceplate"},
    {"name": "faceplate_pointed",       "layer": "top", "min": 1, "max": 1, "title": "Pointed Faceplate"},
    {"name": "faceplate_raised",        "layer": "top", "min": 1, "max": 2, "title": "Raised Faceplate"},
    {"name": "faceplate_short",         "layer": "top", "min": 1, "max": 1, "title": "Short Faceplate"},
    {"name": "faceplate_snub_nose",     "layer": "top", "min": 1, "max": 1, "title": "Snub Nose Faceplate"},
    {"name": "faceplate_winged",        "layer": "top", "min": 1, "max": 1, "title": "Winged Faceplate"},
    {"name": "goblin_gillie",           "layer": "top", "min": 1, "max": 1, "title": "Goblin Gillie"},
    {"name": "goblin_leaves",           "layer": "top", "min": 1, "max": 1, "title": "Goblin Leaves"},
    {"name": "headband_nose",           "layer": "top", "min": 1, "max": 1, "title": "Headband Nose"},
    {"name": "headband_side",           "layer": "top", "min": 1, "max": 1, "title": "Headband Side"},
    {"name": "leather_hood_barb",       "layer": "top", "min": 1, "max": 1, "title": "Leather Hood Barb"},
    {"name": "nose_plate",              "layer": "top", "min": 1, "max": 1, "title": "Nose Plate"},

    {"name": "antler",              "layer": "vanity", "min": 1, "max": 1,   "title": "Antler"},
    {"name": "bear_head",           "layer": "vanity", "min": 1, "max": 1,   "title": "Bear Head"},
    {"name": "beret",               "layer": "vanity", "min": 1, "max": 1,   "title": "Beret"},
    {"name": "bull_horns",          "layer": "vanity", "min": 1, "max": 1,   "title": "Bull Horns"},
    {"name": "crown",               "layer": "vanity", "min": 1, "max": 1,   "title": "Crown"},
    {"name": "faction_helmet",      "layer": "vanity", "min": 1, "max": 12,  "title": "Faction Helmet"},
    {"name": "faction_helmet_2",    "layer": "vanity", "min": 1, "max": 10,  "title": "Faction Helmet"},
    {"name": "feather_band",        "layer": "vanity", "min": 1, "max": 2,   "title": "Feather Band"},
    {"name": "feathered_hat",       "layer": "vanity", "min": 1, "max": 1,   "title": "Feathered Hat"},
    {"name": "fencer_hat",          "layer": "vanity", "min": 1, "max": 1,   "title": "Fencer Hat"},
    {"name": "goat_horns",          "layer": "vanity", "min": 1, "max": 1,   "title": "Goat Horns"},
    {"name": "headband",            "layer": "vanity", "min": 1, "max": 16,  "title": "Headband"},
    {"name": "horn_decorations",    "layer": "vanity", "min": 1, "max": 2,   "title": "Horn Decorations"},
    {"name": "hunter_cap",          "layer": "vanity", "min": 1, "max": 1,   "title": "Hunter Cap"},
    {"name": "impaled_head",        "layer": "vanity", "min": 1, "max": 1,   "title": "Impaled Head"},
    {"name": "jester_hat",          "layer": "vanity", "min": 1, "max": 65,  "title": "Jester Hat"},
    {"name": "metal_bird",          "layer": "vanity", "min": 1, "max": 2,   "title": "Metal Bird"},
    {"name": "noble_buckle",        "layer": "vanity", "min": 1, "max": 1,   "title": "Noble Buckle"},
    {"name": "noble_feather",       "layer": "vanity", "min": 1, "max": 4,   "title": "Noble Feather"},
    {"name": "noble_floppy_hat",    "layer": "vanity", "min": 1, "max": 1,   "title": "Noble Floppy Hat"},
    {"name": "noble_hat",           "layer": "vanity", "min": 1, "max": 1,   "title": "Noble Hat"},
    {"name": "noble_hood",          "layer": "vanity", "min": 1, "max": 1,   "title": "Noble Hood"},
    {"name": "wreath",              "layer": "vanity", "min": 1, "max": 2,   "title": "Wreath"},
    {"name": "orc_bones",           "layer": "vanity", "min": 1, "max": 1,   "title": "Orc Bones"},
    {"name": "plait",               "layer": "vanity", "min": 1, "max": 12,  "title": "Plait"},
    {"name": "ponytail",            "layer": "vanity", "min": 1, "max": 4,   "title": "Ponytail"},
    {"name": "ram_horns",           "layer": "vanity", "min": 1, "max": 1,   "title": "Ram Horns"},
    {"name": "side_feather",        "layer": "vanity", "min": 1, "max": 5,   "title": "Side Feather"},
    {"name": "straw_hat",           "layer": "vanity", "min": 1, "max": 1,   "title": "Straw Hat"},
    {"name": "top_feather",         "layer": "vanity", "min": 1, "max": 5,   "title": "Top Feather"},
    {"name": "witchhunter_helm",    "layer": "vanity", "min": 1, "max": 7,   "title": "Witchhunter Helm"},
    {"name": "wizard_cowl",         "layer": "vanity", "min": 1, "max": 20,  "title": "Wizard Cowl"},
    {"name": "wolf_helm",           "layer": "vanity", "min": 1, "max": 1,   "title": "Wolf Helm"},

    {"name": "back_crest",      "layer": "vanity", "lowervanity": True, "min": 1, "max": 4, "title": "Back Crest"},
    {"name": "back_feathers",   "layer": "vanity", "lowervanity": True, "min": 1, "max": 4, "title": "Back Feathers"},
    {"name": "feather_crest",   "layer": "vanity", "lowervanity": True, "min": 1, "max": 5, "title": "Feather Crest"},
    {"name": "knotted_tail",    "layer": "vanity", "lowervanity": True, "min": 1, "max": 4, "title": "Knotted Tail"},
    {"name": "orc_tail",        "layer": "vanity", "lowervanity": True, "min": 1, "max": 2, "title": "Orc Tail"},
    {"name": "wings",           "layer": "vanity", "lowervanity": True, "min": 1, "max": 6, "title": "Wings"}
]

def main():
    for d in layers:

        layer = d["layer"]

        temp = Layer
        if "base" in d:
            temp = BaseLayer
        if "lowervanity" in d:
            temp = LowerVanityLayer
            layer += "_lower"

        fname = "legend_helmet_" + d["name"]
        dirpath = os.path.join(os.path.dirname(os.path.abspath(__file__)), "scripts", "items", "legend_helmets", layer)
        if not os.path.exists(dirpath):
            os.makedirs(dirpath)

        filepath = os.path.join(dirpath, fname + ".nut")
        F = open(filepath, "w")
        variants = []
        for x in range(d["max"]):
            variants.append(x+1)
        # rname = d["name"]
        # rname = rname.replace("_", " ")
        # rname = rname.title()
        # testname = rname
        # testname = testname.split()[-1]
        # if testname == 'Tailed':
        #     print(testname)
        #     print(rname)
        #     rname = "Tailed " + rname.rsplit(' ', 1)[0]
        # if testname == 'Crested':
        #     rname = rname + " Helm"
        # if testname == 'Restored':
        #     rname = "Restored " + rname.rsplit(' ', 1)[0]
        # rname = rname.replace('Legend ', '')
        opts = dict(
            name=fname,
            rname=d["title"],
            id="armor.head." + fname,
            variants = variants,
            layer = layer,
            type= d["layer"].capitalize(),
            brush = "legendhelms_" + d["name"],
            icon = "inventory_" + d["name"],
            lower = "lower" in d
        )
        s = Template(temp)
        text = s.substitute(opts)
        #text.replace("/", "\\")
        F.write(text)
        F.close()

        #print('"' + layer + "/" + fname + '",')

main()
