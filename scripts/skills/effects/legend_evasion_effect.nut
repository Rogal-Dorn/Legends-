this.legend_evasion_effect <- this.inherit("scripts/skills/skill", {
	m = {
		IsSpent = false
	},
	function create()
	{
		this.m.ID = "effects.legend_evasion";
		this.m.Name = "Evading";
		this.m.Description = "This character ignores all Zones of Control.";
		this.m.Icon = "skills/evasion.png";
		this.m.Overlay = "evasion";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.IsImmuneToZoneOfControl = true;
	}

	function onTurnEnd()
	{
		this.removeSelf();
	}

});
