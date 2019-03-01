this.legend_spawn_zombie_low_skill <- this.inherit("scripts/skills/actives/legend_spawn_skill", {
	m = {},
	function create()
	{
		this.legend_spawn_skill.create();
		this.m.ID = "actives.legend_spawn_zombie_low_skill";
		this.m.Name = "Summon Light Zombie";
		this.m.Description = "Unleash your zombie and send him charging into the enemy. Needs a free tile adjacent.";
		this.m.Icon = "skills/mold_carrion.png",
		this.m.IconDisabled = "skills/mold_carrion_bw.png",
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
		this.m.Script = "scripts/entity/tactical/legends_zombie_low"
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 10;
		this.m.MaxLevelDifference = 4;
		this.m.Order = this.Const.SkillOrder.NonTargeted + 5;
		this.m.HPCost = 5;
	}

});
