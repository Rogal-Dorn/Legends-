this.legend_spawn_zombie_high_skill <- this.inherit("scripts/skills/actives/legend_spawn_skill", {
	m = {},
	function create()
	{
		this.legend_spawn_skill.create();
		this.m.ID = "actives.legend_spawn_zombie_high_skill";
		this.m.Name = "Summon Heavy Zombie";
		this.m.Description = "Unleash your zombie and send him charging into the enemy. Needs a free tile adjacent.";
		this.m.Icon = "skills/remake_man.png",
		this.m.IconDisabled = "skills/remake_man_bw.png",
		this.m.Overlay = "active_26";
		 this.m.SoundOnUse = [
		 	"sounds/combat/meat_01.wav",
		 	"sounds/combat/meat_02.wav",
		 	"sounds/combat/meat_03.wav",
			"sounds/combat/meat_04.wav"
		// ];
		this.m.SoundOnHit = [
			"sounds/enemies/necromancer_01.wav",
			"sounds/enemies/necromancer_02.wav",
			"sounds/enemies/necromancer_03.wav"
		];
		this.m.SpawnItem =  "spawns.zombie",
		this.m.Script = "scripts/entity/tactical/legends_zombie_high"
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.MaxLevelDifference = 4;
		this.m.Order = this.Const.SkillOrder.NonTargeted + 7;
		this.m.HPCost = 15;
		this.m.APStartMult = 0.0;

	}


});
