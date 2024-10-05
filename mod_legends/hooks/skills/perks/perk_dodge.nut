::mods_hookExactClass("skills/perks/perk_dodge", function(o) {
	o.onAdded <- function ()
	{
		this.getContainer().add(this.new("scripts/skills/effects/dodge_effect"));
	}

	o.onCombatStarted = function ()
	{}
});