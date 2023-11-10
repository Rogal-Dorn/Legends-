this.named_cleaver_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Bonus = 0
	},
	function create()
	{
		this.m.ID = "effects.named_cleaver";
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

    function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
	{
        if ( _skill.m.IsWeaponSkill == false ) { return; }
		_hitInfo.FatalityChanceMult *= 1 + (this.m.Bonus * 0.01);
	}

});
