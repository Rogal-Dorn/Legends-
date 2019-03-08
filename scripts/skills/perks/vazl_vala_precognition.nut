this.vazl_vala_precognition <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.vazl_vala_precognition";
		this.m.Name = "Precognition";
		this.m.Description = "Precognition";
		this.m.Icon = "ui/perks/vazl_vala_precognition.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast + 9;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}


	function isHidden()
	{
		return false;
	}


	function getTooltip()
	{
		if (!this.isHidden())
		{
			local bonus = this.Math.round(10 + ((this.getContainer().getActor().getLevel() * 10.00) / this.Const.LevelXP.len()));

			return [
				{
					id = 1,
					type = "title",
					text = this.getName()
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/special.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "%[/color] chance to have any attacker require two successful attack rolls in order to hit."
				}
//				{
//					id = 11,
//					type = "text",
//					icon = "ui/icons/special.png",
//					text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + bonus + "%[/color] less likely to get targeted by enemies."
//				}
			];
		}
		else
		{
			return;
		}
	}


	function onUpdate (_properties)
	{
		local RerollBonus = 10 + ((this.getContainer().getActor().getLevel() * 10.00) / this.Const.LevelXP.len());

		if (RerollBonus >= 20)
		{
			RerollBonus = 20;
		}

		local Attraction = 10 + ((this.getContainer().getActor().getLevel() * 10.00) / this.Const.LevelXP.len());
		local AttractionMult = 1 - ((Attraction + 0.00) / 100);

		if (AttractionMult <= 0.8)
		{
			AttractionMult = 0.8;
		}

		_properties.RerollDefenseChance += RerollBonus;
		_properties.TargetAttractionMult *= AttractionMult;
	}
});
