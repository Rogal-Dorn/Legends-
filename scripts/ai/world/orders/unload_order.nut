this.unload_order <- this.inherit("scripts/ai/world/world_behavior", {
	m = {},
	function create()
	{
		this.world_behavior.create();
		this.m.ID = this.Const.World.AI.Behavior.ID.Unload;
	}

	function onExecute( _entity, _hasChanged )
	{
		local entities = this.World.getAllEntitiesAtPos(_entity.getPos(), 1.0);
		foreach( settlement in entities )
		{
			if (settlement.isLocation() && settlement.isEnterable())
			{
				local origin = _entity.getOrigin();
				local inv = _entity.getInventory();
				local tradegoods; 
				local value = 0; 
				if (inv != null && inv.getItems())
					{
						foreach (item in inv.getItems())
						{
							if (item.isItemType(this.Const.Items.ItemType.TradeGood))
							{
							tradegoods += item.getResourceValue();
							}
							else
							{
							
								if (item.getValue())
								{
								value += item.getValue() * 0.01;
								}
							}
							
						}
						tradegoods = this.Math.floor(tradegoods)
					}
				if (origin != null)
				{
				value = this.Math.floor(value);
				local total = value + tradegoods;
				local totalPayment = this.getResources() - total;
				
				origin.setResources(origin.getResources() + this.getResources());
				settlement.setResources(settlement.getResources() - totalPayment);
				this.logWarning("Unloading caravan with " + inv.len() + " items at " + settlement.getName() +  " who now have " + settlement.getResources() + " after paying " + this.getResources() + " to the origin town "  + origin.getName() + " who now have" + origin.getResources());			
				}
				
				if (inv.len() == 0)
				{
					_entity.clearInventory();
					break;
				}

				for (local i = 0; i < settlement.getSize(); i = ++i)
				{
					settlement.addImportedProduce(inv[this.Math.rand(0, inv.len() - 1)]);
				}
				break;
			}
		}

		this.getController().popOrder();
		return true;
	}

});

