this.legend_vala_chant_senses_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Vala = null,
		Range = 3
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
		this.m.ID = "effects.legend_vala_chant_senses_effect";
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
		if (!this.checkEntities())
		{
			this.updateEffect(false);
			return true;
		}

		if (!this.isInRange())
		{
			this.updateEffect(false);
			return true;
		}

		this.updateEffect(true);
		return false;
	}


	function getTooltip()
	{
		if (!this.isHidden())
		{
			local distance = this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile());
			local bonus = (this.m.Vala.getBravery() / 15.0) + ((this.getContainer().getActor().getFatigueMax() - this.getContainer().getActor().getFatigue()) / 15.0);

			if (this.isMastered())
			{
				bonus *= 1.1;
			}

			if (distance == 2)
			{
				bonus *= 0.75;
			}
			else if (distance == 3)
			{
				bonus *= 0.5;
			}

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
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.Math.round(bonus) + "[/color] Melee and Ranged defense."
				}
			];
		}
		else
		{
			return;
		}
	}


	function updateEffect( _v)
	{
		if (_v)
		{
			this.m.Name = "Heightened Senses";
			this.m.Icon = "skills/status_effect_73.png";
			this.m.IconMini = "status_effect_73_mini";
			this.m.Overlay = "status_effect_73";
		}
		else
		{
			this.m.Name = "";
			this.m.Icon = "";
			this.m.IconMini = "";
			this.m.Overlay = "";
		}
	}


	function checkEntities()
	{
		local actor = this.getContainer().getActor();
		if (actor == null) 
		{
			return false;
		}

		local tile = actor.getTile();
		if (tile == null)
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

		return true;
	}


	function isInRange()
	{
		if (this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile()) <= this.m.Range)
		{
			return true;
		}

		return false;
	}


	function isMastered()
	{
		if (this.m.Vala == null)
		{
			return false;
		}

		if (this.m.Vala.getSkills().hasSkill("perk.legend_vala_chanting_mastery"))
		{
			return true;
		}

		return false;
	}


	function onMovementCompleted()
	{
		if (!this.checkEntities())
		{
			this.updateEffect(false);
			return;
		}

		if (!this.isInRange())
		{
			this.updateEffect(false);
			return;
		}

		if (this.getContainer().getActor().getID() != this.m.Vala.getID())
		{
			this.spawnIcon("status_effect_73", this.getContainer().getActor().getTile());
		}

		this.updateEffect(true);
	}


	function onUpdate(_properties)
	{
		if (!this.checkEntities())
		{
			this.updateEffect(false);
			return
		}

		if (!this.isInRange())
		{
			this.updateEffect(false);
			return 
		}

		local distance = this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile());
		local bonus = (this.m.Vala.getBravery() / 15.0) + ((this.getContainer().getActor().getFatigueMax() - this.getContainer().getActor().getFatigue()) / 15.0);

		if (this.isMastered())
		{
			bonus *= 1.1;
		}

		if (distance == 2)
		{
			bonus *= 0.75;
		}
		else if (distance == 3)
		{
			bonus *= 0.5;
		}

		_properties.MeleeDefense += this.Math.round(bonus);
		_properties.RangedDefense += this.Math.round(bonus);

		this.updateEffect(true);
	}


	function onCombatFinished()
	{
		this.removeSelf();
	}
});
