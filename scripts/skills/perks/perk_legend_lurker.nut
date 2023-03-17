//Author: WNTR Jimmy
this.perk_legend_lurker <- this.inherit("scripts/skills/skill", {
    m = {}, 

	function create()
	{
		this.m.ID = "perk.legend_lurker"; 
		this.m.Name = this.Const.Strings.PerkName.LegendLurker;
		this.m.Description = this.Const.Strings.PerkDescription.LegendLurker;
		this.m.Icon = "ui/perks/lurker.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate(_properties)
	   {
	   	local effect = new("scripts/skills/terrain/hidden_effect");
		//increase ranged skill if hidden
		if(this.getContainer().getActor().getSkills().hasSkill(effect))
		{
			if(this.getContainer().getActor().hasSkill(effect).isActive())
			{
				_properties.RangedSkill *= 1.25;
			}
		}

		// if not
		_properties.ActionPoints += 3

		local actor = this.getContainer().getActor();
		if (actor.getSkills().hasSkill("effect.smoke"))
		{
			_properties.ActionPoints += 2
		}

		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			this.m.IsHidden = true;
			return;
		}

		// lone wolfy part
		local actor = this.getContainer().getActor();
		local myTile = actor.getTile();
		// local allies = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());
		local entites = this.Const.Tactical.CombatInfo.Entities
		local isAlone = true;

		foreach( unit in entites )
		{
			if (unit.getID() == actor.getID())
			{
				continue;
			}

			if (unit.getTile().getDistanceTo(myTile) <= 2)
			{
				isAlone = false;
				break;
			}
		}

		if (isAlone)
		{
			// this.m.IsHidden = false;
			_properties.Initiative += 20;
			_properties.RangedDefenseMult *= 1.30;
			// if so
			//_properties.ActionPoints += 3
		}
		// else
		// {
		// 	this.m.IsHidden = true;
		// }
	}

	// function onCombatFinished()
	// {
	// 	this.m.IsHidden = true;
	// }

	function onAfterUpdate( _properties )
    {
       	if(this.getContainer().getActor().getSkills().hasSkill("hidden_effect")){
			if(this.getContainer().getActor().getSkills().hasSkill("hidden_effect").isActive()){
				_properties.FatigueRecoveryRate += 10; 
			}
		}
    }
   
});




