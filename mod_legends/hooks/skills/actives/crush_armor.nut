::mods_hookExactClass("skills/actives/crush_armor", function(o)
{
	local create = o.create;
	o.create = function()
	{
		create();
		this.m.Description = "Using the weapon to batter, deform, rip and otherwise render the target\'s armor unusable with great effect. Although the impact will be felt through the thickest of armor, it won\'t greatly injure the wearer.";
	}

	o.getTooltip = function()
	{
		local p = this.getContainer().getActor().getCurrentProperties();
		local f = p.IsSpecializedInHammers ? 2.0 : 1.5;
		local damage_armor_min = this.Math.floor(p.DamageRegularMin * p.DamageArmorMult * f * p.DamageTotalMult * p.MeleeDamageMult);
		local damage_armor_max = this.Math.floor(p.DamageRegularMax * p.DamageArmorMult * f * p.DamageTotalMult * p.MeleeDamageMult);
		local tooltip = this.getDefaultUtilityTooltip();

		if (damage_armor_max > 0)
		{
			tooltip.push({
				id = 5,
				type = "text",
				icon = "ui/icons/armor_damage.png",
				text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damage_armor_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_armor_max + "[/color] damage to armor"
			});
		}

		tooltip.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + 10 + "[/color] damage to hitpoints that ignores armor"
		});
		return tooltip;
	}
});
