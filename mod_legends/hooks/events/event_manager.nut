::mods_hookNewObject("events/event_manager", function(o)
{
	o.create = function ()
	{
		local scriptFiles = this.IO.enumerateFiles("scripts/events/events/");

		foreach( i, scriptFile in scriptFiles )
		{
			this.m.Events.push(this.new(scriptFile));
		}

		if (this.Const.DLC.Desert)
		{
			this.addSpecialEvent("event.manhunters_origin_capture_prisoner");
		}

		this.addSpecialEvent("event.legends.retinue_brother_lost");
		this.addSpecialEvent("event.helped_caravan");
		this.m.LastEventTime = this.Time.getVirtualTimeF();
	}

	o.updateSpecialEvents = function ()
	{
		foreach( e in this.m.SpecialEvents )
		{
			if (this.getEvent(e).isValid())
			{
				if (this.canFireEvent(true, true))
				{
					this.fire(e);
				}
				else
				{
					this.Time.scheduleEvent(this.TimeUnit.Real, 4000, function ( _tag )
					{
						if (this.World.Events.canFireEvent(true, true) && this.World.Events.getEvent(e).canFire())
						{
							this.World.Events.fire(e);
						}
					}, null);
				}

				return true;
			}
		}

		  // [037]  OP_CLOSE          0      1    0    0
		return false;
	}

	o.selectEvent = function ()
	{
		// Function is a generator.
		local score = 0;
		local eventToFire;
		local isNewsReady = this.World.Statistics.isNewsReady();

		for( local i = 0; i < this.m.Events.len(); i = ++i )
		{
			if (this.m.LastEventID == this.m.Events[i].getID() && !this.m.Events[i].isSpecial())
			{
				this.m.Events[i].clear();
			}
			else
			{
				this.m.Events[i].update();
			}

			if (i % 2 == 0)
			{
				yield false;
			}

			if (this.m.Events[i].getScore() <= 0 || isNewsReady && this.m.Events[i].getScore() < 2000 || this.Time.getVirtualTimeF() - this.m.LastBattleTime < 5.0 && this.m.Events[i].getScore() < 500)
			{
			}
			else
			{
				score = score + this.m.Events[i].getScore();
			}
		}

		local pick = this.Math.rand(1, score);
		yield false;

		for( local i = 0; i < this.m.Events.len(); i = ++i )
		{
			if (this.m.Events[i].getScore() <= 0 || isNewsReady && this.m.Events[i].getScore() < 2000 || this.Time.getVirtualTimeF() - this.m.LastBattleTime < 5.0 && this.m.Events[i].getScore() < 500)
			{
			}
			else
			{
				if (pick <= this.m.Events[i].getScore())
				{
					eventToFire = this.m.Events[i];
					break;
				}

				pick = pick - this.m.Events[i].getScore();
			}
		}

		if (eventToFire == null)
		{
			this.logDebug("no event???");
			return true;
		}

		yield false;
		this.m.ActiveEvent = eventToFire;
		this.m.ActiveEvent.clear();
		this.m.ActiveEvent.update();

		if (this.m.ActiveEvent.getScore() == 0)
		{
			this.m.ActiveEvent.clear();
			this.m.ActiveEvent = null;
			return true;
		}

		if (this.m.ActiveEvent.getScore() < 500)
		{
			local parties = this.World.getAllEntitiesAtPos(this.World.State.getPlayer().getPos(), 400.0);

			foreach( party in parties )
			{
				if (!party.isAlliedWithPlayer())
				{
					this.m.ActiveEvent.clear();
					this.m.ActiveEvent = null;
					return true;
				}
			}
		}

		if (this.m.ActiveEvent.getScore() < 2000)
		{
			this.m.LastEventTime = this.Time.getVirtualTimeF();
		}

		this.m.ActiveEvent.fire();
		this.m.IsEventShown = this.World.State.showEventScreen(this.m.ActiveEvent);
		return true;
	}
});
