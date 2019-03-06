this.vazl_vala_warden_script <- this.inherit("scripts/entity/tactical/actor", {
	m = {
		Item = null
	},
	function setItem( _i )
	{
		if (typeof _i == "instance")
		{
			this.m.Item = _i;
		}
		else
		{
			this.m.Item = this.WeakTableRef(_i);
		}
	}


	function setName( _n )
	{
		this.m.Name = _n;
	}
	function getName()
	{
		return this.m.Name;
	}


	function create()
	{
		this.m.Type = this.Const.EntityType.Ghost;
		this.m.BloodType = this.Const.BloodType.None;
		this.m.MoraleState = this.Const.MoraleState.Ignore;
		this.m.XP = 0;
		this.m.IsEmittingMovementSounds = false;
		this.m.IsActingImmediately = true;
		this.actor.create();
		this.m.Sound[this.Const.Sound.ActorEvent.Death] = [
			"sounds/enemies/ghost_death_01.wav",
			"sounds/enemies/ghost_death_02.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Idle] = [
			"sounds/enemies/geist_idle_13.wav",
			"sounds/enemies/geist_idle_14.wav",
			"sounds/enemies/geist_idle_15.wav",
			"sounds/enemies/geist_idle_16.wav",
			"sounds/enemies/geist_idle_17.wav"
		];
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/vazl_vala_warden_agent");
		this.m.AIAgent.setActor(this);
	}


	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		if (_tile != null)
		{
			local effect = {
				Delay = 0,
				Quantity = 12,
				LifeTimeQuantity = 12,
				SpawnRate = 100,
				Brushes = [
					"bust_ghost_01"
				],
				Stages = [
					{
						LifeTimeMin = 1.0,
						LifeTimeMax = 1.0,
						ColorMin = this.createColor("ffffff5f"),
						ColorMax = this.createColor("ffffff5f"),
						ScaleMin = 1.0,
						ScaleMax = 1.0,
						RotationMin = 0,
						RotationMax = 0,
						VelocityMin = 80,
						VelocityMax = 100,
						DirectionMin = this.createVec(-1.0, -1.0),
						DirectionMax = this.createVec(1.0, 1.0),
						SpawnOffsetMin = this.createVec(-10, -10),
						SpawnOffsetMax = this.createVec(10, 10),
						ForceMin = this.createVec(0, 0),
						ForceMax = this.createVec(0, 0)
					},
					{
						LifeTimeMin = 1.0,
						LifeTimeMax = 1.0,
						ColorMin = this.createColor("ffffff2f"),
						ColorMax = this.createColor("ffffff2f"),
						ScaleMin = 0.9,
						ScaleMax = 0.9,
						RotationMin = 0,
						RotationMax = 0,
						VelocityMin = 80,
						VelocityMax = 100,
						DirectionMin = this.createVec(-1.0, -1.0),
						DirectionMax = this.createVec(1.0, 1.0),
						ForceMin = this.createVec(0, 0),
						ForceMax = this.createVec(0, 0)
					},
					{
						LifeTimeMin = 0.1,
						LifeTimeMax = 0.1,
						ColorMin = this.createColor("ffffff00"),
						ColorMax = this.createColor("ffffff00"),
						ScaleMin = 0.1,
						ScaleMax = 0.1,
						RotationMin = 0,
						RotationMax = 0,
						VelocityMin = 80,
						VelocityMax = 100,
						DirectionMin = this.createVec(-1.0, -1.0),
						DirectionMax = this.createVec(1.0, 1.0),
						ForceMin = this.createVec(0, 0),
						ForceMax = this.createVec(0, 0)
					}
				]
			};
			this.Tactical.spawnParticleEffect(false, effect.Brushes, _tile, effect.Delay, effect.Quantity, effect.LifeTimeQuantity, effect.SpawnRate, effect.Stages, this.createVec(0, 40));
		}

		if (this.m.Item != null)
		{
			this.m.Item.m.WardenEntity = null;
			this.m.Item = null;
		}

		this.actor.onDeath(_killer, _skill, _tile, _fatalityType);
	}


	function onFactionChanged()
	{
		this.actor.onFactionChanged();
		local flip = this.isAlliedWithPlayer();
		this.getSprite("body").setHorizontalFlipping(flip);
		this.getSprite("head").setHorizontalFlipping(flip);
		this.getSprite("blur_1").setHorizontalFlipping(flip);
		this.getSprite("blur_2").setHorizontalFlipping(flip);

		if (!this.Tactical.State.isScenarioMode())
		{
			local f = this.World.FactionManager.getFaction(this.getFaction());

			if (f != null)
			{
				this.getSprite("socket").setBrush(f.getTacticalBase());
			}
		}
		else
		{
			this.getSprite("socket").setBrush(this.Const.FactionBase[this.getFaction()]);
		}
	}


	function onActorKilled( _actor, _tile, _skill )
	{
		this.actor.onActorKilled(_actor, _tile, _skill);

		if (this.getFaction() == this.Const.Faction.Player || this.getFaction() == this.Const.Faction.PlayerAnimals)
		{
			local XPgroup = _actor.getXPValue();
			local brothers = this.Tactical.Entities.getInstancesOfFaction(this.Const.Faction.Player);

			foreach( bro in brothers )
			{
				bro.addXP(this.Math.max(1, this.Math.floor(XPgroup / brothers.len())));
			}
		}
	}


	function setWardenStats(_vala)
	{
		local NewWardenStats = {
			XP = 0,
			Hitpoints = this.Math.round((_vala.Hitpoints * 1.00) + (_vala.Bravery * 0.50)),
			ActionPoints = 6,
			Bravery = 200,
			Stamina = 200,
			MeleeSkill = this.Math.round((_vala.MeleeSkill * 1.00) + (_vala.Bravery * 0.25)),
			RangedSkill = this.Math.round((_vala.RangedSkill * 1.00) + (_vala.Bravery * 0.25)),
			MeleeDefense = this.Math.round((_vala.MeleeDefense * 1.00) + (_vala.Bravery * 0.25)),
			RangedDefense = this.Math.round((_vala.RangedDefense * 1.00) + (_vala.Bravery * 0.50)),
			Initiative = this.Math.round((_vala.Initiative * 0.50) + (_vala.Bravery * 0.25)),
			FatigueEffectMult = 0.0,
			MoraleEffectMult = 0.0,
			Armor = [0,	0]
		};

		local WardenStats = this.m.BaseProperties;
		WardenStats.setValues(NewWardenStats);
		this.m.Hitpoints = WardenStats.Hitpoints;
		this.m.CurrentProperties = WardenStats;

		this.logInfo("Warden HP " + this.m.CurrentProperties.Hitpoints);
		this.logInfo("Warden mSkill " + this.m.CurrentProperties.MeleeSkill);
		this.logInfo("Warden mDef " + this.m.CurrentProperties.MeleeDefense);
		this.logInfo("Warden rSkill " + this.m.CurrentProperties.RangedSkill);
		this.logInfo("Warden rDef " + this.m.CurrentProperties.RangedDefense);
		this.logInfo("Warden Init " + this.m.CurrentProperties.Initiative);
	}


	function onInit()
	{
		local WardenProperties = {
			XP = 0,
			ActionPoints = 6,
			Hitpoints = 1,
			Bravery = 200,
			Stamina = 200,
			MeleeSkill = 0,
			RangedSkill = 0,
			MeleeDefense = 0,
			RangedDefense = 0,
			Initiative = 1,
			FatigueEffectMult = 0.0,
			MoraleEffectMult = 0.0,
			Armor = [0,	0]
		};

		this.actor.onInit();
		local b = this.m.BaseProperties;
		b.setValues(WardenProperties);
		b.IsImmuneToBleeding = true;
		b.IsImmuneToPoison = true;
		b.IsImmuneToKnockBackAndGrab = true;
		b.IsImmuneToStun = true;
		b.IsImmuneToRoot = true;
		b.IsImmuneToZoneOfControl = true;
		b.IsIgnoringArmorOnAttack = true;
		b.IsAffectedByNight = false;
		b.IsAffectedByInjuries = false;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.m.ActionPointCosts = this.Const.SameMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		this.m.MaxTraversibleLevels = 3;
		this.m.Items.getAppearance().Body = "bust_ghost_01";
		this.addSprite("socket").setBrush("bust_base_player");
		this.addSprite("fog").setBrush("bust_ghost_fog_02");
		local body = this.addSprite("body");
		body.setBrush("bust_ghost_01");
		body.varySaturation(0.25);
		body.varyColor(0.2, 0.2, 0.2);
		local head = this.addSprite("head");
		head.setBrush("bust_ghost_01");
		head.varySaturation(0.25);
		head.varyColor(0.2, 0.2, 0.2);
		local blur_1 = this.addSprite("blur_1");
		blur_1.setBrush("bust_ghost_01");
		blur_1.varySaturation(0.25);
		blur_1.varyColor(0.2, 0.2, 0.2);
		local blur_2 = this.addSprite("blur_2");
		blur_2.setBrush("bust_ghost_01");
		blur_2.varySaturation(0.25);
		blur_2.varyColor(0.2, 0.2, 0.2);
		this.addDefaultStatusSprites();
		this.getSprite("status_rooted").Scale = 0.55;
		this.setSpriteOffset("status_rooted", this.createVec(-5, -5));
		this.m.Skills.add(this.new("scripts/skills/actives/vazl_vala_warden_pale_touch"));
		this.m.Skills.add(this.new("scripts/skills/actives/vazl_vala_warden_wail"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
	}
});
