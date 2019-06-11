this.perk_legend_favoured_enemy_direwolf <- this.inherit("scripts/skills/legend_favoured_enemy_skill", {
	m = {},
	function create()
	{
		this.legend_favoured_enemy_skill.create();
		this.m.ID = "perk.legend_favoured_enemy_direwolf";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemyDirewolf;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemyDirewolf;
		this.m.Icon = "ui/perks/favoured_direwolf_01.png";
		this.m.ValidTypes = [
			this.Const.EntityType.Direwolf,
			this.Const.EntityType.Wolf,
			this.Const.EntityType.GoblinWolfrider,
 			this.Const.EntityType.LegendWhiteDirewolf
		]
	}

});

