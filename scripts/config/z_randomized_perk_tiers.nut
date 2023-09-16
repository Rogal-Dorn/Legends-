local gt = this.getroottable();

// Numbers subject to change :: TODO
gt.Const.RandomizedPower <- {
    VeryLow = 5,
    Low = 7,
    Medium = 10,
    High = 13,
    VeryHigh = 15,
    ExtraHigh = 18
};
 
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