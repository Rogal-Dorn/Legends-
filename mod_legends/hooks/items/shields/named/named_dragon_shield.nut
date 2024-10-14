::mods_hookExactClass("items/shields/named/named_dragon_shield", function(o) {
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Condition = 60;
		this.m.ConditionMax = 60;
	}
});
