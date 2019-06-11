this.legend_favoured_enemy_skill <- this.inherit("scripts/skills/skill", {
	m = {
		ValidTypes = [],
		BraveryMult = 1.0
	},
	function create()
	{
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function validTarget( _targetID)
	{
		foreach (t in this.m.ValidTypes)
		{
			if (_targetID == t)
			{
				return true;
			}
		}
		return false;
	}

	function getTotalKills( _actor )
	{
		local _actor = this.getContainer().getActor();
		if (_actor == null)
		{
			return 0;
		}

		local kills = 0;
		foreach (t in this.m.ValidTypes)
		{
			local mKills = 0;
			mKills = _actor.getLifetimeStats().Tags.get(t)
			if (mKills > 0)
			{
				kills += mKills;
			}
		}
		return kills;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity == null)
		{
			return;
		}
		
		if (!this.validTarget(_targetEntity.getType()))
		{
			return;
		}
		
		local value;

		switch(_targetEntity.getType())
			{
				case "this.Const.EntityType.Lindwurm":
					value = 1;
					break;
				case "this.Const.EntityType.LegendStollwurm":
					value = 0.3;
					break;
				case "this.Const.EntityType.Alp":
					value = 3;
					break;
				case "this.Const.EntityType.LegendDemonAlp":
					value = 0.3; 
					break;
				case "this.Const.EntityType.LegendGreenwoodSchrat":
					value = 0.3;
					break;
				case "this.Const.EntityType.LegendGreenwoodSchratSmall":
					value = 5; 
					break;
				case "this.Const.EntityType.Schrat":
					value = 1; 
					break;
				case "this.Const.EntityType.LegendRockUnhold":
					value = 0.5;
					break;
				case "this.Const.EntityType.Unhold":
					value = 2; 
					break;
				case "this.Const.EntityType.UnholdBog":
					value = 2; 
					break;
				case "this.Const.EntityType.UnholdFrost":
					value = 2; 
					break;
				case "this.Const.EntityType.Hexe":
					value = 2; 
					break;
				case "this.Const.EntityType.LegendHexeLeader":
					value = 0.5; 
					break;
				case "this.Const.EntityType.Spider":
					value = 8; 
					break;
				case "this.Const.EntityType.SpiderBodygaurd":
					value = 8; 
					break;
				case "this.Const.EntityType.LegendRedbackSpider":
					value = 1; 
					break;
				case "this.Const.EntityType.Ghoul":
					value = 6;
					break;
				case "this.Const.EntityType.LegendSkinGhoul":
					value = 2; 
					break;
				case "this.Const.EntityType.Direwolf":
					value = 6; 
					break;
				case "this.Const.EntityType.LegendWhiteDirewolf":
					value = 0.5; 
					break;
				case "this.Const.EntityType.Vampire":
					value = 2;
					break;
				case "this.Const.EntityType.SkeletonPriest":
					value = 2;
					break;
				case "this.Const.EntityType.SkeletonHeavy":
					value = 3;
					break;
				case "this.Const.EntityType.SkeletonMedium":
					value = 5;
					break;
				case "this.Const.EntityType.SkeletonLight":
					value = 7;
					break;
				case "this.Const.EntityType.Ghost":
					value = 4;
					break;
				case "this.Const.EntityType.ZombieBoss":
					value = 1;
					break;
				case "this.Const.EntityType.ZombieBetrayer":
					value = 4;
					break;
				case "this.Const.EntityType.ZombieKnight":
					value = 5;
					break;
				case "this.Const.EntityType.ZombieYeoman":
					value = 10;
					break;
				case "this.Const.EntityType.Zombie":
					value = 20;
					break;
				case "this.Const.EntityType.Necromancer":
					value = 3;
					break;
				case "this.Const.EntityType.GoblinWolfrider":
					value = 5; 
					break;
				case "this.Const.EntityType.GoblinShaman":
					value = 3; 
					break;
				case "this.Const.EntityType.GoblinLeader":
					value = 3; 
					break;
				case "this.Const.EntityType.GoblinFighter":
					value = 6; 
					break;
				case "this.Const.EntityType.GoblinAmbusher":
					value = 5; 
					break;
				case "this.Const.EntityType.OrcYoung":
					value = 6; 
					break;
				case "this.Const.EntityType.OrcBerserker":
					value = 4; 
					break;
				case "this.Const.EntityType.OrcElite":
					value = 2; 
					break;
				case "this.Const.EntityType.OrcWarlord":
					value = 2; 
					break;
				case "this.Const.EntityType.OrcBehemoth":
					value = 2;
					break;
				case "this.Const.EntityType.OrcWarrior":
					value = 3; 
					break;
				case "this.Const.EntityType.Militia":
					value = 10; 
					break;
				case "this.Const.EntityType.MilitiaArcher":
					value = 8; 
					break;
				case "this.Const.EntityType.MilitiaCaptain":
					value = 5; 
					break;
				case "this.Const.EntityType.MilitiaVeteran":
					value = 7; 
					break;
				case "this.Const.EntityType.BountHunter":
					value = 5; 
					break;
				case "this.Const.EntityType.Peasant":
					value = 25; 
					break;
				case "this.Const.EntityType.CaravanHand":
					value = 10; 
					break;
				case "this.Const.EntityType.CaravanGaurd":
					value = 7; 
					break;
				case "this.Const.EntityType.Wardog":
					value = 12; 
					break;
				case "this.Const.EntityType.Mercenary":
					value = 4; 
					break;
				case "this.Const.EntityType.HedgeKnight":
					value = 2; 
					break;
				case "this.Const.EntityType.MasterArcher":
					value = 2; 
					break;
				case "this.Const.EntityType.Footman":
					value = 5; 
					break;
				case "this.Const.EntityType.Greatsword":
					value = 4; 
					break;
				case "this.Const.EntityType.Billman":
					value = 5; 
					break;
				case "this.Const.EntityType.Arbalester":
					value = 5; 
					break;
				case "this.Const.EntityType.StandardBearer":
					value = 4; 
					break;
				case "this.Const.EntityType.Sergeant":
					value = 3; 
					break;
				case "this.Const.EntityType.Knight":
					value = 2; 
					break;
				case "this.Const.EntityType.BanditRabble":
					value = 30; 
					break;
				case "this.Const.EntityType.BanditThug":
					value = 15; 
					break;
				case "this.Const.EntityType.BanditPoacher":
					value = 12; 
					break;
				case "this.Const.EntityType.BanditMarksman":
					value = 7; 
					break;
				case "this.Const.EntityType.BanditRaider":
					value = 5; 
					break;
				case "this.Const.EntityType.BanditLeader":
					value = 3; 
					break;
				case "this.Const.EntityType.Warhound":
					value = 10; 
					break;
				case "this.Const.EntityType.BarbarianThrall":
					value = 8; 
					break;
				case "this.Const.EntityType.BarbarianMarauder":
					value = 4; 
					break;
				case "this.Const.EntityType.BarbarianChampion":
					value = 3; 
					break;
				case "this.Const.EntityType.BarbarianChosen":
					value = 2; 
					break;
				case "this.Const.EntityType.BarbarianDrummer":
					value = 3; 
					break;
				case "this.Const.EntityType.BarbarianUnhold":
					value = 2; 
					break;
				case "this.Const.EntityType.BarbarianUnholdFrost":
					value = 2; 
					break;
				case "this.Const.EntityType.BarbarianBeastmaster":
					value = 5; 
					break;
				default:
				value = 10;
			}

		local kills = this.getTotalKills();
		local killpercent = this.Math.floor(kills / 10);
		local killvalue = killpercent / value;
		local damageMult = 1.05 + killvalue;
		local toHitChance = 5 + (kills / value);
		_properties.MeleeSkill += this.Math.min(5, this.Math.floor(toHitChance);
		_properties.RangedSkill += this.Math.min(5, this.Math.floor(toHitChance);
		_properties.DamageRegularMax *= damageMult;
	}

	function onUpdate( _properties )
	{
		if (this.m.BraveryMult == 1.0)
		{
			return;
		}

		if (!("Entities" in this.Tactical))
		{
			return;
		}

		if (this.Tactical.Entities == null)
		{
			return;
		}

		local actors = this.Tactical.Entities.getAllInstancesAsArray();
		foreach( a in actors )
		{
			foreach (vt in this.m.ValidTypes)
			{
				if (a.getType() == vt)
				{
					_properties.BraveryMult *= this.m.BraveryMult;
					return;
				}
			}
		}
	}
	
});

