this.legend_knockback_prepared_effect<- this.inherit("scripts/skills/skill", {
	m = {
		AttacksLeft = 1
	},
	function create()
	{
		this.m.ID = "effects.legend_knockback_prepared";
		this.m.Name = "Prepared to inflict a knockback";
		this.m.Icon = "skills/status_effect_66.png";
		this.m.IconMini = "status_effect_66_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character is preparing an attack to inflict strong blow that pushes the target back if it deals damage.";
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
	}

	function resetTime()
	{
		if (this.getContainer().getActor().isPlacedOnMap())
		{
			this.spawnIcon("status_effect_54", this.getContainer().getActor().getTile());
		}

		this.m.AttacksLeft = 1;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		--this.m.AttacksLeft;

		if (this.m.AttacksLeft <= 0)
		{
			this.removeSelf();
		}

		if (!_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return;
		}

		local user = this.getContainer().getActor();
		local targetTile = _targetEntity.getTile();

		if (targetTile == null)
		{
			return;
		}

		local knockToTile = this.findTileToKnockBackTo(user.getTile(), targetTile);

		if (knockToTile == null)
		{
			return;
		}

		this.applyFatigueDamage(_targetEntity, 10);

		if (_targetEntity.getCurrentProperties().IsImmuneToKnockBackAndGrab)
		{
			return;
		}

		if (!user.isHiddenToPlayer() && (targetTile.IsVisibleForPlayer || knockToTile.IsVisibleForPlayer))
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " has knocked back " + this.Const.UI.getColorizedEntityName(_targetEntity));
		}

		local skills = _targetEntity.getSkills();
		skills.removeByID("effects.shieldwall");
		skills.removeByID("effects.spearwall");
		skills.removeByID("effects.riposte");

		if (this.m.SoundOnHit.len() != 0)
		{
			this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, user.getPos());
		}

		_targetEntity.setCurrentMovementType(this.Const.Tactical.MovementType.Involuntary);
		local hasShieldBash = user.getSkills().hasSkill("perk.shield_bash");
		local damage = this.Math.max(0, this.Math.abs(knockToTile.Level - targetTile.Level) - 1) * this.Const.Combat.FallingDamage;

		if (damage == 0 && !hasShieldBash)
		{
			this.Tactical.getNavigator().teleport(_targetEntity, knockToTile, null, null, true);
		}
		else
		{
			local p = this.getContainer().getActor().getCurrentProperties();
			local tag = {
				Attacker = user,
				Skill = this,
				HitInfo = clone this.Const.Tactical.HitInfo,
				HitInfoBash = null
			};
			tag.HitInfo.DamageRegular = damage;
			tag.HitInfo.DamageFatigue = this.Const.Combat.FatigueReceivedPerHit;
			tag.HitInfo.DamageDirect = 1.0;
			tag.HitInfo.BodyPart = this.Const.BodyPart.Body;
			tag.HitInfo.BodyDamageMult = 1.0;
			tag.HitInfo.FatalityChanceMult = 1.0;

			if (hasShieldBash)
			{
				local p = this.getContainer().getActor().getCurrentProperties();
				local bodyHealth = this.getContainer().getActor().getHitpointsMax();
				local damagemin = this.Math.abs(10 * p.DamageTotalMult);
				local damagemax = this.Math.abs(25 * p.DamageTotalMult);

				if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_muscularity"))
				{
					local muscularity = this.Math.floor(bodyHealth * 0.1);
					damagemax += muscularity;
				}

				damage = damage + this.Math.rand(damagemin, damagemax);
				tag.HitInfoBash = clone this.Const.Tactical.HitInfo;
				tag.HitInfoBash.DamageRegular = damage * p.DamageRegularMult;
				tag.HitInfoBash.DamageArmor = this.Math.floor(damage * 0.5);
				tag.HitInfoBash.DamageFatigue = 10;
				tag.HitInfoBash.BodyPart = this.Const.BodyPart.Body;
				tag.HitInfoBash.BodyDamageMult = 1.0;
				tag.HitInfoBash.FatalityChanceMult = 0.0;
			}

			this.Tactical.getNavigator().teleport(_targetEntity, knockToTile, this.onKnockedDown, tag, true);
		}
	}

	function onTargetMissed( _skill, _targetEntity )
	{
		--this.m.AttacksLeft;

		if (this.m.AttacksLeft <= 0)
		{
			this.removeSelf();
		}
	}

	function findTileToKnockBackTo( _userTile, _targetTile )
	{
		local dir = _userTile.getDirectionTo(_targetTile);

		if (_targetTile.hasNextTile(dir))
		{
			local knockToTile = _targetTile.getNextTile(dir);

			if (knockToTile.IsEmpty && knockToTile.Level - _targetTile.Level <= 1)
			{
				return knockToTile;
			}
		}

		local altdir = dir - 1 >= 0 ? dir - 1 : 5;

		if (_targetTile.hasNextTile(altdir))
		{
			local knockToTile = _targetTile.getNextTile(altdir);

			if (knockToTile.IsEmpty && knockToTile.Level - _targetTile.Level <= 1)
			{
				return knockToTile;
			}
		}

		altdir = dir + 1 <= 5 ? dir + 1 : 0;

		if (_targetTile.hasNextTile(altdir))
		{
			local knockToTile = _targetTile.getNextTile(altdir);

			if (knockToTile.IsEmpty && knockToTile.Level - _targetTile.Level <= 1)
			{
				return knockToTile;
			}
		}

		return null;
	}

});

