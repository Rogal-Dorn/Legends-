::mods_hookExactClass("ai/tactical/behaviors/ai_boost_stamina", function(o) 
{
	o.m.PossibleSkills.extend([
		"actives.legend_drums_of_life",
		"actives.legend_drums_of_war",
		"actives.legend_push_forward",
		"actives.legend_hold_the_line"
	]);
});