::mods_hookNewObject("ai/tactical/behaviors/ai_boost_stamina", function(o) {
	o.m.PossibleSkills.push("actives.legend_drums_of_life");
	o.m.PossibleSkills.push("actives.legend_drums_of_war");
	o.m.PossibleSkills.push("actives.legend_push_forward");
	o.m.PossibleSkills.push("actives.legend_hold_the_line");
});