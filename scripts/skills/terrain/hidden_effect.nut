this.hidden_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "terrain.hidden";
		this.m.Name = "Hidden";
		this.m.Description = "This character is hidden in terrain and can not be seen by opponents unless directly adjacent or attacking them first.";
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

		if (this.getContainer().getActor().getSkills().hasSkill("perk.boondock_blade"))
		{
			ret = ret + ("\n\nBecause of Boondock Blade, the character also gains:\n[color=" + this.Const.UI.Color.PositiveValue + "]+10 Melee Skill[/color]\n[color=" + this.Const.UI.Color.PositiveValue + "]+10 Ranged Skill[/color]\n[color=" + this.Const.UI.Color.PositiveValue + "]+10 Melee Defense[/color]\n[color=" + this.Const.UI.Color.PositiveValue + "]+10 Ranged Defense[/color]");
		}

		return ret;
	}

});
