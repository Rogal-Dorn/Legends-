this.legend_RSS_radiance_effect <- this.inherit("scripts/skills/skill", {
	m = {
		MalusOne = 0,
		MalusTwo = 0,
		BeforeSkillExecutedTile = null,
		IsUsingMoveSkill = false
	},
	function setMalus(_m1, _m2)
	{
		this.m.MalusOne = _m1;
		this.m.MalusTwo = _m2;
	}


	function create()
	{
		this.m.ID = "effects.legend_RSS_radiance_effect";
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
		local actor = this.getContainer().getActor();
		if (actor == null)
		{
			return;
		}
		local targets = this.Tactical.Entities.getAllInstances();
		local BlindAdjacent = false;

		foreach (tar in targets)
		{
			foreach (t in tar)
			{
				if (!t.isAlliedWith(actor) && t.getSkills().hasSkill("special.legend_RSS_radiance") && t.getTile().getDistanceTo(actor.getTile()) == 1)
				{
					BlindAdjacent = true;
					break;
				}
			}
		}

		if (BlindAdjacent)
		{
			this.m.Name = "Blinded";
			this.m.Icon = "skills/status_effect_52.png";
			this.m.IconMini = "status_effect_52_mini";
			this.m.Overlay = "status_effect_52";
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
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]-" + this.m.MalusOne + "%[/color] Melee skill.\n" + "[color=" + this.Const.UI.Color.PositiveValue + "]-" + this.m.MalusTwo + "%[/color] Melee defense."
				}
			];
		}
		else
		{
			return;
		}
	}


	function updateEffect()
	{
		local actor = this.getContainer().getActor();
		if (actor == null)
		{
			return;
		}
		local targets = this.Tactical.Entities.getAllInstances();
		local BlindAdjacent = false;

		foreach (tar in targets)
		{
			foreach (t in tar)
			{
				if (!t.isAlliedWith(actor) && t.getSkills().hasSkill("special.legend_RSS_radiance") && t.getTile().getDistanceTo(actor.getTile()) == 1)
				{
					BlindAdjacent = true;
					break;
				}
			}
		}

		if (BlindAdjacent)
		{
			this.m.Name = "Blinded";
			this.m.Icon = "skills/status_effect_52.png";
			this.m.IconMini = "status_effect_52_mini";
			this.m.Overlay = "status_effect_52";
		}
		else
		{
			this.m.Name = "";
			this.m.Icon = "";
			this.m.IconMini = "";
			this.m.Overlay = "";
		}
	}


	function onMovementFinished( _tile )
	{
		local actor = this.getContainer().getActor();
		if (actor == null)
		{
			return;
		}
		local targets = this.Tactical.Entities.getAllInstances();

		foreach (tar in targets)
		{
			foreach (t in tar)
			{
				if (!t.isAlliedWith(actor) && t.getSkills().hasSkill("special.legend_RSS_radiance") && t.getTile().getDistanceTo(actor.getTile()) == 1)
				{
					local BlinderValues = t.getSkills().getSkillByID("special.legend_RSS_radiance");
					this.m.MalusOne = BlinderValues.getItem().getRuneBonus1();
					this.m.MalusTwo = BlinderValues.getItem().getRuneBonus2();
					this.spawnIcon("status_effect_52", actor.getTile());
					break;
				}
			}
		}

		this.updateEffect();
	}

	function onBeforeAnySkillExecuted( _skill, _targetTile, _targetEntity )
	{
		this.m.BeforeSkillExecutedTile = this.getContainer().getActor().getTile();
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity )
	{
		if (!this.getContainer().getActor().getTile().isSameTileAs(this.m.BeforeSkillExecutedTile))
		{
			this.m.IsUsingMoveSkill = true;
		}
		else
		{
			this.m.IsUsingMoveSkill = false;
		}
	}


	function onUpdate(_properties)
	{
		local actor = this.getContainer().getActor();
		if (actor == null || this.m.IsUsingMoveSkill)
		{
			this.m.IsUsingMoveSkill = false;
			return;
		}

		local targets = this.Tactical.Entities.getAllInstances();
		local BlindAdjacent = false;

		foreach (tar in targets)
		{
			foreach (t in tar)
			{
				if (!t.isAlliedWith(actor) && t.getSkills().hasSkill("special.legend_RSS_radiance") && t.getTile().getDistanceTo(actor.getTile()) == 1)
				{
					BlindAdjacent = true;
					break;
				}
			}
		}

		if (BlindAdjacent)
		{
			_properties.MeleeSkillMult *= (1.0 - ((this.m.MalusOne * 1.0) / 100.0));
			_properties.MeleeDefenseMult *= (1.0 - ((this.m.MalusTwo * 1.0) / 100.0));
		}

		this.updateEffect();		
	}


	function onDeath()
	{
		this.removeSelf();
	}


	function onCombatFinished()
	{
		this.removeSelf();
	}
});
