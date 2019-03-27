this.legend_vala_information <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "special.legend_vala_information";
		this.m.Name = "Vala Information: Skills";
		this.m.Icon = "ui/perks/legend_vala_information.png";
		this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast + 100;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
		this.m.IsSerialized = true;
	}


	function isHidden()
	{
		if (this.World.State.getCombatStartTime() != 0)
		{
			return true;
		}

		return false;
	}


	function getTooltip()
	{
		local tooltip =
		[
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = "Besides having assorted passive skills, and the ability inscribe objects with magical rune sigils, the Vala also has two somewhat mechanically similar types of active skills at her disposal: sorcerous incantations in the form of chants, and induced trance states through which she may perceive and interact with the spirit world and the spirits therein.\n\nMost of the Vala\'s skills scale in one way or another with her Resolve."
			},
			{
				id = 3,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Chant specifics."
			},
			{
				id = 4,
				type = "hint",
				icon = "ui/icons/special.png",
				text = "Trance specifics."
			}
		];

		return tooltip;
	}
});
