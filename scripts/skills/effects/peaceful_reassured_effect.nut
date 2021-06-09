this.peaceful_reassured_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.peaceful_reassured";
		this.m.Name = "Reassured";
		this.m.Icon = "skills/status_effect_90.png";
		this.m.IconMini = "status_effect_90_mini";
		this.m.Overlay = "status_effect_90";
		this.m.Type = this.Const.SkillType.StatusEffect | this.Const.SkillType.DrugEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "The presence of nearby peaceful people is increasing this characters resolve and experience gain";
	}



	function getTooltip()
	{
		// local peacefuls = this.getPeacefuls();
		// local peaceBravery = peacefuls * 3;
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] Resolve"
			},
			{
				id = 7,
				type = "hint",
				icon = "ui/icons/xp_received.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+1%[/color] Experience Gain"
			}
		];
		return ret;
	}


	// function getPeacefuls()
	// {
	// 	if (!("Entities" in this.Tactical))
	// 	{
	// 		return 0;
	// 	}
	// 	if (this.Tactical.Entities == null)
	// 	{
	// 		return 0;
	// 	}

	// 	if (!this.Tactical.isActive())
	// 	{
	// 		return 0;
	// 	}
	// 	local count = 0.0;
	// 	local hippies = 0.0;

	// 	local actors = this.Tactical.Entities.getAllInstancesAsArray();

	// 	foreach( a in actors )
	// 	{
	// 		if (a.getSkills().hasSkill("perk.legend_peaceful") )
	// 		{
	// 			hippies += 1.0;

	// 		}
	// 		count += 1.0;
	// 	}

	// 	return (count == 0) ? 0 : hippies / count;
	// }
	
	function onUpdate( _properties )
	{
		// local peacefuls = this.getPeacefuls();
		// local peaceBravery = peacefuls * 3;
		// local peaceXP = (100 + peacefuls) * 0.01; 
		_properties.Bravery += 3;
		_properties.XPGainMult *= 1.01;
	}
	

});

