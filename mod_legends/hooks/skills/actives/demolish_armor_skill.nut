::mods_hookExactClass("skills/actives/demolish_armor_skill", function(o)
{
	local create = o.create;
	o.create = function()
	{
		create();
		this.m.Description = "Using the weapon to batter, deform, rip and otherwise render the target\'s armor unusable with great effect. Although the impact will be felt through the thickest of armor, it won\'t greatly injure the wearer.";
	}

	o.getDescription <- function ()
	{
		 return "Prepare your next attack to debilitate a target for three turns, reducing their ability to inflict damage by [color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color] and increasing their damage taken by [color=" + this.Const.UI.Color.NegativeValue + "]+15%[/color].";
	}
});