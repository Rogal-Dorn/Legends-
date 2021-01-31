this.legend_sanctified_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 4
	},
	function create()
	{
		this.m.ID = "effects.legend_sanctified_effect";
		this.m.Name = "Sancitified";
		this.m.Description = "This character is being cleansed by holy light";
		this.m.Icon = "ui/perks/holybluefire_circle.png";
		this.m.Overlay = "bluefire_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsHidden = true;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		return [
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
				id = 12,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Not psychologically affected by injuries, losing hitpoints. Immune to bleeding or poison for [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] more turns"
			}
		];
	}

	function onAdded()
	{
		this.m.TurnsLeft = this.Math.max(1, 2 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
		this.Tactical.TurnSequenceBar.pushEntityBack(this.getContainer().getActor().getID());
	}

	function onRefresh()
	{
		this.m.TurnsLeft = this.Math.max(1, 2 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
		this.Tactical.TurnSequenceBar.pushEntityBack(this.getContainer().getActor().getID());
		this.spawnIcon("status_effect_65", this.getContainer().getActor().getTile());
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

	function onUpdate( _properties )
	{
		_properties.IsAffectedByLosingHitpoints = false;
		_properties.IsAffectedByInjuries = false;
		_properties.IsAffectedByFreshInjuries = false;
		_properties.IsImmuneToBleeding = true;
		_properties.IsImmuneToPoison = true;
	}

});

