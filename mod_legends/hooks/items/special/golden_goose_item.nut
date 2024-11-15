::mods_hookExactClass("items/special/golden_goose_item", function(o) {
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.StaminaModifier = -2;
		this.m.AddGenericSkill = true;
	}

	local getTooltip = o.getTooltip;
	o.getTooltip = function ()
	{
		local result = getTooltip();
		result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Generates [color=" + this.Const.UI.Color.PositiveValue + "]50[/color] crowns daily."
		});
		return result;
	}
});