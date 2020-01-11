this.legend_stuffed_effect <- this.inherit("scripts/skills/skill", {
	m = {
	},

	function create()
	{
		this.m.ID = "effects.legend_stuffed_effect";
		this.m.Name = "Stuffed";
		this.m.Icon = "ui/perks/food56.png";
		this.m.IconMini = "mini_food_circle";
		this.m.Overlay = "food_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character has eaten too much";
	}

	function getTooltip()
	{
		local rate = this.Math.floor(this.m.Amount / 20);

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
				id = 11,
				type = "text",
				icon = "ui/icons/health.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "] 1 [/color] Healing per turn"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "] 4 [/color] Fatigue loss per turn"
			}
		];
		return ret;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		actor.setHitpoints(this.Math.min(actor.getHitpointsMax(), actor.getHitpoints() + 1));
		_properties.FatigueRecoveryRate -= 4;
	}

	function onCombatFinished()
	{
		this.removeSelf();
	}
});

