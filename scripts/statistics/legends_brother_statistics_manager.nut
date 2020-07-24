this.legends_brother_statistics_manager <- {
    m = {
        ActorInteractions = null,
        IDToRef = array(27, -1)
    },
    
    function create()
    {
        this.m.IDToRef <- array(27);
        this.m.ActorInteractions <- array(27); //suposedly this is how u do 2d arrays in squirrel, code from https://forums.electricimp.com/t/2d-array/2788 
        foreach (subarr in this.m.ActorInteractions)
        {
            subarr = array(27);
        }
    }

    function addNewActorID( _actor )
	{
		for ( local i = 0; i < 27; i++ )
		{
			if (this.m.IDToRef[i] == -1)
			{
				this.m.IDToRef[i] = this.WeakTableRef(_actor);
				return i;
			}
		}
	}

    function removeActorID( _id )
	{
		this.m.IDToRef[_id] = -1;
	}

    function idExists( _id )
    {
        return !(this.m.IDToRef[_id] == -1);
    }

    function getRefFromID( _id )
	{
		if (_id == -1) return null;

		if (_id > this.m.IDToRef.len() - 1) return null;

		local val = this.m.IDToRef[_id];
		if (val == -1) {
			return null
		}
		return val;
	}

    // function createInteractionTable()
    // {
    //     local table <- {
    //         BattlesTogether = 0
    //     };
    //     return table;
    // }

    function addInteraction( _id ) 
    {  
        local DefaultInteraction <- {
            BattlesTogether = 0
        };
        //goes across and adds new tables -> i.e. addInteraction(3) adds [0][2], [1][2] -> [2][3], [2][4], ... [2][n], assuming the id exists
        for (local i = 0; i < _id - 1; ++i) 
        {
            if (idExists(i))
            {
                this.m.ActorInteractions[_id - 1][i] = clone DefaultInteraction;   
            }
            
        }
        for (local i = _id; i < 27; ++i)
        {
            if (idExists(i))
            {
                this.m.ActorInteractions[i][_id - 1] = clone DefaultInteraction;
            }
        }
    }

    function removeInteraction( _id )
    {
        for (local i = 0; i < 27; ++i) //clear's the column & row of ID
        {
            this.m.ActorInteractions[i][_id - 1] = null; 
            this.m.ActorInteractions[_id - 1][i] = null; 
        }

        // alternate way of doing it the one above just kinda looks slick
        // for (local i = 0; i < _id - 1; ++i) 
        // {
        //     if (idExists(i))
        //     {
        //         this.m.ActorInteractions[_id - 1][i] = null;   
        //     }
            
        // }
        // for (local i = _id; i < 27; ++i)
        // {
        //     if (idExists(i))
        //     {
        //         this.m.ActorInteractions[i][_id - 1] = null;
        //     }
        // }
    }

    function getInteractionsBetween( _id1, _id2 )
    {
        return ( _id1 < _id2 ? this.m.RelationshipArray[_id1][_id2] : this.m.RelationshipArray[_id2][_id1] )
    }

    function onDeserialize( _in )
    {
        //lazy todo
    }
    
    function onSerialize( _out )
    {
        //lazy todo
    }
};