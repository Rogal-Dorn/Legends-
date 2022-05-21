this.getroottable().Const.LegendMod.hookAIAgent <- function()
{
	::mods_hookBaseClass("ai/tactical/agent", function(o) {
		o = o[o.SuperName];
		o.m.PriorityTarget <- null;

		o.setPriorityTarget <- function(_entity)
		{
			this.m.PriorityTarget = _entity;
		}

		o.getPriorityTarget <- function ()
		{
			return this.m.PriorityTarget;
		}


		o.getVisibleOpponents <- function()
		{
			this.getStrategy().compileKnownOpponents();
			local knownOpponents = this.getKnownOpponents();

			local entityRet = []

			if (knownOpponents.len() == 0)
			{
				return [];
			}

			foreach( o in knownOpponents )
			{
				if (!o.Actor.isNull() && o.Actor.isAlive() && o.Actor.isPlacedOnMap() && o.Actor.get().getTile().getDistanceTo(this.getActor().getTile()) <= this.getActor().getCurrentProperties().getVision())
				{
					// this.logWarning("Tile Added: " + o.Actor.get().getTile())
					entityRet.push(o.Actor.get());
				}
			}

			return entityRet;
		}

		o.think = function( _evaluateOnly = false )
		{
			if (!this.m.Actor.isAlive() || !this.m.IsTurnStarted || this.m.IsFinished || this.Tactical.CameraDirector.isDelayed())
			{
				return;
			}

			if (this.Settings.getGameplaySettings().AlwaysFocusCamera && !this.m.Actor.isPlayerControlled() && !this.m.Actor.isHiddenToPlayer())
			{
				if (this.Tactical.getNavigator().IsTravelling)
				{
					::MSU.Popup.showRawText("prevented a rotation crash, if you see this screen, please notify the Legends team ASAP.")
				}
				else
				{
					this.Tactical.getCamera().moveToExactly(this.m.Actor);
				}
			}

			if (this.m.IsEvaluating)
			{
				if (this.Tactical.getNavigator().IsTravelling)
				{
					return;
				}

				if (this.Const.AI.PathfindingDebugMode)
				{
					this.Tactical.getNavigator().clearPath();
				}

				if (this.m.NextEvaluationTime <= this.Time.getVirtualTime())
				{
					this.evaluate(this.m.Actor);
				}
			}

			if (!_evaluateOnly && (this.isReady() || this.m.ActiveBehavior != null && this.m.ActiveBehavior.getID() == this.Const.AI.Behavior.ID.Idle && this.m.Actor.getActionPoints() == this.m.Actor.getActionPointsMax() || !this.Tactical.TurnSequenceBar.isLastEntityPlayerControlled() && this.m.ActiveBehavior != null && this.m.ActiveBehavior.getID() == this.Const.AI.Behavior.ID.Idle && !this.Tactical.getNavigator().IsTravelling && (this.Const.Tactical.Common.LastAIBehaviorID == this.Const.AI.Behavior.ID.EngageMelee || this.Const.Tactical.Common.LastAIBehaviorID == this.Const.AI.Behavior.ID.EngageRanged)))
			{
				this.m.IsEvaluating = this.execute(this.m.Actor);

				if (this.m.IsEvaluating)
				{
					this.m.ActiveBehavior = null;
				}
			}

			if (!this.m.Actor.isAlive())
			{
				this.setFinished(true);
			}
		}
	});
	delete this.Const.LegendMod.hookAIAgent;
}
