this.legend_prayer_of_faith_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_prayer_of_faith";
		this.m.Name = "Prayer of Faith";
		this.m.Description = "This character is being protected by a holy chant";
		this.m.Icon = "ui/perks/prayer_purple.png";
		this.m.Overlay = "prayer_purple";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsHidden = true;
		this.m.IsRemovedAfterBattle = true;
	}

	function onAdded()
	{
	}

	function onTurnEnd()
	{
		this.removeSelf();
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local resolve = actor.getBaseProperties().Bravery;
		_properties.MeleeDefense += this.Math.floor(resolve * 0.10);
		_properties.RangedDefense += this.Math.floor(resolve * 0.10);

	}

});

