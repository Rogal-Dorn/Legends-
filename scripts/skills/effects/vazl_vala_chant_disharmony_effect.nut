this.vazl_vala_chant_disharmony_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.vazl_vala_chant_disharmony_effect";
		this.m.Name = "Disharmony";
		this.m.Icon = "skills/status_effect_87.png";
		this.m.IconMini = "status_effect_87_mini";
		this.m.Overlay = "status_effect_87";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
//		this.m.IsRemovedAfterBattle = true;
	}


	function isHidden()
	{
		local AllBrothers = this.World.getPlayerRoster().getAll();
		local ValaTile = null;		

		foreach (bro in AllBrothers)
		{
			if (bro.isAlive() && bro.isPlacedOnMap() && bro.getBackground().getID() == "background.vazl_vala")
			{
				ValaTile = bro.getTile();
			}
		}

		if (ValaTile != null)
		{
			if (ValaTile.getDistanceTo(this.getContainer().getActor().getTile()) <= 2)
			{
				return false;
			}
			else
			{
				return true;
			}
		}
		else
		{
			return true;
		}
	}


	function getTooltip()
	{
		if (!this.isHidden())
		{
			return [
				{
					id = 1,
					type = "title",
					text = this.getName()
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Unable to enforce Zone of Control"
				}
			];
		}
		else
		{
			return;
		}
	}


	function onUpdate( _properties )
	{
	}


	function onCombatFinished()
	{
		this.removeSelf();
	}
});
