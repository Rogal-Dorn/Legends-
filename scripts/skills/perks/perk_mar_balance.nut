this.perk_mar_balance <- this.inherit("scripts/skills/skill", {
	m = {
		BonusMin = 0,
		BonusMax = 15
	},
	function create()
	{
		this.m.ID = "perk.mar_balance";
		this.m.Name = this.Const.Strings.PerkName.MARBalance;
		this.m.Description = "%name% gains increased Melee and Ranged defense by balancing %their% armor weight and mobility.";
		this.m.Icon = "ui/perks/balance.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();
		local bonus = this.getBonus();

		if (bonus > this.m.BonusMin)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Melee Defense"
			});
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus/3 + "[/color] Ranged Defense"
			});
		}
		else if (this.getContainer().getActor().getBodyItem() == null)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "This character is not wearing any body armor and hence receives no bonus from this perk"
			});
		}
		else
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "This character\'s armor is too light or too heavy or their Initiative is too low to receive any bonus from this perk"
			});
		}

		return tooltip;
	}

	function getBonus()
	{
		local actor = this.getContainer().getActor();

		local bodyitem = actor.getBodyItem();

		if (bodyitem == null)
		{
			return 0;
		}

		local armorFatPen = actor.getTotalArmorStaminaModifier() * -1;

		local maxPossibleBonus = this.Math.floor(this.Math.minf(this.m.BonusMax, 0.01 * this.Math.pow(armorFatPen, 2.05)));

		local currIniMult = 1;
		local currIni = actor.getInitiative();
		if (currIni < 2 * armorFatPen)
		{
			currIniMult = this.Math.maxf(0, 1 - 0.01 * this.Math.pow((2*armorFatPen - currIni) * armorFatPen/50.0, 1.06));
		}

		return this.Math.floor(this.Math.maxf(this.m.BonusMin, maxPossibleBonus * currIniMult));
	}

	function onAfterUpdate( _properties )
	{
		local bonus = this.getBonus();
		_properties.MeleeDefense += bonus;
		_properties.RangedDefense += bonus/3;
	}
});
