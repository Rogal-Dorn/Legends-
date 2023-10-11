this.perk_legend_meek <- this.inherit("scripts/skills/skill", {
	m = {
		Stacks = 1,
	},
	function create()
	{
		this.m.ID = "perk.legend_meek";
		this.m.Name = this.Const.Strings.PerkName.LegendMeek;
		this.m.Description = "Enemies underestimate this character due to their meekness.";
		this.m.Icon = "ui/perks/meek.png";
		this.m.IconMini = "mini_meek";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk | this.Const.SkillOrder.Any;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		this.m.IsHidden = this.m.Stacks == 0;
	}

	function onCombatStarted()
	{
		this.m.Stacks = 1;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();
		tooltip.push({
			id = 6,
			type = "hint",
			icon = "ui/icons/special.png",
			text = "Always evade the first attack made against this character in combat."
		});

		return tooltip;
	}

	function onBeingAttacked( _attacker, _skill, _properties )
	{
		if (this.m.Stacks > 0)
		{
			_properties.IsEvadingAllAttacks = true;		
		}
	}

	function onMissed( _attacker, _skill )
	{
		if (this.m.Stacks > 0)
		{
			::Tactical.EventLog.logEx(::Const.UI.getColorizedEntityName(_attacker) + " underestimated " + this.Const.UI.getColorizedEntityName(this.getContainer().getActor()) + " due to " + ["their","his","her"][this.getContainer().getActor().getGender() + 1] + " meekness!");
			this.m.Stacks--;	
		}
	}

});
