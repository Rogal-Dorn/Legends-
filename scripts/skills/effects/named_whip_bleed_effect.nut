this.named_whip_bleed_effect <- this.inherit("scripts/skills/skill", {
	m = {
        Bonus = 0
	},
	function create()
	{
		this.m.ID = "effects.named_flail";
		this.m.Name = "";
		this.m.Description = "";
		this.m.Icon = "ui/perks/parrying_circle.png";
		this.m.IconMini = "mini_parrying_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Item;
		this.m.IsActive = false;
		this.m.IsStacking = false;
        this.m.IsWeaponSkill = true;
        this.m.IsHidden = true;
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

    function setBonus( _bonus )
    {
        this.m.Bonus = _bonus;
    }

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		local actor = this.getContainer().getActor();

		if (!actor.isAlive() || actor.isDying())
		{
			return;
		}

		if (!_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return;
		}

		if (!_targetEntity.getCurrentProperties().IsImmuneToBleeding)
		{
            if ( ::Math.rand(0, 100) > this.m.Bonus ) { return; }
			local effect = this.new("scripts/skills/effects/bleeding_effect");
            if (_user.getFaction() == this.Const.Faction.Player )
            {
                effect.setActor(this.getContainer().getActor());
            }
            effect.setDamage(this.getContainer().getActor().getCurrentProperties().IsSpecializedInCleavers ? 10 : 5);
            _targetEntity.getSkills().add(effect);
		}
	}

});
