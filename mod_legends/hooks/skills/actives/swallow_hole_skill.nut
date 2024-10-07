::mods_hookExactClass("skills/actives/swallow_whole_skill", function(o)
{
	o.onVerifyTarget = function ( _originTile, _targetTile )
	{
		local brothers = this.Tactical.Entities.getInstancesOfFaction(this.Const.Faction.Player);
		if (brothers.len() == 1)
		{
			return false;
		}

		local target = _targetTile.getEntity();
		if (target == null)
		{
			return false;
		}
		if (target.getFlags().has("IsSummoned"))
		{
			return false;
		}

		return this.skill.onVerifyTarget(_originTile, _targetTile) && _targetTile.getEntity().isPlayerControlled() && !_targetTile.getEntity().getCurrentProperties().IsImmuneToKnockBackAndGrab;
	}

	o.onUse = function ( _user, _targetTile )
	{
		local target = _targetTile.getEntity();

		if (!_user.isHiddenToPlayer() && (_targetTile.IsVisibleForPlayer || this.knockToTile.IsVisibleForPlayer))
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " devours " + this.Const.UI.getColorizedEntityName(target));
		}

		local skills = target.getSkills();
		skills.removeByID("effects.shieldwall");
		skills.removeByID("effects.spearwall");
		skills.removeByID("effects.riposte");
		skills.removeByID("effects.legend_vala_chant_disharmony_effect");
		skills.removeByID("effects.legend_vala_chant_fury_effect");
		skills.removeByID("effects.legend_vala_chant_senses_effect");
		skills.removeByID("effects.legend_vala_currently_chanting");
		skills.removeByID("effects.legend_vala_in_trance");


		if (target.getMoraleState() != this.Const.MoraleState.Ignore)
		{
			target.setMoraleState(this.Const.MoraleState.Breaking);
		}

		this.m.SwallowedEntity = target;
		this.m.SwallowedEntity.getFlags().set("Devoured", true);
		this.m.SwallowedEntity.setHitpoints(this.Math.max(5, this.m.SwallowedEntity.getHitpoints() - this.Math.rand(10, 20)));
		target.removeFromMap();
		_user.getSprite("body").setBrush("bust_ghoul_body_04");
		_user.getSprite("injury").setBrush("bust_ghoul_04_injured");
		_user.getSprite("head").setBrush("bust_ghoul_04_head_0" + _user.m.Head);
		_user.m.Sound[this.Const.Sound.ActorEvent.Death] = _user.m.Sound[this.Const.Sound.ActorEvent.Other2];
		local effect = this.new("scripts/skills/effects/swallowed_whole_effect");
		effect.setName(target.getName());
		_user.getSkills().add(effect);

		if (this.m.SoundOnHit.len() != 0)
		{
			this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, _user.getPos());
		}

		return true;
	}

});
