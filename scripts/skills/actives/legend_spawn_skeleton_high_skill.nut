this.legend_spawn_skeleton_high_skill <- this.inherit("scripts/skills/actives/legend_spawn_skill", {
	m = {},
	function create()
	{
		this.legend_spawn_skill.create();
		this.m.ID = "actives.legend_spawn_skeleton_high_skill";
		this.m.Name = "Summon Heavy Skeleton";
		this.m.Description = "Unleash your skeleton and send him charging into the enemy. Needs a free tile adjacent.";
		this.m.Icon = "skills/rebuild_skeleton.png",
		this.m.IconDisabled = "skills/rebuild_skeleton_bw.png",
		this.m.Overlay = "active_26";
		// this.m.SoundOnUse = [
		// 	"sounds/enemies/geist_idle_10.wav",
		// 	"sounds/enemies/geist_idle_11.wav",
		// 	"sounds/enemies/geist_idle_12.wav"
		// ];
		this.m.SoundOnHit = [
			"sounds/enemies/necromancer_01.wav",
			"sounds/enemies/necromancer_02.wav",
			"sounds/enemies/necromancer_03.wav"
		];
		this.m.SpawnItem =  "spawns.skeleton",
		this.m.Script = "scripts/entity/tactical/legends_skeleton_high"
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 30;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.MaxLevelDifference = 4;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted + 17;
	}

});
