::mods_hookExactClass("ai/tactical/behaviors/ai_disengage", function(o) 
{
	o.m.PossibleSkills.extend([
		"actives.footwork",
		"actives.legend_horse_pirouette"
	]);
});