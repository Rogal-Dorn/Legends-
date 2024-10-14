::mods_hookExactClass("items/shields/named/named_lindwurm_shield", function(o) {
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.MeleeDefense = 17;
		this.m.Condition = 64;
		this.m.ConditionMax = 64;
		this.m.StaminaModifier = 14;
	}
});
