::mods_hookExactClass("items/weapons/named/named_crossbow", function(o) {

	o.getTooltip <- function ()
	{
		local result = this.named_weapon.getTooltip();

		if (!this.m.IsLoaded)
		{
			result.push({
				id = 10,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Must be reloaded before firing again[/color]"
			});
		}

		return result;
	}

	o.onEquip = function ()
	{
		this.named_weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/shoot_bolt"));
		this.addSkill(this.new("scripts/skills/actives/legend_piercing_bolt_skill"));

		if (!this.m.IsLoaded)
		{
			this.addSkill(this.new("scripts/skills/actives/reload_bolt"));
		}
	}

	o.onCombatFinished = function ()
	{
		this.named_weapon.onCombatFinished();
		this.setLoaded(true);
	}
});
