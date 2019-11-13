::mods_hookNewObject("ai/tactical/behaviors/ai_attack_knock_out", function(o) {
    o.m.PossibleSkills.push("actives.legend_staff_knock_out");
	 o.m.PossibleSkills.push("actives.legend_buckler_bash");

    local fn = o.getBestTarget
    o.getBestTarget = function ( _entity, _skill, _targets )
	{
		local attackSkill = _entity.getSkills().getAttackOfOpportunity();
        if (attackSkill == null)
        {
            return {
                Target = null,
                Score = 0.0
		    }
        }

        return fn(_entity, _skill, _targets)
	}
});
