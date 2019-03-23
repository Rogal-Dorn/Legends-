local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

gt.Const.Perks.PerkDefObjects <- [
	{
		ID = "perk.fast_adaption",
		Script = "scripts/skills/perks/perk_fast_adaption",
		Name = this.Const.Strings.PerkName.FastAdaption,
		Tooltip = this.Const.Strings.PerkDescription.FastAdaption,
		Icon = "ui/perks/perk_33.png",
		IconDisabled = "ui/perks/perk_33_sw.png"
	},
	{
		ID = "perk.crippling_strikes",
		Script = "scripts/skills/perks/perk_crippling_strikes",
		Name = this.Const.Strings.PerkName.CripplingStrikes,
		Tooltip = this.Const.Strings.PerkDescription.CripplingStrikes,
		Icon = "ui/perks/perk_57.png",
		IconDisabled = "ui/perks/perk_57_sw.png"
	},
	{
		ID = "perk.colossus",
		Script = "scripts/skills/perks/perk_colossus",
		Name = this.Const.Strings.PerkName.Colossus,
		Tooltip = this.Const.Strings.PerkDescription.Colossus,
		Icon = "ui/perks/perk_06.png",
		IconDisabled = "ui/perks/perk_06_sw.png"
	},
	{
		ID = "perk.nine_lives",
		Script = "scripts/skills/perks/perk_nine_lives",
		Name = this.Const.Strings.PerkName.NineLives,
		Tooltip = this.Const.Strings.PerkDescription.NineLives,
		Icon = "ui/perks/perk_07.png",
		IconDisabled = "ui/perks/perk_07_sw.png"
	},
	{
		ID = "perk.bags_and_belts",
		Script = "scripts/skills/perks/perk_bags_and_belts",
		Name = this.Const.Strings.PerkName.BagsAndBelts,
		Tooltip = this.Const.Strings.PerkDescription.BagsAndBelts,
		Icon = "ui/perks/perk_20.png",
		IconDisabled = "ui/perks/perk_20_sw.png"
	},
	{
		ID = "perk.pathfinder",
		Script = "scripts/skills/perks/perk_pathfinder",
		Name = this.Const.Strings.PerkName.Pathfinder,
		Tooltip = this.Const.Strings.PerkDescription.Pathfinder,
		Icon = "ui/perks/perk_23.png",
		IconDisabled = "ui/perks/perk_23_sw.png"
	},
	{
		ID = "perk.adrenalin",
		Script = "scripts/skills/perks/perk_adrenalin",
		Name = this.Const.Strings.PerkName.Adrenalin,
		Tooltip = this.Const.Strings.PerkDescription.Adrenalin,
		Icon = "ui/perks/perk_37.png",
		IconDisabled = "ui/perks/perk_37_sw.png"
	},
	{
		ID = "perk.recover",
		Script = "scripts/skills/perks/perk_recover",
		Name = this.Const.Strings.PerkName.Recover,
		Tooltip = this.Const.Strings.PerkDescription.Recover,
		Icon = "ui/perks/perk_54.png",
		IconDisabled = "ui/perks/perk_54_sw.png"
	},
	{
		ID = "perk.student",
		Script = "scripts/skills/perks/perk_student",
		Name = this.Const.Strings.PerkName.Student,
		Tooltip = this.Const.Strings.PerkDescription.Student,
		Icon = "ui/perks/perk_21.png",
		IconDisabled = "ui/perks/perk_21_sw.png"
	},
	{
		ID = "perk.coup_de_grace",
		Script = "scripts/skills/perks/perk_coup_de_grace",
		Name = this.Const.Strings.PerkName.CoupDeGrace,
		Tooltip = this.Const.Strings.PerkDescription.CoupDeGrace,
		Icon = "ui/perks/perk_16.png",
		IconDisabled = "ui/perks/perk_16_sw.png"
	},
	{
		ID = "perk.bullseye",
		Script = "scripts/skills/perks/perk_bullseye",
		Name = this.Const.Strings.PerkName.Bullseye,
		Tooltip = this.Const.Strings.PerkDescription.Bullseye,
		Icon = "ui/perks/perk_17.png",
		IconDisabled = "ui/perks/perk_17_sw.png"
	},
	{
		ID = "perk.dodge",
		Script = "scripts/skills/perks/perk_dodge",
		Name = this.Const.Strings.PerkName.Dodge,
		Tooltip = this.Const.Strings.PerkDescription.Dodge,
		Icon = "ui/perks/perk_01.png",
		IconDisabled = "ui/perks/perk_01_sw.png"
	},
	{
		ID = "perk.fortified_mind",
		Script = "scripts/skills/perks/perk_fortified_mind",
		Name = this.Const.Strings.PerkName.FortifiedMind,
		Tooltip = this.Const.Strings.PerkDescription.FortifiedMind,
		Icon = "ui/perks/perk_08.png",
		IconDisabled = "ui/perks/perk_08_sw.png"
	},
	{
		ID = "perk.hold_out",
		Script = "scripts/skills/perks/perk_hold_out",
		Name = this.Const.Strings.PerkName.HoldOut,
		Tooltip = this.Const.Strings.PerkDescription.HoldOut,
		Icon = "ui/perks/perk_04.png",
		IconDisabled = "ui/perks/perk_04_sw.png"
	},
	{
		ID = "perk.steel_brow",
		Script = "scripts/skills/perks/perk_steel_brow",
		Name = this.Const.Strings.PerkName.SteelBrow,
		Tooltip = this.Const.Strings.PerkDescription.SteelBrow,
		Icon = "ui/perks/perk_09.png",
		IconDisabled = "ui/perks/perk_09_sw.png"
	},
	{
		ID = "perk.quick_hands",
		Script = "scripts/skills/perks/perk_quick_hands",
		Name = this.Const.Strings.PerkName.QuickHands,
		Tooltip = this.Const.Strings.PerkDescription.QuickHands,
		Icon = "ui/perks/perk_39.png",
		IconDisabled = "ui/perks/perk_39_sw.png"
	},
	{
		ID = "perk.gifted",
		Script = "scripts/skills/perks/perk_gifted",
		Name = this.Const.Strings.PerkName.Gifted,
		Tooltip = this.Const.Strings.PerkDescription.Gifted,
		Icon = "ui/perks/perk_56.png",
		IconDisabled = "ui/perks/perk_56_sw.png"
	},
	{
		ID = "perk.backstabber",
		Script = "scripts/skills/perks/perk_backstabber",
		Name = this.Const.Strings.PerkName.Backstabber,
		Tooltip = this.Const.Strings.PerkDescription.Backstabber,
		Icon = "ui/perks/perk_59.png",
		IconDisabled = "ui/perks/perk_59_sw.png"
	},
	{
		ID = "perk.anticipation",
		Script = "scripts/skills/perks/perk_anticipation",
		Name = this.Const.Strings.PerkName.Anticipation,
		Tooltip = this.Const.Strings.PerkDescription.Anticipation,
		Icon = "ui/perks/perk_10.png",
		IconDisabled = "ui/perks/perk_10_sw.png"
	},
	{
		ID = "perk.shield_expert",
		Script = "scripts/skills/perks/perk_shield_expert",
		Name = this.Const.Strings.PerkName.ShieldExpert,
		Tooltip = this.Const.Strings.PerkDescription.ShieldExpert,
		Icon = "ui/perks/perk_05.png",
		IconDisabled = "ui/perks/perk_05_sw.png"
	},
	{
		ID = "perk.brawny",
		Script = "scripts/skills/perks/perk_brawny",
		Name = this.Const.Strings.PerkName.Brawny,
		Tooltip = this.Const.Strings.PerkDescription.Brawny,
		Icon = "ui/perks/perk_40.png",
		IconDisabled = "ui/perks/perk_40_sw.png"
	},
	{
		ID = "perk.rotation",
		Script = "scripts/skills/perks/perk_rotation",
		Name = this.Const.Strings.PerkName.Rotation,
		Tooltip = this.Const.Strings.PerkDescription.Rotation,
		Icon = "ui/perks/perk_11.png",
		IconDisabled = "ui/perks/perk_11_sw.png"
	},
	{
		ID = "perk.rally_the_troops",
		Script = "scripts/skills/perks/perk_rally_the_troops",
		Name = this.Const.Strings.PerkName.RallyTheTroops,
		Tooltip = this.Const.Strings.PerkDescription.RallyTheTroops,
		Icon = "ui/perks/perk_42.png",
		IconDisabled = "ui/perks/perk_42_sw.png"
	},
	{
		ID = "perk.taunt",
		Script = "scripts/skills/perks/perk_taunt",
		Name = this.Const.Strings.PerkName.Taunt,
		Tooltip = this.Const.Strings.PerkDescription.Taunt,
		Icon = "ui/perks/perk_38.png",
		IconDisabled = "ui/perks/perk_38_sw.png"
	},
	{
		ID = "perk.mastery.mace",
		Script = "scripts/skills/perks/perk_mastery_mace",
		Name = this.Const.Strings.PerkName.SpecMace,
		Tooltip = this.Const.Strings.PerkDescription.SpecMace,
		Icon = "ui/perks/perk_43.png",
		IconDisabled = "ui/perks/perk_43_sw.png"
	},
	{
		ID = "perk.mastery.flail",
		Script = "scripts/skills/perks/perk_mastery_flail",
		Name = this.Const.Strings.PerkName.SpecFlail,
		Tooltip = this.Const.Strings.PerkDescription.SpecFlail,
		Icon = "ui/perks/perk_47.png",
		IconDisabled = "ui/perks/perk_47_sw.png"
	},
	{
		ID = "perk.mastery.hammer",
		Script = "scripts/skills/perks/perk_mastery_hammer",
		Name = this.Const.Strings.PerkName.SpecHammer,
		Tooltip = this.Const.Strings.PerkDescription.SpecHammer,
		Icon = "ui/perks/perk_53.png",
		IconDisabled = "ui/perks/perk_53_sw.png"
	},
	{
		ID = "perk.mastery.axe",
		Script = "scripts/skills/perks/perk_mastery_axe",
		Name = this.Const.Strings.PerkName.SpecAxe,
		Tooltip = this.Const.Strings.PerkDescription.SpecAxe,
		Icon = "ui/perks/perk_44.png",
		IconDisabled = "ui/perks/perk_44_sw.png"
	},
	{
		ID = "perk.mastery.cleaver",
		Script = "scripts/skills/perks/perk_mastery_cleaver",
		Name = this.Const.Strings.PerkName.SpecCleaver,
		Tooltip = this.Const.Strings.PerkDescription.SpecCleaver,
		Icon = "ui/perks/perk_52.png",
		IconDisabled = "ui/perks/perk_52_sw.png"
	},
	{
		ID = "perk.mastery.sword",
		Script = "scripts/skills/perks/perk_mastery_sword",
		Name = this.Const.Strings.PerkName.SpecSword,
		Tooltip = this.Const.Strings.PerkDescription.SpecSword,
		Icon = "ui/perks/perk_46.png",
		IconDisabled = "ui/perks/perk_46_sw.png"
	},
	{
		ID = "perk.mastery.dagger",
		Script = "scripts/skills/perks/perk_mastery_dagger",
		Name = this.Const.Strings.PerkName.SpecDagger,
		Tooltip = this.Const.Strings.PerkDescription.SpecDagger,
		Icon = "ui/perks/perk_51.png",
		IconDisabled = "ui/perks/perk_51_sw.png"
	},
	{
		ID = "perk.mastery.polearm",
		Script = "scripts/skills/perks/perk_mastery_polearm",
		Name = this.Const.Strings.PerkName.SpecPolearm,
		Tooltip = this.Const.Strings.PerkDescription.SpecPolearm,
		Icon = "ui/perks/perk_58.png",
		IconDisabled = "ui/perks/perk_58_sw.png"
	},
	{
		ID = "perk.mastery.spear",
		Script = "scripts/skills/perks/perk_mastery_spear",
		Name = this.Const.Strings.PerkName.SpecSpear,
		Tooltip = this.Const.Strings.PerkDescription.SpecSpear,
		Icon = "ui/perks/perk_45.png",
		IconDisabled = "ui/perks/perk_45_sw.png"
	},
	{
		ID = "perk.mastery.crossbow",
		Script = "scripts/skills/perks/perk_mastery_crossbow",
		Name = this.Const.Strings.PerkName.SpecCrossbow,
		Tooltip = this.Const.Strings.PerkDescription.SpecCrossbow,
		Icon = "ui/perks/perk_48.png",
		IconDisabled = "ui/perks/perk_48_sw.png"
	},
	{
		ID = "perk.mastery.bow",
		Script = "scripts/skills/perks/perk_mastery_bow",
		Name = this.Const.Strings.PerkName.SpecBow,
		Tooltip = this.Const.Strings.PerkDescription.SpecBow,
		Icon = "ui/perks/perk_49.png",
		IconDisabled = "ui/perks/perk_49_sw.png"
	},
	{
		ID = "perk.mastery.throwing",
		Script = "scripts/skills/perks/perk_mastery_throwing",
		Name = this.Const.Strings.PerkName.SpecThrowing,
		Tooltip = this.Const.Strings.PerkDescription.SpecThrowing,
		Icon = "ui/perks/perk_50.png",
		IconDisabled = "ui/perks/perk_50_sw.png"
	},
	{
		ID = "perk.reach_advantage",
		Script = "scripts/skills/perks/perk_reach_advantage",
		Name = this.Const.Strings.PerkName.ReachAdvantage,
		Tooltip = this.Const.Strings.PerkDescription.ReachAdvantage,
		Icon = "ui/perks/perk_19.png",
		IconDisabled = "ui/perks/perk_19_sw.png"
	},
	{
		ID = "perk.overwhelm",
		Script = "scripts/skills/perks/perk_overwhelm",
		Name = this.Const.Strings.PerkName.Overwhelm,
		Tooltip = this.Const.Strings.PerkDescription.Overwhelm,
		Icon = "ui/perks/perk_62.png",
		IconDisabled = "ui/perks/perk_62_sw.png"
	},
	{
		ID = "perk.lone_wolf",
		Script = "scripts/skills/perks/perk_lone_wolf",
		Name = this.Const.Strings.PerkName.LoneWolf,
		Tooltip = this.Const.Strings.PerkDescription.LoneWolf,
		Icon = "ui/perks/perk_61.png",
		IconDisabled = "ui/perks/perk_61_sw.png"
	},
	{
		ID = "perk.underdog",
		Script = "scripts/skills/perks/perk_underdog",
		Name = this.Const.Strings.PerkName.Underdog,
		Tooltip = this.Const.Strings.PerkDescription.Underdog,
		Icon = "ui/perks/perk_60.png",
		IconDisabled = "ui/perks/perk_60_sw.png"
	},
	{
		ID = "perk.footwork",
		Script = "scripts/skills/perks/perk_footwork",
		Name = this.Const.Strings.PerkName.Footwork,
		Tooltip = this.Const.Strings.PerkDescription.Footwork,
		Icon = "ui/perks/perk_25.png",
		IconDisabled = "ui/perks/perk_25_sw.png"
	},
	{
		ID = "perk.berserk",
		Script = "scripts/skills/perks/perk_berserk",
		Name = this.Const.Strings.PerkName.Berserk,
		Tooltip = this.Const.Strings.PerkDescription.Berserk,
		Icon = "ui/perks/perk_35.png",
		IconDisabled = "ui/perks/perk_35_sw.png"
	},
	{
		ID = "perk.head_hunter",
		Script = "scripts/skills/perks/perk_head_hunter",
		Name = this.Const.Strings.PerkName.HeadHunter,
		Tooltip = this.Const.Strings.PerkDescription.HeadHunter,
		Icon = "ui/perks/perk_15.png",
		IconDisabled = "ui/perks/perk_15_sw.png"
	},
	{
		ID = "perk.nimble",
		Script = "scripts/skills/perks/perk_nimble",
		Name = this.Const.Strings.PerkName.Nimble,
		Tooltip = this.Const.Strings.PerkDescription.Nimble,
		Icon = "ui/perks/perk_29.png",
		IconDisabled = "ui/perks/perk_29_sw.png"
	},
	{
		ID = "perk.battle_forged",
		Script = "scripts/skills/perks/perk_battle_forged",
		Name = this.Const.Strings.PerkName.BattleForged,
		Tooltip = this.Const.Strings.PerkDescription.BattleForged,
		Icon = "ui/perks/perk_03.png",
		IconDisabled = "ui/perks/perk_03_sw.png"
	},
	{
		ID = "perk.fearsome",
		Script = "scripts/skills/perks/perk_fearsome",
		Name = this.Const.Strings.PerkName.Fearsome,
		Tooltip = this.Const.Strings.PerkDescription.Fearsome,
		Icon = "ui/perks/perk_27.png",
		IconDisabled = "ui/perks/perk_27_sw.png"
	},
	{
		ID = "perk.duelist",
		Script = "scripts/skills/perks/perk_duelist",
		Name = this.Const.Strings.PerkName.Duelist,
		Tooltip = this.Const.Strings.PerkDescription.Duelist,
		Icon = "ui/perks/perk_41.png",
		IconDisabled = "ui/perks/perk_41_sw.png"
	},
	{
		ID = "perk.killing_frenzy",
		Script = "scripts/skills/perks/perk_killing_frenzy",
		Name = this.Const.Strings.PerkName.KillingFrenzy,
		Tooltip = this.Const.Strings.PerkDescription.KillingFrenzy,
		Icon = "ui/perks/perk_36.png",
		IconDisabled = "ui/perks/perk_36_sw.png"
	},
	{
		ID = "perk.indomitable",
		Script = "scripts/skills/perks/perk_indomitable",
		Name = this.Const.Strings.PerkName.Indomitable,
		Tooltip = this.Const.Strings.PerkDescription.Indomitable,
		Icon = "ui/perks/perk_30.png",
		IconDisabled = "ui/perks/perk_30_sw.png"
	},
	{
		ID = "perk.legend_daze",
		Script = "scripts/skills/perks/perk_legend_daze",
		Name = this.Const.Strings.PerkName.LegendDaze,
		Tooltip = this.Const.Strings.PerkDescription.LegendDaze,
		Icon = "ui/perks/daze56_circle.png",
		IconDisabled = "ui/perks/daze56_circle_bw.png"
	},
	{
		ID = "perk.legend_roster_1",
		Script = "scripts/skills/perks/perk_legend_roster_1",
		Name = this.Const.Strings.PerkName.LegendRoster1,
		Tooltip = this.Const.Strings.PerkDescription.LegendRoster1,
		Icon = "ui/perks/recruit1.png",
		IconDisabled = "ui/perks/recruit1_bw.png"
	},
	{
		ID = "perk.legend_roster_2",
		Script = "scripts/skills/perks/perk_legend_roster_2",
		Name = this.Const.Strings.PerkName.LegendRoster2,
		Tooltip = this.Const.Strings.PerkDescription.LegendRoster2,
		Icon = "ui/perks/recruit2.png",
		IconDisabled = "ui/perks/recruit2_bw.png"
	},			
	{
		ID = "perk.legend_roster_3",
		Script = "scripts/skills/perks/perk_legend_roster_3",
		Name = this.Const.Strings.PerkName.LegendRoster3,
		Tooltip = this.Const.Strings.PerkDescription.LegendRoster3,
		Icon = "ui/perks/recruit3.png",
		IconDisabled = "ui/perks/recruit3_bw.png"
	},
	{
		ID = "perk.legend_roster_4",
		Script = "scripts/skills/perks/perk_legend_roster_4",
		Name = this.Const.Strings.PerkName.LegendRoster4,
		Tooltip = this.Const.Strings.PerkDescription.LegendRoster4,
		Icon = "ui/perks/recruit4.png",
		IconDisabled = "ui/perks/recruit4_bw.png"
	},
	{
		ID = "perk.legend_roster_5",
		Script = "scripts/skills/perks/perk_legend_roster_5",
		Name = this.Const.Strings.PerkName.LegendRoster5,
		Tooltip = this.Const.Strings.PerkDescription.LegendRoster5,
		Icon = "ui/perks/recruit4.png",
		IconDisabled = "ui/perks/recruit4_bw.png"
	},
	{
		ID = "perk.legend_roster_6",
		Script = "scripts/skills/perks/perk_legend_roster_6",
		Name = this.Const.Strings.PerkName.LegendRoster6,
		Tooltip = this.Const.Strings.PerkDescription.LegendRoster6,
		Icon = "ui/perks/recruit5.png",
		IconDisabled = "ui/perks/recruit5_bw.png"
	},
	{
		ID = "perk.legend_roster_7",
		Script = "scripts/skills/perks/perk_legend_roster_7",
		Name = this.Const.Strings.PerkName.LegendRoster7,
		Tooltip = this.Const.Strings.PerkDescription.LegendRoster7,
		Icon = "ui/perks/recruit7.png",
		IconDisabled = "ui/perks/recruit7_bw.png"
	},
	{
		ID = "perk.legend_stun",
		Script = "scripts/skills/perks/perk_legend_stun",
		Name = this.Const.Strings.PerkName.LegendStunned,
		Tooltip = this.Const.Strings.PerkDescription.LegendStunned,
		Icon = "ui/perks/stun56_circle.png",
		IconDisabled = "ui/perks/stun56_circle_bw.png"
	},
	{
		ID = "perk.legend_horrify",
		Script = "scripts/skills/perks/perk_legend_horrify",
		Name = this.Const.Strings.PerkName.LegendHorrify,
		Tooltip = this.Const.Strings.PerkDescription.LegendHorrify,
		Icon = "ui/perks/horrify56_circle.png",
		IconDisabled = "ui/perks/horrify56_circle_bw.png"
	},
	{
		ID = "perk.legend_entice",
		Script = "scripts/skills/perks/perk_legend_entice",
		Name = this.Const.Strings.PerkName.LegendEntice,
		Tooltip = this.Const.Strings.PerkDescription.LegendEntice,
		Icon = "ui/perks/entice_circle_56.png",
		IconDisabled = "ui/perks/entice_circle_56_bw.png"
	},
	{
		ID = "perk.legend_push",
		Script = "scripts/skills/perks/perk_legend_push",
		Name = this.Const.Strings.PerkName.LegendPush,
		Tooltip = this.Const.Strings.PerkDescription.LegendPush,
		Icon = "ui/perks/revolt56_circle.png",
		IconDisabled = "ui/perks/revolt56_circle_bw.png"
	},
	{
		ID = "perk.legend_perfect_focus",
		Script = "scripts/skills/perks/perk_legend_perfect_focus",
		Name = this.Const.Strings.PerkName.PerfectFocus,
		Tooltip = this.Const.Strings.PerkDescription.PerfectFocus,
		Icon = "ui/perks/perfectfocus_circle.png",
		IconDisabled = "ui/perks/perfectfocus_circle_bw.png"
	},
	{
		ID = "perk.legend_firefield",
		Script = "scripts/skills/perks/perk_legend_firefield",
		Name = this.Const.Strings.PerkName.LegendFirefield,
		Tooltip = this.Const.Strings.PerkDescription.LegendFirefield,
		Icon = "ui/perks/fire_circle.png",
		IconDisabled = "ui/perks/fire_circle_bw.png"
	},
	{
		ID = "perk.legend_sleep",
		Script = "scripts/skills/perks/perk_legend_sleep",
		Name = this.Const.Strings.PerkName.LegendSleep,
		Tooltip = this.Const.Strings.PerkDescription.LegendSleep,
		Icon = "ui/perks/sleep_56.png",
		IconDisabled = "ui/perks/sleep_56_bw.png"
	},
	{
		ID = "perk.full_force",
		Script = "scripts/skills/perks/perk_full_force",
		Name = this.Const.Strings.PerkName.FullForce,
		Tooltip = this.Const.Strings.PerkDescription.FullForce,
		Icon = "ui/perks/fullforce_circle.png",
		IconDisabled = "ui/perks/fullforce_circle_bw.png"
	},
	{
		ID = "perk.return_favor",
		Script = "scripts/skills/perks/perk_return_favor",
		Name = this.Const.Strings.PerkName.ReturnFavor,
		Tooltip = this.Const.Strings.PerkDescription.ReturnFavor,
		Icon = "ui/perks/return_favor_circle.png",
		IconDisabled = "ui/perks/return_favor_circle_bw.png"
	},
		{
		ID = "perk.steadfast",
		Script = "scripts/skills/perks/perk_steadfast",
		Name = this.Const.Strings.PerkName.Steadfast,
		Tooltip = this.Const.Strings.PerkDescription.Steadfast,
		Icon = "ui/perks/steadfast_circle.png",
		IconDisabled = "ui/perks/steadfast_circle_bw.png"
		},
	{
		ID = "perk.sundering_strikes",
		Script = "scripts/skills/perks/perk_sundering_strikes",
		Name = this.Const.Strings.PerkName.SunderingStrikes,
		Tooltip = this.Const.Strings.PerkDescription.SunderingStrikes,
		Icon = "ui/perks/sunderingstrikes_circle.png",
		IconDisabled = "ui/perks/sunderingstrikes_circle_bw.png"
	},
	{
		ID = "perk.stalwart",
		Script = "scripts/skills/perks/perk_stalwart",
		Name = this.Const.Strings.PerkName.Stalwart,
		Tooltip = this.Const.Strings.PerkDescription.Stalwart,
		Icon = "ui/perks/stalwart.png",
		IconDisabled = "ui/perks/stalwart_bw.png"
	},
	{
		ID = "perk.battle_flow",
		Script = "scripts/skills/perks/perk_battle_flow",
		Name = this.Const.Strings.PerkName.BattleFlow,
		Tooltip = this.Const.Strings.PerkDescription.BattleFlow,
		Icon = "ui/perks/battle_flow56_circle.png",
		IconDisabled = "ui/perks/battle_flow56_circle_bw.png"
	},
	{
		ID = "perk.lookout",
		Script = "scripts/skills/perks/perk_lookout",
		Name = this.Const.Strings.PerkName.Lookout,
		Tooltip = this.Const.Strings.PerkDescription.Lookout,
		Icon = "ui/perks/lookout_circle.png",
		IconDisabled = "ui/perks/lookout_circle_bw.png"
	},
	{
		ID = "perk.sprint",
		Script = "scripts/skills/perks/perk_sprint",
		Name = this.Const.Strings.PerkName.Sprint,
		Tooltip = this.Const.Strings.PerkDescription.Sprint,
		Icon = "ui/perks/perk_sprint.png",
		IconDisabled = "ui/perks/perk_sprint_sw.png"
	},
	{
		ID = "perk.double_strike",
		Script = "scripts/skills/perks/perk_double_strike",
		Name = this.Const.Strings.PerkName.DoubleStrike,
		Tooltip = this.Const.Strings.PerkDescription.DoubleStrike,
		Icon = "ui/perks/doublestrike_circle.png",
		IconDisabled = "ui/perks/doublestrike_circle_bw.png"
	},
	{
		ID = "perk.legend_mastery_poison",
		Script = "scripts/skills/perks/perk_legend_mastery_poison",
		Name = this.Const.Strings.PerkName.LegendSpecPoison,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecPoison,
		Icon = "ui/perks/mastery_poison.png",
		IconDisabled = "ui/perks/mastery_poison_bw.png"
	},
	{
		ID = "perk.close_combat_archer",
		Script = "scripts/skills/perks/perk_close_combat_archer",
		Name = this.Const.Strings.PerkName.CloseCombatArcher,
		Tooltip = this.Const.Strings.PerkDescription.CloseCombatArcher,
		Icon = "ui/perks/closecombat56.png",
		IconDisabled = "ui/perks/closecombat56_bw.png"
	},
	{
		ID = "perk.ballistics",
		Script = "scripts/skills/perks/perk_ballistics",
		Name = this.Const.Strings.PerkName.Ballistics,
		Tooltip = this.Const.Strings.PerkDescription.Ballistics,
		Icon = "ui/perks/ballistics56_circle.png",
		IconDisabled = "ui/perks/ballistics56_circle_bw.png"
	},
	{
		ID = "perk.legend_cascade",
		Script = "scripts/skills/perks/perk_legend_cascade",
		Name = this.Const.Strings.PerkName.LegendCascade,
		Tooltip = this.Const.Strings.PerkDescription.LegendCascade,
		Icon = "ui/perks/triplestrike56.png",
		IconDisabled = "ui/perks/triplestrike56_bw.png"
	},
	{
		ID = "perk.legend_evasion",
		Script = "scripts/skills/perks/perk_legend_evasion",
		Name = this.Const.Strings.PerkName.LegendEvasion,
		Tooltip = this.Const.Strings.PerkDescription.LegendEvasion,
		Icon = "ui/perks/evasion_circle.png",
		IconDisabled = "ui/perks/evasion_circle_bw.png"
	},
	{
		ID = "perk.legend_rust",
		Script = "scripts/skills/perks/perk_legend_rust",
		Name = this.Const.Strings.PerkName.LegendRust,
		Tooltip = this.Const.Strings.PerkDescription.LegendRust,
		Icon = "ui/perks/rust56_circle.png",
		IconDisabled = "ui/perks/rust56_circle_bw.png",
	},
	{
		ID = "perk.legend_deathtouch",
		Script = "scripts/skills/perks/perk_legend_deathtouch",
		Name = this.Const.Strings.PerkName.LegendDeathtouch,
		Tooltip = this.Const.Strings.PerkDescription.LegendDeathtouch,
		Icon = "ui/perks/deathtouch_circle.png",
		IconDisabled = "ui/perks/deathtouch_circle_bw.png"
	},
	{
		ID = "perk.legend_possess_undead",
		Script = "scripts/skills/perks/perk_legend_possess_undead",
		Name = this.Const.Strings.PerkName.LegendPossessUndead,
		Tooltip = this.Const.Strings.PerkDescription.LegendPossessUndead,
		Icon = "ui/perks/possess56.png",
		IconDisabled = "ui/perks/possess56_bw.png"
	},
	{
		ID = "perk.legend_miasma",
		Script = "scripts/skills/perks/perk_legend_miasma",
		Name = this.Const.Strings.PerkName.LegendMiasma,
		Tooltip = this.Const.Strings.PerkDescription.LegendMiasma,
		Icon = "ui/perks/miasma_circle.png",
		IconDisabled = "ui/perks/miasma_circle_bw.png"
	},
	{
		ID = "perk.legend_hex",
		Script = "scripts/skills/perks/perk_legend_hex",
		Name = this.Const.Strings.PerkName.LegendHex,
		Tooltip = this.Const.Strings.PerkDescription.LegendHex,
		Icon = "ui/perks/hex_circle.png",
		IconDisabled = "ui/perks/hex_circle_bw.png"
	},
	{
		ID = "perk.legend_darkflight",
		Script = "scripts/skills/perks/perk_legend_darkflight",
		Name = this.Const.Strings.PerkName.LegendDarkflight,
		Tooltip = this.Const.Strings.PerkDescription.LegendDarkflight,
		Icon = "ui/perks/darkflight_circle.png",
		IconDisabled = "ui/perks/darkflight_circle_bw.png"
	},
	{
		ID = "perk.inspiring_presence",
		Script = "scripts/skills/perks/perk_inspiring_presence",
		Name = this.Const.Strings.PerkName.InspiringPresence,
		Tooltip = this.Const.Strings.PerkDescription.InspiringPresence,
		Icon = "ui/perks/perk_28.png",
		IconDisabled = "ui/perks/perk_28_sw.png"
	},
	{
		ID = "perk.legend_mastery_bandage",
		Script = "scripts/skills/perks/perk_legend_mastery_bandage",
		Name = this.Const.Strings.PerkName.LegendSpecBandage,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecBandage,
		Icon = "ui/perks/bandage_circle.png",
		IconDisabled = "ui/perks/bandage_circle_bw.png"
	},
	{
		ID = "perk.legend_hold_the_line",
		Script = "scripts/skills/perks/perk_legend_hold_the_line",
		Name = this.Const.Strings.PerkName.LegendHoldTheLine,
		Tooltip = this.Const.Strings.PerkDescription.LegendHoldTheLine,
		Icon = "ui/perks/holdtheline_circle.png",
		IconDisabled = "ui/perks/holdtheline_circle_bw.png"
	},
	{
		ID = "perk.inspire",
		Script = "scripts/skills/perks/perk_inspire",
		Name = this.Const.Strings.PerkName.Inspire,
		Tooltip = this.Const.Strings.PerkDescription.Inspire,
		Icon = "ui/perks/inspire_circle.png",
		IconDisabled = "ui/perks/inspire_circle_bw.png"
	},
	{
		ID = "perk.bloody_harvest",
		Script = "scripts/skills/perks/perk_bloody_harvest",
		Name = this.Const.Strings.PerkName.BloodyHarvest,
		Tooltip = this.Const.Strings.PerkDescription.BloodyHarvest,
		Icon = "ui/perks/bloody_harvest.png",
		IconDisabled = "ui/perks/bloody_harvest_bw.png"
	},
	{
		ID = "perk.devastating_strikes",
		Script = "scripts/skills/perks/perk_devastating_strikes",
		Name = this.Const.Strings.PerkName.DevastatingStrikes,
		Tooltip = this.Const.Strings.PerkDescription.DevastatingStrikes,
		Icon = "ui/perks/devastating_strikes.png",
		IconDisabled = "ui/perks/devastating_strikes_bw.png"
	},
	{
		ID = "perk.debilitate",
		Script = "scripts/skills/perks/perk_debilitate",
		Name = this.Const.Strings.PerkName.Debilitate,
		Tooltip = this.Const.Strings.PerkDescription.Debilitate,
		Icon = "ui/perks/debilitate_circle_56.png",
		IconDisabled = "ui/perks/debilitate_circle_56_bw.png"
	},
	{
		ID = "perk.slaughterer",
		Script = "scripts/skills/perks/perk_slaughterer",
		Name = this.Const.Strings.PerkName.Slaughterer,
		Tooltip = this.Const.Strings.PerkDescription.Slaughterer,
		Icon = "ui/perks/slaughterer_circle.png",
		IconDisabled = "ui/perks/slaughterer_circle_bw.png"
	},
	{
		ID = "perk.vengeance",
		Script = "scripts/skills/perks/perk_vengeance",
		Name = this.Const.Strings.PerkName.Vengeance,
		Tooltip = this.Const.Strings.PerkDescription.Vengeance,
		Icon = "ui/perks/vengeance_circle.png",
		IconDisabled = "ui/perks/vengeance_circle_bw.png"
	},
	{
		ID = "perk.ironside",
		Script = "scripts/skills/perks/perk_ironside",
		Name = this.Const.Strings.PerkName.Ironside,
		Tooltip = this.Const.Strings.PerkDescription.Ironside,
		Icon = "ui/perks/perk_101.png",
		IconDisabled = "ui/perks/perk_101_sw.png"
	},
	{
		ID = "perk.last_stand",
		Script = "scripts/skills/perks/perk_last_stand",
		Name = this.Const.Strings.PerkName.LastStand,
		Tooltip = this.Const.Strings.PerkDescription.LastStand,
		Icon = "ui/perks/laststand_circle.png",
		IconDisabled = "ui/perks/laststand_circle_bw.png"
	},
	{
		ID = "perk.legend_raise_undead",
		Script = "scripts/skills/perks/perk_legend_raise_undead",
		Name = this.Const.Strings.PerkName.LegendRaiseUndead,
		Tooltip = this.Const.Strings.PerkDescription.LegendRaiseUndead,
		Icon = "ui/perks/raisedead2_circle.png",
		IconDisabled = "ui/perks/raisedead2_circle_bw.png"
	},
	{
		ID = "perk.legend_wither",
		Script = "scripts/skills/perks/perk_legend_wither",
		Name = this.Const.Strings.PerkName.LegendWither,
		Tooltip = this.Const.Strings.PerkDescription.LegendWither,
		Icon = "ui/perks/wither56.png",
		IconDisabled = "ui/perks/wither56_bw.png"
	},
	{
		ID = "perk.rebound",
		Script = "scripts/skills/perks/perk_rebound",
		Name = this.Const.Strings.PerkName.Rebound,
		Tooltip = this.Const.Strings.PerkDescription.Rebound,
		Icon = "ui/perks/rebound_circle.png",
		IconDisabled = "ui/perks/rebound_circle_bw.png"
	},
	{
		ID = "perk.legend_coordinated_volleys",
		Script = "scripts/skills/perks/perk_legend_coordinated_volleys",
		Name = this.Const.Strings.PerkName.LegendCoordinatedVolleys,
		Tooltip = this.Const.Strings.PerkDescription.LegendCoordinatedVolleys,
		Icon = "ui/perks/coordinated_volleys_circle.png",
		IconDisabled = "ui/perks/coordinated_volleys_circle_bw.png"
	},
	{
		ID = "perk.legend_push_forward",
		Script = "scripts/skills/perks/perk_legend_push_forward",
		Name = this.Const.Strings.PerkName.LegendForwardPush,
		Tooltip = this.Const.Strings.PerkDescription.LegendForwardPush,
		Icon = "ui/perks/spears_circle.png",
		IconDisabled = "ui/perks/spears_circle_bw.png"
	},
	{
		ID = "perk.legend_insects",
		Script = "scripts/skills/perks/perk_legend_insects",
		Name = this.Const.Strings.PerkName.LegendInsects,
		Tooltip = this.Const.Strings.PerkDescription.LegendInsects,
		Icon = "ui/perks/insects_circle.png",
		IconDisabled = "ui/perks/insects_circle_bw.png"
	},
	{
		ID = "perk.legend_chain_lightning",
		Script = "scripts/skills/perks/perk_legend_chain_lightning",
		Name = this.Const.Strings.PerkName.LegendChainLightning,
		Tooltip = this.Const.Strings.PerkDescription.LegendChainLightning,
		Icon = "ui/perks/lightning_circle.png",
		IconDisabled = "ui/perks/lightning_circle_bw.png"
	},
	{
		ID = "perk.legend_composure",
		Script = "scripts/skills/perks/perk_legend_composure",
		Name = this.Const.Strings.PerkName.LegendComposure,
		Tooltip = this.Const.Strings.PerkDescription.LegendComposure,
		Icon = "ui/perks/composed_circle.png",
		IconDisabled = "ui/perks/composed_circle_bw.png"
	},
	{
		ID = "perk.legend_nightvision",
		Script = "scripts/skills/perks/perk_legend_nightvision",
		Name = this.Const.Strings.PerkName.LegendNightvision,
		Tooltip = this.Const.Strings.PerkDescription.LegendNightvision,
		Icon = "ui/perks/nightvision_circle.png",
		IconDisabled = "ui/perks/nightvision_circle_bw.png"
	},
	{
		ID = "perk.legend_mastery_staves",
		Script = "scripts/skills/perks/perk_legend_mastery_staves",
		Name = this.Const.Strings.PerkName.LegendMasteryStaves,
		Tooltip = this.Const.Strings.PerkDescription.LegendMasteryStaves,
		Icon = "ui/perks/staffmastery.png",
		IconDisabled = "ui/perks/staffmastery_bw.png"
	},
	{
		ID = "perk.legend_relax",
		Script = "scripts/skills/perks/perk_legend_relax",
		Name = this.Const.Strings.PerkName.LegendRelax,
		Tooltip = this.Const.Strings.PerkDescription.LegendRelax,
		Icon = "ui/perks/relax_circle.png",
		IconDisabled = "ui/perks/relax_circle_bw.png"
	},
	{
		ID = "perk.legend_gruesome_feast",
		Script = "scripts/skills/perks/perk_legend_gruesome_feast",
		Name = this.Const.Strings.PerkName.LegendGruesomeFeast,
		Tooltip = this.Const.Strings.PerkDescription.LegendGruesomeFeast,
		Icon = "ui/perks/gruesome_circle.png",
		IconDisabled = "ui/perks/gruesome_circle_bw.png"
	},
	{
		ID = "perk.legend_ubernimble",
		Script = "scripts/skills/perks/perk_legend_ubernimble",
		Name = this.Const.Strings.PerkName.LegendUberNimble,
		Tooltip = this.Const.Strings.PerkDescription.LegendUberNimble,
		Icon = "ui/perks/ubernimble_circle.png",
		IconDisabled = "ui/perks/ubernimble_circle_bw.png"
	},
	{
		ID = "perk.legend_muscularity",
		Script = "scripts/skills/perks/perk_legend_muscularity",
		Name = this.Const.Strings.PerkName.LegendMuscularity,
		Tooltip = this.Const.Strings.PerkDescription.LegendMuscularity,
		Icon = "ui/perks/muscularity_circle.png",
		IconDisabled = "ui/perks/muscularity_circle_bw.png"
	},
	{
		ID = "perk.legend_battleheart",
		Script = "scripts/skills/perks/perk_legend_battleheart",
		Name = this.Const.Strings.PerkName.LegendBattleheart,
		Tooltip = this.Const.Strings.PerkDescription.LegendBattleheart,
		Icon = "ui/perks/battlheart_circle.png",
		IconDisabled = "ui/perks/battlheart_circle_bw.png"
	},
	{
		ID = "perk.legend_true_believer",
		Script = "scripts/skills/perks/perk_legend_true_believer",
		Name = this.Const.Strings.PerkName.LegendTrueBeliever,
		Tooltip = this.Const.Strings.PerkDescription.LegendTrueBeliever,
		Icon = "ui/perks/true_believer_circle.png",
		IconDisabled = "ui/perks/true_believer_circle_bw.png"
	},
	{
		ID = "perk.legend_poison_immunity",
		Script = "scripts/skills/perks/perk_legend_poison_immunity",
		Name = this.Const.Strings.PerkName.LegendPoisonImmunity,
		Tooltip = this.Const.Strings.PerkDescription.LegendPoisonImmunity,
		Icon = "ui/perks/poison_immunity.png",
		IconDisabled = "ui/perks/poison_immunity_bw.png"
	},
	{
		ID = "perk.legend_summon_cat",
		Script = "scripts/skills/perks/perk_legend_summon_cat",
		Name = this.Const.Strings.PerkName.LegendSummonCat,
		Tooltip = this.Const.Strings.PerkDescription.LegendSummonCat,
		Icon = "ui/perks/cat_circle.png",
		IconDisabled = "ui/perks/cat_circle_bw.png"
	},
	{
		ID = "perk.legend_spawn_zombie_low",
		Script = "scripts/skills/perks/perk_legend_spawn_zombie_low",
		Name = this.Const.Strings.PerkName.LegendSpawnZombieLow,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpawnZombieLow,
		Icon = "ui/perks/mold_carrion_circle.png",
		IconDisabled = "ui/perks/mold_carrion_circle_bw.png"
	},
	{
		ID = "perk.legend_spawn_zombie_med",
		Script = "scripts/skills/perks/perk_legend_spawn_zombie_med",
		Name = this.Const.Strings.PerkName.LegendSpawnZombieMed,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpawnZombieMed,
		Icon = "ui/perks/fashion_body_circle.png",
		IconDisabled = "ui/perks/fashion_body_circle_bw.png"
	},
	{
		ID = "perk.legend_spawn_zombie_high",
		Script = "scripts/skills/perks/perk_legend_spawn_zombie_high",
		Name = this.Const.Strings.PerkName.LegendSpawnZombieHigh,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpawnZombieHigh,
		Icon = "ui/perks/remake_man_circle.png",
		IconDisabled = "ui/perks/remake_man_circle_bw.png"
	},
	{
		ID = "perk.legend_spawn_skeleton_low",
		Script = "scripts/skills/perks/perk_legend_spawn_skeleton_low",
		Name = this.Const.Strings.PerkName.LegendSpawnSkeletonLow,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpawnSkeletonLow,
		Icon = "ui/perks/arrange_bones_circle.png",
		IconDisabled = "ui/perks/arrange_bones_circle_bw.png"
	},
	{
		ID = "perk.legend_spawn_skeleton_med",
		Script = "scripts/skills/perks/perk_legend_spawn_skeleton_med",
		Name = this.Const.Strings.PerkName.LegendSpawnSkeletonMed,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpawnSkeletonMed,
		Icon = "ui/perks/align_joints_circle.png",
		IconDisabled = "ui/perks/align_joints_circle_bw.png"
	},
	{
		ID = "perk.legend_spawn_skeleton_high",
		Script = "scripts/skills/perks/perk_legend_spawn_skeleton_high",
		Name = this.Const.Strings.PerkName.LegendSpawnSkeletonHigh,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpawnSkeletonHigh,
		Icon = "ui/perks/rebuild_skeleton_circle.png",
		IconDisabled = "ui/perks/rebuild_skeleton_circle_bw.png"
	},
	{
		ID = "perk.legend_extended_aura",
		Script = "scripts/skills/perks/perk_legend_extended_aura",
		Name = this.Const.Strings.PerkName.LegendExtendendAura,
		Tooltip = this.Const.Strings.PerkDescription.LegendExtendendAura,
		Icon = "ui/perks/extended_aura_circle.png",
		IconDisabled = "ui/perks/extended_aura_circle_bw.png"
	},
	{
		ID = "perk.legend_channeled_power",
		Script = "scripts/skills/perks/perk_legend_channeled_power",
		Name = this.Const.Strings.PerkName.LegendChanneledPower,
		Tooltip = this.Const.Strings.PerkDescription.LegendChanneledPower,
		Icon = "ui/perks/channeled_power_circle.png",
		IconDisabled = "ui/perks/channeled_power_circle_bw.png"
	},
	{
		ID = "perk.legend_reclamation",
		Script = "scripts/skills/perks/perk_legend_reclamation",
		Name = this.Const.Strings.PerkName.LegendReclamation,
		Tooltip = this.Const.Strings.PerkDescription.LegendReclamation,
		Icon = "ui/perks/reclamation_circle.png",
		IconDisabled = "ui/perks/reclamation_circle_bw.png"
	},
	{
		ID = "perk.legend_conservation",
		Script = "scripts/skills/perks/perk_legend_conservation",
		Name = this.Const.Strings.PerkName.LegendConservation,
		Tooltip = this.Const.Strings.PerkDescription.LegendConservation,
		Icon = "ui/perks/conservation_circle.png",
		IconDisabled = "ui/perks/conservation_circle_bw.png"
	},
	{
		ID = "perk.legend_enthrall",
		Script = "scripts/skills/perks/perk_legend_enthrall",
		Name = this.Const.Strings.PerkName.LegendEnthrall,
		Tooltip = this.Const.Strings.PerkDescription.LegendEnthrall,
		Icon = "ui/perks/enthrall_circle.png",
		IconDisabled = "ui/perks/enthrall_circle_bw.png"
	},
	{
		ID = "perk.legend_violent_decomposition",
		Script = "scripts/skills/perks/perk_legend_violent_decomposition",
		Name = this.Const.Strings.PerkName.LegendViolentDecomposition,
		Tooltip = this.Const.Strings.PerkDescription.LegendViolentDecomposition,
		Icon = "ui/perks/violent_decomposition_circle.png",
		IconDisabled = "ui/perks/violent_decomposition_circle_bw.png"
	},
	{
		ID = "perk.legend_possession",
		Script = "scripts/skills/perks/perk_legend_possession",
		Name = this.Const.Strings.PerkName.LegendPossession,
		Tooltip = this.Const.Strings.PerkDescription.LegendPossession,
		Icon = "ui/perks/possession_circle_56.png",
		IconDisabled = "ui/perks/possession_circle_56_bw.png"
	},
	{
		ID = "perk.legend_siphon",
		Script = "scripts/skills/perks/perk_legend_siphon",
		Name = this.Const.Strings.PerkName.LegendSiphon,
		Tooltip = this.Const.Strings.PerkDescription.LegendSiphon,
		Icon = "ui/perks/siphon_circle.png",
		IconDisabled = "ui/perks/siphon_circle_bw.png"
	},
	{
		ID = "perk.legend_vala_inscribe_weapon",
		Script = "scripts/skills/perks/legend_vala_inscribe_weapon",
		Name = "Rune Sigils: Weapons",
		Tooltip = "Allows the Vala to inscribe rocks with random weapon specific rune sigils. Her first inscription happens automatically when you learn this perk, but the rest of the time the game checks 4 times per day to see if an inscription is successful.\n\nPossibilities: accuracy, feeding, power\n\nUpon success, she needs to wait 20 days before she can begin inscribing rocks with these rune sigils again.",
		Icon = "ui/perks/legend_vala_inscribe_weapon.png",
		IconDisabled = "ui/perks/legend_vala_inscribe_weapon_sw.png"
	},
	{
		ID = "perk.legend_vala_inscribe_helmet",
		Script = "scripts/skills/perks/legend_vala_inscribe_helmet",
		Name = "Rune Sigils: Helmets",
		Tooltip = "Allows the Vala to inscribe rocks with random helmet specific rune sigils. Her first inscription happens automatically when you learn this perk, but the rest of the time the game checks 4 times per day to see if an inscription is successful.\n\nPossibilities: bravery, clarity, luck\n\nUpon success, she needs to wait 20 days before she can begin inscribing rocks with these rune sigils again.",
		Icon = "ui/perks/legend_vala_inscribe_helmet.png",
		IconDisabled = "ui/perks/legend_vala_inscribe_helmet_sw.png"
	},
	{
		ID = "perk.legend_vala_inscribe_armor",
		Script = "scripts/skills/perks/legend_vala_inscribe_armor",
		Name = "Rune Sigils: Armors",
		Tooltip = "Allows the Vala to inscribe rocks with random armor specific rune sigils. Her first inscription happens automatically when you learn this perk, but the rest of the time the game checks 4 times per day to see if an inscription is successful.\n\nPossibilities: endurance, resilience, safety\n\nUpon success, she needs to wait 20 days before she can begin inscribing rocks with these rune sigils again.",
		Icon = "ui/perks/legend_vala_inscribe_armor.png",
		IconDisabled = "ui/perks/legend_vala_inscribe_armor_sw.png"
	},
	{
		ID = "perk.legend_vala_inscribe_shield",
		Script = "scripts/skills/perks/legend_vala_inscribe_shield",
		Name = "Rune Sigils: Shields",
		Tooltip = "Allows the Vala to inscribe rocks with random shield specific rune sigils. Her first inscription happens automatically when you learn this perk, but the rest of the time the game checks 4 times per day to see if an inscription is successful.\n\nPossibilities: defense\n\nUpon success, she needs to wait 20 days before she can begin inscribing rocks with these rune sigils again.",
		Icon = "ui/perks/legend_vala_inscribe_shield.png",
		IconDisabled = "ui/perks/legend_vala_inscribe_shield_sw.png"
	},
	{
		ID = "perk.legend_guide_steps",
		Script = "scripts/skills/perks/perk_legend_guide_steps",
		Name = this.Const.Strings.PerkName.LegendGuideSteps,
		Tooltip = this.Const.Strings.PerkDescription.LegendGuideSteps,
		Icon = "ui/perks/guided_steps_circle.png",
		IconDisabled = "ui/perks/guided_steps_circle_bw.png"
	},
	{
		ID = "perk.legend_berserker_rage",
		Script = "scripts/skills/perks/perk_legend_berserker_rage",
		Name = this.Const.Strings.PerkName.LegendBerserkerRage,
		Tooltip = this.Const.Strings.PerkDescription.LegendBerserkerRage,
		Icon = "ui/perks/berserker_rage_circle.png",
		IconDisabled = "ui/perks/berserker_rage_circle_bw.png"
	},
	{
		ID = "perk.legend_become_berserker",
		Script = "scripts/skills/perks/perk_legend_become_berserker",
		Name = this.Const.Strings.PerkName.LegendBecomeBerserker,
		Tooltip = this.Const.Strings.PerkDescription.LegendBecomeBerserker,
		Icon = "ui/perks/berserker_rage_circle.png",
		IconDisabled = "ui/perks/berserker_rage_circle_bw.png"
	},
	{
		ID = "perk.legend_skillful_stacking",
		Script = "scripts/skills/perks/perk_legend_skillful_stacking",
		Name = this.Const.Strings.PerkName.LegendSkillfulStacking,
		Tooltip = this.Const.Strings.PerkDescription.LegendSkillfulStacking,
		Icon = "ui/perks/MaxStashT2.png",
		IconDisabled = "ui/perks/MaxStashT2_bw.png"
	},
	{
		ID = "perk.legend_efficient_packing",
		Script = "scripts/skills/perks/perk_legend_efficient_packing",
		Name = this.Const.Strings.PerkName.LegendEfficientPacking,
		Tooltip = this.Const.Strings.PerkDescription.LegendEfficientPacking,
		Icon = "ui/perks/MaxStashT1.png",
		IconDisabled = "ui/perks/MaxStashT1_bw.png"
	},
	{
		ID = "perk.legend_ammo_binding",
		Script = "scripts/skills/perks/perk_legend_ammo_binding",
		Name = this.Const.Strings.PerkName.LegendAmmoBinding,
		Tooltip = this.Const.Strings.PerkDescription.LegendAmmoBinding,
		Icon = "ui/perks/MaxAmmoT1.png",
		IconDisabled = "ui/perks/MaxAmmoT1_bw.png"
	},
	{
		ID = "perk.legend_ammo_bundles",
		Script = "scripts/skills/perks/perk_legend_ammo_bundles",
		Name = this.Const.Strings.PerkName.LegendAmmoBundles,
		Tooltip = this.Const.Strings.PerkDescription.LegendAmmoBundles,
		Icon = "ui/perks/MaxAmmoT2.png",
		IconDisabled = "ui/perks/MaxAmmoT2_bw.png"
	},
	{
		ID = "perk.legend_med_packages",
		Script = "scripts/skills/perks/perk_legend_med_packages",
		Name = this.Const.Strings.PerkName.LegendMedPackages,
		Tooltip = this.Const.Strings.PerkDescription.LegendMedPackages,
		Icon = "ui/perks/MaxMedsT1.png",
		IconDisabled = "ui/perks/MaxMedsT1_bw.png"
	},
	{
		ID = "perk.legend_med_ingredients",
		Script = "scripts/skills/perks/perk_legend_med_ingredients",
		Name = this.Const.Strings.PerkName.LegendMedIngredients,
		Tooltip = this.Const.Strings.PerkDescription.LegendMedIngredients,
		Icon = "ui/perks/MaxMedsT2.png",
		IconDisabled = "ui/perks/MaxMedsT2_bw.png"
	},
	{
		ID = "perk.legend_tools_drawers",
		Script = "scripts/skills/perks/perk_legend_tools_drawers",
		Name = this.Const.Strings.PerkName.LegendToolsDrawers,
		Tooltip = this.Const.Strings.PerkDescription.LegendToolsDrawers,
		Icon = "ui/perks/MaxToolsT1.png",
		IconDisabled = "ui/perks/MaxToolsT1_bw.png"
	},
	{
		ID = "perk.legend_tools_spares",
		Script = "scripts/skills/perks/perk_legend_tools_spares",
		Name = this.Const.Strings.PerkName.LegendToolsSpares,
		Tooltip = this.Const.Strings.PerkDescription.LegendToolsSpares,
		Icon = "ui/perks/MaxToolsT2.png",
		IconDisabled = "ui/perks/MaxToolsT2_bw.png"
	},
	{
		ID = "perk.legend_barter_convincing",
		Script = "scripts/skills/perks/perk_legend_barter_convincing",
		Name = this.Const.Strings.PerkName.LegendBarterConvincing,
		Tooltip = this.Const.Strings.PerkDescription.LegendBarterConvincing,
		Icon = "ui/perks/BarterT1.png",
		IconDisabled = "ui/perks/BarterT1_bw.png"
	},
	{
		ID = "perk.legend_barter_trustworthy",
		Script = "scripts/skills/perks/perk_legend_barter_trustworthy",
		Name = this.Const.Strings.PerkName.LegendBarterTrustworthy,
		Tooltip = this.Const.Strings.PerkDescription.LegendBarterTrustworthy,
		Icon = "ui/perks/BarterT2.png",
		IconDisabled = "ui/perks/BarterT2_bw.png"
	},
	{
		ID = "perk.legend_bribe",
		Script = "scripts/skills/perks/perk_legend_bribe",
		Name = this.Const.Strings.PerkName.LegendBribe,
		Tooltip = this.Const.Strings.PerkDescription.LegendBribe,
		Icon = "ui/perks/coins_circle.png",
		IconDisabled = "ui/perks/coins_circle_bw.png"
	},
	{
		ID = "perk.legend_specialist_butcher_damage",
		Script = "scripts/skills/perks/perk_legend_specialist_butcher_damage",
		Name = this.Const.Strings.PerkName.LegendSpecialistButcherDamage,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistButcherDamage,
		Icon = "ui/perks/cleaver_01.png",
		IconDisabled = "ui/perks/cleaver_bw.png"
	},
	{
		ID = "perk.legend_specialist_butcher_skill",
		Script = "scripts/skills/perks/perk_legend_specialist_butcher_skill",
		Name = this.Const.Strings.PerkName.LegendSpecialistButcherSkill,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistButcherSkill,
		Icon = "ui/perks/cleaver_02.png",
		IconDisabled = "ui/perks/cleaver_bw.png"
	},
	{
		ID = "perk.legend_specialist_hammer_damage",
		Script = "scripts/skills/perks/perk_legend_specialist_hammer_damage",
		Name = this.Const.Strings.PerkName.LegendSpecialistHammerDamage,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistHammerDamage,
		Icon = "ui/perks/hammer_01.png",
		IconDisabled = "ui/perks/hammer_bw.png"
	},
	{
		ID = "perk.legend_specialist_hammer_skill",
		Script = "scripts/skills/perks/perk_legend_specialist_hammer_skill",
		Name = this.Const.Strings.PerkName.LegendSpecialistHammerSkill,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistHammerSkill,
		Icon = "ui/perks/hammer_02.png",
		IconDisabled = "ui/perks/hammer_bw.png"
	},
	{
		ID = "perk.legend_specialist_knife_damage",
		Script = "scripts/skills/perks/perk_legend_specialist_knife_damage",
		Name = this.Const.Strings.PerkName.LegendSpecialistKnifeDamage,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistKnifeDamage,
		Icon = "ui/perks/knife_01.png",
		IconDisabled = "ui/perks/knife_bw.png"
	},
	{
		ID = "perk.legend_specialist_knife_skill",
		Script = "scripts/skills/perks/perk_legend_specialist_knife_skill",
		Name = this.Const.Strings.PerkName.LegendSpecialistKnifeSkill,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistKnifeSkill,
		Icon = "ui/perks/knife_02.png",
		IconDisabled = "ui/perks/knife_bw.png"
	},
	{
		ID = "perk.legend_specialist_lute_damage",
		Script = "scripts/skills/perks/perk_legend_specialist_lute_damage",
		Name = this.Const.Strings.PerkName.LegendSpecialistLuteDamage,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistLuteDamage,
		Icon = "ui/perks/lute_01.png",
		IconDisabled = "ui/perks/lute_bw.png"
	},
	{
		ID = "perk.legend_specialist_lute_skill",
		Script = "scripts/skills/perks/perk_legend_specialist_lute_skill",
		Name = this.Const.Strings.PerkName.LegendSpecialistLuteSkill,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistLuteSkill,
		Icon = "ui/perks/lute_02.png",
		IconDisabled = "ui/perks/lute_bw.png"
	},
	{
		ID = "perk.legend_specialist_militia_damage",
		Script = "scripts/skills/perks/perk_legend_specialist_militia_damage",
		Name = this.Const.Strings.PerkName.LegendSpecialistMilitiaDamage,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistMilitiaDamage,
		Icon = "ui/perks/spear_01.png",
		IconDisabled = "ui/perks/spear_bw.png"
	},
	{
		ID = "perk.legend_specialist_militia_skill",
		Script = "scripts/skills/perks/perk_legend_specialist_militia_skill",
		Name = this.Const.Strings.PerkName.LegendSpecialistMilitiaSkill,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistMilitiaSkill,
		Icon = "ui/perks/spear_02.png",
		IconDisabled = "ui/perks/spear_bw.png"
	},
	{
		ID = "perk.legend_specialist_pickaxe_damage",
		Script = "scripts/skills/perks/perk_legend_specialist_pickaxe_damage",
		Name = this.Const.Strings.PerkName.LegendSpecialistPickaxeDamage,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistPickaxeDamage,
		Icon = "ui/perks/pickaxe_01.png",
		IconDisabled = "ui/perks/pickaxe_bw.png"
	},
	{
		ID = "perk.legend_specialist_pickaxe_skill",
		Script = "scripts/skills/perks/perk_legend_specialist_pickaxe_skill",
		Name = this.Const.Strings.PerkName.LegendSpecialistPickaxeSkill,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistPickaxeSkill,
		Icon = "ui/perks/pickaxe_02.png",
		IconDisabled = "ui/perks/pickaxe_bw.png"
	},
	{
		ID = "perk.legend_specialist_pitchfork_damage",
		Script = "scripts/skills/perks/perk_legend_specialist_pitchfork_damage",
		Name = this.Const.Strings.PerkName.LegendSpecialistPitchforkDamage,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistPitchforkDamage,
		Icon = "ui/perks/pitchfork_01.png",
		IconDisabled = "ui/perks/pitchfork_bw.png"
	},
	{
		ID = "perk.legend_specialist_pitchfork_skill",
		Script = "scripts/skills/perks/perk_legend_specialist_pitchfork_skill",
		Name = this.Const.Strings.PerkName.LegendSpecialistPitchforkSkill,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistPitchforkSkill,
		Icon = "ui/perks/pitchfork_02.png",
		IconDisabled = "ui/perks/pitchfork_bw.png"
	},
	{
		ID = "perk.legend_specialist_shortbow_damage",
		Script = "scripts/skills/perks/perk_legend_specialist_shortbow_damage",
		Name = this.Const.Strings.PerkName.LegendSpecialistShortbowDamage,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistShortbowDamage,
		Icon = "ui/perks/shortbow_01.png",
		IconDisabled = "ui/perks/shortbow_bw.png"
	},
	{
		ID = "perk.legend_specialist_shortbow_skill",
		Script = "scripts/skills/perks/perk_legend_specialist_shortbow_skill",
		Name = this.Const.Strings.PerkName.LegendSpecialistShortbowSkill,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistShortbowSkill,
		Icon = "ui/perks/shortbow_02.png",
		IconDisabled = "ui/perks/shortbow_bw.png"
	},
	{
		ID = "perk.legend_specialist_shovel_damage",
		Script = "scripts/skills/perks/perk_legend_specialist_shovel_damage",
		Name = this.Const.Strings.PerkName.LegendSpecialistShovelDamage,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistShovelDamage,
		Icon = "ui/perks/shovel_01.png",
		IconDisabled = "ui/perks/shovel_bw.png"
	},
	{
		ID = "perk.legend_specialist_shovel_skill",
		Script = "scripts/skills/perks/perk_legend_specialist_shovel_skill",
		Name = this.Const.Strings.PerkName.LegendSpecialistShovelSkill,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistShovelSkill,
		Icon = "ui/perks/shovel_02.png",
		IconDisabled = "ui/perks/shovel_bw.png"
	},
	{
		ID = "perk.legend_specialist_woodaxe_damage",
		Script = "scripts/skills/perks/perk_legend_specialist_woodaxe_damage",
		Name = this.Const.Strings.PerkName.LegendSpecialistWoodaxeDamage,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistWoodaxeDamage,
		Icon = "ui/perks/woodaxe_01.png",
		IconDisabled = "ui/perks/woodaxe_bw.png"
	},
	{
		ID = "perk.legend_specialist_woodaxe_skill",
		Script = "scripts/skills/perks/perk_legend_specialist_woodaxe_skill",
		Name = this.Const.Strings.PerkName.LegendSpecialistWoodaxeSkill,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistWoodaxeSkill,
		Icon = "ui/perks/woodaxe_02.png",
		IconDisabled = "ui/perks/woodaxe_bw.png"
	},
	{
		ID = "perk.legend_specialist_sickle_damage",
		Script = "scripts/skills/perks/perk_legend_specialist_sickle_damage",
		Name = this.Const.Strings.PerkName.LegendSpecialistSickleDamage,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistSickleDamage,
		Icon = "ui/perks/sickle_01.png",
		IconDisabled = "ui/perks/sickle_bw.png"
	},
	{
		ID = "perk.legend_specialist_sickle_skill",
		Script = "scripts/skills/perks/perk_legend_specialist_sickle_skill",
		Name = this.Const.Strings.PerkName.LegendSpecialistSickleSkill,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistSickleSkill,
		Icon = "ui/perks/sickle_02.png",
		IconDisabled = "ui/perks/sickle_bw.png"
	},
	{
		ID = "perk.legend_specialist_sling_damage",
		Script = "scripts/skills/perks/perk_legend_specialist_sling_damage",
		Name = this.Const.Strings.PerkName.LegendSpecialistSlingDamage,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistSlingDamage,
		Icon = "ui/perks/sling_01.png",
		IconDisabled = "ui/perks/sling_bw.png"
	},
	{
		ID = "perk.legend_specialist_sling_skill",
		Script = "scripts/skills/perks/perk_legend_specialist_sling_skill",
		Name = this.Const.Strings.PerkName.LegendSpecialistSlingSkill,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecialistSlingSkill,
		Icon = "ui/perks/sling_02.png",
		IconDisabled = "ui/perks/sling_bw.png"
	},
	{
		ID = "perk.legend_big_game_hunter",
		Script = "scripts/skills/perks/perk_legend_big_game_hunter",
		Name = this.Const.Strings.PerkName.LegendBigGameHunter,
		Tooltip = this.Const.Strings.PerkDescription.LegendBigGameHunter,
		Icon = "ui/perks/BigGameHunterPerk.png",
		IconDisabled = "ui/perks/BigGameHunterPerk_bw.png"
	},
	{
		ID = "perk.legend_second_wind",
		Script = "scripts/skills/perks/perk_legend_second_wind",
		Name = this.Const.Strings.PerkName.LegendSecondWind,
		Tooltip = this.Const.Strings.PerkDescription.LegendSecondWind,
		Icon = "ui/perks/SecondWindPerk.png",
		IconDisabled = "ui/perks/SecondWindPerk_bw.png"
	},
	{
		ID = "perk.legend_mark_target",
		Script = "scripts/skills/perks/perk_legend_mark_target",
		Name = this.Const.Strings.PerkName.LegendMarkTarget,
		Tooltip = this.Const.Strings.PerkDescription.LegendMarkTarget,
		Icon = "ui/perks/MarkTargetPerk.png",
		IconDisabled = "ui/perks/MarkTargetPerk_bw.png"
	},
	{
		ID = "perk.legend_field_triage",
		Script = "scripts/skills/perks/perk_legend_field_triage",
		Name = this.Const.Strings.PerkName.LegendFieldTriage,
		Tooltip = this.Const.Strings.PerkDescription.LegendFieldTriage,
		Icon = "ui/perks/MaxMedsT2.png",
		IconDisabled = "ui/perks/MaxMedsT2_bw.png"
	},
	{
		ID = "perk.legend_field_repairs",
		Script = "scripts/skills/perks/perk_legend_field_repairs",
		Name = this.Const.Strings.PerkName.LegendFieldRepairs,
		Tooltip = this.Const.Strings.PerkDescription.LegendFieldRepairs,
		Icon = "ui/perks/MaxToolsT2.png",
		IconDisabled = "ui/perks/MaxToolsT2_bw.png"
	},
	{
		ID = "perk.legend_danger_pay",
		Script = "scripts/skills/perks/perk_legend_danger_pay",
		Name = this.Const.Strings.PerkName.LegendDangerPay,
		Tooltip = this.Const.Strings.PerkDescription.LegendDangerPay,
		Icon = "ui/perks/coins_circle.png",
		IconDisabled = "ui/perks/coins_circle_bw.png"
	},															
	{
		ID = "perk.legend_vala_inscription_mastery",
		Script = "scripts/skills/perks/legend_vala_inscription_mastery",
		Name = "Inscription Mastery",
		Tooltip = "Lowers the cooldown until the Vala can begin inscribing rune sigils again (after a successful inscription) from 20 to 15 days, and increases her inscription speed from 4 to 5.5 tries per day.",
		Icon = "ui/perks/legend_vala_inscription_mastery.png",
		IconDisabled = "ui/perks/legend_vala_inscription_mastery_sw.png"
	},	
	{
		ID = "perk.legend_vala_warden",
		Script = "scripts/skills/perks/legend_vala_warden",
		Name = "Warden",
		Tooltip = "Each individual has a warden spirit that follows their soul from birth to death. The Vala, being spiritually attuned, has a remarkable connection to and relation with her Warden which allows it to manifest itself in a semi-physical form and help her out during battle.\n\nAutomatically summons the Warden at the start of a fight. It can be beaten, but it never dies. The Warden\'s attributes are reinforced by the strength of the Vala\'s Resolve.",
		Icon = "ui/perks/legend_vala_warden.png",
		IconDisabled = "ui/perks/legend_vala_warden_sw.png"
	},
	{
		ID = "perk.legend_vala_threads",
		Script = "scripts/skills/perks/legend_vala_threads",
		Name = "Threads of Fate",
		Tooltip = "As the Vala swings and weaves her staff she spins and twines the threads of fate of those she hits with it.\n\nThe Vala needs her staff equipped for this perk to work, and each point of Resolve increases her chance to apply a stacking debuff. Each stack lowers maximum hitpoints and increases amount of damage taken.",
		Icon = "ui/perks/legend_vala_threads.png",
		IconDisabled = "ui/perks/legend_vala_threads_sw.png"
	},
	{
		ID = "perk.legend_vala_premonition",
		Script = "scripts/skills/perks/legend_vala_premonition",
		Name = "Premonition",
		Tooltip = "As if being warned by some higher being, the Vala occasionally gets glimpses of the immediate future and any dangers it may hold, letting her prepare herself accordingly.\n\nHelps the Vala avoid incoming damage. Her understanding of these visions grows stronger as she becomes more experienced.",
		Icon = "ui/perks/legend_vala_premonition.png",
		IconDisabled = "ui/perks/legend_vala_premonition_sw.png"
	},
	{
		ID = "perk.legend_vala_chanting_mastery",
		Script = "scripts/skills/perks/legend_vala_chanting_mastery",
		Name = "Chanting Mastery",
		Tooltip = "Chanting builds up 25% less Fatigue.",
		Icon = "ui/perks/legend_vala_chanting_mastery.png",
		IconDisabled = "ui/perks/legend_vala_chanting_mastery_sw.png"
	},
	{
		ID = "perk.legend_vala_trance_mastery",
		Script = "scripts/skills/perks/legend_vala_trance_mastery",
		Name = "Trance Mastery",
		Tooltip = "Entering trances builds up 25% less Fatigue. Gain a 50% chance to not drop out of trance when receiving damage. Successful trances are more likely to occur.",
		Icon = "ui/perks/legend_vala_trance_mastery.png",
		IconDisabled = "ui/perks/legend_vala_trance_mastery_sw.png"
	},
	{
		ID = "perk.legend_vala_chant_disharmony",
		Script = "scripts/skills/perks/legend_vala_chant_disharmony",
		Name = "Disharmony",
		Tooltip = "A very disagreeable and cacophonous chant that makes it almost impossible for the Vala\'s enemies to focus and concentrate properly.\n\nEnemies adjacent to the Vala are unable to enforce Zones of Control, making it easy to slip past them.",
		Icon = "ui/perks/legend_vala_chant_disharmony.png",
		IconDisabled = "ui/perks/legend_vala_chant_disharmony_sw.png"
	},
	{
		ID = "perk.legend_vala_spiritual_bond",
		Script = "scripts/skills/perks/legend_vala_spiritual_bond",
		Name = "Spiritual Bond",
		Tooltip = "The bond between the Vala and her Warden has grown strong with the passing of time. A percentage of the Vala\'s incoming health damage is dealt to the Warden instead, based on the Vala\'s Resolve and up to a maximum of 50%.\n\nThis perk does nothing unless the Vala has the Warden perk.",
		Icon = "ui/perks/legend_vala_spiritual_bond.png",
		IconDisabled = "ui/perks/legend_vala_spiritual_bond_sw.png"
	},
	{
		ID = "perk.legend_vala_trance_perspective",
		Script = "scripts/skills/perks/legend_vala_trance_perspective",
		Name = "Incorporeal Perspective",
		Tooltip = "Incorporeal Perspective.",
		Icon = "ui/perks/legend_vala_trance_perspective.png",
		IconDisabled = "ui/perks/legend_vala_trance_perspective_sw.png"
	},
	{
		ID = "perk.legend_vala_trance_malevolent",
		Script = "scripts/skills/perks/legend_vala_trance_malevolent",
		Name = "Malevolent Spirits",
		Tooltip = "The spirit world is home to many malevolent beings, and the Vala knows how to contact them. Once her access to their realm has been established, she calls upon these ill-willed spirits in hopes of receiving their help. If she\'s successful, these spirits will harass, torment and weaken her foes.\n\nWhen the Vala enters a trance she will remain in that state until her task is either completed or interrupted. Trance completion is checked at the start of her turns, and failure causes her to remain in trance (while gaining additional success chance for her next completion check). Receiving damage of any kind, or becoming too fatigued, will drop the Vala out of an active trance.",
		Icon = "ui/perks/legend_vala_trance_malevolent.png",
		IconDisabled = "ui/perks/legend_vala_trance_malevolent_sw.png"
	},
	{
		ID = "perk.legend_prepared_for_anything",
		Script = "scripts/skills/perks/legend_prepared_for_anything",
		Name = this.Const.Strings.PerkName.LegendPreparedForAnything,
		Tooltip = this.Const.Strings.PerkDescription.LegendPreparedForAnything,
		Icon = "ui/perks/perk_20.png",
		IconDisabled = "ui/perks/perk_20_sw.png"
	},
	{
		ID = "perk.legend_brink_of_death",
		Script = "scripts/skills/perks/legend_brink_of_death",
		Name = this.Const.Strings.PerkName.LegendBrinkOfDeath,
		Tooltip = this.Const.Strings.PerkDescription.LegendBrinkOfDeath,
		Icon = "ui/perks/perk_04.png",
		IconDisabled = "ui/perks/perk_04_sw.png"
	},
	{
		ID = "perk.legend_strict_sermons",
		Script = "scripts/skills/perks/legend_strict_sermons",
		Name = this.Const.Strings.PerkName.LegendStrictSermons,
		Tooltip = this.Const.Strings.PerkDescription.LegendStrictSermons,
		Icon = "ui/perks/perk_08.png",
		IconDisabled = "ui/perks/perk_08_sw.png"
	},
	{
		ID = "perk.legend_infectious_rage",
		Script = "scripts/skills/perks/legend_infectious_rage",
		Name = this.Const.Strings.PerkName.LegendInfectiousRage,
		Tooltip = this.Const.Strings.PerkDescription.LegendInfectiousRage,
		Icon = "ui/perks/perk_35.png",
		IconDisabled = "ui/perks/perk_35_sw.png"
	},
	{
		ID = "perk.legend_teacher",
		Script = "scripts/skills/perks/legend_teacher",
		Name = this.Const.Strings.PerkName.LegendTeacher,
		Tooltip = this.Const.Strings.PerkDescription.LegendTeacher,
		Icon = "ui/perks/perk_21.png",
		IconDisabled = "ui/perks/perk_21_sw.png"
	},
	{
		ID = "perk.legend_resurrectionist",
		Script = "scripts/skills/perks/perk_legend_resurrectionist",
		Name = this.Const.Strings.PerkName.LegendResurrectionist,
		Tooltip = this.Const.Strings.PerkDescription.LegendResurrectionist,
		Icon = "ui/perks/reclamation_circle.png",
		IconDisabled = "ui/perks/reclamation_circle_bw.png"
	},
	{
		ID = "perk.legend_scry",
		Script = "scripts/skills/perks/perk_legend_scry",
		Name = this.Const.Strings.PerkName.LegendScry,
		Tooltip = this.Const.Strings.PerkDescription.LegendScry,
		Icon = "ui/perks/scry_perk.png",
		IconDisabled = "ui/perks/scry_perk_bw.png"
	},
	{
		ID = "perk.legend_piercing_shot",
		Script = "scripts/skills/perks/perk_legend_piercing_shot",
		Name = this.Const.Strings.PerkName.LegendPiercingShot,
		Tooltip = this.Const.Strings.PerkDescription.LegendPiercingShot,
		Icon = "ui/perks/PiercingBoltPerk.png",
		IconDisabled = "ui/perks/PiercingBoltPerk_bw.png"
	}		
];


gt.Const.Perks.PerkDefs <- {
	FastAdaptation = 0,
	CripplingStrikes = 1,
	Colossus = 2,
	NineLives = 3,
	BagsAndBelts = 4,
	Pathfinder = 5,
	Adrenalin = 6,
	Recover = 7,
	Student = 8,
	CoupDeGrace = 9,
	Bullseye = 10,
	Dodge = 11,
	FortifiedMind = 12,
	HoldOut = 13,
	SteelBrow = 14,
	QuickHands = 15,
	Gifted = 16,
	BackStabber = 17,
	Anticipation = 18,
	ShieldExpert = 19,
	Brawny = 20,
	Rotation = 21,
	RallyTheTroops = 22,
	Taunt = 23,
	MasteryMace = 24,
	MasteryFlail = 25,
	MasteryHammer = 26,
	MasteryAxe = 27,
	MasteryCleaver = 28,
	MasterySword = 29,
	MasteryDagger = 30,
	MasteryPolearm = 31,
	MasterySpear = 32,
	MasteryCrossbow = 33,
	MasteryBow = 34,
	MasteryThrowing = 35,
	ReachAdvantage = 36,
	Overwhelm = 37,
	LoneWolf = 38,
	Underdog = 39,
	Footwork = 40,
	Berserk = 41,
	HeadHunter = 42,
	Nimble = 43,
	BattleForged = 44
	Fearsome = 45,
	Duelist = 46,
	KillingFrenzy = 47,
	Indomitable = 48,
	LegendDaze = 49,
	LegendRoster1 = 50,
	LegendRoster2 = 51,
	LegendRoster3 = 52,
	LegendRoster4 = 53,
	LegendRoster5 = 54,
	LegendRoster6 = 55,
	LegendRoster7 = 56,
	LegendStun = 57,
	LegendHorrify = 58,
	LegendEntice = 59,
	LegendPush = 60,
	LegendPerfectFocus = 61,
	LegendFireField = 62,
	LegendSleep = 63,
	FullForce = 64,
	ReturnFavor = 65,
	Steadfast = 66,
	SunderingStrike = 67,
	Stalwart = 68,
	BattleFlow = 69,
	Lookout = 70,
	Sprint = 71,
	DoubleStrike = 72,
	MasteryPoison = 73,
	CloseCombatArcher = 74,
	Ballistics = 75,
	LegendCascade = 76,
	LegendEvasion = 77,
	LegendRust = 78,
	LegendDeathTouch = 79,
	LegendPossessUndead = 80,
	LegendMiasma = 81,
	LegendHex = 82,
	LegendDarkflight = 83,
	InspiringPresence = 84,
	LegendMasteryBandage = 85,
	LegendHoldTheLine = 86,
	Inspire = 87,
	BloodyHarvest = 88,
	DevastatingStrikes = 89,
	Debilitate = 90,
	Slaughter = 91,
	Vengeance = 92,
	Ironside = 93,
	LastStand = 94,
	LegendRaiseUndead = 95,
	LegendWither = 96,
	Rebound = 97,
	CoordinatedVolleys = 98,
	LegendPushForward = 99,
	LegendInsects = 100,
	LegendChainLightning = 101,
	LegendComposure = 102,
	LegendNightvision = 103,
	LegendMasteryStaves = 104,
	LegendRelax = 105,
	LegendGruesomeFeast = 106,
	LegendUberNimble = 107,
	LegendMuscularity = 108,
	LegendBattleheart = 109,
	LegendTrueBeliever = 110,
	LegendPoisonImmunity = 111,
	LegendSummonCat = 112,
	LegendSpawnZombieLow = 113,
	LegendSpawnZombieMed = 114,
	LegendSpawnZombieHigh = 115,
	LegendSpawnSkeletonLow =116,
	LegendSpawnSkeletonMed = 117,
	LegendSpawnSkeletonHigh = 118,
	LegendExtendendAura = 119,
	LegendChanneledPower = 120,
	LegendReclamation = 121,
	LegendConservation = 122,
	LegendEnthrall = 123,
	LegendViolentDecomposition = 124,
	LegendPossession = 125,
	LegendSiphon = 126,
	VazlInscribeWeapon = 127,
	VazlInscribeHelmet = 128,
	VazlInscribeArmor = 129,
	VazlInscribeShield = 130,
	LegendGuidedSteps = 131,
	LegendBerserkerRage = 132,
	LegendBecomeBerserker = 133,
	LegendSkillfulStacking = 134,
	LegendEfficientPacking = 135,
	LegendAmmoBinding = 136,
	LegendAmmoBundles = 137,
	LegendMedPackages = 138, 
	LegendMedIngredients = 139,
	LegendToolsDrawers = 140,
	LegendToolsSpares = 141,
	LegendBarterConvincing = 142,
	LegendBarterTrustworthy = 143,
	LegendBribe = 144,
	LegendSpecialistButcherDamage = 145,
	LegendSpecialistButcherSkill = 146,
	LegendSpecialistHammerDamage = 147,
	LegendSpecialistHammerSkill = 148,
	LegendSpecialistKnifeDamage = 149,
	LegendSpecialistKnifeSkill = 150,
	LegendSpecialistLuteDamage = 151,
	LegendSpecialistLuteSkill = 152,
	LegendSpecialistMilitiaDamage = 153,
	LegendSpecialistMilitiaSkill = 154,
	LegendSpecialistPickaxeDamage = 155,
	LegendSpecialistPickaxeSkill = 156,
	LegendSpecialistPitchforkDamage = 157,
	LegendSpecialistPitchforkSkill = 158,
	LegendSpecialistShortbowDamage = 159,
	LegendSpecialistShortbowSkill = 160,
	LegendSpecialistShovelDamage = 161,
	LegendSpecialistShovelSkill = 162,
	LegendSpecialistWoodaxeDamage = 163,
	LegendSpecialistWoodaxeSkill = 164,
	LegendSpecialistSickleDamage = 165,
	LegendSpecialistSickleSkill = 166,
	LegendSpecialistSlingDamage = 167,
	LegendSpecialistSlingSkill = 168,
	LegendBigGameHunter = 169,
	LegendSecondWind = 170,
	LegendMarkTarget = 171,
	LegendFieldTriage = 172,
	LegendFieldRepairs = 173,
	LegendDangerPay = 174,
	VazlInscribeMastery = 175,
	LegendValaWarden = 176,
	LegendValaThreads = 177,
	LegendValaPremonition = 178,
	LegendValaChantMastery = 179,
	LegendValaTranceMastery = 180,
	LegendValaChantDisharmony = 181,
	LegendValaSpiritualBond = 182,
	LegendValaPerspective = 183,
	LegendValaMalevolent = 184
	LegendPreparedForAnything = 185,
	LegendBrinkOfDeath = 186,
	LegendStrictSermons = 187,
	LegendInfectiousRage = 188,
	LegendTeacher = 189,
	LegendResurrectionist = 190,
	LegendScry = 191,
	LegendPiercingShot = 192
};
