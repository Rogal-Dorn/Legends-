local gt = this.getroottable();
local et = gt.Const.EntityType //idk man like i'm supposed to do checks but it loads after global so it's fine?

// Numbers subject to change :: TODO
gt.Const.PerkPurchasePower <- {
    VeryLow = 2,
    Low = 4,
    Medium = 5,
    High = 7,
    VeryHigh = 9,
    ExtraHigh = 11
};

gt.Const.RandomizedCharacterInfo <- {}
gt.Const.RandomizedCharacterInfo["Default"] <- {
    Outfits = [
        [1, "low_tier_unit_catchall_outfit_01"]
    ],
    ClassPerkList = [], 
    DefensePerkList = [  
        this.Const.Perks.HeavyArmorTree,
        this.Const.Perks.MediumArmorTree,
        this.Const.Perks.LightArmorTree,
        this.Const.Perks.ClothArmorTree
    ],
    TraitsPerkList = [  
        this.Const.Perks.AgileTree,
        this.Const.Perks.IndestructibleTree,
        this.Const.Perks.MartyrTree,
        this.Const.Perks.ViciousTree,
        // this.Const.Perks.DeviousTree,
        // this.Const.Perks.InspirationalTree,
        // this.Const.Perks.IntelligentTree,
        this.Const.Perks.CalmTree,
        this.Const.Perks.FastTree,
        this.Const.Perks.LargeTree,
        this.Const.Perks.OrganisedTree,
        this.Const.Perks.SturdyTree,
        this.Const.Perks.FitTree,
        this.Const.Perks.TrainedTree
    ], 
    GuaranteedPerks = [], 
    WeaponsAndTrees = [ 
        ["scripts/items/weapons/knife", this.Const.Perks.DaggerTree, 100, this.Const.Perks.KnifeClassTree, 75]
    ],
    LevelRange = [3, 3]
    PerkPower = gt.Const.PerkPurchasePower.Low
}
gt.Const.RandomizedCharacterInfo[gt.Const.EntityType.Peasant] <- {
    Outfits = [
        [1, "peasant_outfit_00"]
    ],
    WeaponsAndTrees = [ 
        ["scripts/items/weapons/knife", this.Const.Perks.DaggerTree, 100, this.Const.Perks.KnifeClassTree, 80],
        ["scripts/items/weapons/pitchfork", this.Const.Perks.PolearmTree, 100, this.Const.Perks.PitchforkClassTree, 60],
        ["scripts/items/weapons/wooden_stick", this.Const.Perks.SpearTree, 100, this.Const.Perks.MilitiaClassTree, 65],
        ["scripts/items/weapons/pickaxe", this.Const.Perks.HammerTree, 100, this.Const.Perks.HammerClassTree, 45],
        ["scripts/items/weapons/legend_hammer", this.Const.Perks.HammerTree, 100, this.Const.Perks.HammerClassTree, 60],
        ["scripts/items/weapons/legend_sickle", this.Const.Perks.SwordTree, 100, this.Const.Perks.SickleClassTree, 80],
        ["scripts/items/weapons/legend_wooden_pitchfork", this.Const.Perks.PolearmTree, 100, this.Const.Perks.PitchforkClassTree, 65],
        ["scripts/items/weapons/legend_scythe", this.Const.Perks.CleaverTree, 100, this.Const.Perks.ButcherClassTree, 75],
        ["scripts/items/weapons/legend_hoe", this.Const.Perks.AxeTree, 100],
        ["scripts/items/weapons/legend_shiv", this.Const.Perks.DaggerTree, 100, this.Const.Perks.KnifeClassTree, 75],
        ["scripts/items/weapons/legend_shovel", this.Const.Perks.MaceTree, 100, this.Const.Perks.ShovelClassTree, 80],
        ["scripts/items/weapons/legend_staff", this.Const.Perks.StaffTree, 100],
        ["scripts/items/weapons/butchers_cleaver", this.Const.Perks.CleaverTree, 100, this.Const.Perks.ButcherClassTree, 45],
        ["scripts/items/weapons/legend_wooden_spear", this.Const.Perks.SpearTree, 100, this.Const.Perks.MilitiaClassTree, 80]
    ],
    LevelRange = [1, 3]
    PerkPower = gt.Const.PerkPurchasePower.VeryLow
}
gt.Const.RandomizedCharacterInfo[gt.Const.EntityType.CaravanHand] <- {
    Outfits = [
        [1, "caravan_hand_outfit_00"]
    ],
    WeaponsAndTrees = [
        ["scripts/items/weapons/dagger", this.Const.Perks.DaggerTree, 100, this.Const.Perks.KnifeClassTree, 75],
        ["scripts/items/weapons/knife", this.Const.Perks.DaggerTree, 100, this.Const.Perks.KnifeClassTree, 75],
        ["scripts/items/weapons/wooden_stick", this.Const.Perks.SpearTree, 100, this.Const.Perks.MilitiaClassTree, 75],
        ["scripts/items/weapons/hatchet", this.Const.Perks.AxeTree, 100],
        ["scripts/items/weapons/bludgeon", this.Const.Perks.MaceTree, 100],
        ["scripts/items/weapons/militia_spear", this.Const.Perks.SpearTree, 100, this.Const.Perks.MilitiaClassTree, 75],
        ["scripts/items/weapons/scramasax", this.Const.Perks.CleaverTree, 100],
        ["scripts/items/weapons/shortsword", this.Const.Perks.SwordTree, 100],
        ["scripts/items/weapons/legend_militia_glaive", this.Const.Perks.SpearTree, 100]
    ],
    GuaranteedPerks = [
        "scripts/skills/perks/perk_recover"
    ],
    LevelRange = [3, 5],
    PerkPower = gt.Const.PerkPurchasePower.Low
}
gt.Const.RandomizedCharacterInfo[gt.Const.EntityType.CaravanGuard] <- {
    Outfits = [
        [1, "caravan_guard_outfit_00"]
    ],
    WeaponsAndTrees = [
        ["scripts/items/weapons/hand_axe", this.Const.Perks.AxeTree, 100],
        ["scripts/items/weapons/boar_spear", this.Const.Perks.SpearTree, 100, this.Const.Perks.MilitiaClassTree, 60],
        ["scripts/items/weapons/falchion", this.Const.Perks.SwordTree, 100],
        ["scripts/items/weapons/shortsword", this.Const.Perks.SwordTree, 100],
        ["scripts/items/weapons/arming_sword", this.Const.Perks.SwordTree, 100],
        ["scripts/items/weapons/legend_glaive", this.Const.Perks.SpearTree, 100, this.Const.Perks.MilitiaClassTree, 65],
    ],
    GuaranteedPerks = [
        "scripts/skills/perks/perk_recover",
        "scripts/skills/perks/perk_shield_expert"
    ],
    LevelRange = [4, 7],
    PerkPower = gt.Const.PerkPurchasePower.Medium
}
gt.Const.RandomizedCharacterInfo[gt.Const.EntityType.BanditRabble] <- {
    Outfits = [
        [1, "bandit_rabble_outfit_00"]
    ],
    WeaponsAndTrees = [
        ["scripts/items/weapons/legend_wooden_pitchfork", this.Const.Perks.AxeTree, 35],
        ["scripts/items/weapons/legend_wooden_spear", this.Const.Perks.SpearTree, 35],
        ["scripts/items/weapons/legend_sickle", this.Const.Perks.SwordTree, 35],
        ["scripts/items/weapons/legend_staff", this.Const.Perks.StaffTree, 35],
        ["scripts/items/weapons/legend_shovel", this.Const.Perks.MaceTree, 35],
        ["scripts/items/weapons/wooden_stick", this.Const.Perks.SpearTree, 35],
        ["scripts/items/weapons/legend_hammer", this.Const.Perks.HammerTree, 35],
        ["scripts/items/weapons/legend_shiv", this.Const.Perks.DaggerTree, 35],
        ["scripts/items/weapons/lute", this.Const.Perks.MaceTree, 35],
        ["scripts/items/weapons/butchers_cleaver", this.Const.Perks.CleaverTree, 35],
        ["scripts/items/weapons/legend_saw", this.Const.Perks.CleaverTree, 35],
        ["scripts/items/weapons/legend_hoe", this.Const.Perks.AxeTree, 35],
        ["scripts/items/weapons/wooden_flail", this.Const.Perks.FlailTree, 35]
    ],
    LevelRange = [1, 3],
    PerkPower = gt.Const.PerkPurchasePower.VeryLow
}
gt.Const.RandomizedCharacterInfo[gt.Const.EntityType.BanditRabblePoacher] <- {
    Outfits = [
        [1, "bandit_rabble_poacher_outfit_00"]
    ],
    WeaponsAndTrees = [
        ["scripts/items/weapons/short_bow", this.Const.Perks.BowTree, 50],
        ["scripts/items/weapons/legend_sling", this.Const.Perks.SlingTree, 50],
        ["scripts/items/weapons/legend_sling", this.Const.Perks.SlingTree, 50]
    ],
    LevelRange = [1, 3],
    PerkPower = gt.Const.PerkPurchasePower.VeryLow
}
gt.Const.RandomizedCharacterInfo[gt.Const.EntityType.BanditThug] <- {
    Outfits = [
        [1, "bandit_thug_outfit_00"]
    ],
    WeaponsAndTrees = [
        ["scripts/items/weapons/woodcutters_axe", this.Const.Perks.AxeTree, 70],
        ["scripts/items/weapons/goedendag", this.Const.Perks.MaceTree, 70],
        ["scripts/items/weapons/pitchfork", this.Const.Perks.PolearmTree, 70],
        ["scripts/items/weapons/shortsword", this.Const.Perks.SwordTree, 70],
        ["scripts/items/weapons/hatchet", this.Const.Perks.AxeTree, 70],
        ["scripts/items/weapons/bludgeon", this.Const.Perks.MaceTree, 70],
        ["scripts/items/weapons/militia_spear", this.Const.Perks.SpearTree, 70],
        ["scripts/items/weapons/pickaxe", this.Const.Perks.HammerClassTree, 70],
        ["scripts/items/weapons/reinforced_wooden_flail", this.Const.Perks.FlailTree, 70],
        ["scripts/items/weapons/wooden_flail", this.Const.Perks.FlailTree, 70],
        ["scripts/items/weapons/butchers_cleaver", this.Const.Perks.CleaverTree, 70],
        ["scripts/items/weapons/dagger", this.Const.Perks.DaggerTree, 70],
        ["scripts/items/weapons/legend_scythe", this.Const.Perks.AxeTree, 70],
        ["scripts/items/weapons/legend_tipstaff", this.Const.Perks.StaffTree, 70],
        ["scripts/items/weapons/legend_militia_glaive", this.Const.Perks.SpearTree, 70],
        ["scripts/items/weapons/legend_tipstaff", this.Const.Perks.StaffTree, 70],
        ["scripts/items/weapons/legend_ranged_wooden_flail", this.Const.Perks.FlailTree, 70],
    ],
    LevelRange = [2, 5],
    PerkPower = gt.Const.PerkPurchasePower.Medium
}
gt.Const.RandomizedCharacterInfo[gt.Const.EntityType.BanditPoacher] <- {
    Outfits = [
        [1, "bandit_poacher_outfit_00"]
    ],
    WeaponsAndTrees = [
        ["scripts/items/weapons/short_bow", this.Const.Perks.BowTree, 65],
        ["scripts/items/weapons/legend_sling", this.Const.Perks.SlingTree, 65]
    ],
    LevelRange = [2, 4],
    PerkPower = gt.Const.PerkPurchasePower.Low
}

     
    
     
    
    


gt.Const.RandomizedMalus <- {
    Hitpoints = [
        0,
        0
    ],
    Bravery = [
        0,
        0
    ],
    Stamina = [
        0,
        0
    ],
    MeleeSkill = [
        -3,
        -5
    ],
    RangedSkill = [
        -3,
        -5
    ],
    MeleeDefense = [
        0,
        0
    ],
    RangedDefense = [
        0,
        0
    ],
    Initiative = [
        0,
        0
    ]
};