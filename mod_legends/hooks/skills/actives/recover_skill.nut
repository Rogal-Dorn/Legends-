::mods_hookExactClass("skills/actives/recover_skill", function(o)
{
	o.m.CanRecover <- true;
	o.m.AP <- 0;

	o.getTooltip = function ()
	{
		local actor = this.getContainer().getActor();
		local fatReduc = actor.getActionPoints() * 3.0;
		return = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Current Fatigue is reduced by [color=" + this.Const.UI.Color.PositiveValue + "]" + fatReduc + "%[/color] of maximum fatigue"
			}
		];
	}
	
	o.onTurnStart <- function ()
	{
		this.m.CanRecover = true;
		this.m.AP = 0;
	}
	
	o.isUsable <- function ()
	{
		return this.skill.isUsable() && this.m.CanRecover;
	}
	
	o.getActionPointCost <- function ()
	{
		local actor = this.getContainer().getActor();
		return actor.getActionPoints();
	}
	
	o.onBeforeUse <- function ( _user, _targetTile )
	{
		this.m.AP = _user.getActionPoints();
	}

	o.onUse = function ( _user, _targetTile )
	{
		local actor = this.getContainer().getActor();
		local fatMult = this.m.AP * 0.055;

		_user.setFatigue(_user.getFatigue() - fatMult * _user.getFatigueMax() );
		
		if (!_user.isHiddenToPlayer())
		{
			_user.playSound(this.Const.Sound.ActorEvent.Fatigue, this.Const.Sound.Volume.Actor * _user.getSoundVolume(this.Const.Sound.ActorEvent.Fatigue));
		}

		return true;
	}
});
