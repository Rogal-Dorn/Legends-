::mods_hookExactClass("skills/traits/insecure_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Description = "I can\'t do it! This character cowers, dodges and could use a bit more self confidence.";
		this.m.Excluded.extend(
		[
			"trait.legend_aggressive",
			"trait.legend_pragmatic",
			"trait.legend_ambitious",
			"trait.legend_natural",
			"trait.legend_gift_of_people"
		]);
	}

	local getTooltip = o.getTooltip;
	o.getTooltip = function ()
	{
		local ret = getTooltip();
		ret.extend([{
			id = 10,
			type = "text",
			icon = "ui/icons/melee_defense.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color] Melee Defense"
		},
		{
			id = 10,
			type = "text",
			icon = "ui/icons/ranged_defense.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color] Ranged Defense"
		}]);
		
		return ret;
	}

	o.onUpdate <- function ( _properties )
	{
		_properties.MeleeDefenseMult *= 1.05;
		_properties.RangedDefenseMult *= 1.05;
	}
});
