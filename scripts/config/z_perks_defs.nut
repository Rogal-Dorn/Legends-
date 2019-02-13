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
		Name = this.Const.Strings.PerkName.LegendRoster + " 1",
		Tooltip = this.Const.Strings.PerkDescription.LegendRoster,
		Icon = "ui/perks/recruit56_3.png",
		IconDisabled = "ui/perks/recruit56_3_bw.png"
	},
	{
		ID = "perk.legend_roster_2",
		Script = "scripts/skills/perks/perk_legend_roster_2",
		Name = this.Const.Strings.PerkName.LegendRoster,
		Tooltip = this.Const.Strings.PerkDescription.LegendRoster,
		Icon = "ui/perks/recruit56_3.png",
		IconDisabled = "ui/perks/recruit56_3_bw.png"
	},			
	{
		ID = "perk.legend_roster_3",
		Script = "scripts/skills/perks/perk_legend_roster_3",
		Name = this.Const.Strings.PerkName.LegendRoster,
		Tooltip = this.Const.Strings.PerkDescription.LegendRoster,
		Icon = "ui/perks/recruit56_3.png",
		IconDisabled = "ui/perks/recruit56_3_bw.png"
	},
	{
		ID = "perk.legend_roster_4",
		Script = "scripts/skills/perks/perk_legend_roster_4",
		Name = this.Const.Strings.PerkName.LegendRoster,
		Tooltip = this.Const.Strings.PerkDescription.LegendRoster,
		Icon = "ui/perks/recruit56_3.png",
		IconDisabled = "ui/perks/recruit56_3_bw.png"
	},
	{
		ID = "perk.legend_roster_5",
		Script = "scripts/skills/perks/perk_legend_roster_5",
		Name = this.Const.Strings.PerkName.LegendRoster,
		Tooltip = this.Const.Strings.PerkDescription.LegendRoster,
		Icon = "ui/perks/recruit56_3.png",
		IconDisabled = "ui/perks/recruit56_3_bw.png"
	},
	{
		ID = "perk.legend_roster_6",
		Script = "scripts/skills/perks/perk_legend_roster_6",
		Name = this.Const.Strings.PerkName.LegendRoster,
		Tooltip = this.Const.Strings.PerkDescription.LegendRoster,
		Icon = "ui/perks/recruit56_3.png",
		IconDisabled = "ui/perks/recruit56_3_bw.png"
	},
	{
		ID = "perk.legend_roster_7",
		Script = "scripts/skills/perks/perk_legend_roster_7",
		Name = this.Const.Strings.PerkName.LegendRoster,
		Tooltip = this.Const.Strings.PerkDescription.LegendRoster,
		Icon = "ui/perks/recruit56_3.png",
		IconDisabled = "ui/perks/recruit56_3_bw.png"
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
		Icon = "ui/perks/perk_37.png",
		IconDisabled = "ui/perks/perk_37_sw.png"
	},
	{
		ID = "perk.legend_firefield",
		Script = "scripts/skills/perks/perk_legend_firefield",
		Name = this.Const.Strings.PerkName.LegendFirefield,
		Tooltip = this.Const.Strings.PerkDescription.LegendFirefield,
		Icon = "ui/perks/firefield56_circle.png",
		IconDisabled = "ui/perks/firefield56_circle_bw.png"
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
		Icon = "ui/perks/fullforce56_circle.png",
		IconDisabled = "ui/perks/fullforce56_circle_bw.png"
	},
	{
		ID = "perk.return_favor",
		Script = "scripts/skills/perks/perk_return_favor",
		Name = this.Const.Strings.PerkName.ReturnFavor,
		Tooltip = this.Const.Strings.PerkDescription.ReturnFavor,
		Icon = "ui/perks/return_favor56.png",
		IconDisabled = "ui/perks/return_favor56_bw.png"
	},
		{
		ID = "perk.steadfast",
		Script = "scripts/skills/perks/perk_steadfast",
		Name = this.Const.Strings.PerkName.Steadfast,
		Tooltip = this.Const.Strings.PerkDescription.Steadfast,
		Icon = "ui/perks/perk_03.png",
		IconDisabled = "ui/perks/perk_03_sw.png"
		},
	{
		ID = "perk.sundering_strikes",
		Script = "scripts/skills/perks/perk_sundering_strikes",
		Name = this.Const.Strings.PerkName.SunderingStrikes,
		Tooltip = this.Const.Strings.PerkDescription.SunderingStrikes,
		Icon = "ui/perks/perk_12.png",
		IconDisabled = "ui/perks/perk_12_sw.png"
	},
	{
		ID = "perk.stalwart",
		Script = "scripts/skills/perks/perk_stalwart",
		Name = this.Const.Strings.PerkName.Stalwart,
		Tooltip = this.Const.Strings.PerkDescription.Stalwart,
		Icon = "skills/active_08.png",
		IconDisabled = "skills/active_08_sw.png"
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
		Icon = "ui/perks/perk_vision.png",
		IconDisabled = "ui/perks/perk_vision_sw.png"
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
		Icon = "ui/perks/doublestrike_56.png",
		IconDisabled = "ui/perks/doublestrike_56_bw.png"
	},
	{
		ID = "perk.legend_mastery_poison",
		Script = "scripts/skills/perks/perk_legend_mastery_poison",
		Name = this.Const.Strings.PerkName.LegendSpecPoison,
		Tooltip = this.Const.Strings.PerkDescription.LegendSpecPoison,
		Icon = "ui/perks/mastery-poison.png",
		IconDisabled = "ui/perks/mastery-poison_bw.png"
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
		Icon = "ui/perks/perk_29.png",
		IconDisabled = "ui/perks/perk_29_sw.png"
	},
	{
		ID = "perk.legend_rust",
		Script = "scripts/skills/perks/perk_legend_rust",
		Name = this.Const.Strings.PerkName.LegendRust,
		Tooltip = this.Const.Strings.PerkDescription.LegendRust,
		Icon = "ui/perks/perk_137.png",
		IconDisabled = "skills/active_137_sw.png",
	},
	{
		ID = "perk.legend_deathtouch",
		Script = "scripts/skills/perks/perk_legend_deathtouch",
		Name = this.Const.Strings.PerkName.LegendDeathtouch,
		Tooltip = this.Const.Strings.PerkDescription.LegendDeathtouch,
		Icon = "skills/deathtouch_square.png",
		IconDisabled = "skills/deathtouch_square_bw.png"
	},
	{
		ID = "perk.legend_possess_undead",
		Script = "scripts/skills/perks/perk_legend_possess_undead",
		Name = this.Const.Strings.PerkName.LegendPossessUndead,
		Tooltip = this.Const.Strings.PerkDescription.LegendPossessUndead,
		Icon = "skills/active_99.png",
		IconDisabled = "skills/active_99_sw.png"
	},
	{
		ID = "perk.legend_miasma",
		Script = "scripts/skills/perks/perk_legend_miasma",
		Name = this.Const.Strings.PerkName.LegendMiasma,
		Tooltip = this.Const.Strings.PerkDescription.LegendMiasma,
		Icon = "skills/active_101.png",
		IconDisabled = "skills/active_101_sw.png"
	},
	{
		ID = "perk.legend_hex",
		Script = "scripts/skills/perks/perk_legend_hex",
		Name = this.Const.Strings.PerkName.LegendHex,
		Tooltip = this.Const.Strings.PerkDescription.LegendHex,
		Icon = "skills/active_100.png",
		IconDisabled = "skills/active_100_sw.png"
	},
	{
		ID = "perk.legend_darkflight",
		Script = "scripts/skills/perks/perk_legend_darkflight",
		Name = this.Const.Strings.PerkName.LegendDarkflight,
		Tooltip = this.Const.Strings.PerkDescription.LegendDarkflight,
		Icon = "ui/perks/perk_27.png",
		IconDisabled = "ui/perks/perk_27_sw.png"
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
		Icon = "skills/active_105.png",
		IconDisabled = "skills/active_105_sw.png"
	},
	{
		ID = "perk.legend_hold_the_line",
		Script = "scripts/skills/perks/perk_legend_hold_the_line",
		Name = this.Const.Strings.PerkName.LegendHoldTheLine,
		Tooltip = this.Const.Strings.PerkDescription.LegendHoldTheLine,
		Icon = "ui/perks/return_favor56.png",
		IconDisabled = "ui/perks/return_favor56_bw.png"
	},
	{
		ID = "perk.inspire",
		Script = "scripts/skills/perks/perk_inspire",
		Name = this.Const.Strings.PerkName.Inspire,
		Tooltip = this.Const.Strings.PerkDescription.Inspire,
		Icon = "ui/perks/perk_41.png",
		IconDisabled = "ui/perks/perk_41_sw.png"
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
	Inspire = 87
};
