this.perk_legend_magic_teleport <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_magic_teleport";
		this.m.Name = this.Const.Strings.PerkName.LegendMagicTeleport;
		this.m.Description = this.Const.Strings.PerkDescription.LegendMagicTeleport;
		this.m.Icon = "ui/perks/teleport_perk.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_magic_teleport"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_magic_teleport_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_magic_teleport");
	}

});

