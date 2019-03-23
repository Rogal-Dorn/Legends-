this.perk_legend_piercing_shot <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_piercing_shot";
		this.m.Name = this.Const.Strings.PerkName.LegendPiercingShot;
		this.m.Description = this.Const.Strings.PerkDescription.LegendPiercingShot;
		this.m.Icon = "ui/perks/PiercingBoltPerk.png";
		this.m.IconDisabled = "ui/perks/PiercingBoltPerk_bw.png"
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_piercing_shot"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_piercing_shot"));
		}
	}
		function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_piercing_shot");
	}

});
