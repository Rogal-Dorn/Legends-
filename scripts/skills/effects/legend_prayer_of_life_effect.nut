this.legend_prayer_of_life_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_prayer_of_life";
		this.m.Name = "Prayer of Hope";
		this.m.Description = "This character is being restored by a holy chant";
		this.m.Icon = "ui/perks/prayer_green.png";
		this.m.Overlay = "prayer_green";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsHidden = true;
		this.m.IsRemovedAfterBattle = true;
	}

	function onTurnEnd()
	{
		local actor = this.getContainer().getActor();
		local resolve = actor.getBaseProperties().Bravery;
		local bonus = this.Math.floor(resolve * 0.10);
		if (actor.getHitpoints() < actor.getHitpointsMax())
		{
		actor.setHitpoints(this.Math.max(0, actor.getHitpoints() + bonus));
		this.spawnIcon(this.m.Overlay, actor.getTile());
		}

		this.removeSelf();
	}

});

