this.legend_protect_target <- this.inherit("scripts/skills/skill", {
	m = {
		Pet = []
	},

	function create()
	{
		this.m.ID = "actives.protect";
		this.m.Name = "Defend! Good boy!";
		this.m.Description = "Order your pets to protect a target.";
		this.m.Icon = "skills/active_175.png";
		this.m.IconDisabled = "skills/active_175_sw.png";
		this.m.Overlay = "active_175";
		this.m.SoundOnUse = [
			"sounds/enemies/wardog_idle_01.wav",
			"sounds/enemies/wardog_idle_02.wav",
			"sounds/enemies/wardog_idle_03.wav",
			"sounds/enemies/wardog_idle_04.wav",
			"sounds/enemies/wardog_idle_05.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any + 2;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 0;
		this.m.FatigueCost = 3;
		this.m.MinRange = 1;
		this.m.MaxRange = 9;
		this.m.MaxLevelDifference = 4;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
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
				text = "Give your pet an order to prioritize protecting target"
			}
		];

		if (this.m.Pet.len() == 0)
		{
			ret.push({
				id = 10,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]This character does not have any unleashed pets[/color]"
			});
		}

		return ret;
	}

	function addPet( _petID )
	{
		this.m.Pet.push(_petID);
	}

	function removePet( _petID )
	{
		local i = this.m.Pet.find(_petID);

		if (i != null)
		{
			this.m.Pet.remove(_petID);
		}
	}

	function onUpdate( _properties )
	{
		if (this.m.Pet.len() != 0)
		{
			local pets = [];

			foreach (id in this.m.Pet)
			{
				local e = this.Tactical.getEntityByID(id);

				if (e != null)
				{
					pets.push(id);
				}
			}

			this.m.Pet = pets;
		}
	}

	function isUsable()
	{
		return this.m.Pet.len() != 0 && this.skill.isUsable();
	}

	function onVerifyTarget( _originTile, _targetTile )
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

		if (target.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return false;
		}

		return true;
	}

	function setTarget(_t)
	{
		if (this.m.LastTarget != null)
		{
			local e = this.Tactical.getEntityByID(this.m.LastTarget);
			if (e != null)
			{
				e.getSkills().removeByID("effects.guarded_effect");
			}
		}
		this.m.LastTarget = null;


		foreach (id in this.m.Pet)
		{
			local pet = this.Tactical.getEntityByID(id);
			if (pet == null)
			{
				continue;
			}

			local hasSkill = pet.getSkills().hasSkill("effects.legend_guard")

			if (_t == null)
			{
				if (hasSkill)
				{
					local skill = pet.getSkills().getSkillByID("effects.legend_guard")
					skill.setTarget(null)
				}
				continue;
			}

			if (!hasSkill)
			{
				pet.getSkills().add(this.new("scripts/skills/effects/legend_guard_effect"));
			}

			local guard = pet.getSkills().getSkillByID("effects.legend_guard");
			guard.setTarget(target);
			this.spawnIcon("status_effect_103", pet.getTile());
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " orders " + this.Const.UI.getColorizedEntityName(pet) + " to protect " + this.Const.UI.getColorizedEntityName(target));
		}

		if (_t == null)
		{
			return;
		}
		target.getSkills().add(this.new("scripts/skills/effects/guarded_effect"));
		this.m.LastTarget = _t.getID();
	}

	function onUse( _user, _targetTile )
	{
		if (_user.getSkills().hasSkill("actives.legend_attack_target"))
		{
			local skill = _user.getSkills().getSkillByID("actives.legend_attack_target")
			skill.setTarget(null);
		}

		local target = _targetTile.getEntity();
		this.setTarget(target);
		return true;

	}

});

