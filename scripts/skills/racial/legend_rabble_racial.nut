this.legend_rabble_racial <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "racial.legend_rabble";
		this.m.Name = "Coerced";
		this.m.Description = "";
		this.m.Icon = "skills/status_effect_86.png";
		this.m.IconMini = "status_effect_86_mini";
		this.m.SoundOnUse = [];
		this.m.Type = this.Const.SkillType.Racial | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function getBandits()
	{
		local user = this.getContainer();
		local bandits = 0;
		local actors = this.Tactical.Entities.getInstancesOfFaction(_user.getFaction());
		foreach( i in actors )
		{
			foreach( a in i )
			{
				if (a.getType() == this.Const.EntityType.BanditThug || a.getType() == this.Const.EntityType.BanditPoacher || a.getType() == this.Const.EntityType.BanditMarksman || a.getType() == this.Const.EntityType.BanditRaider || a.getType() == this.Const.EntityType.BanditVeteran || a.getType() == this.Const.EntityType.BanditWarlord)
				{
					bandits += 1;

				}

			}
		}
		return bandits;
	}

	function onUpdate( _properties )
	{	
		local user = this.getContainer();
		local bandits = this.getBandits();
		local bonus = 5 * bandits;

		if (bandits >= 1)
		{
			_properties.IsAffectedByDyingAllies = false;
			_properties.IsAffectedByFleeingAllies = false;
			_properties.Bravery += bonus;
		}

		if (bandits < 1 && )
		{
			_properties.IsAffectedByDyingAllies = true;
			_properties.IsAffectedByFleeingAllies = true;
		}
	}

});

