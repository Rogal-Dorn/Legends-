this.perk_legend_zombie_bite <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_zombie_bite";
		this.m.Name = "Wiederganger Bite";	//this.Const.Strings.PerkName.LegendZombieBite;
		this.m.Description = "A vicious bite with a 15% increased chance to hit the head. Infects on legendary difficulty";	//this.Const.Strings.PerkDescription.LegendZombieBite;
		this.m.Icon = "ui/perks/misile_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.zombie_bite"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/zombie_bite"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.zombie_bite");
	}



});

