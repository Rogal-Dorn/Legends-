this.perk_head_hunter <- this.inherit("scripts/skills/skill", {
	m = {
		Stacks = 0,
		SkillCount = 0
	},
	function create()
	{
		this.m.ID = "perk.head_hunter";
		this.m.Name = this.Const.Strings.PerkName.HeadHunter;
		this.m.Description = this.Const.Strings.PerkDescription.HeadHunter;
		this.m.Icon = "ui/perks/perk_15.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk | this.Const.SkillOrder.Any;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}


	function getDescription()
	{
		return "This character has an additional [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.Stacks * 15 + "%[/color] chance to land a hit to the head.";
	}

	function onUpdate( _properties )
	{
		this.m.IsHidden = this.m.Stacks == 0;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (this.m.SkillCount == this.Const.SkillCounter)
		{
			return;
		}

		this.m.SkillCount = this.Const.SkillCounter;
		local dirty = false;

		if (_bodyPart == this.Const.BodyPart.Head)
		{
			if (this.m.Stacks != 0)
			{
				dirty = true;
			}

			this.m.Stacks = 0;
		}
		else
		{
			++this.m.Stacks;

			if (this.m.Stacks == 1)
			{
				dirty = true;
			}
		}

		if (dirty)
		{
			this.getContainer().getActor().setDirty(true);
		}
	}

	function onCombatStarted()
	{
		this.m.Stacks = 0;
		this.m.SkillCount = 0;
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.Stacks = 0;
		this.m.SkillCount = 0;
		this.m.IsHidden = true;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill.isAttack())
		{
			_properties.HitChance[this.Const.BodyPart.Head] += 15 * this.m.Stacks;
		}
	}

});

