::mods_hookExactClass("items/weapons/warbrand", function(o) {
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Value = 1700;
	}

	local onEquip = o.onEquip;
	o.onEquip = function ()
	{
		onEquip();
		this.addSkill(this.new("scripts/skills/actives/legend_great_slash"));
		this.addSkill(this.new("scripts/skills/actives/split"));
		this.addSkill(this.new("scripts/skills/actives/swing"));
	}
});
