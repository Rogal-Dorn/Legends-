::mods_hookExactClass("skills/perks/perk_relentless", function(o) {
	o.m.TilesUsed <- [];

	local ws_create = o.create;
	o.create = function ()
	{
		ws_create();
		this.m.SoundOnUse = [
			"sounds/combat/bash_01.wav",
			"sounds/combat/bash_02.wav",
			"sounds/combat/bash_03.wav"
		];
		this.m.SoundOnHitHitpoints = [
			"sounds/combat/bash_hit_01.wav",
			"sounds/combat/bash_hit_02.wav",
			"sounds/combat/bash_hit_03.wav"
		];
	}

	o.onTargetHit <- function( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		this.m.TilesUsed = [];
		if (!_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return false;
		}
		
		if (_targetEntity.getCurrentProperties().IsImmuneToStun)
		{
			return false;
		}

		if (_targetEntity.isNonCombatant())
		{
			return false;
		}

		local user = this.getContainer().getActor();
		local ourInit =  user.getInitiative();
		local targetInit = _targetEntity.getInitiative()


		if (ourInit <= targetInit)
		{
			return false;
		}


		if ( this.Math.rand(1, 100) > 50)
		{
			return false;
		}
		
		if (!_targetEntity.getSkills().hasSkill("effects.stunned"))
		{
			_targetEntity.getSkills().add(this.new("scripts/skills/effects/legend_baffled_effect"));

			if (!user.isHiddenToPlayer() && _targetEntity.getTile().IsVisibleForPlayer)
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " battered " + this.Const.UI.getColorizedEntityName(_targetEntity) + " leaving them baffled");
			}
		}

		return true;
		
	}
});