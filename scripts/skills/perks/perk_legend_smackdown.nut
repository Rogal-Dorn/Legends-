this.perk_legend_smackdown <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_smackdown";
		this.m.Name = this.Const.Strings.PerkName.LegendSmackDown;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSmackDown;
		this.m.Icon = "ui/perks/smackdown_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{

		local user = _skill.getContainer().getActor();
		local ourHP =  user.getHitpoints();
		local targetHP = _targetEntity.getHitpoints()
		local ourFat =  user.getFatigue();
		local targetFat = _targetEntity.getFatigue()

		if(ourHP > targetHP && ourFat > targetFat)
		{
			local knockToTile = this.findTileToKnockBackTo(user.getTile(), _targetEntity.getTile());

			if (knockToTile == null)
			{
				return false;
			}

			if (_targetEntity.getCurrentProperties().IsImmuneToKnockBackAndGrab)
			{
				return false;
			}

			if (!_user.isHiddenToPlayer() && (_targetTile.IsVisibleForPlayer || knockToTile.IsVisibleForPlayer))
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " has knocked back " + this.Const.UI.getColorizedEntityName(_targetEntity));
			}

			local skills = _targetEntity.getSkills();
			skills.removeByID("effects.shieldwall");
			skills.removeByID("effects.spearwall");
			skills.removeByID("effects.riposte");

			_targetEntity.setCurrentMovementType(this.Const.Tactical.MovementType.Involuntary);

			this.Tactical.getNavigator().teleport(_targetEntity, knockToTile, this.onKnockedDown, tag, true);
		

			return true;
		}
	}


});

