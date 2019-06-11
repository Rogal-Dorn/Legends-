this.perk_legend_favoured_enemy_schrat <- this.inherit("scripts/skills/legend_favoured_enemy_skill", {
	m = {},
	function create()
	{
		this.legend_favoured_enemy_skill.create();
		this.m.ID = "perk.legend_favoured_enemy_schrat";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemySchrat;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemySchrat;
		this.m.Icon = "ui/perks/favoured_schratt_01.png";
		this.m.ValidTypes = [
			this.Const.EntityType.Schrat,
			this.Const.EntityType.SchratSmall,
			this.Const.EntityType.LegendGreenwoodSchrat,
			this.Const.EntityType.LegendGreenwoodSchratSmall,
		];

	}

});

