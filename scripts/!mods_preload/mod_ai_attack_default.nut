::mods_hookNewObject("ai/tactical/behaviors/ai_attack_default", function(o) {
    o.m.PossibleSkills.push("actives.cat_bite");
    o.m.PossibleSkills.push("actives.legend_staff_bash");
	o.m.PossibleSkills.push("actives.legend_skin_ghoul_claws");
});