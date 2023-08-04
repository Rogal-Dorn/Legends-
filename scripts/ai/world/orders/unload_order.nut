this.unload_order <- this.inherit("scripts/ai/world/world_behavior", {
	m = {},
	function create()
	{
		this.world_behavior.create();
		this.m.ID = this.Const.World.AI.Behavior.ID.Unload;
	}

	function onExecute( _entity, _hasChanged )
	{
		foreach (settlement in this.World.getAllEntitiesAndOneLocationAtPos(_entity.getPos(), 1.0))
		{
			if (!settlement.isLocation() || !settlement.isLocationType(this.Const.World.LocationType.Settlement) || !settlement.isEnterable()) continue;

			// yes world economy
			if (::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
			{
				local origin = _entity.getOrigin();

				if (origin != null)
				{
					local investment = _entity.getFlags().getAsInt("CaravanInvestment");
					local shared = _entity.getFlags().getAsInt("CaravanSharedProfit");
					local profit = _entity.getFlags().getAsInt("CaravanProfit");
					local totalPayment = investment + profit;
					
					// new functions
					//origin.addResources(totalPayment);
					//settlement.addResources(shared);

					// old functions
					//origin.setResources(origin.getResources() + totalPayment);
					//settlement.setResources(settlement.getResources() - totalPayment);

					this.logWarning("Unloading caravan with " + inv.len() + " items at " + settlement.getName() + " who now have " + settlement.getResources() + " after paying " + totalPayment + " crowns to the origin town " + origin.getName() + " who now have" + origin.getResources());			
				}

				foreach( item in _entity.getStashInventory().getItems() )
				{
					settlement.addImportedProduce(item);
					this.logWarning("Moving \'" + item.getName() + "\' to " + settlement.getName() +  "\'s marketplace");
				}
			}
			// no world economy
			else
			{
				foreach( item in _entity.getInventory() )
				{
					settlement.addImportedProduce(item);
				}
			}

			_entity.clearInventory();
			break;
		}

		this.getController().popOrder();
		return true;
	}

});

