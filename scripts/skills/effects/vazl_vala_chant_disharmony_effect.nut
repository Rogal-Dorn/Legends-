this.vazl_vala_chant_disharmony_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Vala = null
	},
	function setVala(_c)
	{
		if (typeof _c == "instance")
		{
			this.m.Vala = _c;
		}
		else
		{
			this.m.Vala = this.WeakTableRef(_c);
		}
	}


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
	}


	function isHidden()
	{
		if (this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile()) <= 2)
		{
			return false;
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
					text = "Unable to enforce Zone of Control."
				}
			];
		}
		else
		{
			return;
		}
	}


	function onMovementCompleted()
	{
		if (this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile()) <= 2)
		{
			this.getContainer().getActor().m.IsUsingZoneOfControl = false;
		}
		else
		{
			this.getContainer().getActor().m.IsUsingZoneOfControl = true;
		}
	}


	function onUpdate( _properties )
	{
		if (this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile()) <= 2)
		{
			this.getContainer().getActor().m.IsUsingZoneOfControl = false;
		}
		else
		{
			this.getContainer().getActor().m.IsUsingZoneOfControl = true;
		}
	}


	function onRemoved()
	{
		this.getContainer().getActor().m.IsUsingZoneOfControl = true;
	}


	function onDeath()
	{
		this.getContainer().getActor().m.IsUsingZoneOfControl = true;
	}


	function onCombatFinished()
	{
		this.removeSelf();
	}
});
