this.perk_legend_true_believer <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_true_believer";
		this.m.Name = this.Const.Strings.PerkName.LegendTrueBeliever;
		this.m.Description = this.Const.Strings.PerkDescription.LegendTrueBeliever;
		this.m.Icon = "ui/perks/true_believer_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.IsAffectedByFleeingAllies = false;
		_properties.IsAffectedByDyingAllies = false;
		local bonus = this.getFleeing() * 0.05;
		_properties.BraveryMult += bonus;

	}

	function getFleeing()
	{
		if (!("Entities" in this.Tactical))
		{
			return 0;
		}
		if (this.Tactical.Entities == null)
		{
			return 0;
		}
		
		if (!this.Tactical.isActive())
		{
			return 0;
		}

		local fleeing = 0;
	
		local actors = this.Tactical.Entities.getAllInstancesAsArray();

		foreach( a in actors )
		{
			if (a.getMoraleState() == this.Const.MoraleState.Fleeing)
			{
				fleeing += 1;

			}

		}
		return fleeing;
	}

	function onAdded()
	{
		if (this.m.Container.hasSkill("trait.pessimist"))
		{
			this.m.Container.removeByID("trait.pessimist");
		}
		if (this.m.Container.hasSkill("trait.irrational"))
		{
			this.m.Container.removeByID("trait.irrational");
		}
		this.m.Container.add(this.new("scripts/skills/traits/optimist_trait"));
	}
});