::mods_hookExactClass("items/shields/named/named_wing_shield", function(o) {
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
	}
});
