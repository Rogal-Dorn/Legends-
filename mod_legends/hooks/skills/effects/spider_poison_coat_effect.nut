::mods_hookExactClass("skills/effects/spider_poison_coat_effect", function(o) {
	
	o.resetTime = function ()
	{
		if (this.getContainer().getActor().isPlacedOnMap())
		{
			this.spawnIcon("status_effect_88", this.getContainer().getActor().getTile());
		}

		this.m.AttacksLeft = 4;
	}

	o.onTargetHit = function ( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		--this.m.AttacksLeft;

		if (this.m.AttacksLeft <= 0)
		{
			this.removeSelf();
		}

		if (!_targetEntity.isAlive())
		{
			return;
		}

		if (_targetEntity.getCurrentProperties().IsImmuneToPoison || _damageInflictedHitpoints < this.Const.Combat.PoisonEffectMinDamage || _targetEntity.getHitpoints() <= 0)
		{
			return;
		}

		if (_targetEntity.getFlags().has("undead"))
		{
			return;
		}

		if (!_targetEntity.isHiddenToPlayer())
		{
			if (this.m.SoundOnUse.len() != 0)
			{
				this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.5, _targetEntity.getPos());
			}

			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_targetEntity) + " is poisoned");
		}

		local effect = this.new("scripts/skills/effects/spider_poison_effect");
		local actor = this.getContainer().getActor()
		if (actor.getFaction() == this.Const.Faction.Player )
		{
			effect.setActor(actor);
		}
		
		effect.setDamage(10);
		_targetEntity.getSkills().add(effect);
	}
});