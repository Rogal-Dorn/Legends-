this.legend_frenemies <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.frenemies";
		this.m.Name = "Relationships";
		this.m.Icon = "ui/traits/trait_relationships.png";
	}

	function relationStringHelper( _name, _relTab )
	{
		local relNum = _relTab.RelationNum;
		local returnString = "";
		returnString += _name + " relation gives: ";
		if ( relNum <= -10 )
		{
			returnString += "-5 Resolve";
		}
		if ( relNum <= -20 )
		{
			returnString += ", -5 Ranged Defense";
		}
		if ( relNum <= -30 )
		{
			returnString += ", -5 Melee Defense";
		}
		if ( relNum > -10 && relNum <= 10)
		{
			returnString += "No Bonuses"
		}
		if ( relNum > 10 )
		{
			returnString += "+5 Resolve";
		}
		if ( relNum > 20 )
		{
			returnString += ", +5 Ranged Defense";
		}
		if ( relNum > 30 )
		{
			returnString += ", +5 Melee Defense";
		}
		returnString += ".\n";
		return returnString;
	}

	function getCombatTooltip()
	{
		local actor = this.getContainer().getActor();
		local targetTile = actor.getTile();
		local returnString = "";

			for (local i = 0; i != 6; ++i)
			{
				if (!targetTile.hasNextTile(i)) {}
				else
				{
					local tile = targetTile.getNextTile(i);
					if (tile.IsOccupiedByActor && tile.getEntity().getMoraleState() != this.Const.MoraleState.Fleeing)
					{
						
						if (tile.getEntity().getFaction() == this.Const.Faction.Player)
						{
							if (tile.getEntity().getCompanyID() == -1)
							{
								continue;
							}
							local relTab = this.World.State.getRefFromID(actor.getCompanyID()).getActiveRelationshipWith(tile.getEntity());
							//local relNum = relTab.RelationNum;
							returnString += relationStringHelper(tile.getEntity().getName(), relTab);
						}
						
					}
				}
			}

			if (returnString == "") 
			{
				returnString = "No Bonuses"
			}

			return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = returnString + "\n" + this.getContainer().getActor().getActiveRelationshipsTraitText()
			}
		];
	}

	function checkPosition ( _roster, _actor, _position )
	{
		foreach (bro in _roster)
		{
			if (bro.getPlaceInFormation() == _position)
			{
				return relationStringHelper(bro.getName(), this.World.State.getRefFromID(_actor.getCompanyID()).getActiveRelationshipWith(bro));
			}
		}
		return ""; //Will get tooltip reading similar to NULL(0x000000) etc without this because it'll return null but it puts that into the retString 
	}

	function getNormalTooltip()
	{
		local actor = this.getContainer().getActor();
		local position = actor.getPlaceInFormation();
		local roster = this.World.getPlayerRoster().getAll();
		local returnString = "";

		if (position <= 8) //check only down (+9) 
		{
			if (position != 0) //don't check to left (-1) if pos = 0
			{
				returnString += checkPosition(roster, actor, position - 1);
			}
			if (position != 8) //don't check to right (+1) if pos = 8
			{
				returnString += checkPosition(roster, actor, position + 1);
			}
			returnString += checkPosition(roster, actor, position + 9);
		}
		else if (position <= 17) //check up and down (-+9)
		{
			if (position != 9) //don't check to left (-1)
			{
				returnString += checkPosition(roster, actor, position - 1);
			}
			if (position != 17) //don't check to right (+1)
			{
				returnString += checkPosition(roster, actor, position + 1);
			}
			returnString += checkPosition(roster, actor, position - 9);
			returnString += checkPosition(roster, actor, position + 9);
		}	
		else //position <= 26 : check only up (-9)
		{
			if (position != 18) //don't check left (-1)
			{
				returnString += checkPosition(roster, actor, position - 1);
			}
			if (position != 26) //don't check right (+1)
			{
				returnString += checkPosition(roster, actor, position + 1);
			}
			returnString += checkPosition(roster, actor, position - 9);
		}

		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = returnString + "\n" + this.getContainer().getActor().getActiveRelationshipsTraitText()
			}
		];
	}

	function getTooltip()
	{
		if (("State" in this.Tactical) && this.Tactical.State != null)
		{
			return getCombatTooltip();
		}
		else
		{
			return getNormalTooltip();
		}
		// return [
		// 	{
		// 		id = 1,
		// 		type = "title",
		// 		text = this.getName()
		// 	},
		// 	{
		// 		id = 2,
		// 		type = "description",
		// 		text = this.getContainer().getActor().getActiveRelationshipsTraitText()
		// 	}
		// ];
	}

	function getBonus( _bro )
	{

	}

	function onUpdate( _properties )
	{

		if (this.getContainer().getActor().getPlaceInFormation())
		{
			local spot = this.getContainer().getActor().getPlaceInFormation();
			foreach ( b in this.World.getPlayerRoster().getAll() )
			{
				switch (b.getPlaceInFormation())
				{
					case spot - 1:
					case spot + 1:
					case spot + 7:
					case spot + 8:
					case spot - 6:
					case spot - 7:				
					this.getBonus( b )

					break;
				}
			}
		}
	}

});

