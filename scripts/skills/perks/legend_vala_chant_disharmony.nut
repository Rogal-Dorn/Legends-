this.legend_vala_chant_disharmony <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_vala_chant_disharmony";
		this.m.Name = "Disharmony";
		this.m.Description = "A very disagreeable and cacophonous chant that makes it almost impossible for the Vala\'s enemies to focus and concentrate properly.";
		this.m.Icon = "ui/perks/legend_vala_chant_disharmony_active.png";
		this.m.IconDisabled = "ui/perks/legend_vala_chant_disharmony_active_sw.png";
		this.m.Type = this.Const.SkillType.Active | this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.NonTargeted + 1;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
		this.m.IsAttack = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 30;
	}


	function isUsable()
	{
		local actor = this.getContainer().getActor();

		if (!this.skill.isUsable())
		{
			return false;
		}

		if (actor.getSkills().hasSkill("effects.legend_vala_currently_chanting"))
		{
			return false;
		}

		if (actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) == null)
		{
			return false;
		}

		if (actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getID() != "weapon.legend_staff_vala")
		{
			return false;
		}

		return true;
	}


	function getTooltip()
	{
		local actor = this.getContainer().getActor();

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
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Until the start of her next turn, enemies adjacent to the Vala are unable to enforce Zones of Control."
			},
		];

		if (actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) == null || (actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getID() != "weapon.legend_staff_vala"))
		{
			ret.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Requires the Vala's staff.[/color]"
			});
		}

		if (actor.getSkills().hasSkill("effects.legend_vala_currently_chanting"))
		{
			ret.push({
				id = 10,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Already chanting.[/color]"
			});
		}

		return ret;
	}


	function onTurnStart()
	{
		local actor = this.getContainer().getActor();
		local targets = this.Tactical.Entities.getAllInstances();

		if (actor.getSkills().hasSkill("effects.legend_vala_currently_chanting"))
		{
			actor.getSkills().removeByID("effects.legend_vala_currently_chanting");
		}

		foreach (tar in targets)
		{
			foreach (t in tar)
			{
				if (t.getSkills().hasSkill("effects.legend_vala_chant_disharmony_effect"))
				{
					t.getSkills().removeByID("effects.legend_vala_chant_disharmony_effect");
				}
			}
		}
	}


	function onCombatFinished()
	{
		local actor = this.getContainer().getActor();
		local targets = this.Tactical.Entities.getAllInstances();

		if (actor.getSkills().hasSkill("effects.legend_vala_currently_chanting"))
		{
			actor.getSkills().removeByID("effects.legend_vala_currently_chanting");
		}

		foreach (tar in targets)
		{
			foreach (t in tar)
			{
				if (t.getSkills().hasSkill("effects.legend_vala_chant_disharmony_effect"))
				{
					t.getSkills().removeByID("effects.legend_vala_chant_disharmony_effect");
				}
			}
		}
	}


	function onDeath()
	{
		local actor = this.getContainer().getActor();
		local targets = this.Tactical.Entities.getAllInstances();

		if (actor.getSkills().hasSkill("effects.legend_vala_currently_chanting"))
		{
			actor.getSkills().removeByID("effects.legend_vala_currently_chanting");
		}

		foreach (tar in targets)
		{
			foreach (t in tar)
			{
				if (t.getSkills().hasSkill("effects.legend_vala_chant_disharmony_effect"))
				{
					t.getSkills().removeByID("effects.legend_vala_chant_disharmony_effect");
				}
			}
		}
	}


	function onAfterUpdate( _properties )
	{
		local actor = this.getContainer().getActor();

		if (actor.getSkills().hasSkill("perk.legend_vala_chanting_mastery"))
		{
			this.m.FatigueCostMult = 0.75;
		}
		else
		{
			this.m.FatigueCostMult = 1.0;
		}
	}


	function onMovementCompleted()
	{
		local actor = this.getContainer().getActor();
		local targets = this.Tactical.Entities.getAllInstances();

		if (actor.getSkills().hasSkill("effects.legend_vala_currently_chanting"))
		{
			this.Sound.play("sounds/combat/legend_vala_chant.wav");
		}

		foreach (tar in targets)
		{
			foreach (t in tar)
			{
				if (t.getSkills().hasSkill("effects.legend_vala_chant_disharmony_effect"))
				{
					t.getSkills().update();
				}
			}
		}
	}


	function onUpdate( _properties )
	{
	}


	function onUse(_user, _targetTile)
	{
		if (this.isUsable())
		{
			local actor = this.getContainer().getActor();
			local targets = this.Tactical.Entities.getAllInstances();

			if (!actor.getSkills().hasSkill("effects.legend_vala_currently_chanting"))
			{
				actor.getSkills().add(this.new("scripts/skills/effects/legend_vala_currently_chanting"));
			}

			foreach (tar in targets)
			{
				foreach (t in tar)
				{
					if (!t.isAlliedWith(actor) && !t.getSkills().hasSkill("effects.legend_vala_chant_disharmony_effect"))
					{
						local disharmony = this.new("scripts/skills/effects/legend_vala_chant_disharmony_effect");
						disharmony.setVala(this.getContainer().getActor());
						t.getSkills().add(disharmony);
					}
				}
			}

			this.Sound.play("sounds/combat/legend_vala_chant.wav");
		}
	}
});
