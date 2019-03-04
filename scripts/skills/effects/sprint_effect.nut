this.sprint_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.sprint";
		this.m.Name = "Sprinting";
		this.m.Description = "TODO";
		this.m.Icon = "ui/perks/perk_37.png";
		this.m.IconMini = "perk_37_mini";
		this.m.Overlay = "perk_37";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function onUpdate( _properties )
	{
		if (!this.isGarbage())
		{
			_properties.MovementAPCostAdditional += -1;
			_properties.MovementFatigueCostMult *= 2.0;
		}
	}

	function onTurnStart()
	{
		this.removeSelf();
	}

});

