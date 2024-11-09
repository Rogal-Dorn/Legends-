::mods_hookExactClass("skills/racial/unhold_racial", function(o)
{
	o.onTurnStart = function ()
	{
		local actor = this.getContainer().getActor();
		local healthMissing = actor.getHitpointsMax() - actor.getHitpoints();
		local healthAdded = this.Math.min(healthMissing, this.Math.floor(actor.getHitpointsMax() * 0.15));

		if (healthAdded <= 0)
		{
			return;
		}
		if (!actor.getSkills().hasSkill("effects.spider_poison") && !actor.getSkills().hasSkill("effects.legend_redback_spider_poison") && !actor.getSkills().hasSkill("effects.legend_RSW_poison_effect"))
		{
			actor.setHitpoints(actor.getHitpoints() + healthAdded);
			actor.setDirty(true);
	
			if (!actor.isHiddenToPlayer())
			{
				this.spawnIcon("status_effect_79", actor.getTile());

				if (this.m.SoundOnUse.len() != 0)
				{
					this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.25, actor.getPos());
				}

				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " heals for " + healthAdded + " points");
			}
		}
	}
});
