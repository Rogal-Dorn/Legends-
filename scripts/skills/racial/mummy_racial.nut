this.mummy_racial <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "racial.mummy";
		this.m.Name = "Resistant to Ranged Attacks";
		this.m.Description = "";
		this.m.Icon = "";
		this.m.Type = this.Const.SkillType.Racial | this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_skill == null)
		{
			return;
		}

		if (_skill.getID() == "actives.aimed_shot" || _skill.getID() == "actives.quick_shot"  || _skill.getID() == "actives.legend_cascade"  || _skill.getID() == "actives.legend_siphon_skill")
		{
			_properties.DamageReceivedRegularMult *= 0.2;
		}
		else if (_skill.getID() == "actives.shoot_bolt" || _skill.getID() == "actives.shoot_stake" || _skill.getID() == "actives.sling_stone" || _skill.getID() == "actives.legend_piercing_shot" || _skill.getID() == "actives.fire_handgonne")
		{
			_properties.DamageReceivedRegularMult *= 0.66;
		}
		else if (_skill.getID() == "actives.throw_javelin" || _skill.getID() == "actives.legend_magic_missile" || _skill.getID() == "actives.ignite_firelance")
		{
			_properties.DamageReceivedRegularMult *= 0.5;
		}
		else if (_skill.getID() == "actives.puncture" || _skill.getID() == "actives.thrust" || _skill.getID() == "actives.stab" || _skill.getID() == "actives.deathblow" || _skill.getID() == "actives.impale" || _skill.getID() == "actives.rupture" || _skill.getID() == "actives.prong" || _skill.getID() == "actives.lunge")
		{
			_properties.DamageReceivedRegularMult *= 0.75;
		}

		 if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			_properties.DamageReceivedRegularMult *= 0.75;
		}

	}

	
	function onDeath()
	{
	
		local user = this.getContainer();
		local myTile = user.getTile();
		local actors = this.Tactical.Entities.getAllInstances();
		
		local actors = this.Tactical.Entities.getInstancesOfFaction(_user.getFaction());
		
		foreach( a in actors )
		{
			if (a.getID() == user.getID())
			{
				continue;
			}

			if (myTile.getDistanceTo(a.getTile()) > 2)
			{
				continue;
			}

			if (a.getFaction() == user.getFaction())
			{
				continue;
			}
	
			a.getSkills().add(this.new("scripts/skills/effects/mummy_curse_effect"));
		
			
		}	
		
		
		this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.Skill);
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 30, this.teleport.bindenv(this), null);
	}	

});

