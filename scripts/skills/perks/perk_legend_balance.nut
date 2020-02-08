this.perk_legend_balance <- this.inherit("scripts/skills/skill", {
	m = {
		Charges = 1
	},
	function create()
	{
		this.m.ID = "perk.legend_balance";
		this.m.Name = this.Const.Strings.PerkName.LegendBalance;
		this.m.Description = this.Const.Strings.PerkDescription.LegendBalance;
		this.m.Icon = "ui/perks/balance.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getBonus()
	{
		if (this.getContainer() == null)
		{
			return 5;
		}

		local actor = this.getContainer().getActor();

		if (actor == null)
		{
			return 5;
		}

		local body = actor.getArmor(this.Const.BodyPart.Body);
		local initiative = actor.getInitiative();
		local diff = this.Math.abs(body - (2 * initiative));
		local adjust = this.Math.floor(25 - diff * 0.5);
		return this.Math.max(5, adjust)
	}

	function getTooltip()
	{
		local bonus = this.getBonus();
		local tooltip = this.skill.getTooltip();

		if (bonus > 5)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You gain [color=" + this.Const.UI.Color.PositiveValue + "]" + bonus + "%[/color] defense reroll chance due to Balance"
			});
		}
		else
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "This character\'s initiative and armor are too far out of alignment to give more than[color=" + this.Const.UI.Color.PositiveValue + "] 5%[/color] defense reroll chance due to Balance"
			});
		}

		return tooltip;
	}

	function onUpdate( _properties )
	{
		local bonus = this.getBonus();
		_properties.RerollDefenseChance += bonus;
	}


});

