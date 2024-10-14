::mods_hookExactClass("items/weapons/named/named_goblin_spear", function(o) {
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Description = "A masterfully crafted goblin glaive. Accurate, fast and deadly in the hands of any skilled fighter.";
		this.m.Value = 2500;
		this.m.StaminaModifier = -5;
		this.m.RegularDamage = 30;
		this.m.RegularDamageMax = 40;
	}

	local onEquip = o.onEquip;
	o.onEquip = function ()
	{
		this.named_weapon.onEquip();
		local p = this.new("scripts/skills/actives/legend_glaive_slash_skill");
		this.addSkill(p);
		local spearwall = this.new("scripts/skills/actives/spearwall");
		spearwall.m.BaseAttackName = p.getName();
		this.addSkill(spearwall);
	}
});
