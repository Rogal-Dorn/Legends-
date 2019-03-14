this.legend_vala_threads_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Threads = 1
	},
	function create()
	{
		this.m.ID = "effects.legend_vala_threads_effect";
		this.m.Name = "Threads of Fate";
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
		return false;
	}


	function getName()
	{
		if (this.m.Threads <= 1)
		{
			return this.m.Name;
		}
		else
		{
			return this.m.Name + " (x" + this.m.Threads + ")";
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
		if (this.m.Threads > 5)
		{
			this.m.Threads = 5;
		}

		_properties.HitpointsMult *= 1.0 - (this.m.Threads / 20.0);
		_properties.BraveryMult *= 1.0 - (this.m.Threads / 20.0);
		_properties.StaminaMult *= 1.0 - (this.m.Threads / 20.0);
		_properties.InitiativeMult *= 1.0 - (this.m.Threads / 20.0);
		_properties.MeleeSkillMult *= 1.0 - (this.m.Threads / 20.0);
		_properties.RangedSkillMult *= 1.0 - (this.m.Threads / 20.0);
		_properties.MeleeDefenseMult *= 1.0 - (this.m.Threads / 20.0);
		_properties.RangedDefenseMult *= 1.0 - (this.m.Threads / 20.0);
	}


	function onRefresh()
	{
		if (this.m.Threads < 5)
		{
			++this.m.Threads;
			this.spawnIcon("status_effect_87", this.getContainer().getActor().getTile());
		}
	}


	function onCombatFinished()
	{
		this.removeSelf();
	}
});
