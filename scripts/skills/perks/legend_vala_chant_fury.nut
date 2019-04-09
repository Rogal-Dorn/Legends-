this.legend_vala_chant_fury <- this.inherit("scripts/skills/skill", {
	m = {
		ChantIsActive = false
	},
	function create()
	{
		this.m.ID = "perk.legend_vala_chant_fury";
		this.m.Name = "Fury";
		this.m.Description = "Fury.";
		this.m.Icon = "ui/perks/legend_vala_chant_fury_active.png";
		this.m.IconDisabled = "ui/perks/legend_vala_chant_fury_active_sw.png";
		this.m.Type = this.Const.SkillType.Active | this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.NonTargeted + 2;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
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

		if (this.m.ChantIsActive)
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
				text = "Rawr!"
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


	function ChantFinished()
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
				if (t.getSkills().hasSkill("effects.legend_vala_chant_fury_effect"))
				{
					t.getSkills().removeByID("effects.legend_vala_chant_fury_effect");
				}
			}
		}

		this.m.ChantIsActive = false;
	}


	function onTurnStart()
	{
		this.ChantFinished();
	}


	function onCombatFinished()
	{
		this.ChantFinished();
	}


	function onDeath()
	{
		this.ChantFinished();
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

		if (actor.getSkills().hasSkill("effects.legend_vala_currently_chanting") && this.m.ChantIsActive)
		{
			this.Sound.play("sounds/combat/legend_vala_fury.wav");
		}

		foreach (tar in targets)
		{
			foreach (t in tar)
			{
				if (t.getSkills().hasSkill("effects.legend_vala_chant_fury_effect"))
				{
					if (actor.getTile().getDistanceTo(t.getTile()) <= 3 && actor.getID() != t.getID())
					{
						this.spawnIcon("perk_36", t.getTile());
					}

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
					if (t.isAlliedWith(actor) && !t.getSkills().hasSkill("effects.legend_vala_chant_fury_effect"))
					{
						local firststrike = this.new("scripts/skills/effects/legend_vala_chant_fury_effect");
						firststrike.setVala(this.getContainer().getActor());
						t.getSkills().add(firststrike);

						if (actor.getTile().getDistanceTo(t.getTile()) <= 3)
						{
							this.spawnIcon("perk_36", t.getTile());
						}
					}
				}
			}

			this.Sound.play("sounds/combat/legend_vala_fury.wav");
			this.m.ChantIsActive = true;
		}
	}
});
