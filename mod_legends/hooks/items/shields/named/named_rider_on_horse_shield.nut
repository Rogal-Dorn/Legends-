::mods_hookExactClass("items/shields/named/named_rider_on_horse_shield", function(o) {
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
	}
});
