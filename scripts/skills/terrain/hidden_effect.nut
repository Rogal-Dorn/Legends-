this.hidden_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "terrain.hidden";
		this.m.Name = "Hidden";
		this.m.Description = "This character is hidden by terrain and cannot be seen by opponents unless directly adjacent or attacking them first.";
		this.m.Icon = "skills/status_effect_08.png";
		this.m.IconMini = "status_effect_08_mini";
		this.m.Type = this.Const.SkillType.Terrain | this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsHidden = false;
		this.m.IsSerialized = false;
	}

	function getDescription()
	{
		local ret = this.m.Description;
		return ret;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		local actor = this.getContainer().getActor();
		if (actor.getSkills().hasSkill("perk.legend_assassinate"))
		{
			ret.extend([
				{
					id = 11,
					type = "text",
					icon = "ui/icons/regular_damage.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+50%[/color] Minimum Damage from the Assassinate perk"
				},
				{
					id = 12,
					type = "text",
					icon = "ui/icons/regular_damage.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+50%[/color] Maximum Damage from the Assassinate perk"
				}
			]);

			if (actor.getSkills().hasSkill("background.legend_assassin") || actor.getSkills().hasSkill("background.assassin") || actor.getSkills().hasSkill("background.assassin_southern"))
			{
					{
						id = 13,
						type = "text",
						icon = "ui/icons/regular_damage.png",
						text = "[color=" + this.Const.UI.Color.PositiveValue + "]+50%[/color] Maximum Damage from being an assassin"
					}
			}

			if (actor.getSkills().hasSkill("background.legend_commander_assassin"))
			{
					{
						id = 13,
						type = "text",
						icon = "ui/icons/regular_damage.png",
						text = "[color=" + this.Const.UI.Color.PositiveValue + "]+75%[/color] Maximum Damage from being an experienced assassin"
					}
			}
		}

		ret.push({
			id = 13,
			type = "text",
			text = "Will last for " + this.m.TurnsLeft + " more end of rounds"
		})

		return ret;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		if (actor.getSkills().hasSkill("perk.legend_assassinate"))
		{
			_properties.DamageRegularMin *= 1.5;
			_properties.DamageRegularMax *= 1.5;

			if (actor.getSkills().hasSkill("background.legend_assassin") || actor.getSkills().hasSkill("background.assassin") || actor.getSkills().hasSkill("background.assassin_southern"))
			{
				_properties.DamageRegularMax *= 1.5;
			}
			if (actor.getSkills().hasSkill("background.legend_commander_assassin"))
			{
				_properties.DamageRegularMax *= 1.75;
			}
		}
	}
});

