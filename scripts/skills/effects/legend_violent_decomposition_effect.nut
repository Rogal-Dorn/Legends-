this.legend_violent_decomposition_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 1
	},
	function create()
	{
		this.m.ID = "effects.legend_violent_decomposition_effect";
		this.m.Name = "Violent Decomposition";
		this.m.Icon = "skills/status_effect_78.png";
		this.m.IconMini = "status_effect_78_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = true;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This summon is set to explode in [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] turn(s).";
	}

	function getTooltip()
	{
		local ret = [
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

		return ret;
	}

	function applyDamage()
	{
		if (this.m.TurnsLeft > 0)
		{
			return;
		}

		//BLOW UP
		local actor = this.getContainer().getActor();
		local ownTile = actor.getTile();
		//this.spawnIcon("status_effect_78", actor.getTile());

		local inBlast = [];
		this.spawnAttackEffect(ownTile, this.Const.Tactical.AttackEffectThresh);
		for( local i = 5; i >= 0; i = --i )
		{
			if (!ownTile.hasNextTile(i))
			{
				continue
			}
			local tile = ownTile.getNextTile(i);

			if (!tile.IsEmpty && tile.getEntity().isAttackable() && this.Math.abs(tile.Level - ownTile.Level) <= 1)
			{
				this.attackEntity(actor, tile.getEntity());
			}
		}


		actor.kill(null, null, this.Const.FatalityType.Suicide, false);
		this.removeSelf();
	}

	function onAdded()
	{
		this.m.TurnsLeft = 1;

		if (this.m.SoundOnUse.len() != 0)
		{
			this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.25, this.getContainer().getActor().getPos());
		}
	}

	function onUpdate( _properties )
	{
	}

	function onNewRound()
	{
        --this.m.TurnsLeft;
	}

	function onTurnEnd()
	{
		this.applyDamage();
	}

	function onWaitTurn()
	{
		this.applyDamage();
	}

});
