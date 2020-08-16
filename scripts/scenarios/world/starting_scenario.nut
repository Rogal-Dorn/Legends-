this.starting_scenario <- {
	m = {
		ID = "",
		Name = "",
		Description = "",
		Difficulty = 1,
		Order = 0,
		IsFixedLook = false,
		StashModifier = 0,
		StaticRelationsToFaction = array(this.Const.FactionType.len(), false) 	//Something defined here won't have relations normalized over time in faction_manager
										//I think this would be better if we instead automatically set the size to be
	}									//equal to length of factiontypes and then we can skip if len() > 0 in
										//faction_manager's update()
	function isFixedLook()				//Useful for when you set the relations and want them to be permanent e.g. legion scenario
	{
		return this.m.IsFixedLook;
	}

	function isDroppedAsLoot( _item )
	{
		return false;
	}

	function getID()
	{
		return this.m.ID;
	}

	function getName()
	{
		return this.m.Name;
	}

	function getDescription()
	{
		return this.m.Description;
	}

	function getDifficulty()
	{
		return this.m.Difficulty;
	}

	function getDifficultyForUI()
	{
		switch(this.m.Difficulty)
		{
		case 1:
			return "difficulty_easy";

		case 2:
			return "difficulty_medium";

		case 3:
			return "difficulty_hard";
		}

		return "difficulty_unknown";
	}

	function getOrder()
	{
		return this.m.Order;
	}

	function getStaticRelations()
	{
		return this.m.StaticRelationsToFaction;
	}

	function getStashModifier()
	{
		return this.m.StashModifier;
	}

	function isValid()
	{
		return true;
	}

	function onSpawnAssets()
	{
	}

	function onSpawnPlayer()
	{
	}

	function onInit()
	{
		this.m.StaticRelationsToFaction.resize(this.Const.FactionType.len());
		if (this.World.State.getPlayer() != null)
		{
			this.World.State.getPlayer().calculateModifiers();
		}

	}

	function onUpdateHiringRoster( _roster )
	{
	}

	function onUpdateDraftList( _list, _gender)
	{
	}

	function onUpdateStablesList( _list )
	{
	}

	function onHiredByScenario( bro )
	{
	}

	function onBuildPerkTree( _tree)
	{
	}

	function onCombatFinished()
	{
		return true;
	}

};

