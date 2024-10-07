::mods_hookExactClass("skills/actives/drink_antidote_skill", function(o)
{
	o.onVerifyTarget = function ( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local target = _targetTile.getEntity();

		if (!this.m.Container.getActor().isAlliedWith(target))
		{
			return false;
		}

		if (target.getID() != _originTile.getEntity().getID())
		{
			if (!target.getItems().hasEmptySlot(this.Const.ItemSlot.Bag))
			{
				return false;
			}

			return true;
		}
		else
		{
			if (target.getSkills().hasSkill("effects.goblin_poison"))
			{
				return true;
			}

			if (target.getSkills().hasSkill("effects.spider_poison"))
			{
				return true;
			}

			if (target.getSkills().hasSkill("effects.legend_redback_spider_poison"))
			{
				return true;
			}

			return false;
		}
	}
});
