::mods_hookExactClass("ai/tactical/behaviors/ai_charge", function(o) 
{
	o.m.PossibleSkills.extend([
		"actives.charge",
		"actives.unstoppable_charge",
		"actives.legend_horse_charge"
	]);
});