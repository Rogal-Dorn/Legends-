::mods_hookExactClass("items/weapons/barbarians/skull_hammer", function(o) {
	local onEquip = o.onEquip;
	o.onEquip = function ()
	{
		onEquip();
		//this.addSkill(this.new("scripts/skills/actives/legend_harvest_rock_skill"));
	}
});