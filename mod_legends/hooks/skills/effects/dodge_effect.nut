::mods_hookExactClass("skills/effects/dodge_effect", function(o) {
	
	local create = o.create;
	o.create = function()
	{
		create();
		this.m.IsRemovedAfterBattle = false;
	}
});