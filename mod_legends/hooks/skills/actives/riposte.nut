::mods_hookExactClass("skills/actives/riposte", function(o)
{
	o.isUsable = function ()
	{
		return !this.m.IsSpent && this.skill.isUsable() && !this.getContainer().hasSkill("effects.riposte");
	}
});
