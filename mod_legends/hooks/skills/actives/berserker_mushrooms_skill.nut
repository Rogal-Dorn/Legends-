::mods_hookExactClass("skills/actives/berserker_mushrooms_skill", function(o)
{
	o.onUse = function( _user, _targetTile )
	{
		local user = _targetTile.getEntity();

		if (_user.getID() == user.getID())
		{
			local shrooms = user.getSkills().getSkillByID("effects.berserker_mushrooms");

			if (shrooms != null)
			{
				shrooms.resetTime();
			}
			else
			{
				user.getSkills().add(this.new("scripts/skills/effects/berserker_mushrooms_effect"));
			}

			if (!_user.isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " eats  Strange Mushrooms");
			}

			if (this.m.Item != null && !this.m.Item.isNull())
			{
				this.m.Item.removeSelf();
			}

			this.Const.Tactical.Common.checkDrugEffect(user);
		}
		else
		{
			if (!_user.isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " gives Strange Mushrooms to " + this.Const.UI.getColorizedEntityName(user));
			}

			this.spawnIcon("status_effect_67", _targetTile);
			this.Sound.play("sounds/cloth_01.wav", this.Const.Sound.Volume.Inventory);
			local item = this.m.Item.get();
			_user.getItems().removeFromBag(item);
			user.getItems().addToBag(item);
		}

		return true;
	}
});
