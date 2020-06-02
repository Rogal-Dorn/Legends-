this.relationship_check <- this.inherit("scripts/skills/skill", {
	m = {
		RCMeleeDefense = 0,
		RCRangedDefense = 0,
		RCBravery = 0,
		RCStaminaMult = 1.0
	},
	function create()
	{
		this.m.ID = "special.relationship_check";
		this.m.Name = "Relationship Check";
		this.m.Icon = "skills/status_effect_01.png";
		this.m.IconMini = "";
		this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.Trait;
		this.m.Order = this.Const.SkillOrder.Trait + 600;
		this.m.IsActive = false;
		this.m.IsHidden = true;
		this.m.IsSerialized = false;
		this.m.IsStacking = true;
	}

	function resetModifiers() 
	{
		this.m.RCBravery = 0;
		this.m.RCStaminaMult = 1.0;
		this.m.RCRangedDefense = 0;
		this.m.RCMeleeDefense = 0;
	}

	function onCombatFinished()
	{
		this.m.IsHidden = true;
		local properties = actor.getBaseProperties;

		properties.Bravery -= this.m.RCBravery;
		properties.StaminaMult /= this.m.RCStaminaMult;
		properties.RangedDefense -= this.m.RCRangedDefense;
		properties.MeleeDefense -= this.m.RCMeleeDefense;
		this.resetModifiers;
	}

	function onCombatStarted()
	{
		this.m.IsHidden = false;
		local actor = this.getContainer().getActor();
		local myTile = actor.getTile();
		local actors = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());
		local properties = actor.getBaseProperties();

		foreach( a in actors )
		{
			if (a.getID() == actor.getID())
			{
				continue;
			}

			if (myTile.getDistanceTo(a.getTile()) > 1)
			{
				continue;
			}

			if (a.getFaction() != actor.getFaction())
			{
				continue;
			}



			// local arrIndex = a.getCompanyID();

			local relation = actor.getActiveRelationshipWith(a).RelationNum;
			

			if (relation <= -40 )
			{
			this.m.RCStaminaMult *= 0.95;
			this.m.RCBravery -= 5;
			this.m.RCRangedDefense -= 5;
			this.m.RCMeleeDefense -= 5;
			}
			else if (relation <= -30 )
			{
			this.m.RCBravery -= 5;
			this.m.RCRangedDefense -= 5;
			this.m.RCMeleeDefense -= 5;
			}
			else if (relation <= -20 )
			{
			this.m.RCBravery -= 5;
			this.m.RCRangedDefense -= 5;
			}
			else if (relation <= -10 )
			{
			this.m.RCBravery -= 5;
			}			
			else if (relation <= 0 )
			{
			}	
			else if (relation <= 10 )
			{
			}	
			else if (relation <= 20 )
			{
				this.logInfo("giving " + actor.getName() + " +5 bravery with " + a.getName() + " " + relation);
			this.m.RCBravery += 5;
			}	
			else if (relation <= 30 )
			{
			this.m.RCBravery += 5;
			this.m.RCRangedDefense += 5;
			}	
			else if (relation <= 40 )
			{
			this.m.RCBravery += 5;
			this.m.RCRangedDefense += 5;
			this.m.RCMeleeDefense += 5;
			}	
			else if (relation <= 50 )
			{
			this.m.RCStaminaMult *= 1.05;
			this.m.RCBravery += 5;
			this.m.RCRangedDefense += 5;
			this.m.RCMeleeDefense += 5;
			}

			properties.Bravery += this.m.RCBravery;
			properties.StaminaMult *= this.m.RCStaminaMult;
			properties.RangedDefense += this.m.RCRangedDefense;
			properties.MeleeDefense += this.m.RCMeleeDefense;
		}

	}


	function onMovementCompleted( _tile )
	{

		local actor = this.getContainer().getActor();
		local myTile = actor.getTile();
		local actors = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());
		local properties = actor.getBaseProperties();

		properties.Bravery -= this.m.RCBravery;
		properties.StaminaMult /= this.m.RCStaminaMult;
		properties.RangedDefense -= this.m.RCRangedDefense;
		properties.MeleeDefense -= this.m.RCMeleeDefense;
		this.resetModifiers();


		foreach( a in actors )
		{
			if (a.getID() == actor.getID())
			{
				continue;
			}

			if (myTile.getDistanceTo(a.getTile()) > 1)
			{
				continue;
			}

			if (a.getFaction() != actor.getFaction())
			{
				continue;
			}

			this.logInfo("checking relationship");

			local relation = actor.getActiveRelationshipWith(a).RelationNum;

			if (relation <= -40 )
			{
			this.m.RCStaminaMult *= 0.95;
			this.m.RCBravery -= 5;
			this.m.RCRangedDefense -= 5;
			this.m.RCMeleeDefense -= 5;
			}
			else if (relation <= -30 )
			{
			this.m.RCBravery -= 5;
			this.m.RCRangedDefense -= 5;
			this.m.RCMeleeDefense -= 5;
			}
			else if (relation <= -20 )
			{
			this.m.RCBravery -= 5;
			this.m.RCRangedDefense -= 5;
			}
			else if (relation <= -10 )
			{
			this.m.RCBravery -= 5;
			}			
			else if (relation <= 0 )
			{
			}	
			else if (relation <= 10 )
			{
			}	
			else if (relation <= 20 )
			{
				this.logInfo("giving " + actor.getName() + " +5 bravery with " + a.getName() + " " + relation);
			this.m.RCBravery += 5;
			}	
			else if (relation <= 30 )
			{
			this.m.RCBravery += 5;
			this.m.RCRangedDefense += 5;
			}	
			else if (relation <= 40 )
			{
			this.m.RCBravery += 5;
			this.m.RCRangedDefense += 5;
			this.m.RCMeleeDefense += 5;
			}	
			else if (relation <= 50 )
			{
			this.m.RCStaminaMult *= 1.05;
			this.m.RCBravery += 5;
			this.m.RCRangedDefense += 5;
			this.m.RCMeleeDefense += 5;
			}

			properties.Bravery += this.m.RCBravery;
			properties.StaminaMult *= this.m.RCStaminaMult;
			properties.RangedDefense += this.m.RCRangedDefense;
			properties.MeleeDefense += this.m.RCMeleeDefense;
		}

	}

});

