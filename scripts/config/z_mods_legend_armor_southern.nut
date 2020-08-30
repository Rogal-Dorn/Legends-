local gt = this.getroottable();

if (!("LegendMod" in gt.Const))
{
	gt.Const.LegendMod <- {};
}

if (!("ArmorObjs" in gt.Const.LegendMod))
{
    gt.Const.LegendMod.ArmorObjs <- [];
}

gt.Const.LegendMod.ArmorObjs.extend([
{
    ID = "oriental/assassin_robe", // 120
    Script = "",
    Sets = [{
        Cloth = [
            [1, "cloth/legend_ancient_cloth"],// 30
            [1, "cloth/legend_ancient_cloth_restored"],// 35
            [1, "cloth/legend_apron_butcher"],// 30
            [1, "cloth/legend_apron"],// 35
            [1, "cloth/legend_gambeson"],// 65
            [1, "cloth/legend_gambeson_plain"],// 65
            [1, "cloth/legend_gambeson_wolf"],// 70
            [1, "cloth/legend_gambeson_named"],// 70
            [1, "cloth/legend_padded_surcoat"],// 55
            [1, "cloth/legend_padded_surcoat_plain"],// 55
            [1, "cloth/legend_peasant_dress"],// 25
            [1, "cloth/legend_robes"],// 25
            [1, "cloth/legend_robes_magic"],// 40
            [1, "cloth/legend_robes_wizard"],// 30
            [1, "cloth/legend_robes_nun"],// 22
            [1, "cloth/legend_sackcloth_tattered"],// 5
            [1, "cloth/legend_sackcloth"],// 10
            [1, "cloth/legend_sackcloth_patched"],// 15
            [1, "cloth/legend_thick_tunic"],// 30
            [1, "cloth/legend_tunic"],// 20
            [1, "cloth/legend_tunic_wrap"],// 20
            [1, "cloth/legend_tunic_collar_thin"],// 20
            [1, "cloth/legend_tunic_collar_deep"],// 20
            [1, "cloth/legend_dark_tunic"],// 35
            [1, "cloth/legend_tunic_noble"],// 40
            [1, "cloth/legend_tunic_noble_named"],// 40
            [1, "cloth/legend_southern_robe"],// 25
            [1, "cloth/legend_southern_gambeson"],// 65
            [1, "cloth/legend_southern_split_gambeson"],// 65
            [1, "cloth/legend_southern_tunic"],// 25
            [1, "cloth/legend_southern_noble_surcoat"],// 55
        ],
        Chain = [
            [1, "chain/legend_armor_ancient_double_mail"],// 80
            [1, "chain/legend_armor_ancient_mail"],// 35
            [1, "chain/legend_armor_basic_mail"],// 85
            [1, "chain/legend_armor_hauberk"],// 95
            [1, "chain/legend_armor_hauberk_full"],// 115
            [1, "chain/legend_armor_hauberk_full_named"],// 120
            [1, "chain/legend_armor_hauberk_sleevless"],// 65
            [1, "chain/legend_armor_mail_shirt"],// 50
            [1, "chain/legend_armor_mail_shirt_simple"],// 25
            [1, "chain/legend_armor_reinforced_mail"],// 110
            [1, "chain/legend_armor_reinforced_mail_shirt"],// 80
            [1, "chain/legend_armor_reinforced_rotten_mail_shirt"],// 45
            [1, "chain/legend_armor_reinforced_worn_mail"],// 105
            [1, "chain/legend_armor_reinforced_worn_mail_shirt"],// 65
            [1, "chain/legend_armor_rusty_mail_shirt"],// 20
            [1, "chain/legend_armor_short_mail"],// 60
            [1, "chain/legend_southern_cloth"],// 30
            [1, "chain/legend_southern_padded_chest"],// 45
            [1, "chain/legend_southern_mail"],// 100
        ],
        Plate = [
            [1, "plate/legend_armor_leather_brigandine"],// 65
            [1, "plate/legend_armor_leather_brigandine_hardened"],// 110
            [1, "plate/legend_armor_leather_brigandine_hardened_full"],// 140
            [1, "plate/legend_armor_leather_brigandine_named"],// 75
            [1, "plate/legend_armor_leather_jacket"],// 25
            [1, "plate/legend_armor_leather_jacket_named"],// 30
            [1, "plate/legend_armor_leather_studded_jacket_named"],// 30
            [1, "plate/legend_armor_leather_jacket_simple"],// 15
            [1, "plate/legend_armor_leather_lamellar"],// 50
            [1, "plate/legend_armor_leather_lamellar_harness_heavy"],// 130
            [1, "plate/legend_armor_leather_lamellar_harness_reinforced"],// 150
            [1, "plate/legend_armor_leather_lamellar_heavy"],// 165
            [1, "plate/legend_armor_leather_lamellar_heavy_named"],// 140
            [1, "plate/legend_armor_leather_lamellar_reinforced"],// 55
            [1, "plate/legend_armor_leather_noble"],// 65
            [1, "plate/legend_armor_leather_padded"],// 40
            [1, "plate/legend_armor_leather_riveted"],// 95
            [1, "plate/legend_armor_leather_riveted_light"],// 80
            [1, "plate/legend_armor_leather_scale"],// 70
            [1, "plate/legend_armor_plate_ancient_chest"],// 105
            [1, "plate/legend_armor_plate_ancient_chest_restored"],// 110
            [1, "plate/legend_armor_plate_ancient_gladiator"],// 35
            [1, "plate/legend_armor_plate_ancient_harness"],// 115
            [1, "plate/legend_armor_plate_ancient_mail"],// 45
            [1, "plate/legend_armor_plate_ancient_scale"],// 105
            [1, "plate/legend_armor_plate_ancient_scale_coat"],// 140
            [1, "plate/legend_armor_plate_ancient_scale_harness"],// 75
            [1, "plate/legend_armor_plate_chest"],// 125
            [1, "plate/legend_armor_plate_chest_rotten"],// 100
            [1, "plate/legend_armor_plate_cuirass"],// 150
            [1, "plate/legend_armor_plate_full"],// 160
            [1, "plate/legend_armor_plate_full_greaves"],// 170
            [1, "plate/legend_armor_plate_full_greaves_named"],// 170
            [1, "plate/legend_armor_plate_full_greaves_painted"],// 170
            [1, "plate/legend_armor_scale"],// 100
            [1, "plate/legend_armor_scale_coat"],// 120
            [1, "plate/legend_armor_scale_coat_named"],// 160
            [1, "plate/legend_armor_scale_coat_rotten"],// 60
            [1, "plate/legend_armor_scale_shirt"],// 85
            [1, "plate/legend_animal_hide_armor"],// 30
            [1, "plate/legend_heavy_iron_armor"],// 120
            [1, "plate/legend_hide_and_bone_armor"],// 80
            [1, "plate/legend_reinforced_animal_hide_armor"],// 55
            [1, "plate/legend_rugged_scale_armor"],// 95
            [1, "plate/legend_scrap_metal_armor"],// 65
            [1, "plate/legend_thick_furs_armor"],// 10
            [1, "plate/legend_thick_plated_barbarian_armor"],// 155
            [1, "plate/legend_southern_named_golden_plates"],// 155
            [1, "plate/legend_southern_named_plates"],// 155
            [1, "plate/legend_southern_plate_full"],// 155
            [1, "plate/legend_southern_plate"],// 155
            [1, "plate/legend_southern_padded"],// 155
            [1, "plate/legend_southern_arm_guards"],// 155
            [1, "plate/legend_southern_strips"],// 155
            [1, "plate/legend_southern_leather_jacket"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
            [1, "plate/legend_southern_leather_scale"],// 155
            [1, "plate/legend_southern_scale"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
        ],
        Cloak = [
            [1, "cloak/legend_shoulder_cloth"],// 5
            [1, "cloak/legend_noble_shawl"],// 10
            [1, "cloak/legend_dark_wooly_cloak"],// 15
            [1, "cloak/legend_armor_cloak_common"],// 10
            [1, "cloak/legend_armor_cloak_heavy"],// 30
            [1, "cloak/legend_armor_cloak_crusader"],// 35
            [1, "cloak/legend_armor_cloak_noble"],// 25
            [1, "cloak/legend_sash"],// 3
            [1, "cloak/legend_southern_scarf"],// 5
            [1, "cloak/legend_animal_pelt"],// 15
            [1, "cloak/legend_southern_scarf_wrap"],// 15
        ],
        Tabard = [
            [1, "tabard/legend_common_tabard"],// 5
            [1, "tabard/legend_noble_tabard"],// 10
            [1, "tabard/legend_tattered_tabard"],// 2
            [1, "tabard/legend_southern_wrap_right"],// 2
            [1, "tabard/legend_southern_wrap_left"],// 2
            [1, "tabard/legend_southern_wide_belt"],// 2
            [1, "tabard/legend_noble_vest"],// 10
            [1, "tabard/legend_southern_wrap"],// 5
            [1, "tabard/legend_southern_shoulder_cloth"],// 5
            [1, "tabard/legend_southern_overcloth"],// 10
            [1, "tabard/legend_southern_tabard"],// 5
        ],
        Attachments =[
        ]
    }]
},{
    ID = "oriental/cloth_sash", // 20
    Script = "",
    Sets = [{
        Cloth = [
            [1, "cloth/legend_ancient_cloth"],// 30
            [1, "cloth/legend_ancient_cloth_restored"],// 35
            [1, "cloth/legend_apron_butcher"],// 30
            [1, "cloth/legend_apron"],// 35
            [1, "cloth/legend_gambeson"],// 65
            [1, "cloth/legend_gambeson_plain"],// 65
            [1, "cloth/legend_gambeson_wolf"],// 70
            [1, "cloth/legend_gambeson_named"],// 70
            [1, "cloth/legend_padded_surcoat"],// 55
            [1, "cloth/legend_padded_surcoat_plain"],// 55
            [1, "cloth/legend_peasant_dress"],// 25
            [1, "cloth/legend_robes"],// 25
            [1, "cloth/legend_robes_magic"],// 40
            [1, "cloth/legend_robes_wizard"],// 30
            [1, "cloth/legend_robes_nun"],// 22
            [1, "cloth/legend_sackcloth_tattered"],// 5
            [1, "cloth/legend_sackcloth"],// 10
            [1, "cloth/legend_sackcloth_patched"],// 15
            [1, "cloth/legend_thick_tunic"],// 30
            [1, "cloth/legend_tunic"],// 20
            [1, "cloth/legend_tunic_wrap"],// 20
            [1, "cloth/legend_tunic_collar_thin"],// 20
            [1, "cloth/legend_tunic_collar_deep"],// 20
            [1, "cloth/legend_dark_tunic"],// 35
            [1, "cloth/legend_tunic_noble"],// 40
            [1, "cloth/legend_tunic_noble_named"],// 40
            [1, "cloth/legend_southern_robe"],// 25
            [1, "cloth/legend_southern_gambeson"],// 65
            [1, "cloth/legend_southern_split_gambeson"],// 65
            [1, "cloth/legend_southern_tunic"],// 25
            [1, "cloth/legend_southern_noble_surcoat"],// 55
        ],
        Chain = [
           [1, "chain/legend_armor_ancient_mail"],// 35
            [1, "chain/legend_armor_basic_mail"],// 85
            [1, "chain/legend_armor_hauberk"],// 95
            [1, "chain/legend_armor_hauberk_full"],// 115
            [1, "chain/legend_armor_hauberk_full_named"],// 120
            [1, "chain/legend_armor_hauberk_sleevless"],// 65
            [1, "chain/legend_armor_mail_shirt"],// 50
            [1, "chain/legend_armor_mail_shirt_simple"],// 25
            [1, "chain/legend_armor_reinforced_mail"],// 110
            [1, "chain/legend_armor_reinforced_mail_shirt"],// 80
            [1, "chain/legend_armor_reinforced_rotten_mail_shirt"],// 45
            [1, "chain/legend_armor_reinforced_worn_mail"],// 105
            [1, "chain/legend_armor_reinforced_worn_mail_shirt"],// 65
            [1, "chain/legend_armor_rusty_mail_shirt"],// 20
            [1, "chain/legend_armor_short_mail"],// 60
            [1, "chain/legend_southern_cloth"],// 30
            [1, "chain/legend_southern_padded_chest"],// 45
            [1, "chain/legend_southern_mail"],// 100
        ],
        Plate = [
            [1, "plate/legend_armor_leather_brigandine"],// 65
            [1, "plate/legend_armor_leather_brigandine_hardened"],// 110
            [1, "plate/legend_armor_leather_brigandine_hardened_full"],// 140
            [1, "plate/legend_armor_leather_brigandine_named"],// 75
            [1, "plate/legend_armor_leather_jacket"],// 25
            [1, "plate/legend_armor_leather_jacket_named"],// 30
            [1, "plate/legend_armor_leather_studded_jacket_named"],// 30
            [1, "plate/legend_armor_leather_jacket_simple"],// 15
            [1, "plate/legend_armor_leather_lamellar"],// 50
            [1, "plate/legend_armor_leather_lamellar_harness_heavy"],// 130
            [1, "plate/legend_armor_leather_lamellar_harness_reinforced"],// 150
            [1, "plate/legend_armor_leather_lamellar_heavy"],// 165
            [1, "plate/legend_armor_leather_lamellar_heavy_named"],// 140
            [1, "plate/legend_armor_leather_lamellar_reinforced"],// 55
            [1, "plate/legend_armor_leather_noble"],// 65
            [1, "plate/legend_armor_leather_padded"],// 40
            [1, "plate/legend_armor_leather_riveted"],// 95
            [1, "plate/legend_armor_leather_riveted_light"],// 80
            [1, "plate/legend_armor_leather_scale"],// 70
            [1, "plate/legend_armor_plate_ancient_chest"],// 105
            [1, "plate/legend_armor_plate_ancient_chest_restored"],// 110
            [1, "plate/legend_armor_plate_ancient_gladiator"],// 35
            [1, "plate/legend_armor_plate_ancient_harness"],// 115
            [1, "plate/legend_armor_plate_ancient_mail"],// 45
            [1, "plate/legend_armor_plate_ancient_scale"],// 105
            [1, "plate/legend_armor_plate_ancient_scale_coat"],// 140
            [1, "plate/legend_armor_plate_ancient_scale_harness"],// 75
            [1, "plate/legend_armor_plate_chest"],// 125
            [1, "plate/legend_armor_plate_chest_rotten"],// 100
            [1, "plate/legend_armor_plate_cuirass"],// 150
            [1, "plate/legend_armor_plate_full"],// 160
            [1, "plate/legend_armor_plate_full_greaves"],// 170
            [1, "plate/legend_armor_plate_full_greaves_named"],// 170
            [1, "plate/legend_armor_plate_full_greaves_painted"],// 170
            [1, "plate/legend_armor_scale"],// 100
            [1, "plate/legend_armor_scale_coat"],// 120
            [1, "plate/legend_armor_scale_coat_named"],// 160
            [1, "plate/legend_armor_scale_coat_rotten"],// 60
            [1, "plate/legend_armor_scale_shirt"],// 85
            [1, "plate/legend_animal_hide_armor"],// 30
            [1, "plate/legend_heavy_iron_armor"],// 120
            [1, "plate/legend_hide_and_bone_armor"],// 80
            [1, "plate/legend_reinforced_animal_hide_armor"],// 55
            [1, "plate/legend_rugged_scale_armor"],// 95
            [1, "plate/legend_scrap_metal_armor"],// 65
            [1, "plate/legend_thick_furs_armor"],// 10
            [1, "plate/legend_thick_plated_barbarian_armor"],// 155
            [1, "plate/legend_southern_named_golden_plates"],// 155
            [1, "plate/legend_southern_named_plates"],// 155
            [1, "plate/legend_southern_plate_full"],// 155
            [1, "plate/legend_southern_plate"],// 155
            [1, "plate/legend_southern_padded"],// 155
            [1, "plate/legend_southern_arm_guards"],// 155
            [1, "plate/legend_southern_strips"],// 155
            [1, "plate/legend_southern_leather_jacket"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
            [1, "plate/legend_southern_leather_scale"],// 155
            [1, "plate/legend_southern_scale"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
        ],
        Cloak = [
            [1, "cloak/legend_shoulder_cloth"],// 5
            [1, "cloak/legend_noble_shawl"],// 10
            [1, "cloak/legend_dark_wooly_cloak"],// 15
            [1, "cloak/legend_armor_cloak_common"],// 10
            [1, "cloak/legend_armor_cloak_heavy"],// 30
            [1, "cloak/legend_armor_cloak_crusader"],// 35
            [1, "cloak/legend_armor_cloak_noble"],// 25
            [1, "cloak/legend_sash"],// 3
            [1, "cloak/legend_southern_scarf"],// 5
            [1, "cloak/legend_animal_pelt"],// 15
            [1, "cloak/legend_southern_scarf_wrap"],// 15
        ],
        Tabard = [
            [1, "tabard/legend_common_tabard"],// 5
            [1, "tabard/legend_noble_tabard"],// 10
            [1, "tabard/legend_tattered_tabard"],// 2
            [1, "tabard/legend_southern_wrap_right"],// 2
            [1, "tabard/legend_southern_wrap_left"],// 2
            [1, "tabard/legend_southern_wide_belt"],// 2
            [1, "tabard/legend_noble_vest"],// 10
            [1, "tabard/legend_southern_wrap"],// 5
            [1, "tabard/legend_southern_shoulder_cloth"],// 5
            [1, "tabard/legend_southern_overcloth"],// 10
            [1, "tabard/legend_southern_tabard"],// 5
        ],
        Attachments =[
        ]
    }]
},{
    ID = "oriental/gladiator_harness", // 40
    Script = "",
    Sets = [{
        Cloth = [
            [1, "cloth/legend_ancient_cloth"],// 30
            [1, "cloth/legend_ancient_cloth_restored"],// 35
            [1, "cloth/legend_apron_butcher"],// 30
            [1, "cloth/legend_apron"],// 35
            [1, "cloth/legend_gambeson"],// 65
            [1, "cloth/legend_gambeson_plain"],// 65
            [1, "cloth/legend_gambeson_wolf"],// 70
            [1, "cloth/legend_gambeson_named"],// 70
            [1, "cloth/legend_padded_surcoat"],// 55
            [1, "cloth/legend_padded_surcoat_plain"],// 55
            [1, "cloth/legend_peasant_dress"],// 25
            [1, "cloth/legend_robes"],// 25
            [1, "cloth/legend_robes_magic"],// 40
            [1, "cloth/legend_robes_wizard"],// 30
            [1, "cloth/legend_robes_nun"],// 22
            [1, "cloth/legend_sackcloth_tattered"],// 5
            [1, "cloth/legend_sackcloth"],// 10
            [1, "cloth/legend_sackcloth_patched"],// 15
            [1, "cloth/legend_thick_tunic"],// 30
            [1, "cloth/legend_tunic"],// 20
            [1, "cloth/legend_tunic_wrap"],// 20
            [1, "cloth/legend_tunic_collar_thin"],// 20
            [1, "cloth/legend_tunic_collar_deep"],// 20
            [1, "cloth/legend_dark_tunic"],// 35
            [1, "cloth/legend_tunic_noble"],// 40
            [1, "cloth/legend_tunic_noble_named"],// 40
            [1, "cloth/legend_southern_robe"],// 25
            [1, "cloth/legend_southern_gambeson"],// 65
            [1, "cloth/legend_southern_split_gambeson"],// 65
            [1, "cloth/legend_southern_tunic"],// 25
            [1, "cloth/legend_southern_noble_surcoat"],// 55
        ],
        Chain = [
           [1, "chain/legend_armor_ancient_mail"],// 35
            [1, "chain/legend_armor_basic_mail"],// 85
            [1, "chain/legend_armor_hauberk"],// 95
            [1, "chain/legend_armor_hauberk_full"],// 115
            [1, "chain/legend_armor_hauberk_full_named"],// 120
            [1, "chain/legend_armor_hauberk_sleevless"],// 65
            [1, "chain/legend_armor_mail_shirt"],// 50
            [1, "chain/legend_armor_mail_shirt_simple"],// 25
            [1, "chain/legend_armor_reinforced_mail"],// 110
            [1, "chain/legend_armor_reinforced_mail_shirt"],// 80
            [1, "chain/legend_armor_reinforced_rotten_mail_shirt"],// 45
            [1, "chain/legend_armor_reinforced_worn_mail"],// 105
            [1, "chain/legend_armor_reinforced_worn_mail_shirt"],// 65
            [1, "chain/legend_armor_rusty_mail_shirt"],// 20
            [1, "chain/legend_armor_short_mail"],// 60
            [1, "chain/legend_southern_cloth"],// 30
            [1, "chain/legend_southern_padded_chest"],// 45
            [1, "chain/legend_southern_mail"],// 100
        ],
        Plate = [
            [1, "plate/legend_armor_leather_brigandine"],// 65
            [1, "plate/legend_armor_leather_brigandine_hardened"],// 110
            [1, "plate/legend_armor_leather_brigandine_hardened_full"],// 140
            [1, "plate/legend_armor_leather_brigandine_named"],// 75
            [1, "plate/legend_armor_leather_jacket"],// 25
            [1, "plate/legend_armor_leather_jacket_named"],// 30
            [1, "plate/legend_armor_leather_studded_jacket_named"],// 30
            [1, "plate/legend_armor_leather_jacket_simple"],// 15
            [1, "plate/legend_armor_leather_lamellar"],// 50
            [1, "plate/legend_armor_leather_lamellar_harness_heavy"],// 130
            [1, "plate/legend_armor_leather_lamellar_harness_reinforced"],// 150
            [1, "plate/legend_armor_leather_lamellar_heavy"],// 165
            [1, "plate/legend_armor_leather_lamellar_heavy_named"],// 140
            [1, "plate/legend_armor_leather_lamellar_reinforced"],// 55
            [1, "plate/legend_armor_leather_noble"],// 65
            [1, "plate/legend_armor_leather_padded"],// 40
            [1, "plate/legend_armor_leather_riveted"],// 95
            [1, "plate/legend_armor_leather_riveted_light"],// 80
            [1, "plate/legend_armor_leather_scale"],// 70
            [1, "plate/legend_armor_plate_ancient_chest"],// 105
            [1, "plate/legend_armor_plate_ancient_chest_restored"],// 110
            [1, "plate/legend_armor_plate_ancient_gladiator"],// 35
            [1, "plate/legend_armor_plate_ancient_harness"],// 115
            [1, "plate/legend_armor_plate_ancient_mail"],// 45
            [1, "plate/legend_armor_plate_ancient_scale"],// 105
            [1, "plate/legend_armor_plate_ancient_scale_coat"],// 140
            [1, "plate/legend_armor_plate_ancient_scale_harness"],// 75
            [1, "plate/legend_armor_plate_chest"],// 125
            [1, "plate/legend_armor_plate_chest_rotten"],// 100
            [1, "plate/legend_armor_plate_cuirass"],// 150
            [1, "plate/legend_armor_plate_full"],// 160
            [1, "plate/legend_armor_plate_full_greaves"],// 170
            [1, "plate/legend_armor_plate_full_greaves_named"],// 170
            [1, "plate/legend_armor_plate_full_greaves_painted"],// 170
            [1, "plate/legend_armor_scale"],// 100
            [1, "plate/legend_armor_scale_coat"],// 120
            [1, "plate/legend_armor_scale_coat_named"],// 160
            [1, "plate/legend_armor_scale_coat_rotten"],// 60
            [1, "plate/legend_armor_scale_shirt"],// 85
            [1, "plate/legend_animal_hide_armor"],// 30
            [1, "plate/legend_heavy_iron_armor"],// 120
            [1, "plate/legend_hide_and_bone_armor"],// 80
            [1, "plate/legend_reinforced_animal_hide_armor"],// 55
            [1, "plate/legend_rugged_scale_armor"],// 95
            [1, "plate/legend_scrap_metal_armor"],// 65
            [1, "plate/legend_thick_furs_armor"],// 10
            [1, "plate/legend_thick_plated_barbarian_armor"],// 155
            [1, "plate/legend_southern_named_golden_plates"],// 155
            [1, "plate/legend_southern_named_plates"],// 155
            [1, "plate/legend_southern_plate_full"],// 155
            [1, "plate/legend_southern_plate"],// 155
            [1, "plate/legend_southern_padded"],// 155
            [1, "plate/legend_southern_arm_guards"],// 155
            [1, "plate/legend_southern_strips"],// 155
            [1, "plate/legend_southern_leather_jacket"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
            [1, "plate/legend_southern_leather_scale"],// 155
            [1, "plate/legend_southern_scale"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
        ],
        Cloak = [
            [1, "cloak/legend_shoulder_cloth"],// 5
            [1, "cloak/legend_noble_shawl"],// 10
            [1, "cloak/legend_dark_wooly_cloak"],// 15
            [1, "cloak/legend_armor_cloak_common"],// 10
            [1, "cloak/legend_armor_cloak_heavy"],// 30
            [1, "cloak/legend_armor_cloak_crusader"],// 35
            [1, "cloak/legend_armor_cloak_noble"],// 25
            [1, "cloak/legend_sash"],// 3
            [1, "cloak/legend_southern_scarf"],// 5
            [1, "cloak/legend_animal_pelt"],// 15
            [1, "cloak/legend_southern_scarf_wrap"],// 15
        ],
        Tabard = [
            [1, "tabard/legend_common_tabard"],// 5
            [1, "tabard/legend_noble_tabard"],// 10
            [1, "tabard/legend_tattered_tabard"],// 2
            [1, "tabard/legend_southern_wrap_right"],// 2
            [1, "tabard/legend_southern_wrap_left"],// 2
            [1, "tabard/legend_southern_wide_belt"],// 2
            [1, "tabard/legend_noble_vest"],// 10
            [1, "tabard/legend_southern_wrap"],// 5
            [1, "tabard/legend_southern_shoulder_cloth"],// 5
            [1, "tabard/legend_southern_overcloth"],// 10
            [1, "tabard/legend_southern_tabard"],// 5
        ],
        Attachments =[
        ]
    }]
},{
    ID = "oriental/leather_nomad_robe", // 65
    Script = "",
    Sets = [{
        Cloth = [
            [1, "cloth/legend_ancient_cloth"],// 30
            [1, "cloth/legend_ancient_cloth_restored"],// 35
            [1, "cloth/legend_apron_butcher"],// 30
            [1, "cloth/legend_apron"],// 35
            [1, "cloth/legend_gambeson"],// 65
            [1, "cloth/legend_gambeson_plain"],// 65
            [1, "cloth/legend_gambeson_wolf"],// 70
            [1, "cloth/legend_gambeson_named"],// 70
            [1, "cloth/legend_padded_surcoat"],// 55
            [1, "cloth/legend_padded_surcoat_plain"],// 55
            [1, "cloth/legend_peasant_dress"],// 25
            [1, "cloth/legend_robes"],// 25
            [1, "cloth/legend_robes_magic"],// 40
            [1, "cloth/legend_robes_wizard"],// 30
            [1, "cloth/legend_robes_nun"],// 22
            [1, "cloth/legend_sackcloth_tattered"],// 5
            [1, "cloth/legend_sackcloth"],// 10
            [1, "cloth/legend_sackcloth_patched"],// 15
            [1, "cloth/legend_thick_tunic"],// 30
            [1, "cloth/legend_tunic"],// 20
            [1, "cloth/legend_tunic_wrap"],// 20
            [1, "cloth/legend_tunic_collar_thin"],// 20
            [1, "cloth/legend_tunic_collar_deep"],// 20
            [1, "cloth/legend_dark_tunic"],// 35
            [1, "cloth/legend_tunic_noble"],// 40
            [1, "cloth/legend_tunic_noble_named"],// 40
            [1, "cloth/legend_southern_robe"],// 25
            [1, "cloth/legend_southern_gambeson"],// 65
            [1, "cloth/legend_southern_split_gambeson"],// 65
            [1, "cloth/legend_southern_tunic"],// 25
            [1, "cloth/legend_southern_noble_surcoat"],// 55
        ],
        Chain = [
           [1, "chain/legend_armor_ancient_mail"],// 35
            [1, "chain/legend_armor_basic_mail"],// 85
            [1, "chain/legend_armor_hauberk"],// 95
            [1, "chain/legend_armor_hauberk_full"],// 115
            [1, "chain/legend_armor_hauberk_full_named"],// 120
            [1, "chain/legend_armor_hauberk_sleevless"],// 65
            [1, "chain/legend_armor_mail_shirt"],// 50
            [1, "chain/legend_armor_mail_shirt_simple"],// 25
            [1, "chain/legend_armor_reinforced_mail"],// 110
            [1, "chain/legend_armor_reinforced_mail_shirt"],// 80
            [1, "chain/legend_armor_reinforced_rotten_mail_shirt"],// 45
            [1, "chain/legend_armor_reinforced_worn_mail"],// 105
            [1, "chain/legend_armor_reinforced_worn_mail_shirt"],// 65
            [1, "chain/legend_armor_rusty_mail_shirt"],// 20
            [1, "chain/legend_armor_short_mail"],// 60
            [1, "chain/legend_southern_cloth"],// 30
            [1, "chain/legend_southern_padded_chest"],// 45
            [1, "chain/legend_southern_mail"],// 100
        ],
        Plate = [
            [1, "plate/legend_armor_leather_brigandine"],// 65
            [1, "plate/legend_armor_leather_brigandine_hardened"],// 110
            [1, "plate/legend_armor_leather_brigandine_hardened_full"],// 140
            [1, "plate/legend_armor_leather_brigandine_named"],// 75
            [1, "plate/legend_armor_leather_jacket"],// 25
            [1, "plate/legend_armor_leather_jacket_named"],// 30
            [1, "plate/legend_armor_leather_studded_jacket_named"],// 30
            [1, "plate/legend_armor_leather_jacket_simple"],// 15
            [1, "plate/legend_armor_leather_lamellar"],// 50
            [1, "plate/legend_armor_leather_lamellar_harness_heavy"],// 130
            [1, "plate/legend_armor_leather_lamellar_harness_reinforced"],// 150
            [1, "plate/legend_armor_leather_lamellar_heavy"],// 165
            [1, "plate/legend_armor_leather_lamellar_heavy_named"],// 140
            [1, "plate/legend_armor_leather_lamellar_reinforced"],// 55
            [1, "plate/legend_armor_leather_noble"],// 65
            [1, "plate/legend_armor_leather_padded"],// 40
            [1, "plate/legend_armor_leather_riveted"],// 95
            [1, "plate/legend_armor_leather_riveted_light"],// 80
            [1, "plate/legend_armor_leather_scale"],// 70
            [1, "plate/legend_armor_plate_ancient_chest"],// 105
            [1, "plate/legend_armor_plate_ancient_chest_restored"],// 110
            [1, "plate/legend_armor_plate_ancient_gladiator"],// 35
            [1, "plate/legend_armor_plate_ancient_harness"],// 115
            [1, "plate/legend_armor_plate_ancient_mail"],// 45
            [1, "plate/legend_armor_plate_ancient_scale"],// 105
            [1, "plate/legend_armor_plate_ancient_scale_coat"],// 140
            [1, "plate/legend_armor_plate_ancient_scale_harness"],// 75
            [1, "plate/legend_armor_plate_chest"],// 125
            [1, "plate/legend_armor_plate_chest_rotten"],// 100
            [1, "plate/legend_armor_plate_cuirass"],// 150
            [1, "plate/legend_armor_plate_full"],// 160
            [1, "plate/legend_armor_plate_full_greaves"],// 170
            [1, "plate/legend_armor_plate_full_greaves_named"],// 170
            [1, "plate/legend_armor_plate_full_greaves_painted"],// 170
            [1, "plate/legend_armor_scale"],// 100
            [1, "plate/legend_armor_scale_coat"],// 120
            [1, "plate/legend_armor_scale_coat_named"],// 160
            [1, "plate/legend_armor_scale_coat_rotten"],// 60
            [1, "plate/legend_armor_scale_shirt"],// 85
            [1, "plate/legend_animal_hide_armor"],// 30
            [1, "plate/legend_heavy_iron_armor"],// 120
            [1, "plate/legend_hide_and_bone_armor"],// 80
            [1, "plate/legend_reinforced_animal_hide_armor"],// 55
            [1, "plate/legend_rugged_scale_armor"],// 95
            [1, "plate/legend_scrap_metal_armor"],// 65
            [1, "plate/legend_thick_furs_armor"],// 10
            [1, "plate/legend_thick_plated_barbarian_armor"],// 155
            [1, "plate/legend_southern_named_golden_plates"],// 155
            [1, "plate/legend_southern_named_plates"],// 155
            [1, "plate/legend_southern_plate_full"],// 155
            [1, "plate/legend_southern_plate"],// 155
            [1, "plate/legend_southern_padded"],// 155
            [1, "plate/legend_southern_arm_guards"],// 155
            [1, "plate/legend_southern_strips"],// 155
            [1, "plate/legend_southern_leather_jacket"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
            [1, "plate/legend_southern_leather_scale"],// 155
            [1, "plate/legend_southern_scale"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
        ],
        Cloak = [
            [1, "cloak/legend_shoulder_cloth"],// 5
            [1, "cloak/legend_noble_shawl"],// 10
            [1, "cloak/legend_dark_wooly_cloak"],// 15
            [1, "cloak/legend_armor_cloak_common"],// 10
            [1, "cloak/legend_armor_cloak_heavy"],// 30
            [1, "cloak/legend_armor_cloak_crusader"],// 35
            [1, "cloak/legend_armor_cloak_noble"],// 25
            [1, "cloak/legend_sash"],// 3
            [1, "cloak/legend_southern_scarf"],// 5
            [1, "cloak/legend_animal_pelt"],// 15
            [1, "cloak/legend_southern_scarf_wrap"],// 15
        ],
        Tabard = [
            [1, "tabard/legend_common_tabard"],// 5
            [1, "tabard/legend_noble_tabard"],// 10
            [1, "tabard/legend_tattered_tabard"],// 2
            [1, "tabard/legend_southern_wrap_right"],// 2
            [1, "tabard/legend_southern_wrap_left"],// 2
            [1, "tabard/legend_southern_wide_belt"],// 2
            [1, "tabard/legend_noble_vest"],// 10
            [1, "tabard/legend_southern_wrap"],// 5
            [1, "tabard/legend_southern_shoulder_cloth"],// 5
            [1, "tabard/legend_southern_overcloth"],// 10
            [1, "tabard/legend_southern_tabard"],// 5
        ],
        Attachments =[
        ]
    }]
},{
    ID = "oriental/linothorax", // 75
    Script = "",
    Sets = [{
        Cloth = [
            [1, "cloth/legend_ancient_cloth"],// 30
            [1, "cloth/legend_ancient_cloth_restored"],// 35
            [1, "cloth/legend_apron_butcher"],// 30
            [1, "cloth/legend_apron"],// 35
            [1, "cloth/legend_gambeson"],// 65
            [1, "cloth/legend_gambeson_plain"],// 65
            [1, "cloth/legend_gambeson_wolf"],// 70
            [1, "cloth/legend_gambeson_named"],// 70
            [1, "cloth/legend_padded_surcoat"],// 55
            [1, "cloth/legend_padded_surcoat_plain"],// 55
            [1, "cloth/legend_peasant_dress"],// 25
            [1, "cloth/legend_robes"],// 25
            [1, "cloth/legend_robes_magic"],// 40
            [1, "cloth/legend_robes_wizard"],// 30
            [1, "cloth/legend_robes_nun"],// 22
            [1, "cloth/legend_sackcloth_tattered"],// 5
            [1, "cloth/legend_sackcloth"],// 10
            [1, "cloth/legend_sackcloth_patched"],// 15
            [1, "cloth/legend_thick_tunic"],// 30
            [1, "cloth/legend_tunic"],// 20
            [1, "cloth/legend_tunic_wrap"],// 20
            [1, "cloth/legend_tunic_collar_thin"],// 20
            [1, "cloth/legend_tunic_collar_deep"],// 20
            [1, "cloth/legend_dark_tunic"],// 35
            [1, "cloth/legend_tunic_noble"],// 40
            [1, "cloth/legend_tunic_noble_named"],// 40
            [1, "cloth/legend_southern_robe"],// 25
            [1, "cloth/legend_southern_gambeson"],// 65
            [1, "cloth/legend_southern_split_gambeson"],// 65
            [1, "cloth/legend_southern_tunic"],// 25
            [1, "cloth/legend_southern_noble_surcoat"],// 55
        ],
        Chain = [
           [1, "chain/legend_armor_ancient_mail"],// 35
            [1, "chain/legend_armor_basic_mail"],// 85
            [1, "chain/legend_armor_hauberk"],// 95
            [1, "chain/legend_armor_hauberk_full"],// 115
            [1, "chain/legend_armor_hauberk_full_named"],// 120
            [1, "chain/legend_armor_hauberk_sleevless"],// 65
            [1, "chain/legend_armor_mail_shirt"],// 50
            [1, "chain/legend_armor_mail_shirt_simple"],// 25
            [1, "chain/legend_armor_reinforced_mail"],// 110
            [1, "chain/legend_armor_reinforced_mail_shirt"],// 80
            [1, "chain/legend_armor_reinforced_rotten_mail_shirt"],// 45
            [1, "chain/legend_armor_reinforced_worn_mail"],// 105
            [1, "chain/legend_armor_reinforced_worn_mail_shirt"],// 65
            [1, "chain/legend_armor_rusty_mail_shirt"],// 20
            [1, "chain/legend_armor_short_mail"],// 60
            [1, "chain/legend_southern_cloth"],// 30
            [1, "chain/legend_southern_padded_chest"],// 45
            [1, "chain/legend_southern_mail"],// 100
        ],
        Plate = [
            [1, "plate/legend_armor_leather_brigandine"],// 65
            [1, "plate/legend_armor_leather_brigandine_hardened"],// 110
            [1, "plate/legend_armor_leather_brigandine_hardened_full"],// 140
            [1, "plate/legend_armor_leather_brigandine_named"],// 75
            [1, "plate/legend_armor_leather_jacket"],// 25
            [1, "plate/legend_armor_leather_jacket_named"],// 30
            [1, "plate/legend_armor_leather_studded_jacket_named"],// 30
            [1, "plate/legend_armor_leather_jacket_simple"],// 15
            [1, "plate/legend_armor_leather_lamellar"],// 50
            [1, "plate/legend_armor_leather_lamellar_harness_heavy"],// 130
            [1, "plate/legend_armor_leather_lamellar_harness_reinforced"],// 150
            [1, "plate/legend_armor_leather_lamellar_heavy"],// 165
            [1, "plate/legend_armor_leather_lamellar_heavy_named"],// 140
            [1, "plate/legend_armor_leather_lamellar_reinforced"],// 55
            [1, "plate/legend_armor_leather_noble"],// 65
            [1, "plate/legend_armor_leather_padded"],// 40
            [1, "plate/legend_armor_leather_riveted"],// 95
            [1, "plate/legend_armor_leather_riveted_light"],// 80
            [1, "plate/legend_armor_leather_scale"],// 70
            [1, "plate/legend_armor_plate_ancient_chest"],// 105
            [1, "plate/legend_armor_plate_ancient_chest_restored"],// 110
            [1, "plate/legend_armor_plate_ancient_gladiator"],// 35
            [1, "plate/legend_armor_plate_ancient_harness"],// 115
            [1, "plate/legend_armor_plate_ancient_mail"],// 45
            [1, "plate/legend_armor_plate_ancient_scale"],// 105
            [1, "plate/legend_armor_plate_ancient_scale_coat"],// 140
            [1, "plate/legend_armor_plate_ancient_scale_harness"],// 75
            [1, "plate/legend_armor_plate_chest"],// 125
            [1, "plate/legend_armor_plate_chest_rotten"],// 100
            [1, "plate/legend_armor_plate_cuirass"],// 150
            [1, "plate/legend_armor_plate_full"],// 160
            [1, "plate/legend_armor_plate_full_greaves"],// 170
            [1, "plate/legend_armor_plate_full_greaves_named"],// 170
            [1, "plate/legend_armor_plate_full_greaves_painted"],// 170
            [1, "plate/legend_armor_scale"],// 100
            [1, "plate/legend_armor_scale_coat"],// 120
            [1, "plate/legend_armor_scale_coat_named"],// 160
            [1, "plate/legend_armor_scale_coat_rotten"],// 60
            [1, "plate/legend_armor_scale_shirt"],// 85
            [1, "plate/legend_animal_hide_armor"],// 30
            [1, "plate/legend_heavy_iron_armor"],// 120
            [1, "plate/legend_hide_and_bone_armor"],// 80
            [1, "plate/legend_reinforced_animal_hide_armor"],// 55
            [1, "plate/legend_rugged_scale_armor"],// 95
            [1, "plate/legend_scrap_metal_armor"],// 65
            [1, "plate/legend_thick_furs_armor"],// 10
            [1, "plate/legend_thick_plated_barbarian_armor"],// 155
            [1, "plate/legend_southern_named_golden_plates"],// 155
            [1, "plate/legend_southern_named_plates"],// 155
            [1, "plate/legend_southern_plate_full"],// 155
            [1, "plate/legend_southern_plate"],// 155
            [1, "plate/legend_southern_padded"],// 155
            [1, "plate/legend_southern_arm_guards"],// 155
            [1, "plate/legend_southern_strips"],// 155
            [1, "plate/legend_southern_leather_jacket"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
            [1, "plate/legend_southern_leather_scale"],// 155
            [1, "plate/legend_southern_scale"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
        ],
        Cloak = [
            [1, "cloak/legend_shoulder_cloth"],// 5
            [1, "cloak/legend_noble_shawl"],// 10
            [1, "cloak/legend_dark_wooly_cloak"],// 15
            [1, "cloak/legend_armor_cloak_common"],// 10
            [1, "cloak/legend_armor_cloak_heavy"],// 30
            [1, "cloak/legend_armor_cloak_crusader"],// 35
            [1, "cloak/legend_armor_cloak_noble"],// 25
            [1, "cloak/legend_sash"],// 3
            [1, "cloak/legend_southern_scarf"],// 5
            [1, "cloak/legend_animal_pelt"],// 15
            [1, "cloak/legend_southern_scarf_wrap"],// 15
        ],
        Tabard = [
            [1, "tabard/legend_common_tabard"],// 5
            [1, "tabard/legend_noble_tabard"],// 10
            [1, "tabard/legend_tattered_tabard"],// 2
            [1, "tabard/legend_southern_wrap_right"],// 2
            [1, "tabard/legend_southern_wrap_left"],// 2
            [1, "tabard/legend_southern_wide_belt"],// 2
            [1, "tabard/legend_noble_vest"],// 10
            [1, "tabard/legend_southern_wrap"],// 5
            [1, "tabard/legend_southern_shoulder_cloth"],// 5
            [1, "tabard/legend_southern_overcloth"],// 10
            [1, "tabard/legend_southern_tabard"],// 5
        ],
        Attachments =[
        ]
    }]
},{
    ID = "oriental/mail_and_lamellar_plating", // 135
    Script = "",
    Sets = [{
        Cloth = [
            [1, "cloth/legend_ancient_cloth"],// 30
            [1, "cloth/legend_ancient_cloth_restored"],// 35
            [1, "cloth/legend_apron_butcher"],// 30
            [1, "cloth/legend_apron"],// 35
            [1, "cloth/legend_gambeson"],// 65
            [1, "cloth/legend_gambeson_plain"],// 65
            [1, "cloth/legend_gambeson_wolf"],// 70
            [1, "cloth/legend_gambeson_named"],// 70
            [1, "cloth/legend_padded_surcoat"],// 55
            [1, "cloth/legend_padded_surcoat_plain"],// 55
            [1, "cloth/legend_peasant_dress"],// 25
            [1, "cloth/legend_robes"],// 25
            [1, "cloth/legend_robes_magic"],// 40
            [1, "cloth/legend_robes_wizard"],// 30
            [1, "cloth/legend_robes_nun"],// 22
            [1, "cloth/legend_sackcloth_tattered"],// 5
            [1, "cloth/legend_sackcloth"],// 10
            [1, "cloth/legend_sackcloth_patched"],// 15
            [1, "cloth/legend_thick_tunic"],// 30
            [1, "cloth/legend_tunic"],// 20
            [1, "cloth/legend_tunic_wrap"],// 20
            [1, "cloth/legend_tunic_collar_thin"],// 20
            [1, "cloth/legend_tunic_collar_deep"],// 20
            [1, "cloth/legend_dark_tunic"],// 35
            [1, "cloth/legend_tunic_noble"],// 40
            [1, "cloth/legend_tunic_noble_named"],// 40
            [1, "cloth/legend_southern_robe"],// 25
            [1, "cloth/legend_southern_gambeson"],// 65
            [1, "cloth/legend_southern_split_gambeson"],// 65
            [1, "cloth/legend_southern_tunic"],// 25
            [1, "cloth/legend_southern_noble_surcoat"],// 55
        ],
        Chain = [
           [1, "chain/legend_armor_ancient_mail"],// 35
            [1, "chain/legend_armor_basic_mail"],// 85
            [1, "chain/legend_armor_hauberk"],// 95
            [1, "chain/legend_armor_hauberk_full"],// 115
            [1, "chain/legend_armor_hauberk_full_named"],// 120
            [1, "chain/legend_armor_hauberk_sleevless"],// 65
            [1, "chain/legend_armor_mail_shirt"],// 50
            [1, "chain/legend_armor_mail_shirt_simple"],// 25
            [1, "chain/legend_armor_reinforced_mail"],// 110
            [1, "chain/legend_armor_reinforced_mail_shirt"],// 80
            [1, "chain/legend_armor_reinforced_rotten_mail_shirt"],// 45
            [1, "chain/legend_armor_reinforced_worn_mail"],// 105
            [1, "chain/legend_armor_reinforced_worn_mail_shirt"],// 65
            [1, "chain/legend_armor_rusty_mail_shirt"],// 20
            [1, "chain/legend_armor_short_mail"],// 60
            [1, "chain/legend_southern_cloth"],// 30
            [1, "chain/legend_southern_padded_chest"],// 45
            [1, "chain/legend_southern_mail"],// 100
        ],
        Plate = [
            [1, "plate/legend_armor_leather_brigandine"],// 65
            [1, "plate/legend_armor_leather_brigandine_hardened"],// 110
            [1, "plate/legend_armor_leather_brigandine_hardened_full"],// 140
            [1, "plate/legend_armor_leather_brigandine_named"],// 75
            [1, "plate/legend_armor_leather_jacket"],// 25
            [1, "plate/legend_armor_leather_jacket_named"],// 30
            [1, "plate/legend_armor_leather_studded_jacket_named"],// 30
            [1, "plate/legend_armor_leather_jacket_simple"],// 15
            [1, "plate/legend_armor_leather_lamellar"],// 50
            [1, "plate/legend_armor_leather_lamellar_harness_heavy"],// 130
            [1, "plate/legend_armor_leather_lamellar_harness_reinforced"],// 150
            [1, "plate/legend_armor_leather_lamellar_heavy"],// 165
            [1, "plate/legend_armor_leather_lamellar_heavy_named"],// 140
            [1, "plate/legend_armor_leather_lamellar_reinforced"],// 55
            [1, "plate/legend_armor_leather_noble"],// 65
            [1, "plate/legend_armor_leather_padded"],// 40
            [1, "plate/legend_armor_leather_riveted"],// 95
            [1, "plate/legend_armor_leather_riveted_light"],// 80
            [1, "plate/legend_armor_leather_scale"],// 70
            [1, "plate/legend_armor_plate_ancient_chest"],// 105
            [1, "plate/legend_armor_plate_ancient_chest_restored"],// 110
            [1, "plate/legend_armor_plate_ancient_gladiator"],// 35
            [1, "plate/legend_armor_plate_ancient_harness"],// 115
            [1, "plate/legend_armor_plate_ancient_mail"],// 45
            [1, "plate/legend_armor_plate_ancient_scale"],// 105
            [1, "plate/legend_armor_plate_ancient_scale_coat"],// 140
            [1, "plate/legend_armor_plate_ancient_scale_harness"],// 75
            [1, "plate/legend_armor_plate_chest"],// 125
            [1, "plate/legend_armor_plate_chest_rotten"],// 100
            [1, "plate/legend_armor_plate_cuirass"],// 150
            [1, "plate/legend_armor_plate_full"],// 160
            [1, "plate/legend_armor_plate_full_greaves"],// 170
            [1, "plate/legend_armor_plate_full_greaves_named"],// 170
            [1, "plate/legend_armor_plate_full_greaves_painted"],// 170
            [1, "plate/legend_armor_scale"],// 100
            [1, "plate/legend_armor_scale_coat"],// 120
            [1, "plate/legend_armor_scale_coat_named"],// 160
            [1, "plate/legend_armor_scale_coat_rotten"],// 60
            [1, "plate/legend_armor_scale_shirt"],// 85
            [1, "plate/legend_animal_hide_armor"],// 30
            [1, "plate/legend_heavy_iron_armor"],// 120
            [1, "plate/legend_hide_and_bone_armor"],// 80
            [1, "plate/legend_reinforced_animal_hide_armor"],// 55
            [1, "plate/legend_rugged_scale_armor"],// 95
            [1, "plate/legend_scrap_metal_armor"],// 65
            [1, "plate/legend_thick_furs_armor"],// 10
            [1, "plate/legend_thick_plated_barbarian_armor"],// 155
            [1, "plate/legend_southern_named_golden_plates"],// 155
            [1, "plate/legend_southern_named_plates"],// 155
            [1, "plate/legend_southern_plate_full"],// 155
            [1, "plate/legend_southern_plate"],// 155
            [1, "plate/legend_southern_padded"],// 155
            [1, "plate/legend_southern_arm_guards"],// 155
            [1, "plate/legend_southern_strips"],// 155
            [1, "plate/legend_southern_leather_jacket"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
            [1, "plate/legend_southern_leather_scale"],// 155
            [1, "plate/legend_southern_scale"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
        ],
        Cloak = [
            [1, "cloak/legend_shoulder_cloth"],// 5
            [1, "cloak/legend_noble_shawl"],// 10
            [1, "cloak/legend_dark_wooly_cloak"],// 15
            [1, "cloak/legend_armor_cloak_common"],// 10
            [1, "cloak/legend_armor_cloak_heavy"],// 30
            [1, "cloak/legend_armor_cloak_crusader"],// 35
            [1, "cloak/legend_armor_cloak_noble"],// 25
            [1, "cloak/legend_sash"],// 3
            [1, "cloak/legend_southern_scarf"],// 5
            [1, "cloak/legend_animal_pelt"],// 15
            [1, "cloak/legend_southern_scarf_wrap"],// 15
        ],
        Tabard = [
            [1, "tabard/legend_common_tabard"],// 5
            [1, "tabard/legend_noble_tabard"],// 10
            [1, "tabard/legend_tattered_tabard"],// 2
            [1, "tabard/legend_southern_wrap_right"],// 2
            [1, "tabard/legend_southern_wrap_left"],// 2
            [1, "tabard/legend_southern_wide_belt"],// 2
            [1, "tabard/legend_noble_vest"],// 10
            [1, "tabard/legend_southern_wrap"],// 5
            [1, "tabard/legend_southern_shoulder_cloth"],// 5
            [1, "tabard/legend_southern_overcloth"],// 10
            [1, "tabard/legend_southern_tabard"],// 5
        ],
        Attachments =[
        ]
    }]
},{
    ID = "oriental/nomad_robe", // 30
    Script = "",
    Sets = [{
        Cloth = [
            [1, "cloth/legend_ancient_cloth"],// 30
            [1, "cloth/legend_ancient_cloth_restored"],// 35
            [1, "cloth/legend_apron_butcher"],// 30
            [1, "cloth/legend_apron"],// 35
            [1, "cloth/legend_gambeson"],// 65
            [1, "cloth/legend_gambeson_plain"],// 65
            [1, "cloth/legend_gambeson_wolf"],// 70
            [1, "cloth/legend_gambeson_named"],// 70
            [1, "cloth/legend_padded_surcoat"],// 55
            [1, "cloth/legend_padded_surcoat_plain"],// 55
            [1, "cloth/legend_peasant_dress"],// 25
            [1, "cloth/legend_robes"],// 25
            [1, "cloth/legend_robes_magic"],// 40
            [1, "cloth/legend_robes_wizard"],// 30
            [1, "cloth/legend_robes_nun"],// 22
            [1, "cloth/legend_sackcloth_tattered"],// 5
            [1, "cloth/legend_sackcloth"],// 10
            [1, "cloth/legend_sackcloth_patched"],// 15
            [1, "cloth/legend_thick_tunic"],// 30
            [1, "cloth/legend_tunic"],// 20
            [1, "cloth/legend_tunic_wrap"],// 20
            [1, "cloth/legend_tunic_collar_thin"],// 20
            [1, "cloth/legend_tunic_collar_deep"],// 20
            [1, "cloth/legend_dark_tunic"],// 35
            [1, "cloth/legend_tunic_noble"],// 40
            [1, "cloth/legend_tunic_noble_named"],// 40
            [1, "cloth/legend_southern_robe"],// 25
            [1, "cloth/legend_southern_gambeson"],// 65
            [1, "cloth/legend_southern_split_gambeson"],// 65
            [1, "cloth/legend_southern_tunic"],// 25
            [1, "cloth/legend_southern_noble_surcoat"],// 55
        ],
        Chain = [
           [1, "chain/legend_armor_ancient_mail"],// 35
            [1, "chain/legend_armor_basic_mail"],// 85
            [1, "chain/legend_armor_hauberk"],// 95
            [1, "chain/legend_armor_hauberk_full"],// 115
            [1, "chain/legend_armor_hauberk_full_named"],// 120
            [1, "chain/legend_armor_hauberk_sleevless"],// 65
            [1, "chain/legend_armor_mail_shirt"],// 50
            [1, "chain/legend_armor_mail_shirt_simple"],// 25
            [1, "chain/legend_armor_reinforced_mail"],// 110
            [1, "chain/legend_armor_reinforced_mail_shirt"],// 80
            [1, "chain/legend_armor_reinforced_rotten_mail_shirt"],// 45
            [1, "chain/legend_armor_reinforced_worn_mail"],// 105
            [1, "chain/legend_armor_reinforced_worn_mail_shirt"],// 65
            [1, "chain/legend_armor_rusty_mail_shirt"],// 20
            [1, "chain/legend_armor_short_mail"],// 60
            [1, "chain/legend_southern_cloth"],// 30
            [1, "chain/legend_southern_padded_chest"],// 45
            [1, "chain/legend_southern_mail"],// 100
        ],
        Plate = [
            [1, "plate/legend_armor_leather_brigandine"],// 65
            [1, "plate/legend_armor_leather_brigandine_hardened"],// 110
            [1, "plate/legend_armor_leather_brigandine_hardened_full"],// 140
            [1, "plate/legend_armor_leather_brigandine_named"],// 75
            [1, "plate/legend_armor_leather_jacket"],// 25
            [1, "plate/legend_armor_leather_jacket_named"],// 30
            [1, "plate/legend_armor_leather_studded_jacket_named"],// 30
            [1, "plate/legend_armor_leather_jacket_simple"],// 15
            [1, "plate/legend_armor_leather_lamellar"],// 50
            [1, "plate/legend_armor_leather_lamellar_harness_heavy"],// 130
            [1, "plate/legend_armor_leather_lamellar_harness_reinforced"],// 150
            [1, "plate/legend_armor_leather_lamellar_heavy"],// 165
            [1, "plate/legend_armor_leather_lamellar_heavy_named"],// 140
            [1, "plate/legend_armor_leather_lamellar_reinforced"],// 55
            [1, "plate/legend_armor_leather_noble"],// 65
            [1, "plate/legend_armor_leather_padded"],// 40
            [1, "plate/legend_armor_leather_riveted"],// 95
            [1, "plate/legend_armor_leather_riveted_light"],// 80
            [1, "plate/legend_armor_leather_scale"],// 70
            [1, "plate/legend_armor_plate_ancient_chest"],// 105
            [1, "plate/legend_armor_plate_ancient_chest_restored"],// 110
            [1, "plate/legend_armor_plate_ancient_gladiator"],// 35
            [1, "plate/legend_armor_plate_ancient_harness"],// 115
            [1, "plate/legend_armor_plate_ancient_mail"],// 45
            [1, "plate/legend_armor_plate_ancient_scale"],// 105
            [1, "plate/legend_armor_plate_ancient_scale_coat"],// 140
            [1, "plate/legend_armor_plate_ancient_scale_harness"],// 75
            [1, "plate/legend_armor_plate_chest"],// 125
            [1, "plate/legend_armor_plate_chest_rotten"],// 100
            [1, "plate/legend_armor_plate_cuirass"],// 150
            [1, "plate/legend_armor_plate_full"],// 160
            [1, "plate/legend_armor_plate_full_greaves"],// 170
            [1, "plate/legend_armor_plate_full_greaves_named"],// 170
            [1, "plate/legend_armor_plate_full_greaves_painted"],// 170
            [1, "plate/legend_armor_scale"],// 100
            [1, "plate/legend_armor_scale_coat"],// 120
            [1, "plate/legend_armor_scale_coat_named"],// 160
            [1, "plate/legend_armor_scale_coat_rotten"],// 60
            [1, "plate/legend_armor_scale_shirt"],// 85
            [1, "plate/legend_animal_hide_armor"],// 30
            [1, "plate/legend_heavy_iron_armor"],// 120
            [1, "plate/legend_hide_and_bone_armor"],// 80
            [1, "plate/legend_reinforced_animal_hide_armor"],// 55
            [1, "plate/legend_rugged_scale_armor"],// 95
            [1, "plate/legend_scrap_metal_armor"],// 65
            [1, "plate/legend_thick_furs_armor"],// 10
            [1, "plate/legend_thick_plated_barbarian_armor"],// 155
            [1, "plate/legend_southern_named_golden_plates"],// 155
            [1, "plate/legend_southern_named_plates"],// 155
            [1, "plate/legend_southern_plate_full"],// 155
            [1, "plate/legend_southern_plate"],// 155
            [1, "plate/legend_southern_padded"],// 155
            [1, "plate/legend_southern_arm_guards"],// 155
            [1, "plate/legend_southern_strips"],// 155
            [1, "plate/legend_southern_leather_jacket"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
            [1, "plate/legend_southern_leather_scale"],// 155
            [1, "plate/legend_southern_scale"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
        ],
        Cloak = [
            [1, "cloak/legend_shoulder_cloth"],// 5
            [1, "cloak/legend_noble_shawl"],// 10
            [1, "cloak/legend_dark_wooly_cloak"],// 15
            [1, "cloak/legend_armor_cloak_common"],// 10
            [1, "cloak/legend_armor_cloak_heavy"],// 30
            [1, "cloak/legend_armor_cloak_crusader"],// 35
            [1, "cloak/legend_armor_cloak_noble"],// 25
            [1, "cloak/legend_sash"],// 3
            [1, "cloak/legend_southern_scarf"],// 5
            [1, "cloak/legend_animal_pelt"],// 15
            [1, "cloak/legend_southern_scarf_wrap"],// 15
        ],
        Tabard = [
            [1, "tabard/legend_common_tabard"],// 5
            [1, "tabard/legend_noble_tabard"],// 10
            [1, "tabard/legend_tattered_tabard"],// 2
            [1, "tabard/legend_southern_wrap_right"],// 2
            [1, "tabard/legend_southern_wrap_left"],// 2
            [1, "tabard/legend_southern_wide_belt"],// 2
            [1, "tabard/legend_noble_vest"],// 10
            [1, "tabard/legend_southern_wrap"],// 5
            [1, "tabard/legend_southern_shoulder_cloth"],// 5
            [1, "tabard/legend_southern_overcloth"],// 10
            [1, "tabard/legend_southern_tabard"],// 5
        ],
        Attachments =[
        ]
    }]
},{
    ID = "oriental/padded_mail_and_lamellar_hauberk", // 290
    Script = "",
    Sets = [{
        Cloth = [
            [1, "cloth/legend_ancient_cloth"],// 30
            [1, "cloth/legend_ancient_cloth_restored"],// 35
            [1, "cloth/legend_apron_butcher"],// 30
            [1, "cloth/legend_apron"],// 35
            [1, "cloth/legend_gambeson"],// 65
            [1, "cloth/legend_gambeson_plain"],// 65
            [1, "cloth/legend_gambeson_wolf"],// 70
            [1, "cloth/legend_gambeson_named"],// 70
            [1, "cloth/legend_padded_surcoat"],// 55
            [1, "cloth/legend_padded_surcoat_plain"],// 55
            [1, "cloth/legend_peasant_dress"],// 25
            [1, "cloth/legend_robes"],// 25
            [1, "cloth/legend_robes_magic"],// 40
            [1, "cloth/legend_robes_wizard"],// 30
            [1, "cloth/legend_robes_nun"],// 22
            [1, "cloth/legend_sackcloth_tattered"],// 5
            [1, "cloth/legend_sackcloth"],// 10
            [1, "cloth/legend_sackcloth_patched"],// 15
            [1, "cloth/legend_thick_tunic"],// 30
            [1, "cloth/legend_tunic"],// 20
            [1, "cloth/legend_tunic_wrap"],// 20
            [1, "cloth/legend_tunic_collar_thin"],// 20
            [1, "cloth/legend_tunic_collar_deep"],// 20
            [1, "cloth/legend_dark_tunic"],// 35
            [1, "cloth/legend_tunic_noble"],// 40
            [1, "cloth/legend_tunic_noble_named"],// 40
            [1, "cloth/legend_southern_robe"],// 25
            [1, "cloth/legend_southern_gambeson"],// 65
            [1, "cloth/legend_southern_split_gambeson"],// 65
            [1, "cloth/legend_southern_tunic"],// 25
            [1, "cloth/legend_southern_noble_surcoat"],// 55
        ],
        Chain = [
           [1, "chain/legend_armor_ancient_mail"],// 35
            [1, "chain/legend_armor_basic_mail"],// 85
            [1, "chain/legend_armor_hauberk"],// 95
            [1, "chain/legend_armor_hauberk_full"],// 115
            [1, "chain/legend_armor_hauberk_full_named"],// 120
            [1, "chain/legend_armor_hauberk_sleevless"],// 65
            [1, "chain/legend_armor_mail_shirt"],// 50
            [1, "chain/legend_armor_mail_shirt_simple"],// 25
            [1, "chain/legend_armor_reinforced_mail"],// 110
            [1, "chain/legend_armor_reinforced_mail_shirt"],// 80
            [1, "chain/legend_armor_reinforced_rotten_mail_shirt"],// 45
            [1, "chain/legend_armor_reinforced_worn_mail"],// 105
            [1, "chain/legend_armor_reinforced_worn_mail_shirt"],// 65
            [1, "chain/legend_armor_rusty_mail_shirt"],// 20
            [1, "chain/legend_armor_short_mail"],// 60
            [1, "chain/legend_southern_cloth"],// 30
            [1, "chain/legend_southern_padded_chest"],// 45
            [1, "chain/legend_southern_mail"],// 100
        ],
        Plate = [
            [1, "plate/legend_armor_leather_brigandine"],// 65
            [1, "plate/legend_armor_leather_brigandine_hardened"],// 110
            [1, "plate/legend_armor_leather_brigandine_hardened_full"],// 140
            [1, "plate/legend_armor_leather_brigandine_named"],// 75
            [1, "plate/legend_armor_leather_jacket"],// 25
            [1, "plate/legend_armor_leather_jacket_named"],// 30
            [1, "plate/legend_armor_leather_studded_jacket_named"],// 30
            [1, "plate/legend_armor_leather_jacket_simple"],// 15
            [1, "plate/legend_armor_leather_lamellar"],// 50
            [1, "plate/legend_armor_leather_lamellar_harness_heavy"],// 130
            [1, "plate/legend_armor_leather_lamellar_harness_reinforced"],// 150
            [1, "plate/legend_armor_leather_lamellar_heavy"],// 165
            [1, "plate/legend_armor_leather_lamellar_heavy_named"],// 140
            [1, "plate/legend_armor_leather_lamellar_reinforced"],// 55
            [1, "plate/legend_armor_leather_noble"],// 65
            [1, "plate/legend_armor_leather_padded"],// 40
            [1, "plate/legend_armor_leather_riveted"],// 95
            [1, "plate/legend_armor_leather_riveted_light"],// 80
            [1, "plate/legend_armor_leather_scale"],// 70
            [1, "plate/legend_armor_plate_ancient_chest"],// 105
            [1, "plate/legend_armor_plate_ancient_chest_restored"],// 110
            [1, "plate/legend_armor_plate_ancient_gladiator"],// 35
            [1, "plate/legend_armor_plate_ancient_harness"],// 115
            [1, "plate/legend_armor_plate_ancient_mail"],// 45
            [1, "plate/legend_armor_plate_ancient_scale"],// 105
            [1, "plate/legend_armor_plate_ancient_scale_coat"],// 140
            [1, "plate/legend_armor_plate_ancient_scale_harness"],// 75
            [1, "plate/legend_armor_plate_chest"],// 125
            [1, "plate/legend_armor_plate_chest_rotten"],// 100
            [1, "plate/legend_armor_plate_cuirass"],// 150
            [1, "plate/legend_armor_plate_full"],// 160
            [1, "plate/legend_armor_plate_full_greaves"],// 170
            [1, "plate/legend_armor_plate_full_greaves_named"],// 170
            [1, "plate/legend_armor_plate_full_greaves_painted"],// 170
            [1, "plate/legend_armor_scale"],// 100
            [1, "plate/legend_armor_scale_coat"],// 120
            [1, "plate/legend_armor_scale_coat_named"],// 160
            [1, "plate/legend_armor_scale_coat_rotten"],// 60
            [1, "plate/legend_armor_scale_shirt"],// 85
            [1, "plate/legend_animal_hide_armor"],// 30
            [1, "plate/legend_heavy_iron_armor"],// 120
            [1, "plate/legend_hide_and_bone_armor"],// 80
            [1, "plate/legend_reinforced_animal_hide_armor"],// 55
            [1, "plate/legend_rugged_scale_armor"],// 95
            [1, "plate/legend_scrap_metal_armor"],// 65
            [1, "plate/legend_thick_furs_armor"],// 10
            [1, "plate/legend_thick_plated_barbarian_armor"],// 155
            [1, "plate/legend_southern_named_golden_plates"],// 155
            [1, "plate/legend_southern_named_plates"],// 155
            [1, "plate/legend_southern_plate_full"],// 155
            [1, "plate/legend_southern_plate"],// 155
            [1, "plate/legend_southern_padded"],// 155
            [1, "plate/legend_southern_arm_guards"],// 155
            [1, "plate/legend_southern_strips"],// 155
            [1, "plate/legend_southern_leather_jacket"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
            [1, "plate/legend_southern_leather_scale"],// 155
            [1, "plate/legend_southern_scale"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
        ],
        Cloak = [
            [1, "cloak/legend_shoulder_cloth"],// 5
            [1, "cloak/legend_noble_shawl"],// 10
            [1, "cloak/legend_dark_wooly_cloak"],// 15
            [1, "cloak/legend_armor_cloak_common"],// 10
            [1, "cloak/legend_armor_cloak_heavy"],// 30
            [1, "cloak/legend_armor_cloak_crusader"],// 35
            [1, "cloak/legend_armor_cloak_noble"],// 25
            [1, "cloak/legend_sash"],// 3
            [1, "cloak/legend_southern_scarf"],// 5
            [1, "cloak/legend_animal_pelt"],// 15
            [1, "cloak/legend_southern_scarf_wrap"],// 15
        ],
        Tabard = [
            [1, "tabard/legend_common_tabard"],// 5
            [1, "tabard/legend_noble_tabard"],// 10
            [1, "tabard/legend_tattered_tabard"],// 2
            [1, "tabard/legend_southern_wrap_right"],// 2
            [1, "tabard/legend_southern_wrap_left"],// 2
            [1, "tabard/legend_southern_wide_belt"],// 2
            [1, "tabard/legend_noble_vest"],// 10
            [1, "tabard/legend_southern_wrap"],// 5
            [1, "tabard/legend_southern_shoulder_cloth"],// 5
            [1, "tabard/legend_southern_overcloth"],// 10
            [1, "tabard/legend_southern_tabard"],// 5
        ],
        Attachments =[
        ]
    }]
},{
    ID = "oriental/padded_vest", // 60
    Script = "",
    Sets = [{
        Cloth = [
            [1, "cloth/legend_ancient_cloth"],// 30
            [1, "cloth/legend_ancient_cloth_restored"],// 35
            [1, "cloth/legend_apron_butcher"],// 30
            [1, "cloth/legend_apron"],// 35
            [1, "cloth/legend_gambeson"],// 65
            [1, "cloth/legend_gambeson_plain"],// 65
            [1, "cloth/legend_gambeson_wolf"],// 70
            [1, "cloth/legend_gambeson_named"],// 70
            [1, "cloth/legend_padded_surcoat"],// 55
            [1, "cloth/legend_padded_surcoat_plain"],// 55
            [1, "cloth/legend_peasant_dress"],// 25
            [1, "cloth/legend_robes"],// 25
            [1, "cloth/legend_robes_magic"],// 40
            [1, "cloth/legend_robes_wizard"],// 30
            [1, "cloth/legend_robes_nun"],// 22
            [1, "cloth/legend_sackcloth_tattered"],// 5
            [1, "cloth/legend_sackcloth"],// 10
            [1, "cloth/legend_sackcloth_patched"],// 15
            [1, "cloth/legend_thick_tunic"],// 30
            [1, "cloth/legend_tunic"],// 20
            [1, "cloth/legend_tunic_wrap"],// 20
            [1, "cloth/legend_tunic_collar_thin"],// 20
            [1, "cloth/legend_tunic_collar_deep"],// 20
            [1, "cloth/legend_dark_tunic"],// 35
            [1, "cloth/legend_tunic_noble"],// 40
            [1, "cloth/legend_tunic_noble_named"],// 40
            [1, "cloth/legend_southern_robe"],// 25
            [1, "cloth/legend_southern_gambeson"],// 65
            [1, "cloth/legend_southern_split_gambeson"],// 65
            [1, "cloth/legend_southern_tunic"],// 25
            [1, "cloth/legend_southern_noble_surcoat"],// 55
        ],
        Chain = [
           [1, "chain/legend_armor_ancient_mail"],// 35
            [1, "chain/legend_armor_basic_mail"],// 85
            [1, "chain/legend_armor_hauberk"],// 95
            [1, "chain/legend_armor_hauberk_full"],// 115
            [1, "chain/legend_armor_hauberk_full_named"],// 120
            [1, "chain/legend_armor_hauberk_sleevless"],// 65
            [1, "chain/legend_armor_mail_shirt"],// 50
            [1, "chain/legend_armor_mail_shirt_simple"],// 25
            [1, "chain/legend_armor_reinforced_mail"],// 110
            [1, "chain/legend_armor_reinforced_mail_shirt"],// 80
            [1, "chain/legend_armor_reinforced_rotten_mail_shirt"],// 45
            [1, "chain/legend_armor_reinforced_worn_mail"],// 105
            [1, "chain/legend_armor_reinforced_worn_mail_shirt"],// 65
            [1, "chain/legend_armor_rusty_mail_shirt"],// 20
            [1, "chain/legend_armor_short_mail"],// 60
            [1, "chain/legend_southern_cloth"],// 30
            [1, "chain/legend_southern_padded_chest"],// 45
            [1, "chain/legend_southern_mail"],// 100
        ],
        Plate = [
            [1, "plate/legend_armor_leather_brigandine"],// 65
            [1, "plate/legend_armor_leather_brigandine_hardened"],// 110
            [1, "plate/legend_armor_leather_brigandine_hardened_full"],// 140
            [1, "plate/legend_armor_leather_brigandine_named"],// 75
            [1, "plate/legend_armor_leather_jacket"],// 25
            [1, "plate/legend_armor_leather_jacket_named"],// 30
            [1, "plate/legend_armor_leather_studded_jacket_named"],// 30
            [1, "plate/legend_armor_leather_jacket_simple"],// 15
            [1, "plate/legend_armor_leather_lamellar"],// 50
            [1, "plate/legend_armor_leather_lamellar_harness_heavy"],// 130
            [1, "plate/legend_armor_leather_lamellar_harness_reinforced"],// 150
            [1, "plate/legend_armor_leather_lamellar_heavy"],// 165
            [1, "plate/legend_armor_leather_lamellar_heavy_named"],// 140
            [1, "plate/legend_armor_leather_lamellar_reinforced"],// 55
            [1, "plate/legend_armor_leather_noble"],// 65
            [1, "plate/legend_armor_leather_padded"],// 40
            [1, "plate/legend_armor_leather_riveted"],// 95
            [1, "plate/legend_armor_leather_riveted_light"],// 80
            [1, "plate/legend_armor_leather_scale"],// 70
            [1, "plate/legend_armor_plate_ancient_chest"],// 105
            [1, "plate/legend_armor_plate_ancient_chest_restored"],// 110
            [1, "plate/legend_armor_plate_ancient_gladiator"],// 35
            [1, "plate/legend_armor_plate_ancient_harness"],// 115
            [1, "plate/legend_armor_plate_ancient_mail"],// 45
            [1, "plate/legend_armor_plate_ancient_scale"],// 105
            [1, "plate/legend_armor_plate_ancient_scale_coat"],// 140
            [1, "plate/legend_armor_plate_ancient_scale_harness"],// 75
            [1, "plate/legend_armor_plate_chest"],// 125
            [1, "plate/legend_armor_plate_chest_rotten"],// 100
            [1, "plate/legend_armor_plate_cuirass"],// 150
            [1, "plate/legend_armor_plate_full"],// 160
            [1, "plate/legend_armor_plate_full_greaves"],// 170
            [1, "plate/legend_armor_plate_full_greaves_named"],// 170
            [1, "plate/legend_armor_plate_full_greaves_painted"],// 170
            [1, "plate/legend_armor_scale"],// 100
            [1, "plate/legend_armor_scale_coat"],// 120
            [1, "plate/legend_armor_scale_coat_named"],// 160
            [1, "plate/legend_armor_scale_coat_rotten"],// 60
            [1, "plate/legend_armor_scale_shirt"],// 85
            [1, "plate/legend_animal_hide_armor"],// 30
            [1, "plate/legend_heavy_iron_armor"],// 120
            [1, "plate/legend_hide_and_bone_armor"],// 80
            [1, "plate/legend_reinforced_animal_hide_armor"],// 55
            [1, "plate/legend_rugged_scale_armor"],// 95
            [1, "plate/legend_scrap_metal_armor"],// 65
            [1, "plate/legend_thick_furs_armor"],// 10
            [1, "plate/legend_thick_plated_barbarian_armor"],// 155
            [1, "plate/legend_southern_named_golden_plates"],// 155
            [1, "plate/legend_southern_named_plates"],// 155
            [1, "plate/legend_southern_plate_full"],// 155
            [1, "plate/legend_southern_plate"],// 155
            [1, "plate/legend_southern_padded"],// 155
            [1, "plate/legend_southern_arm_guards"],// 155
            [1, "plate/legend_southern_strips"],// 155
            [1, "plate/legend_southern_leather_jacket"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
            [1, "plate/legend_southern_leather_scale"],// 155
            [1, "plate/legend_southern_scale"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
        ],
        Cloak = [
            [1, "cloak/legend_shoulder_cloth"],// 5
            [1, "cloak/legend_noble_shawl"],// 10
            [1, "cloak/legend_dark_wooly_cloak"],// 15
            [1, "cloak/legend_armor_cloak_common"],// 10
            [1, "cloak/legend_armor_cloak_heavy"],// 30
            [1, "cloak/legend_armor_cloak_crusader"],// 35
            [1, "cloak/legend_armor_cloak_noble"],// 25
            [1, "cloak/legend_sash"],// 3
            [1, "cloak/legend_southern_scarf"],// 5
            [1, "cloak/legend_animal_pelt"],// 15
            [1, "cloak/legend_southern_scarf_wrap"],// 15
        ],
        Tabard = [
            [1, "tabard/legend_common_tabard"],// 5
            [1, "tabard/legend_noble_tabard"],// 10
            [1, "tabard/legend_tattered_tabard"],// 2
            [1, "tabard/legend_southern_wrap_right"],// 2
            [1, "tabard/legend_southern_wrap_left"],// 2
            [1, "tabard/legend_southern_wide_belt"],// 2
            [1, "tabard/legend_noble_vest"],// 10
            [1, "tabard/legend_southern_wrap"],// 5
            [1, "tabard/legend_southern_shoulder_cloth"],// 5
            [1, "tabard/legend_southern_overcloth"],// 10
            [1, "tabard/legend_southern_tabard"],// 5
        ],
        Attachments =[
        ]
    }]
},{
    ID = "oriental/plated_nomad_mail", // 105
    Script = "",
    Sets = [{
        Cloth = [
            [1, "cloth/legend_ancient_cloth"],// 30
            [1, "cloth/legend_ancient_cloth_restored"],// 35
            [1, "cloth/legend_apron_butcher"],// 30
            [1, "cloth/legend_apron"],// 35
            [1, "cloth/legend_gambeson"],// 65
            [1, "cloth/legend_gambeson_plain"],// 65
            [1, "cloth/legend_gambeson_wolf"],// 70
            [1, "cloth/legend_gambeson_named"],// 70
            [1, "cloth/legend_padded_surcoat"],// 55
            [1, "cloth/legend_padded_surcoat_plain"],// 55
            [1, "cloth/legend_peasant_dress"],// 25
            [1, "cloth/legend_robes"],// 25
            [1, "cloth/legend_robes_magic"],// 40
            [1, "cloth/legend_robes_wizard"],// 30
            [1, "cloth/legend_robes_nun"],// 22
            [1, "cloth/legend_sackcloth_tattered"],// 5
            [1, "cloth/legend_sackcloth"],// 10
            [1, "cloth/legend_sackcloth_patched"],// 15
            [1, "cloth/legend_thick_tunic"],// 30
            [1, "cloth/legend_tunic"],// 20
            [1, "cloth/legend_tunic_wrap"],// 20
            [1, "cloth/legend_tunic_collar_thin"],// 20
            [1, "cloth/legend_tunic_collar_deep"],// 20
            [1, "cloth/legend_dark_tunic"],// 35
            [1, "cloth/legend_tunic_noble"],// 40
            [1, "cloth/legend_tunic_noble_named"],// 40
            [1, "cloth/legend_southern_robe"],// 25
            [1, "cloth/legend_southern_gambeson"],// 65
            [1, "cloth/legend_southern_split_gambeson"],// 65
            [1, "cloth/legend_southern_tunic"],// 25
            [1, "cloth/legend_southern_noble_surcoat"],// 55
        ],
        Chain = [
           [1, "chain/legend_armor_ancient_mail"],// 35
            [1, "chain/legend_armor_basic_mail"],// 85
            [1, "chain/legend_armor_hauberk"],// 95
            [1, "chain/legend_armor_hauberk_full"],// 115
            [1, "chain/legend_armor_hauberk_full_named"],// 120
            [1, "chain/legend_armor_hauberk_sleevless"],// 65
            [1, "chain/legend_armor_mail_shirt"],// 50
            [1, "chain/legend_armor_mail_shirt_simple"],// 25
            [1, "chain/legend_armor_reinforced_mail"],// 110
            [1, "chain/legend_armor_reinforced_mail_shirt"],// 80
            [1, "chain/legend_armor_reinforced_rotten_mail_shirt"],// 45
            [1, "chain/legend_armor_reinforced_worn_mail"],// 105
            [1, "chain/legend_armor_reinforced_worn_mail_shirt"],// 65
            [1, "chain/legend_armor_rusty_mail_shirt"],// 20
            [1, "chain/legend_armor_short_mail"],// 60
            [1, "chain/legend_southern_cloth"],// 30
            [1, "chain/legend_southern_padded_chest"],// 45
            [1, "chain/legend_southern_mail"],// 100
        ],
        Plate = [
            [1, "plate/legend_armor_leather_brigandine"],// 65
            [1, "plate/legend_armor_leather_brigandine_hardened"],// 110
            [1, "plate/legend_armor_leather_brigandine_hardened_full"],// 140
            [1, "plate/legend_armor_leather_brigandine_named"],// 75
            [1, "plate/legend_armor_leather_jacket"],// 25
            [1, "plate/legend_armor_leather_jacket_named"],// 30
            [1, "plate/legend_armor_leather_studded_jacket_named"],// 30
            [1, "plate/legend_armor_leather_jacket_simple"],// 15
            [1, "plate/legend_armor_leather_lamellar"],// 50
            [1, "plate/legend_armor_leather_lamellar_harness_heavy"],// 130
            [1, "plate/legend_armor_leather_lamellar_harness_reinforced"],// 150
            [1, "plate/legend_armor_leather_lamellar_heavy"],// 165
            [1, "plate/legend_armor_leather_lamellar_heavy_named"],// 140
            [1, "plate/legend_armor_leather_lamellar_reinforced"],// 55
            [1, "plate/legend_armor_leather_noble"],// 65
            [1, "plate/legend_armor_leather_padded"],// 40
            [1, "plate/legend_armor_leather_riveted"],// 95
            [1, "plate/legend_armor_leather_riveted_light"],// 80
            [1, "plate/legend_armor_leather_scale"],// 70
            [1, "plate/legend_armor_plate_ancient_chest"],// 105
            [1, "plate/legend_armor_plate_ancient_chest_restored"],// 110
            [1, "plate/legend_armor_plate_ancient_gladiator"],// 35
            [1, "plate/legend_armor_plate_ancient_harness"],// 115
            [1, "plate/legend_armor_plate_ancient_mail"],// 45
            [1, "plate/legend_armor_plate_ancient_scale"],// 105
            [1, "plate/legend_armor_plate_ancient_scale_coat"],// 140
            [1, "plate/legend_armor_plate_ancient_scale_harness"],// 75
            [1, "plate/legend_armor_plate_chest"],// 125
            [1, "plate/legend_armor_plate_chest_rotten"],// 100
            [1, "plate/legend_armor_plate_cuirass"],// 150
            [1, "plate/legend_armor_plate_full"],// 160
            [1, "plate/legend_armor_plate_full_greaves"],// 170
            [1, "plate/legend_armor_plate_full_greaves_named"],// 170
            [1, "plate/legend_armor_plate_full_greaves_painted"],// 170
            [1, "plate/legend_armor_scale"],// 100
            [1, "plate/legend_armor_scale_coat"],// 120
            [1, "plate/legend_armor_scale_coat_named"],// 160
            [1, "plate/legend_armor_scale_coat_rotten"],// 60
            [1, "plate/legend_armor_scale_shirt"],// 85
            [1, "plate/legend_animal_hide_armor"],// 30
            [1, "plate/legend_heavy_iron_armor"],// 120
            [1, "plate/legend_hide_and_bone_armor"],// 80
            [1, "plate/legend_reinforced_animal_hide_armor"],// 55
            [1, "plate/legend_rugged_scale_armor"],// 95
            [1, "plate/legend_scrap_metal_armor"],// 65
            [1, "plate/legend_thick_furs_armor"],// 10
            [1, "plate/legend_thick_plated_barbarian_armor"],// 155
            [1, "plate/legend_southern_named_golden_plates"],// 155
            [1, "plate/legend_southern_named_plates"],// 155
            [1, "plate/legend_southern_plate_full"],// 155
            [1, "plate/legend_southern_plate"],// 155
            [1, "plate/legend_southern_padded"],// 155
            [1, "plate/legend_southern_arm_guards"],// 155
            [1, "plate/legend_southern_strips"],// 155
            [1, "plate/legend_southern_leather_jacket"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
            [1, "plate/legend_southern_leather_scale"],// 155
            [1, "plate/legend_southern_scale"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
        ],
        Cloak = [
            [1, "cloak/legend_shoulder_cloth"],// 5
            [1, "cloak/legend_noble_shawl"],// 10
            [1, "cloak/legend_dark_wooly_cloak"],// 15
            [1, "cloak/legend_armor_cloak_common"],// 10
            [1, "cloak/legend_armor_cloak_heavy"],// 30
            [1, "cloak/legend_armor_cloak_crusader"],// 35
            [1, "cloak/legend_armor_cloak_noble"],// 25
            [1, "cloak/legend_sash"],// 3
            [1, "cloak/legend_southern_scarf"],// 5
            [1, "cloak/legend_animal_pelt"],// 15
            [1, "cloak/legend_southern_scarf_wrap"],// 15
        ],
        Tabard = [
            [1, "tabard/legend_common_tabard"],// 5
            [1, "tabard/legend_noble_tabard"],// 10
            [1, "tabard/legend_tattered_tabard"],// 2
            [1, "tabard/legend_southern_wrap_right"],// 2
            [1, "tabard/legend_southern_wrap_left"],// 2
            [1, "tabard/legend_southern_wide_belt"],// 2
            [1, "tabard/legend_noble_vest"],// 10
            [1, "tabard/legend_southern_wrap"],// 5
            [1, "tabard/legend_southern_shoulder_cloth"],// 5
            [1, "tabard/legend_southern_overcloth"],// 10
            [1, "tabard/legend_southern_tabard"],// 5
        ],
        Attachments =[
        ]
    }]
},{
    ID = "oriental/southern_long_mail_with_padding", // 200
    Script = "",
    Sets = [{
        Cloth = [
            [1, "cloth/legend_ancient_cloth"], // 30
            [1, "cloth/legend_ancient_cloth_restored"], // 35
            [1, "cloth/legend_apron_butcher"], // 30
            [1, "cloth/legend_apron"], // 35
            [1, "cloth/legend_dark_tunic"], // 35
            [1, "cloth/legend_gambeson"], // 65
            [1, "cloth/legend_gambeson_common_color"], // 65
            [1, "cloth/legend_gambeson_named"], // 70
            [1, "cloth/legend_gambeson_plain"], // 65
            [1, "cloth/legend_gambeson_rare_color"], // 65
            [1, "cloth/legend_gambeson_wolf"], // 70
            [1, "cloth/legend_padded_surcoat"], // 55
            [1, "cloth/legend_peasant_dress"], // 25
            [1, "cloth/legend_robes"], // 25

            [1, "cloth/legend_robes_magic"], // 40
            [1, "cloth/legend_robes_nun"], // 22
            [1, "cloth/legend_robes_wizard"], // 40
            [1, "cloth/legend_sackcloth"], // 10
            [1, "cloth/legend_sackcloth_patched"], // 15
            [1, "cloth/legend_sackcloth_tattered"], // 5
            [1, "cloth/legend_thick_tunic"], // 30
            [1, "cloth/legend_tunic"], // 20
            [1, "cloth/legend_tunic_noble"], // 40
        ],
        Chain = [
           [1, "chain/legend_armor_ancient_mail"],// 35
            [1, "chain/legend_armor_basic_mail"],// 85
            [1, "chain/legend_armor_hauberk"],// 95
            [1, "chain/legend_armor_hauberk_full"],// 115
            [1, "chain/legend_armor_hauberk_full_named"],// 120
            [1, "chain/legend_armor_hauberk_sleevless"],// 65
            [1, "chain/legend_armor_mail_shirt"],// 50
            [1, "chain/legend_armor_mail_shirt_simple"],// 25
            [1, "chain/legend_armor_reinforced_mail"],// 110
            [1, "chain/legend_armor_reinforced_mail_shirt"],// 80
            [1, "chain/legend_armor_reinforced_rotten_mail_shirt"],// 45
            [1, "chain/legend_armor_reinforced_worn_mail"],// 105
            [1, "chain/legend_armor_reinforced_worn_mail_shirt"],// 65
            [1, "chain/legend_armor_rusty_mail_shirt"],// 20
            [1, "chain/legend_armor_short_mail"],// 60
            [1, "chain/legend_southern_cloth"],// 30
            [1, "chain/legend_southern_padded_chest"],// 45
            [1, "chain/legend_southern_mail"],// 100
        ],
        Plate = [
            [1, "plate/legend_armor_leather_brigandine"],// 65
            [1, "plate/legend_armor_leather_brigandine_hardened"],// 110
            [1, "plate/legend_armor_leather_brigandine_hardened_full"],// 140
            [1, "plate/legend_armor_leather_brigandine_named"],// 75
            [1, "plate/legend_armor_leather_jacket"],// 25
            [1, "plate/legend_armor_leather_jacket_named"],// 30
            [1, "plate/legend_armor_leather_studded_jacket_named"],// 30
            [1, "plate/legend_armor_leather_jacket_simple"],// 15
            [1, "plate/legend_armor_leather_lamellar"],// 50
            [1, "plate/legend_armor_leather_lamellar_harness_heavy"],// 130
            [1, "plate/legend_armor_leather_lamellar_harness_reinforced"],// 150
            [1, "plate/legend_armor_leather_lamellar_heavy"],// 165
            [1, "plate/legend_armor_leather_lamellar_heavy_named"],// 140
            [1, "plate/legend_armor_leather_lamellar_reinforced"],// 55
            [1, "plate/legend_armor_leather_noble"],// 65
            [1, "plate/legend_armor_leather_padded"],// 40
            [1, "plate/legend_armor_leather_riveted"],// 95
            [1, "plate/legend_armor_leather_riveted_light"],// 80
            [1, "plate/legend_armor_leather_scale"],// 70
            [1, "plate/legend_armor_plate_ancient_chest"],// 105
            [1, "plate/legend_armor_plate_ancient_chest_restored"],// 110
            [1, "plate/legend_armor_plate_ancient_gladiator"],// 35
            [1, "plate/legend_armor_plate_ancient_harness"],// 115
            [1, "plate/legend_armor_plate_ancient_mail"],// 45
            [1, "plate/legend_armor_plate_ancient_scale"],// 105
            [1, "plate/legend_armor_plate_ancient_scale_coat"],// 140
            [1, "plate/legend_armor_plate_ancient_scale_harness"],// 75
            [1, "plate/legend_armor_plate_chest"],// 125
            [1, "plate/legend_armor_plate_chest_rotten"],// 100
            [1, "plate/legend_armor_plate_cuirass"],// 150
            [1, "plate/legend_armor_plate_full"],// 160
            [1, "plate/legend_armor_plate_full_greaves"],// 170
            [1, "plate/legend_armor_plate_full_greaves_named"],// 170
            [1, "plate/legend_armor_plate_full_greaves_painted"],// 170
            [1, "plate/legend_armor_scale"],// 100
            [1, "plate/legend_armor_scale_coat"],// 120
            [1, "plate/legend_armor_scale_coat_named"],// 160
            [1, "plate/legend_armor_scale_coat_rotten"],// 60
            [1, "plate/legend_armor_scale_shirt"],// 85
            [1, "plate/legend_animal_hide_armor"],// 30
            [1, "plate/legend_heavy_iron_armor"],// 120
            [1, "plate/legend_hide_and_bone_armor"],// 80
            [1, "plate/legend_reinforced_animal_hide_armor"],// 55
            [1, "plate/legend_rugged_scale_armor"],// 95
            [1, "plate/legend_scrap_metal_armor"],// 65
            [1, "plate/legend_thick_furs_armor"],// 10
            [1, "plate/legend_thick_plated_barbarian_armor"],// 155
            [1, "plate/legend_southern_named_golden_plates"],// 155
            [1, "plate/legend_southern_named_plates"],// 155
            [1, "plate/legend_southern_plate_full"],// 155
            [1, "plate/legend_southern_plate"],// 155
            [1, "plate/legend_southern_padded"],// 155
            [1, "plate/legend_southern_arm_guards"],// 155
            [1, "plate/legend_southern_strips"],// 155
            [1, "plate/legend_southern_leather_jacket"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
            [1, "plate/legend_southern_leather_scale"],// 155
            [1, "plate/legend_southern_scale"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
        ],
        Cloak = [
            [1, "cloak/legend_shoulder_cloth"],// 5
            [1, "cloak/legend_noble_shawl"],// 10
            [1, "cloak/legend_dark_wooly_cloak"],// 15
            [1, "cloak/legend_armor_cloak_common"],// 10
            [1, "cloak/legend_armor_cloak_heavy"],// 30
            [1, "cloak/legend_armor_cloak_crusader"],// 35
            [1, "cloak/legend_armor_cloak_noble"],// 25
            [1, "cloak/legend_sash"],// 3
            [1, "cloak/legend_southern_scarf"],// 5
            [1, "cloak/legend_animal_pelt"],// 15
            [1, "cloak/legend_southern_scarf_wrap"],// 15
        ],
        Tabard = [
            [1, "tabard/legend_common_tabard"],// 5
            [1, "tabard/legend_noble_tabard"],// 10
            [1, "tabard/legend_tattered_tabard"],// 2
            [1, "tabard/legend_southern_wrap_right"],// 2
            [1, "tabard/legend_southern_wrap_left"],// 2
            [1, "tabard/legend_southern_wide_belt"],// 2
            [1, "tabard/legend_noble_vest"],// 10
            [1, "tabard/legend_southern_wrap"],// 5
            [1, "tabard/legend_southern_shoulder_cloth"],// 5
            [1, "tabard/legend_southern_overcloth"],// 10
            [1, "tabard/legend_southern_tabard"],// 5
        ],
        Attachments =[
        ]
    }]
},{
    ID = "oriental/southern_mail_shirt", // 110
    Script = "",
    Sets = [{
        Cloth = [
            [1, "cloth/legend_ancient_cloth"], // 30
            [1, "cloth/legend_ancient_cloth_restored"], // 35
            [1, "cloth/legend_apron_butcher"], // 30
            [1, "cloth/legend_apron"], // 35
            [1, "cloth/legend_dark_tunic"], // 35
            [1, "cloth/legend_gambeson"], // 65
            [1, "cloth/legend_gambeson_common_color"], // 65
            [1, "cloth/legend_gambeson_named"], // 70
            [1, "cloth/legend_gambeson_plain"], // 65
            [1, "cloth/legend_gambeson_rare_color"], // 65
            [1, "cloth/legend_gambeson_wolf"], // 70
            [1, "cloth/legend_padded_surcoat"], // 55
            [1, "cloth/legend_peasant_dress"], // 25
            [1, "cloth/legend_robes"], // 25

            [1, "cloth/legend_robes_magic"], // 40
            [1, "cloth/legend_robes_nun"], // 22
            [1, "cloth/legend_robes_wizard"], // 40
            [1, "cloth/legend_sackcloth"], // 10
            [1, "cloth/legend_sackcloth_patched"], // 15
            [1, "cloth/legend_sackcloth_tattered"], // 5
            [1, "cloth/legend_thick_tunic"], // 30
            [1, "cloth/legend_tunic"], // 20
            [1, "cloth/legend_tunic_noble"], // 40
        ],
        Chain = [
           [1, "chain/legend_armor_ancient_mail"],// 35
            [1, "chain/legend_armor_basic_mail"],// 85
            [1, "chain/legend_armor_hauberk"],// 95
            [1, "chain/legend_armor_hauberk_full"],// 115
            [1, "chain/legend_armor_hauberk_full_named"],// 120
            [1, "chain/legend_armor_hauberk_sleevless"],// 65
            [1, "chain/legend_armor_mail_shirt"],// 50
            [1, "chain/legend_armor_mail_shirt_simple"],// 25
            [1, "chain/legend_armor_reinforced_mail"],// 110
            [1, "chain/legend_armor_reinforced_mail_shirt"],// 80
            [1, "chain/legend_armor_reinforced_rotten_mail_shirt"],// 45
            [1, "chain/legend_armor_reinforced_worn_mail"],// 105
            [1, "chain/legend_armor_reinforced_worn_mail_shirt"],// 65
            [1, "chain/legend_armor_rusty_mail_shirt"],// 20
            [1, "chain/legend_armor_short_mail"],// 60
            [1, "chain/legend_southern_cloth"],// 30
            [1, "chain/legend_southern_padded_chest"],// 45
            [1, "chain/legend_southern_mail"],// 100
        ],
        Plate = [
            [1, "plate/legend_armor_leather_brigandine"],// 65
            [1, "plate/legend_armor_leather_brigandine_hardened"],// 110
            [1, "plate/legend_armor_leather_brigandine_hardened_full"],// 140
            [1, "plate/legend_armor_leather_brigandine_named"],// 75
            [1, "plate/legend_armor_leather_jacket"],// 25
            [1, "plate/legend_armor_leather_jacket_named"],// 30
            [1, "plate/legend_armor_leather_studded_jacket_named"],// 30
            [1, "plate/legend_armor_leather_jacket_simple"],// 15
            [1, "plate/legend_armor_leather_lamellar"],// 50
            [1, "plate/legend_armor_leather_lamellar_harness_heavy"],// 130
            [1, "plate/legend_armor_leather_lamellar_harness_reinforced"],// 150
            [1, "plate/legend_armor_leather_lamellar_heavy"],// 165
            [1, "plate/legend_armor_leather_lamellar_heavy_named"],// 140
            [1, "plate/legend_armor_leather_lamellar_reinforced"],// 55
            [1, "plate/legend_armor_leather_noble"],// 65
            [1, "plate/legend_armor_leather_padded"],// 40
            [1, "plate/legend_armor_leather_riveted"],// 95
            [1, "plate/legend_armor_leather_riveted_light"],// 80
            [1, "plate/legend_armor_leather_scale"],// 70
            [1, "plate/legend_armor_plate_ancient_chest"],// 105
            [1, "plate/legend_armor_plate_ancient_chest_restored"],// 110
            [1, "plate/legend_armor_plate_ancient_gladiator"],// 35
            [1, "plate/legend_armor_plate_ancient_harness"],// 115
            [1, "plate/legend_armor_plate_ancient_mail"],// 45
            [1, "plate/legend_armor_plate_ancient_scale"],// 105
            [1, "plate/legend_armor_plate_ancient_scale_coat"],// 140
            [1, "plate/legend_armor_plate_ancient_scale_harness"],// 75
            [1, "plate/legend_armor_plate_chest"],// 125
            [1, "plate/legend_armor_plate_chest_rotten"],// 100
            [1, "plate/legend_armor_plate_cuirass"],// 150
            [1, "plate/legend_armor_plate_full"],// 160
            [1, "plate/legend_armor_plate_full_greaves"],// 170
            [1, "plate/legend_armor_plate_full_greaves_named"],// 170
            [1, "plate/legend_armor_plate_full_greaves_painted"],// 170
            [1, "plate/legend_armor_scale"],// 100
            [1, "plate/legend_armor_scale_coat"],// 120
            [1, "plate/legend_armor_scale_coat_named"],// 160
            [1, "plate/legend_armor_scale_coat_rotten"],// 60
            [1, "plate/legend_armor_scale_shirt"],// 85
            [1, "plate/legend_animal_hide_armor"],// 30
            [1, "plate/legend_heavy_iron_armor"],// 120
            [1, "plate/legend_hide_and_bone_armor"],// 80
            [1, "plate/legend_reinforced_animal_hide_armor"],// 55
            [1, "plate/legend_rugged_scale_armor"],// 95
            [1, "plate/legend_scrap_metal_armor"],// 65
            [1, "plate/legend_thick_furs_armor"],// 10
            [1, "plate/legend_thick_plated_barbarian_armor"],// 155
            [1, "plate/legend_southern_named_golden_plates"],// 155
            [1, "plate/legend_southern_named_plates"],// 155
            [1, "plate/legend_southern_plate_full"],// 155
            [1, "plate/legend_southern_plate"],// 155
            [1, "plate/legend_southern_padded"],// 155
            [1, "plate/legend_southern_arm_guards"],// 155
            [1, "plate/legend_southern_strips"],// 155
            [1, "plate/legend_southern_leather_jacket"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
            [1, "plate/legend_southern_leather_scale"],// 155
            [1, "plate/legend_southern_scale"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
        ],
        Cloak = [
            [1, "cloak/legend_shoulder_cloth"],// 5
            [1, "cloak/legend_noble_shawl"],// 10
            [1, "cloak/legend_dark_wooly_cloak"],// 15
            [1, "cloak/legend_armor_cloak_common"],// 10
            [1, "cloak/legend_armor_cloak_heavy"],// 30
            [1, "cloak/legend_armor_cloak_crusader"],// 35
            [1, "cloak/legend_armor_cloak_noble"],// 25
            [1, "cloak/legend_sash"],// 3
            [1, "cloak/legend_southern_scarf"],// 5
            [1, "cloak/legend_animal_pelt"],// 15
            [1, "cloak/legend_southern_scarf_wrap"],// 15
        ],
        Tabard = [
            [1, "tabard/legend_common_tabard"],// 5
            [1, "tabard/legend_noble_tabard"],// 10
            [1, "tabard/legend_tattered_tabard"],// 2
            [1, "tabard/legend_southern_wrap_right"],// 2
            [1, "tabard/legend_southern_wrap_left"],// 2
            [1, "tabard/legend_southern_wide_belt"],// 2
            [1, "tabard/legend_noble_vest"],// 10
            [1, "tabard/legend_southern_wrap"],// 5
            [1, "tabard/legend_southern_shoulder_cloth"],// 5
            [1, "tabard/legend_southern_overcloth"],// 10
            [1, "tabard/legend_southern_tabard"],// 5
        ],
        Attachments =[
        ]
    }]
},{
    ID = "oriental/stitched_nomad_armor", // 80
    Script = "",
    Sets = [{
        Cloth = [
            [1, "cloth/legend_ancient_cloth"],// 30
            [1, "cloth/legend_ancient_cloth_restored"],// 35
            [1, "cloth/legend_apron_butcher"],// 30
            [1, "cloth/legend_apron"],// 35
            [1, "cloth/legend_gambeson"],// 65
            [1, "cloth/legend_gambeson_plain"],// 65
            [1, "cloth/legend_gambeson_wolf"],// 70
            [1, "cloth/legend_gambeson_named"],// 70
            [1, "cloth/legend_padded_surcoat"],// 55
            [1, "cloth/legend_padded_surcoat_plain"],// 55
            [1, "cloth/legend_peasant_dress"],// 25
            [1, "cloth/legend_robes"],// 25
            [1, "cloth/legend_robes_magic"],// 40
            [1, "cloth/legend_robes_wizard"],// 30
            [1, "cloth/legend_robes_nun"],// 22
            [1, "cloth/legend_sackcloth_tattered"],// 5
            [1, "cloth/legend_sackcloth"],// 10
            [1, "cloth/legend_sackcloth_patched"],// 15
            [1, "cloth/legend_thick_tunic"],// 30
            [1, "cloth/legend_tunic"],// 20
            [1, "cloth/legend_tunic_wrap"],// 20
            [1, "cloth/legend_tunic_collar_thin"],// 20
            [1, "cloth/legend_tunic_collar_deep"],// 20
            [1, "cloth/legend_dark_tunic"],// 35
            [1, "cloth/legend_tunic_noble"],// 40
            [1, "cloth/legend_tunic_noble_named"],// 40
            [1, "cloth/legend_southern_robe"],// 25
            [1, "cloth/legend_southern_gambeson"],// 65
            [1, "cloth/legend_southern_split_gambeson"],// 65
            [1, "cloth/legend_southern_tunic"],// 25
            [1, "cloth/legend_southern_noble_surcoat"],// 55
        ],
        Chain = [
           [1, "chain/legend_armor_ancient_mail"],// 35
            [1, "chain/legend_armor_basic_mail"],// 85
            [1, "chain/legend_armor_hauberk"],// 95
            [1, "chain/legend_armor_hauberk_full"],// 115
            [1, "chain/legend_armor_hauberk_full_named"],// 120
            [1, "chain/legend_armor_hauberk_sleevless"],// 65
            [1, "chain/legend_armor_mail_shirt"],// 50
            [1, "chain/legend_armor_mail_shirt_simple"],// 25
            [1, "chain/legend_armor_reinforced_mail"],// 110
            [1, "chain/legend_armor_reinforced_mail_shirt"],// 80
            [1, "chain/legend_armor_reinforced_rotten_mail_shirt"],// 45
            [1, "chain/legend_armor_reinforced_worn_mail"],// 105
            [1, "chain/legend_armor_reinforced_worn_mail_shirt"],// 65
            [1, "chain/legend_armor_rusty_mail_shirt"],// 20
            [1, "chain/legend_armor_short_mail"],// 60
            [1, "chain/legend_southern_cloth"],// 30
            [1, "chain/legend_southern_padded_chest"],// 45
            [1, "chain/legend_southern_mail"],// 100
        ],
        Plate = [
            [1, "plate/legend_armor_leather_brigandine"],// 65
            [1, "plate/legend_armor_leather_brigandine_hardened"],// 110
            [1, "plate/legend_armor_leather_brigandine_hardened_full"],// 140
            [1, "plate/legend_armor_leather_brigandine_named"],// 75
            [1, "plate/legend_armor_leather_jacket"],// 25
            [1, "plate/legend_armor_leather_jacket_named"],// 30
            [1, "plate/legend_armor_leather_studded_jacket_named"],// 30
            [1, "plate/legend_armor_leather_jacket_simple"],// 15
            [1, "plate/legend_armor_leather_lamellar"],// 50
            [1, "plate/legend_armor_leather_lamellar_harness_heavy"],// 130
            [1, "plate/legend_armor_leather_lamellar_harness_reinforced"],// 150
            [1, "plate/legend_armor_leather_lamellar_heavy"],// 165
            [1, "plate/legend_armor_leather_lamellar_heavy_named"],// 140
            [1, "plate/legend_armor_leather_lamellar_reinforced"],// 55
            [1, "plate/legend_armor_leather_noble"],// 65
            [1, "plate/legend_armor_leather_padded"],// 40
            [1, "plate/legend_armor_leather_riveted"],// 95
            [1, "plate/legend_armor_leather_riveted_light"],// 80
            [1, "plate/legend_armor_leather_scale"],// 70
            [1, "plate/legend_armor_plate_ancient_chest"],// 105
            [1, "plate/legend_armor_plate_ancient_chest_restored"],// 110
            [1, "plate/legend_armor_plate_ancient_gladiator"],// 35
            [1, "plate/legend_armor_plate_ancient_harness"],// 115
            [1, "plate/legend_armor_plate_ancient_mail"],// 45
            [1, "plate/legend_armor_plate_ancient_scale"],// 105
            [1, "plate/legend_armor_plate_ancient_scale_coat"],// 140
            [1, "plate/legend_armor_plate_ancient_scale_harness"],// 75
            [1, "plate/legend_armor_plate_chest"],// 125
            [1, "plate/legend_armor_plate_chest_rotten"],// 100
            [1, "plate/legend_armor_plate_cuirass"],// 150
            [1, "plate/legend_armor_plate_full"],// 160
            [1, "plate/legend_armor_plate_full_greaves"],// 170
            [1, "plate/legend_armor_plate_full_greaves_named"],// 170
            [1, "plate/legend_armor_plate_full_greaves_painted"],// 170
            [1, "plate/legend_armor_scale"],// 100
            [1, "plate/legend_armor_scale_coat"],// 120
            [1, "plate/legend_armor_scale_coat_named"],// 160
            [1, "plate/legend_armor_scale_coat_rotten"],// 60
            [1, "plate/legend_armor_scale_shirt"],// 85
            [1, "plate/legend_animal_hide_armor"],// 30
            [1, "plate/legend_heavy_iron_armor"],// 120
            [1, "plate/legend_hide_and_bone_armor"],// 80
            [1, "plate/legend_reinforced_animal_hide_armor"],// 55
            [1, "plate/legend_rugged_scale_armor"],// 95
            [1, "plate/legend_scrap_metal_armor"],// 65
            [1, "plate/legend_thick_furs_armor"],// 10
            [1, "plate/legend_thick_plated_barbarian_armor"],// 155
            [1, "plate/legend_southern_named_golden_plates"],// 155
            [1, "plate/legend_southern_named_plates"],// 155
            [1, "plate/legend_southern_plate_full"],// 155
            [1, "plate/legend_southern_plate"],// 155
            [1, "plate/legend_southern_padded"],// 155
            [1, "plate/legend_southern_arm_guards"],// 155
            [1, "plate/legend_southern_strips"],// 155
            [1, "plate/legend_southern_leather_jacket"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
            [1, "plate/legend_southern_leather_scale"],// 155
            [1, "plate/legend_southern_scale"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
        ],
        Cloak = [
            [1, "cloak/legend_shoulder_cloth"],// 5
            [1, "cloak/legend_noble_shawl"],// 10
            [1, "cloak/legend_dark_wooly_cloak"],// 15
            [1, "cloak/legend_armor_cloak_common"],// 10
            [1, "cloak/legend_armor_cloak_heavy"],// 30
            [1, "cloak/legend_armor_cloak_crusader"],// 35
            [1, "cloak/legend_armor_cloak_noble"],// 25
            [1, "cloak/legend_sash"],// 3
            [1, "cloak/legend_southern_scarf"],// 5
            [1, "cloak/legend_animal_pelt"],// 15
            [1, "cloak/legend_southern_scarf_wrap"],// 15
        ],
        Tabard = [
            [1, "tabard/legend_common_tabard"],// 5
            [1, "tabard/legend_noble_tabard"],// 10
            [1, "tabard/legend_tattered_tabard"],// 2
            [1, "tabard/legend_southern_wrap_right"],// 2
            [1, "tabard/legend_southern_wrap_left"],// 2
            [1, "tabard/legend_southern_wide_belt"],// 2
            [1, "tabard/legend_noble_vest"],// 10
            [1, "tabard/legend_southern_wrap"],// 5
            [1, "tabard/legend_southern_shoulder_cloth"],// 5
            [1, "tabard/legend_southern_overcloth"],// 10
            [1, "tabard/legend_southern_tabard"],// 5
        ],
        Attachments =[
        ]
    }]
},{
    ID = "oriental/thick_nomad_robe", // 50
    Script = "",
    Sets = [{
        Cloth = [
            [1, "cloth/legend_ancient_cloth"], // 30
            [1, "cloth/legend_ancient_cloth_restored"], // 35
            [1, "cloth/legend_apron"], // 30
            [1, "cloth/legend_apron_butcher"], // 40

            [1, "cloth/legend_dark_tunic"], // 35
            [1, "cloth/legend_gambeson"], // 65
            [1, "cloth/legend_gambeson_common_color"], // 65
            [1, "cloth/legend_gambeson_named"], // 70
            [1, "cloth/legend_gambeson_plain"], // 65
            [1, "cloth/legend_gambeson_rare_color"], // 65
            [1, "cloth/legend_gambeson_wolf"], // 70
            [1, "cloth/legend_padded_surcoat"], // 55
            [1, "cloth/legend_peasant_dress"], // 25
            [1, "cloth/legend_robes"], // 25

            [1, "cloth/legend_robes_magic"], // 40
            [1, "cloth/legend_robes_nun"], // 22
            [1, "cloth/legend_robes_wizard"], // 40
            [1, "cloth/legend_sackcloth"], // 10
            [1, "cloth/legend_sackcloth_patched"], // 15
            [1, "cloth/legend_sackcloth_tattered"], // 5
            [1, "cloth/legend_thick_tunic"], // 30
            [1, "cloth/legend_tunic"], // 20
            [1, "cloth/legend_tunic_noble"], // 40
        ],
        Chain = [
           [1, "chain/legend_armor_ancient_mail"],// 35
            [1, "chain/legend_armor_basic_mail"],// 85
            [1, "chain/legend_armor_hauberk"],// 95
            [1, "chain/legend_armor_hauberk_full"],// 115
            [1, "chain/legend_armor_hauberk_full_named"],// 120
            [1, "chain/legend_armor_hauberk_sleevless"],// 65
            [1, "chain/legend_armor_mail_shirt"],// 50
            [1, "chain/legend_armor_mail_shirt_simple"],// 25
            [1, "chain/legend_armor_reinforced_mail"],// 110
            [1, "chain/legend_armor_reinforced_mail_shirt"],// 80
            [1, "chain/legend_armor_reinforced_rotten_mail_shirt"],// 45
            [1, "chain/legend_armor_reinforced_worn_mail"],// 105
            [1, "chain/legend_armor_reinforced_worn_mail_shirt"],// 65
            [1, "chain/legend_armor_rusty_mail_shirt"],// 20
            [1, "chain/legend_armor_short_mail"],// 60
            [1, "chain/legend_southern_cloth"],// 30
            [1, "chain/legend_southern_padded_chest"],// 45
            [1, "chain/legend_southern_mail"],// 100
        ],
        Plate = [
            [1, "plate/legend_armor_leather_brigandine"],// 65
            [1, "plate/legend_armor_leather_brigandine_hardened"],// 110
            [1, "plate/legend_armor_leather_brigandine_hardened_full"],// 140
            [1, "plate/legend_armor_leather_brigandine_named"],// 75
            [1, "plate/legend_armor_leather_jacket"],// 25
            [1, "plate/legend_armor_leather_jacket_named"],// 30
            [1, "plate/legend_armor_leather_studded_jacket_named"],// 30
            [1, "plate/legend_armor_leather_jacket_simple"],// 15
            [1, "plate/legend_armor_leather_lamellar"],// 50
            [1, "plate/legend_armor_leather_lamellar_harness_heavy"],// 130
            [1, "plate/legend_armor_leather_lamellar_harness_reinforced"],// 150
            [1, "plate/legend_armor_leather_lamellar_heavy"],// 165
            [1, "plate/legend_armor_leather_lamellar_heavy_named"],// 140
            [1, "plate/legend_armor_leather_lamellar_reinforced"],// 55
            [1, "plate/legend_armor_leather_noble"],// 65
            [1, "plate/legend_armor_leather_padded"],// 40
            [1, "plate/legend_armor_leather_riveted"],// 95
            [1, "plate/legend_armor_leather_riveted_light"],// 80
            [1, "plate/legend_armor_leather_scale"],// 70
            [1, "plate/legend_armor_plate_ancient_chest"],// 105
            [1, "plate/legend_armor_plate_ancient_chest_restored"],// 110
            [1, "plate/legend_armor_plate_ancient_gladiator"],// 35
            [1, "plate/legend_armor_plate_ancient_harness"],// 115
            [1, "plate/legend_armor_plate_ancient_mail"],// 45
            [1, "plate/legend_armor_plate_ancient_scale"],// 105
            [1, "plate/legend_armor_plate_ancient_scale_coat"],// 140
            [1, "plate/legend_armor_plate_ancient_scale_harness"],// 75
            [1, "plate/legend_armor_plate_chest"],// 125
            [1, "plate/legend_armor_plate_chest_rotten"],// 100
            [1, "plate/legend_armor_plate_cuirass"],// 150
            [1, "plate/legend_armor_plate_full"],// 160
            [1, "plate/legend_armor_plate_full_greaves"],// 170
            [1, "plate/legend_armor_plate_full_greaves_named"],// 170
            [1, "plate/legend_armor_plate_full_greaves_painted"],// 170
            [1, "plate/legend_armor_scale"],// 100
            [1, "plate/legend_armor_scale_coat"],// 120
            [1, "plate/legend_armor_scale_coat_named"],// 160
            [1, "plate/legend_armor_scale_coat_rotten"],// 60
            [1, "plate/legend_armor_scale_shirt"],// 85
            [1, "plate/legend_animal_hide_armor"],// 30
            [1, "plate/legend_heavy_iron_armor"],// 120
            [1, "plate/legend_hide_and_bone_armor"],// 80
            [1, "plate/legend_reinforced_animal_hide_armor"],// 55
            [1, "plate/legend_rugged_scale_armor"],// 95
            [1, "plate/legend_scrap_metal_armor"],// 65
            [1, "plate/legend_thick_furs_armor"],// 10
            [1, "plate/legend_thick_plated_barbarian_armor"],// 155
            [1, "plate/legend_southern_named_golden_plates"],// 155
            [1, "plate/legend_southern_named_plates"],// 155
            [1, "plate/legend_southern_plate_full"],// 155
            [1, "plate/legend_southern_plate"],// 155
            [1, "plate/legend_southern_padded"],// 155
            [1, "plate/legend_southern_arm_guards"],// 155
            [1, "plate/legend_southern_strips"],// 155
            [1, "plate/legend_southern_leather_jacket"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
            [1, "plate/legend_southern_leather_scale"],// 155
            [1, "plate/legend_southern_scale"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
        ],
        Cloak = [
            [1, "cloak/legend_shoulder_cloth"],// 5
            [1, "cloak/legend_noble_shawl"],// 10
            [1, "cloak/legend_dark_wooly_cloak"],// 15
            [1, "cloak/legend_armor_cloak_common"],// 10
            [1, "cloak/legend_armor_cloak_heavy"],// 30
            [1, "cloak/legend_armor_cloak_crusader"],// 35
            [1, "cloak/legend_armor_cloak_noble"],// 25
            [1, "cloak/legend_sash"],// 3
            [1, "cloak/legend_southern_scarf"],// 5
            [1, "cloak/legend_animal_pelt"],// 15
            [1, "cloak/legend_southern_scarf_wrap"],// 15
        ],
        Tabard = [
            [1, "tabard/legend_common_tabard"],// 5
            [1, "tabard/legend_noble_tabard"],// 10
            [1, "tabard/legend_tattered_tabard"],// 2
            [1, "tabard/legend_southern_wrap_right"],// 2
            [1, "tabard/legend_southern_wrap_left"],// 2
            [1, "tabard/legend_southern_wide_belt"],// 2
            [1, "tabard/legend_noble_vest"],// 10
            [1, "tabard/legend_southern_wrap"],// 5
            [1, "tabard/legend_southern_shoulder_cloth"],// 5
            [1, "tabard/legend_southern_overcloth"],// 10
            [1, "tabard/legend_southern_tabard"],// 5
        ],
        Attachments =[
        ]
    }]
},{
    ID = "oriental/vizier_gear", // 10
    Script = "",
    Sets = [{
        Cloth = [
            [1, "cloth/legend_ancient_cloth"], // 30
            [1, "cloth/legend_ancient_cloth_restored"], // 35
            [1, "cloth/legend_apron"], // 30
            [1, "cloth/legend_apron_butcher"], // 40

            [1, "cloth/legend_dark_tunic"], // 35
            [1, "cloth/legend_gambeson"], // 65
            [1, "cloth/legend_gambeson_common_color"], // 65
            [1, "cloth/legend_gambeson_named"], // 70
            [1, "cloth/legend_gambeson_plain"], // 65
            [1, "cloth/legend_gambeson_rare_color"], // 65
            [1, "cloth/legend_gambeson_wolf"], // 70
            [1, "cloth/legend_padded_surcoat"], // 55
            [1, "cloth/legend_peasant_dress"], // 25
            [1, "cloth/legend_robes"], // 25

            [1, "cloth/legend_robes_magic"], // 40
            [1, "cloth/legend_robes_nun"], // 22
            [1, "cloth/legend_robes_wizard"], // 40
            [1, "cloth/legend_sackcloth"], // 10
            [1, "cloth/legend_sackcloth_patched"], // 15
            [1, "cloth/legend_sackcloth_tattered"], // 5
            [1, "cloth/legend_thick_tunic"], // 30
            [1, "cloth/legend_tunic"], // 20
            [1, "cloth/legend_tunic_noble"], // 40
        ],
        Chain = [
           [1, "chain/legend_armor_ancient_mail"],// 35
            [1, "chain/legend_armor_basic_mail"],// 85
            [1, "chain/legend_armor_hauberk"],// 95
            [1, "chain/legend_armor_hauberk_full"],// 115
            [1, "chain/legend_armor_hauberk_full_named"],// 120
            [1, "chain/legend_armor_hauberk_sleevless"],// 65
            [1, "chain/legend_armor_mail_shirt"],// 50
            [1, "chain/legend_armor_mail_shirt_simple"],// 25
            [1, "chain/legend_armor_reinforced_mail"],// 110
            [1, "chain/legend_armor_reinforced_mail_shirt"],// 80
            [1, "chain/legend_armor_reinforced_rotten_mail_shirt"],// 45
            [1, "chain/legend_armor_reinforced_worn_mail"],// 105
            [1, "chain/legend_armor_reinforced_worn_mail_shirt"],// 65
            [1, "chain/legend_armor_rusty_mail_shirt"],// 20
            [1, "chain/legend_armor_short_mail"],// 60
            [1, "chain/legend_southern_cloth"],// 30
            [1, "chain/legend_southern_padded_chest"],// 45
            [1, "chain/legend_southern_mail"],// 100
        ],
        Plate = [
            [1, "plate/legend_armor_leather_brigandine"],// 65
            [1, "plate/legend_armor_leather_brigandine_hardened"],// 110
            [1, "plate/legend_armor_leather_brigandine_hardened_full"],// 140
            [1, "plate/legend_armor_leather_brigandine_named"],// 75
            [1, "plate/legend_armor_leather_jacket"],// 25
            [1, "plate/legend_armor_leather_jacket_named"],// 30
            [1, "plate/legend_armor_leather_studded_jacket_named"],// 30
            [1, "plate/legend_armor_leather_jacket_simple"],// 15
            [1, "plate/legend_armor_leather_lamellar"],// 50
            [1, "plate/legend_armor_leather_lamellar_harness_heavy"],// 130
            [1, "plate/legend_armor_leather_lamellar_harness_reinforced"],// 150
            [1, "plate/legend_armor_leather_lamellar_heavy"],// 165
            [1, "plate/legend_armor_leather_lamellar_heavy_named"],// 140
            [1, "plate/legend_armor_leather_lamellar_reinforced"],// 55
            [1, "plate/legend_armor_leather_noble"],// 65
            [1, "plate/legend_armor_leather_padded"],// 40
            [1, "plate/legend_armor_leather_riveted"],// 95
            [1, "plate/legend_armor_leather_riveted_light"],// 80
            [1, "plate/legend_armor_leather_scale"],// 70
            [1, "plate/legend_armor_plate_ancient_chest"],// 105
            [1, "plate/legend_armor_plate_ancient_chest_restored"],// 110
            [1, "plate/legend_armor_plate_ancient_gladiator"],// 35
            [1, "plate/legend_armor_plate_ancient_harness"],// 115
            [1, "plate/legend_armor_plate_ancient_mail"],// 45
            [1, "plate/legend_armor_plate_ancient_scale"],// 105
            [1, "plate/legend_armor_plate_ancient_scale_coat"],// 140
            [1, "plate/legend_armor_plate_ancient_scale_harness"],// 75
            [1, "plate/legend_armor_plate_chest"],// 125
            [1, "plate/legend_armor_plate_chest_rotten"],// 100
            [1, "plate/legend_armor_plate_cuirass"],// 150
            [1, "plate/legend_armor_plate_full"],// 160
            [1, "plate/legend_armor_plate_full_greaves"],// 170
            [1, "plate/legend_armor_plate_full_greaves_named"],// 170
            [1, "plate/legend_armor_plate_full_greaves_painted"],// 170
            [1, "plate/legend_armor_scale"],// 100
            [1, "plate/legend_armor_scale_coat"],// 120
            [1, "plate/legend_armor_scale_coat_named"],// 160
            [1, "plate/legend_armor_scale_coat_rotten"],// 60
            [1, "plate/legend_armor_scale_shirt"],// 85
            [1, "plate/legend_animal_hide_armor"],// 30
            [1, "plate/legend_heavy_iron_armor"],// 120
            [1, "plate/legend_hide_and_bone_armor"],// 80
            [1, "plate/legend_reinforced_animal_hide_armor"],// 55
            [1, "plate/legend_rugged_scale_armor"],// 95
            [1, "plate/legend_scrap_metal_armor"],// 65
            [1, "plate/legend_thick_furs_armor"],// 10
            [1, "plate/legend_thick_plated_barbarian_armor"],// 155
            [1, "plate/legend_southern_named_golden_plates"],// 155
            [1, "plate/legend_southern_named_plates"],// 155
            [1, "plate/legend_southern_plate_full"],// 155
            [1, "plate/legend_southern_plate"],// 155
            [1, "plate/legend_southern_padded"],// 155
            [1, "plate/legend_southern_arm_guards"],// 155
            [1, "plate/legend_southern_strips"],// 155
            [1, "plate/legend_southern_leather_jacket"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
            [1, "plate/legend_southern_leather_scale"],// 155
            [1, "plate/legend_southern_scale"],// 155
            [1, "plate/legend_southern_leather_plates"],// 155
        ],
        Cloak = [
            [1, "cloak/legend_shoulder_cloth"],// 5
            [1, "cloak/legend_noble_shawl"],// 10
            [1, "cloak/legend_dark_wooly_cloak"],// 15
            [1, "cloak/legend_armor_cloak_common"],// 10
            [1, "cloak/legend_armor_cloak_heavy"],// 30
            [1, "cloak/legend_armor_cloak_crusader"],// 35
            [1, "cloak/legend_armor_cloak_noble"],// 25
            [1, "cloak/legend_sash"],// 3
            [1, "cloak/legend_southern_scarf"],// 5
            [1, "cloak/legend_animal_pelt"],// 15
            [1, "cloak/legend_southern_scarf_wrap"],// 15
        ],
        Tabard = [
            [1, "tabard/legend_common_tabard"],// 5
            [1, "tabard/legend_noble_tabard"],// 10
            [1, "tabard/legend_tattered_tabard"],// 2
            [1, "tabard/legend_southern_wrap_right"],// 2
            [1, "tabard/legend_southern_wrap_left"],// 2
            [1, "tabard/legend_southern_wide_belt"],// 2
            [1, "tabard/legend_noble_vest"],// 10
            [1, "tabard/legend_southern_wrap"],// 5
            [1, "tabard/legend_southern_shoulder_cloth"],// 5
            [1, "tabard/legend_southern_overcloth"],// 10
            [1, "tabard/legend_southern_tabard"],// 5
        ],
        Attachments =[
        ]
    }]
}
])