
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
		this.m.Name = "TODO $name";
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
		this.m.Icon = "legend_helmets/$layer/$icon" + "_" + variant + ".png"
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
		this.m.Name = "TODO $name";
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
		this.m.Icon = "legend_helmets/$layer/$icon" + "_" + variant + ".png";
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
		this.m.Name = "TODO $name";
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
		this.m.Icon = "legend_helmets/$layer/$icon" + "_" + variant + ".png";
        this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});
'''
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
    {"name": "goblin_spiked_helm", "layer": "helm", "min": 1, "max": 1},
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
    {"name": "eyemask", "layer": "top", "min": 1, "max": 2},
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
    {"name": "faction_helmet", "layer": "vanity", "min": 1, "max": 12},
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
    {"name": "ponytail", "layer": "vanity", "min": 1, "max": 4},
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
        fpath = os.path.join("scripts", "items", "legend_helmets", layer, fname + ".nut")
        mfile = os.path.join(os.path.dirname(os.path.abspath(__file__)), fpath)
        F = open(mfile, "w+")
        variants = []
        for x in range(d["max"]):
            variants.append(x+1)
        opts = dict(
            name=fname,
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

        print('"' + layer + "/" + fname + '",')

main()
