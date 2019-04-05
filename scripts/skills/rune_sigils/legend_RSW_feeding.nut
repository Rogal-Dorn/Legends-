this.legend_RSW_feeding <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "special.legend_RSW_feeding";
		this.m.Name = "Rune Sigil: Feeding";
		this.m.Description = "Rune Sigil: Feeding";
		this.m.Icon = "ui/rune_sigils/legend_rune_sigil.png";
		this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}


	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_damageInflictedHitpoints <= 0)
		{
			return;
		}

		local drain = 0.08 + (this.m.Item.RuneMultiplier / 100.0);
		local actor = this.m.Container.getActor();
		actor.setFatigue(this.Math.max(0, actor.getFatigue() - this.Math.ceil(_damageInflictedHitpoints * drain)));
	}
});
