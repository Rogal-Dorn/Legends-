this.perk_legend_balance <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_balance";
		this.m.Name = this.Const.Strings.PerkName.LegendBalance;
		this.m.Description = this.Const.Strings.PerkDescription.LegendBalance;
		this.m.Icon = "ui/perks/balance.png";
		this.m.IconDisabled = "ui/perks/balance_bw.png"
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getBonus()
	{
		local actor = this.getContainer().getActor();
		local body = actor.getArmor(this.Const.BodyPart.Body);
		local initiative = actor.getInitiative();
		local diff = this.Math.abs(body - (2 * initiative));
		local bonus = this.Math.max(5, (30 - diff));
		return bonus;
	}

	function getTooltip()
	{
		local bonus = this.getBonus();

		if (bonus > 5)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You are gaining [color=" + this.Const.UI.Color.PositiveValue + "]" + bonus + "%[/color] defence due to increased balance"
			});
		}
		else
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]This character\'s initiative and armor are too far out of alignment to gain more than[color=" + this.Const.UI.Color.PositiveValue + "] 5%[/color] from balance"
			});
		}

		return tooltip;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		local bonus = this.getBonus();
		_properties.MeleeDefense += bonus;
		_properties.RangedDefense += bonus;
	}

});

