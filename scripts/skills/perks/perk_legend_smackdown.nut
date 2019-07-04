this.perk_legend_smackdown <- this.inherit("scripts/skills/skill", {
	m = {
		TilesUsed = []
	},
	function create()
	{
		this.m.ID = "perk.legend_smackdown";
		this.m.Name = this.Const.Strings.PerkName.LegendSmackdown;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSmackdown;
		this.m.Icon = "ui/perks/smackdown_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function findTileToKnockBackTo( _userTile, _targetTile )
	{

		if (_targetTile == null)
		{
			return null;
		}

		if (_userTile == null)
		{
			return null;
		}

		local dir = _userTile.getDirectionTo(_targetTile);

		if (_targetTile.hasNextTile(dir))
		{
			local knockToTile = _targetTile.getNextTile(dir);

			if (knockToTile.IsEmpty && knockToTile.Level - _targetTile.Level <= 1 && this.m.TilesUsed.find(knockToTile.ID) == null)
			{
				return knockToTile;
			}
		}

		local altdir = dir - 1 >= 0 ? dir - 1 : 5;

		if (_targetTile.hasNextTile(altdir))
		{
			local knockToTile = _targetTile.getNextTile(altdir);

			if (knockToTile.IsEmpty && knockToTile.Level - _targetTile.Level <= 1 && this.m.TilesUsed.find(knockToTile.ID) == null)
			{
				return knockToTile;
			}
		}

		altdir = dir + 1 <= 5 ? dir + 1 : 0;

		if (_targetTile.hasNextTile(altdir))
		{
			local knockToTile = _targetTile.getNextTile(altdir);

			if (knockToTile.IsEmpty && knockToTile.Level - _targetTile.Level <= 1  && this.m.TilesUsed.find(knockToTile.ID) == null)
			{
				return knockToTile;
			}
		}

		return null;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		this.m.TilesUsed = [];
		if (_targetEntity.getCurrentProperties().IsImmuneToKnockBackAndGrab)
		{
			return false;
		}

		local user = _skill.getContainer().getActor();
		local ourHP =  user.getHitpoints();
		local targetHP = _targetEntity.getHitpoints()
		local ourFat =  user.getFatigue();
		local targetFat = _targetEntity.getFatigue()

		if (ourHP <= targetHP)
		{
			return false;
		}

		if (ourFat <= targetFat)
		{
			return false;
		}

		if (_targetEntity.isNonCombatant() || _targetEntity.getCurrentProperties().IsImmuneToKnockBackAndGrab)
		{
			return false;
		}
		
		if (knockToTile == null)
		{
			return false;
		}

		if (!_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return false;
		}
		
		local knockToTile = this.findTileToKnockBackTo(user.getTile(), _targetEntity.getTile());

		if (knockToTile == null)
		{
			return false;
		}

		this.m.TilesUsed.push(knockToTile.ID);

		if (!user.isHiddenToPlayer() && (_targetEntity.getTile().IsVisibleForPlayer || knockToTile.IsVisibleForPlayer))
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " has knocked back " + this.Const.UI.getColorizedEntityName(_targetEntity));
		}

		local skills = _targetEntity.getSkills();
		skills.removeByID("effects.shieldwall");
		skills.removeByID("effects.spearwall");
		skills.removeByID("effects.riposte");

		_targetEntity.setCurrentMovementType(this.Const.Tactical.MovementType.Involuntary);
		local damage = this.Math.max(0, this.Math.abs(knockToTile.Level - _targetTile.Level) - 1) * this.Const.Combat.FallingDamage;
		if (damage == 0)
			{
			this.Tactical.getNavigator().teleport(_targetEntity, knockToTile, null, null, true);
			}
		else
			{
			local p = user.getCurrentProperties();
			local tag = {
				Attacker = user,
				Skill = _skill,
				HitInfo = clone this.Const.Tactical.HitInfo
			};
			tag.HitInfo.DamageRegular = damage;
			tag.HitInfo.DamageDirect = 1.0;
			tag.HitInfo.BodyPart = this.Const.BodyPart.Body;
			tag.HitInfo.BodyDamageMult = 1.0;
			tag.HitInfo.FatalityChanceMult = 1.0;
			this.Tactical.getNavigator().teleport(_targetEntity, knockToTile, this.onKnockedDown, tag, true);
			}

		this.m.TilesUsed = [];
		return true;
		
	}


});

