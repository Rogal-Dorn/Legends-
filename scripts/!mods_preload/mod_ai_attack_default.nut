::mods_hookNewObject("ai/tactical/behaviors/ai_attack_default", function(o) {
    o.m.PossibleSkills.push("actives.cat_bite");
    o.m.PossibleSkills.push("actives.legend_staff_bash");
	o.m.PossibleSkills.push("actives.legend_skin_ghoul_claws");
	o.m.PossibleSkills.push("actives.legend_white_wolf_bite");
	o.m.PossibleSkills.push("actives.legend_redback_spider_bite");
	o.m.PossibleSkills.push("actives.legend_great_slash");
});