this.perk_adrenalin <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.adrenalin";
		this.m.Name = this.Const.Strings.PerkName.Adrenalin;
		this.m.Description = this.Const.Strings.PerkDescription.Adrenalin;
		this.m.Icon = "ui/perks/perk_37.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.adrenalin"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/adrenalin_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.adrenalin");
	}

});
