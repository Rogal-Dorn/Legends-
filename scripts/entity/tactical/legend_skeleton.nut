this.legend_skeleton <- this.inherit("scripts/entity/tactical/skeleton", {
	m = {
		Item = null
	},

	function create()
	{
		this.m.IsControlledByPlayer = true;
		this.m.Type = this.Const.EntityType.SkeletonLight;
		this.skeleton.create();
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
