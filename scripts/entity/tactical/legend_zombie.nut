this.legend_zombie <- this.inherit("scripts/entity/tactical/enemies/zombie", {
	m = {
		Item = null
	},

	function create()
	{
		this.m.IsControlledByPlayer = true;
		this.m.IsCreatingAgent = false;
		this.zombie.create();
		this.m.AIAgent = this.new("scripts/ai/tactical/idle_agent");
		this.m.AIAgent.setActor(this);
	}

    function isGuest()
    {
        return false;
    }

	function setItem( _i )
	{
		if (typeof _i == "instance")
		{
			this.m.Item = _i;
			return 
		}

		this.m.Item = this.WeakTableRef(_i);
	}

	function setVariant( _v )
	{
		
	}

});
