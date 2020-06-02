this.relationship_check <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "special.relationship_check";
		this.m.Name = "Relationship Check";
		this.m.Icon = "skills/status_effect_02.png";
		this.m.IconMini = "";
		this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.Trait;
		this.m.Order = this.Const.SkillOrder.Trait + 600;
		this.m.IsActive = false;
		this.m.IsHidden = false;
		this.m.IsSerialized = false;
		this.m.IsStacking = true;
	}


	function onCombatStarted()
	{

	local actor = this.getContainer().getActor();
		local myTile = actor.getTile();
		local actors = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());

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



			local arrIndex = a.getCompanyID();

			local relation = actor.getActiveRelationshipWith(a).RelationNum;

			if (relation <= -40 )
			{
			_properties.StaminaMult *= 0.95;
			_properties.Bravery -= 5;
			_properties.RangedDefense -= 5;
			_properties.MeleeDefense -= 5;
			}
			else if (relation <= -30 )
			{
			_properties.Bravery -= 5;
			_properties.RangedDefense -= 5;
			_properties.MeleeDefense -= 5;
			}
			else if (relation <= -20 )
			{
			_properties.Bravery -= 5;
			_properties.RangedDefense -= 5;
			}
			else if (relation <= -10 )
			{
			actor.getBaseProperties().Bravery -= 5;
			}			
			else if (relation <= 0 )
			{
			}	
			else if (relation <= 10 )
			{
			}	
			else if (relation <= 20 )
			{
			_properties.Bravery += 5;
			}	
			else if (relation <= 30 )
			{
			_properties.RangedDefense += 5;
			_properties.Bravery += 5;
			}	
			else if (relation <= 40 )
			{
			_properties.MeleeDefense += 5;
			_properties.RangedDefense += 5;
			_properties.Bravery += 5;
			}	
			else if (relation <= 50 )
			{
			_properties.MeleeDefense += 5;
			_properties.RangedDefense += 5;
			_properties.Bravery += 5;
			_properties.StaminaMult *= 1.05;
			}
		}

	}


	function onMove( _properties )
	{

		local actor = this.getContainer().getActor();
		local myTile = actor.getTile();
		local actors = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());

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

			local relation = actor.getActiveRelationshipWith(a);

			if (relation <= -40 )
			{
			_properties.StaminaMult *= 0.95;
			_properties.Bravery -= 5;
			_properties.RangedDefense -= 5;
			_properties.MeleeDefense -= 5;
			}
			else if (relation <= -30 )
			{
			_properties.Bravery -= 5;
			_properties.RangedDefense -= 5;
			_properties.MeleeDefense -= 5;
			}
			else if (relation <= -20 )
			{
			_properties.Bravery -= 5;
			_properties.RangedDefense -= 5;
			}
			else if (relation <= -10 )
			{
			actor.getBaseProperties().Bravery -= 5;
			}			
			else if (relation <= 0 )
			{
			}	
			else if (relation <= 10 )
			{
			}	
			else if (relation <= 20 )
			{
			_properties.Bravery += 5;
			}	
			else if (relation <= 30 )
			{
			_properties.RangedDefense += 5;
			_properties.Bravery += 5;
			}	
			else if (relation <= 40 )
			{
			_properties.MeleeDefense += 5;
			_properties.RangedDefense += 5;
			_properties.Bravery += 5;
			}	
			else if (relation <= 50 )
			{
			_properties.MeleeDefense += 5;
			_properties.RangedDefense += 5;
			_properties.Bravery += 5;
			_properties.StaminaMult *= 1.05;
			}
		}

	}

});

