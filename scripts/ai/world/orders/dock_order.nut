this.dock_order <- this.inherit("scripts/ai/world/world_behavior", {
	m = {},
	function create()
	{
		this.world_behavior.create();
		this.m.ID = this.Const.World.AI.Behavior.ID.Dock;
	}

	function onExecute( _entity, _hasChanged )
	{
		local entities = this.World.getAllEntitiesAtPos(_entity.getPos(), 1.0);

		foreach( loc in entities )
		{
			if (!loc.isLocation())
			{
				continue;
			}

			this.logInfo("Undock location = " + loc.getName())

			if (!loc.isUsable())
			{
				continue;
			}

			local settlement = loc.getSettlement();
			if (settlement == null)
			{
				this.logInfo("settlement is null??")
				continue;
			}

			this.logInfo("Adding resources from dock order " + _entity.getResources())
			settlement.setResources(settlement.getResources() + _entity.getResources());

			foreach( item in _entity.getInventory() )
			{
				settlement.addImportedProduce(item);
			}
			_entity.clearInventory();
			break;
		}

		this.getController().popOrder();
		return true;
	}

});

