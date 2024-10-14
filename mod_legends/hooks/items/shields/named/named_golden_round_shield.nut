::mods_hookExactClass("items/shields/named/named_golden_round_shield", function(o) {
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Condition = 75;
		this.m.ConditionMax = 75;
	}
});
