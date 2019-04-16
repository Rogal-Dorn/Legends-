this.legend_vala_chant_disharmony_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Vala = null,
		Range = 1
	},
	function setVala(_v)
	{
		if (typeof _v == "instance")
		{
			this.m.Vala = _v;
		}
		else
		{
			this.m.Vala = this.WeakTableRef(_v);
		}
	}


	function create()
	{
		this.m.ID = "effects.legend_vala_chant_disharmony_effect";
		this.m.Name = "";
		this.m.Icon = "";
		this.m.IconMini = "";
		this.m.Overlay = "";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}


	function isHidden()
	{
		if (this.inRange())
		{
			this.m.Name = "Disharmony";
			this.m.Icon = "skills/status_effect_65.png";
			this.m.IconMini = "status_effect_65_mini";
			this.m.Overlay = "status_effect_65";
			return false;
		}
		else
		{
			this.m.Name = "";
			this.m.Icon = "";
			this.m.IconMini = "";
			this.m.Overlay = "";
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
					text = "Unable to enforce Zones of Control."
				}
			];
		}
		else
		{
			return;
		}
	}


	function ChantUpdate()
	{
		if (this.inRange())
		{
			this.getContainer().getActor().m.IsUsingZoneOfControl = false;
			this.m.Name = "Disharmony";
			this.m.Icon = "skills/status_effect_65.png";
			this.m.IconMini = "status_effect_65_mini";
			this.m.Overlay = "status_effect_65";
		}
		else
		{
			this.getContainer().getActor().m.IsUsingZoneOfControl = true;
			this.m.Name = "";
			this.m.Icon = "";
			this.m.IconMini = "";
			this.m.Overlay = "";
		}
	}


	function inRange()
	{
		if (this.getContainer().getActor() == null) 
		{
			return false;
		}

		if (this.getContainer().getActor().getTile() == null)
		{
			return false;
		}

		if (this.m.Vala == null)
		{
			return false;
		}

		if (this.m.Vala.getTile() == null)
		{
			return false;
		}

		if (this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile()) <= this.m.Range)
		{
			return true;
		}

		return false;
	}


	function onMovementCompleted()
	{
		if (this.inRange())
		{
			this.spawnIcon("status_effect_65", this.getContainer().getActor().getTile());
		}

		this.ChantUpdate();
	}


	function onUpdate( _properties )
	{
		this.ChantUpdate();
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
		this.getContainer().getActor().m.IsUsingZoneOfControl = true;
		this.removeSelf();
	}
});
