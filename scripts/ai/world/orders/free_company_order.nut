this.free_company_order <- this.inherit("scripts/ai/world/world_behavior", {
	m = {
		TargetSettlement = null,
		Theme = null
	},
	function setSettlement( _t )
	{
		this.m.TargetSettlement = this.WeakTableRef(_t);
	}

	function create()
	{
		this.world_behavior.create();
		this.m.ID = this.Const.World.AI.Behavior.ID.FreeCompany; //might need to change this
	}

	function onSerialize( _out )
	{
		this.world_behavior.onSerialize(_out);

		if (this.m.TargetSettlement != null && !this.m.TargetSettlement.isNull() && this.m.TargetSettlement.isAlive())
		{
			_out.writeU32(this.m.TargetSettlement.getID());
		}
		else
		{
			_out.writeU32(0);
		}
	}

	function onDeserialize( _in )
	{
		this.world_behavior.onDeserialize(_in);
		local targetSettlementID = _in.readU32();

		if (targetSettlementID != 0)
		{
			local target = this.World.getEntityByID(targetSettlementID);

			if (target != null)
			{
				this.m.TargetSettlement = this.WeakTableRef(target);
			}
		}
	}

	function onExecute( _entity, _hasChanged )
	{
		if (this.m.TargetSettlement == null || this.m.TargetSettlement.isNull() || !this.m.TargetSettlement.isAlive())
		{
			this.getController().popOrder();
			return true;
		}

		if (this.m.TargetSettlement.getTile().ID != _entity.getTile().ID)
		{
			local move = this.new("scripts/ai/world/orders/move_order");
			move.setDestination(this.m.TargetSettlement.getTile());
			this.getController().addOrderInFront(move);
			return true;
		}

		// _entity.setOrders("Hiring Troops");
		// _entity.clearTroops();
		// local r = this.Math.min(350, 150 + this.World.getTime().Days);
		// local brush = _entity.getSprite("body").getBrush().Name;
		// local r = this.World.State.getPlayer().getStrength();
		// local days = this.World.getTime().Days;
		// if (days > 100) r += 50;
		// else if (days > 75) r += 30
		// else if (days > 50) r += 10
		
		// local r = this.Math.rand(r * 0.8, r * 1.5);
		// if (days < 25) {
		// 	this.Const.World.Common.assignTroops(_entity, this.Const.World.Spawn.FreeCompanyLow, r * 0.9); 
		// }
		// else
		// {
		// 	this.Const.World.Common.assignTroops(_entity, this.Const.World.Spawn[spawntype], r); //change this to freecompany spawn later
		// }
		// _entity.getSprite("body").setBrush(brush);
        // _entity.setFaction(this.World.FactionManager.getFactionOfType(this.Const.FactionType.FreeCompany).getID())

		this.getController().popOrder();
		return true;
	}

});

