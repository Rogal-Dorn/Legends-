::mods_hookExactClass("skills/perks/perk_quick_hands", function(o) {
	o.getName <- function()
	{
		local name = this.skill.getName();
		if (this.getContainer() != null && this.getContainer().hasSkill("injury.missing_hand")) name = ::MSU.String.replace(name, "Quick Hands", "Quick Hand")
		return name;
	}

	o.getDescription <- function()
	{
		local description = this.skill.getDescription()
		if (this.getContainer() != null && this.getContainer().hasSkill("injury.missing_hand")) description = ::MSU.String.replace(description, "has quick hands", "has a quick hand")
		return description;
	}
});