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
//			{
//				id = 2,
//				type = "description",
//				text = "Besides having assorted passive skills, and the ability inscribe objects with magical rune sigils, the Vala also has two somewhat mechanically similar types of active skills at her disposal: sorcerous incantations in the form of chants, and induced trance states through which she may perceive and interact with the spirit world and the spirits therein."
//			},
			{
				id = 3,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Most of the Vala\'s skills scale in one way or another with the strength of her Resolve."
			},
			{
				id = 4,
				type = "text",
				icon = "ui/icons/special.png",
				text = "When the Vala starts chanting she will cause immediate effects. These effects usually last until the start of her next turn. Taking damage does not interrupt her chanting."
			},
			{
				id = 5,
				type = "text",
				icon = "ui/icons/special.png",
				text = "When the Vala enters a trance she will remain in that state until her task is either completed or interrupted. Trance completion is checked at the start of her turns, and failure causes her to remain in trance (while gaining additional success chance for her next completion check). Receiving damage of any kind, or becoming too fatigued, will drop the Vala out of an active trance."
			}
		];

		return tooltip;
	}
});
