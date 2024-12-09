::mods_hookExactClass("items/shields/buckler_shield", function(o) {
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Description = "A small but sturdy shield gripped in the fist. Offers poor protection against ranged attacks but can be useful in deflecting blows in melee. Gains defense depending on how many enemies are within 1 tile.";
		this.m.MeleeDefense = 5;
	}

	local onEquip = o.onEquip;
	o.onEquip = function ()
	{
		onEquip();
		this.addSkill(this.new("scripts/skills/actives/legend_buckler_bash_skill"));
		this.addSkill(this.new("scripts/skills/effects/legend_buckler_effect"));
	}
});
