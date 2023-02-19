//Author: WNTR Jimmy
this.perk_legend_night_raider <- this.inherit("scripts/skills/skill", {
    m = {}, 

	function create()
	{
		this.m.ID = "perk.legend_night_raider"; 
		this.m.Name = this.Const.Strings.PerkName.LegendNightRaider;
		this.m.Description = this.Const.Strings.PerkDescription.LegendNightRaider;
		this.m.Icon = "night_raider";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

    function onUpdate(_properties)
    {
	    local effect = new("scripts/skills/effects/night_effect");
	    if(this.getContainer().getActor().hasSkill(effect)){
		this.getSkills().hasSkill(effect).IsAffectedByNight == false;
		_properties.Threat += 10;
		_properties.Vision += 1;
		_properties.MeleeSkill *= 1.10;
		_properties.RangedSkill *= 1.10;
	}
}); 
