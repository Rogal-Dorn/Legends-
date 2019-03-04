this.iron_will_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.iron_will";
		this.m.Name = "Iron Will";
		this.m.Icon = "skills/status_effect_92.png";
		this.m.IconMini = "status_effect_92_mini";
		this.m.Overlay = "status_effect_92";
		this.m.Type = this.Const.SkillType.StatusEffect | this.Const.SkillType.DrugEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "I feel invincible! Well, feelings may betray this character, but as he doesn\'t feel any injuries suffered, he also won\'t be affected by them until after combat ends and the adrenaline fades.";
	}

	function onUpdate( _properties )
	{
		_properties.IsAffectedByInjuries = false;
	}

});

