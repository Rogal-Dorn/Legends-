this.perk_legend_favoured_enemy_skeleton <- this.inherit("scripts/skills/legend_favoured_enemy_skill", {
	m = {},
	function create()
	{
		this.legend_favoured_enemy_skill.create();
		this.m.ID = "perk.legend_favoured_enemy_skeleton";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemySkeleton;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemySkeleton;
		this.m.Icon = "ui/perks/favoured_skeleton_01.png";
		this.m.ValidTypes = [
			this.Const.EntityType.SkeletonLight,
			this.Const.EntityType.SkeletonMedium,
			this.Const.EntityType.SkeletonHeavy,
			this.Const.EntityType.SkeletonBoss,
			this.Const.EntityType.SkeletonPriest
		];
	}

});

