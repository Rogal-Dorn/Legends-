this.taunt_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.taunt";
		this.m.Name = "Taunting";
		this.m.Description = "This character has gotten the attention of nearby opponents and is more likely to get attacked over other potential targets.";
		this.m.Icon = "ui/perks/perk_38.png";
		this.m.IconMini = "perk_38_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function onUpdate( _properties )
	{
		_properties.TargetAttractionMult *= 1.0 + this.Math.minf(1.5, this.getContainer().getActor().getCurrentProperties().Bravery * 0.015);
	}

	function onAdded()
	{
		this.m.TurnsLeft = this.Math.max(1, 2 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
	}

	function onRefresh()
	{
		this.m.TurnsLeft = this.Math.max(1, 2 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

});
