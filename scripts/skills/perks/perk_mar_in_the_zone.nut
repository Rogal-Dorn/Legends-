this.perk_mar_in_the_zone <- this.inherit("scripts/skills/skill", {
	m = {
		Stacks = 0,
		MaxStacks = 25,
		IsInCombat = false
	},
	function create()
	{
		this.m.ID = "perk.mar_in_the_zone";
		this.m.Name = this.Const.Strings.PerkName.MARInTheZone;
		this.m.Description = "%name% utilizes %their% armor\'s blend of protection and mobility to deal increased damage and gain increased accuracy when foes miss attacks against %them%.";
		this.m.Icon = "ui/perks/in_the_zone.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		local bonus = this.getBonus();

		if (bonus > 0)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "+[color=" + this.Const.UI.Color.PositiveValue + "]" + bonus + "%[/color] Melee Skill"
			});
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "+[color=" + this.Const.UI.Color.PositiveValue + "]" + bonus + "%[/color] Melee Damage"
			});
		}

		local actor = this.getContainer().getActor();

		if (!actor.isPlacedOnMap())
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/warning.png",
				text = "These bonuses will be [color=" + this.Const.UI.Color.NegativeValue + "]halved[/color] when not engaged in melee"
			});
		}
		else if (!actor.isEngagedInMelee())
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/warning.png",
				text = "Bonuses [color=" + this.Const.UI.Color.NegativeValue + "]halved[/color] due to not being engaged in melee"
			});
		}

		return tooltip;
	}

	function getBonus()
	{
		return (this.getContainer().getActor().isPlacedOnMap() && !this.getContainer().getActor().isEngagedInMelee()) ? this.m.Stacks / 2 : this.m.Stacks;		
	}

	function onAfterUpdate( _properties )
	{
		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			this.m.Stacks = 0;
			local actor = this.getContainer().getActor();
			local armorFat = actor.getTotalArmorStaminaModifier() * -1;

			if (actor.getInitiative() >= 2*armorFat)
			{
				this.m.Stacks = this.Math.min(this.m.MaxStacks, this.Math.max(0, armorFat - 15));
			}
		}

		if (this.m.Stacks > 0)
		{
			local bonus = this.getBonus();
			_properties.MeleeDamageMult *= 1 + bonus * 0.01;
			_properties.MeleeSkillMult *= 1 + bonus * 0.01;
		}
	}

	function onMissed( _attacker, _skill )
	{
		if (_attacker != null && _skill != null && _skill.isAttack() && !_skill.isRanged())
		{
			this.m.Stacks = this.Math.min(this.m.MaxStacks, this.m.Stacks + 1);
		}
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker != null && _skill != null && _skill.isAttack())
		{
			this.m.Stacks -= 2;
		}
	}
});
