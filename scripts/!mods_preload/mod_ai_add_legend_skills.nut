::mods_hookNewObject("ai/tactical/behaviors/ai_attack_default", function(o) {
    o.m.PossibleSkills.push("actives.cat_bite");
    o.m.PossibleSkills.push("actives.legend_staff_bash");
	o.m.PossibleSkills.push("actives.legend_skin_ghoul_claws");
	o.m.PossibleSkills.push("actives.legend_white_wolf_bite");
	o.m.PossibleSkills.push("actives.legend_redback_spider_bite");
	o.m.PossibleSkills.push("actives.legend_great_slash");
	o.m.PossibleSkills.push("actives.legend_glaive_slash");
	o.m.PossibleSkills.push("actives.legend_spear_lunge_skill");
	o.m.PossibleSkills.push("actives.legend_chain_thresh");
	o.m.PossibleSkills.push("actives.legend_chain_flail_skill");
	o.m.PossibleSkills.push("actives.legend_demon_hound_bite");
	o.m.PossibleSkills.push("actives.legend_ranged_flail");
	o.m.PossibleSkills.push("actives.legend_halberd_impale");
	o.m.PossibleSkills.push("actives.legend_voulge_cleave");
	o.m.PossibleSkills.push("actives.legend_horse_kick");
	o.m.PossibleSkills.push("actives.legend_donkey_kick");
	o.m.PossibleSkills.push("actives.legend_bear_bite");
	o.m.PossibleSkills.push("actives.legend_bear_claws");
	o.m.PossibleSkills.push("actives.legend_flaggelate");
	o.m.PossibleSkills.push("actives.legend_boar_gore");
	o.m.PossibleSkills.push("actives.legend_rat_claws");
	o.m.PossibleSkills.push("actives.legend_rat_bite");
	o.m.PossibleSkills.push("actives.legend_en_garde");
	o.m.PossibleSkills.push("actives.lunge");
});

::mods_hookNewObject("ai/tactical/behaviors/ai_attack_bow", function(o) {
    //o.m.PossibleSkills.push("actives.legend_quick_pebble");
    //o.m.PossibleSkills.push("actives.legend_aimed_pebble");
	o.m.PossibleSkills.push("actives.legend_catapult_boulder");
    o.m.PossibleSkills.push("actives.legend_sling_heavy_stone");
	o.m.PossibleSkills.push("actives.legend_shoot_dart");
})

::mods_hookNewObject("ai/tactical/behaviors/ai_adrenaline", function(o) {
    o.m.PossibleSkills.push("actives.adrenaline");
	o.m.PossibleSkills.push("actives.legend_transform_into_bear");
});

::mods_hookNewObject("ai/tactical/behaviors/ai_attack_crush_armor", function(o) {
    o.m.PossibleSkills.push("actives.legend_halberd_smite");
})

::mods_hookNewObject("ai/tactical/behaviors/ai_attack_decapitate", function(o) {
    o.m.PossibleSkills.push("actives.legend_voulge_decapitate");
});

::mods_hookNewObject("ai/tactical/behaviors/ai_attack_lash", function(o) {
    o.m.PossibleSkills.push("actives.legend_ranged_lash");
})

::mods_hookNewObject("ai/tactical/behaviors/ai_attack_swallow_whole", function(o) {
    o.m.PossibleSkills.push("actives.legend_skin_ghoul_swallow_whole");
});

::mods_hookNewObject("ai/tactical/behaviors/ai_attack_terror", function(o) {
	o.m.PossibleSkills.push("actives.legend_banshee_scream");
	o.m.PossibleSkills.push("actives.legend_horrific_scream");
});

::mods_hookNewObject("ai/tactical/behaviors/ai_boost_stamina", function(o) {
	o.m.PossibleSkills.push("actives.legend_drums_of_life");
	o.m.PossibleSkills.push("actives.legend_drums_of_war");
	o.m.PossibleSkills.push("actives.legend_push_forward");
	o.m.PossibleSkills.push("actives.legend_hold_the_line");
});

::mods_hookNewObject("ai/tactical/behaviors/ai_buff_howl", function(o) {
	o.m.PossibleSkills.push("actives.legend_white_wolf_howl");
});

::mods_hookNewObject("ai/tactical/behaviors/ai_charge", function(o) {
    o.m.PossibleSkills.push("actives.charge");
	o.m.PossibleSkills.push("actives.unstoppable_charge");
	o.m.PossibleSkills.push("actives.legend_horse_charge");
});

::mods_hookNewObject("ai/tactical/behaviors/ai_charm", function(o) {
    o.m.PossibleSkills.push("actives.legend_intensely_charm");
});

::mods_hookNewObject("ai/tactical/behaviors/ai_corruption", function(o) {
    o.m.PossibleSkills.push("actives.legend_demon_shadows");
});

::mods_hookNewObject("ai/tactical/behaviors/ai_darkflight", function(o) {
    o.m.PossibleSkills.push("actives.legend_teleport");
})

::mods_hookNewObject("ai/tactical/behaviors/ai_defend_knock_back", function ( o ) {
	o.m.PossibleSkills.push("actives.legend_kick");
	o.m.PossibleSkills.push("actives.legend_revolt");
	o.m.PossibleSkills.push("actives.legend_push");
	o.m.PossibleSkills.push("actives.legend_chain_hook");
});

::mods_hookNewObject("ai/tactical/behaviors/ai_defend_riposte", function(o) {
    o.m.PossibleSkills.push("actives.legend_staff_riposte");
	  o.m.PossibleSkills.push("actives.return_favor");
});

::mods_hookNewObject("ai/tactical/behaviors/ai_disengage", function(o) {
    o.m.PossibleSkills.push("actives.footwork");
	  o.m.PossibleSkills.push("actives.legend_horse_pirouette");
});

::mods_hookNewObject("ai/tactical/behaviors/ai_engage_ranged", function(o) {
    //o.m.PossibleSkills.push("actives.legend_quick_pebble");
    //o.m.PossibleSkills.push("actives.legend_aimed_pebble");
	//o.m.PossibleSkills.push("actives.legend_aimed_rock");
	o.m.PossibleSkills.push("actives.legend_magic_missile");
	o.m.PossibleSkills.push("actives.legend_catapult_boulder");
	o.m.PossibleSkills.push("actives.legend_sling_heavy_stone");
	o.m.PossibleSkills.push("actives.legend_shoot_dart");
});

::mods_hookNewObject("ai/tactical/behaviors/ai_line_breaker", function(o) {
    o.m.PossibleSkills.push("actives.legend_boar_charge");
})

::mods_hookNewObject("ai/tactical/behaviors/ai_move_tail", function(o) {
    o.m.PossibleSkills.push("actives.legend_stollwurm_move_tail");
})

::mods_hookNewObject("ai/tactical/behaviors/ai_move_tentacle", function(o) {
    o.m.PossibleSkills.push("actives.legend_stollwurm_move");
})

::mods_hookNewObject("ai/tactical/behaviors/ai_attack_puncture", function(o) {
    o.m.PossibleSkills.push("actives.puncture_parry_dagger");
})

::mods_hookNewObject("ai/tactical/behaviors/ai_defend_rotation", function(o) {
	o.onExecute = function( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(this.m.TargetTile);
			this.m.IsFirstExecuted = false;
			return false;
		}

		if (this.Const.AI.VerboseMode)
		{
			this.logInfo("* " + _entity.getName() + ": Using Rotation!");
		}

		this.m.Skill.use(this.m.TargetTile);

		if (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer)
		{
			this.getAgent().declareEvaluationDelay(3000);
			this.getAgent().declareAction();
		}

		this.m.TargetTile = null;
		this.m.Skill = null;
		return true;
	}

});