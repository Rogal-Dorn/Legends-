this.legend_spawn_zombie_med_skill <- this.inherit("scripts/skills/actives/legend_spawn_skill", {
	m = {},
	function create()
	{
		this.legend_spawn_skill.create();
		this.m.ID = "actives.legend_spawn_zombie_med_skill";
		this.m.Name = "Summon Medium Zombie";
		this.m.Description = "Unleash your zombie and send him charging into the enemy. Needs a free tile adjacent.";
		this.m.Icon = "skills/fashion_body.png",
		this.m.IconDisabled = "skills/fashion_body_bw.png",
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
		this.m.SpawnItem =  "spawns.zombie",
		this.m.Script = "scripts/entity/tactical/legends_zombie_med"
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.MaxLevelDifference = 4;
		this.m.Order = this.Const.SkillOrder.NonTargeted + 6;
		this.m.HPCost = 10;
		this.m.APStartMult = 0.5;
	}

});
