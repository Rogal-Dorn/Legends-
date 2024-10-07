::mods_hookExactClass("skills/traits/craven_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Description = "Run for your lives! This character is a craven and will run at the slightest sign of the odds turning against them.";
		this.m.Excluded.extend(
		[
			"trait.legend_hate_nobles",
			"trait.legend_aggressive",
			"trait.legend_ambitious",
			"trait.legend_natural"
		]);
	}

	local getTooltip = o.getTooltip;
	o.getTooltip = function ()
	{
		ret = getTooltip();
		ret.push({
			id = 10,
			type = "text",
			icon = "ui/icons/ranged_defense.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Ranged Defense"
		});
		
		return ret;
	}

	local onUpdate = o.onUpdate;
	o.onUpdate = function ( _properties )
	{
		onUpdate();
		_properties.RangedDefense += 5;
	}
});
