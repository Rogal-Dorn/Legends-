::mods_hookExactClass("skills/actives/possess_undead_skill", function(o)
{
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Order = this.Const.SkillOrder.Any +10;
	}
});
