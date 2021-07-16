local gt = this.getroottable();

if (!("LegendMod" in gt.Const))
{
	gt.Const.LegendMod <- {};
}

gt.Const.LegendMod.FavoriteZombies <- [
	this.Const.EntityType.ZombieYeoman,
	this.Const.EntityType.Zombie,
	this.Const.EntityType.ZombieBetrayer,
	this.Const.EntityType.ZombieBoss,
	this.Const.EntityType.ZombieKnight,
	this.Const.EntityType.Necromancer,
	this.Const.EntityType.ZombieTreasureHunter
];
gt.Const.LegendMod.FavoriteAlps <- [
	this.Const.EntityType.Alp,
	this.Const.EntityType.AlpShadow,
	this.Const.EntityType.LegendDemonAlp
];
gt.Const.LegendMod.FavoriteDirewolf <- [
	this.Const.EntityType.Hyena,
	this.Const.EntityType.Direwolf,
	this.Const.EntityType.Wolf,
	this.Const.EntityType.GoblinWolfrider,
	this.Const.EntityType.KoboldWolfrider,
	this.Const.EntityType.LegendWhiteDirewolf
];
gt.Const.LegendMod.FavoriteGhoul <- [
	this.Const.EntityType.Ghoul,
	this.Const.EntityType.LegendSkinGhoul
];
gt.Const.LegendMod.FavoriteGoblin <- [
	this.Const.EntityType.GoblinFighter,
	this.Const.EntityType.GoblinAmbusher,
	this.Const.EntityType.GoblinLeader,
	this.Const.EntityType.GoblinShaman,
	this.Const.EntityType.GoblinWolfrider,
	this.Const.EntityType.KoboldWolfrider,
	this.Const.EntityType.KoboldFighter
];
gt.Const.LegendMod.FavoriteHexe <- [
	this.Const.EntityType.Hexe,
	this.Const.EntityType.LegendHexeLeader
];
gt.Const.LegendMod.FavoriteLindwurm <- [
	this.Const.EntityType.Serpent,
	this.Const.EntityType.Lindwurm,
	this.Const.EntityType.LegendStollwurm
];
gt.Const.LegendMod.FavoriteOrc <- [
	this.Const.EntityType.OrcBerserker,
	this.Const.EntityType.OrcYoung,
	this.Const.EntityType.OrcWarrior,
	this.Const.EntityType.OrcWarlord,
	this.Const.EntityType.LegendOrcBehemoth,
	this.Const.EntityType.LegendOrcElite
];
gt.Const.LegendMod.FavoriteSchrat <- [
	this.Const.EntityType.SandGolem,
	this.Const.EntityType.Schrat,
	this.Const.EntityType.SchratSmall,
	this.Const.EntityType.LegendGreenwoodSchrat,
	this.Const.EntityType.LegendGreenwoodSchratSmall
];
gt.Const.LegendMod.FavoriteSkeleton <- [
	this.Const.EntityType.SkeletonLight,
	this.Const.EntityType.SkeletonMedium,
	this.Const.EntityType.SkeletonHeavy,
	this.Const.EntityType.SkeletonBoss,
	this.Const.EntityType.SkeletonPriest,
	this.Const.EntityType.SkeletonLich,
	this.Const.EntityType.SkeletonLichMirrorImage,
	this.Const.EntityType.SkeletonPhylactery,
	this.Const.EntityType.SkeletonGladiator,
	this.Const.EntityType.FlyingSkull
];
gt.Const.LegendMod.FavoriteSpider <- [
	this.Const.EntityType.Spider,
	this.Const.EntityType.SpiderEggs,
	this.Const.EntityType.LegendRedbackSpider
];
gt.Const.LegendMod.FavoriteUnhold <- [
	this.Const.EntityType.Unhold,
	this.Const.EntityType.UnholdBog,
	this.Const.EntityType.UnholdFrost,
	this.Const.EntityType.BarbarianUnhold,
	this.Const.EntityType.BarbarianUnholdFrost,
	this.Const.EntityType.LegendRockUnhold
];
gt.Const.LegendMod.FavoriteVampire <- [
	this.Const.EntityType.Vampire,
	this.Const.EntityType.Ghost,
	this.Const.EntityType.LegendVampireLord,
	this.Const.EntityType.LegendBanshee,
	this.Const.EntityType.LegendMummyLight,
	this.Const.EntityType.LegendMummyMedium,
	this.Const.EntityType.LegendMummyHeavy,
	this.Const.EntityType.LegendMummyQueen,
	this.Const.EntityType.LegendMummyPriest
];
gt.Const.LegendMod.FavoriteSwordmaster <- [
	this.Const.EntityType.HedgeKnight,
	this.Const.EntityType.Knight,
	this.Const.EntityType.Greatsword,
	this.Const.EntityType.Swordmaster,
	this.Const.EntityType.BanditLeader,
	this.Const.EntityType.BanditVeteran,
	this.Const.EntityType.BanditWarlord,
	this.Const.EntityType.LegendFencer,
	this.Const.EntityType.BarbarianChampion,
	this.Const.EntityType.Sergeant,
	this.Const.EntityType.Officer,
	this.Const.EntityType.Gladiator,
	this.Const.EntityType.Assassin,
	this.Const.EntityType.NomadLeader,
	this.Const.EntityType.Executioner,
	this.Const.EntityType.DesertDevil,
	this.Const.EntityType.LegendFencer
];
gt.Const.LegendMod.FavoriteArcher <- [
	this.Const.EntityType.MasterArcher,
	this.Const.EntityType.BanditMarksman,
	this.Const.EntityType.BanditRabblePoacher,
	this.Const.EntityType.BanditPoacher,
	this.Const.EntityType.MilitiaRanged,
	this.Const.EntityType.Arbalester,
	this.Const.EntityType.LegendSlinger,
	this.Const.EntityType.GoblinAmbusher,
	this.Const.EntityType.NomadSlinger,
	this.Const.EntityType.NomadArcher,
	this.Const.EntityType.Gunner,
	this.Const.EntityType.DesertStalker
];
gt.Const.LegendMod.FavoriteBarbarian <- [
	this.Const.EntityType.Warhound,
	this.Const.EntityType.BarbarianThrall,
	this.Const.EntityType.BarbarianMarauder,
	this.Const.EntityType.BarbarianChampion,
	this.Const.EntityType.BarbarianChosen,
	this.Const.EntityType.BarbarianDrummer,
	this.Const.EntityType.BarbarianBeastmaster
];
gt.Const.LegendMod.FavoriteBandit <- [
	this.Const.EntityType.BanditRabble,
	this.Const.EntityType.BanditRabblePoacher,
	this.Const.EntityType.BanditThug,
	this.Const.EntityType.BanditPoacher,
	this.Const.EntityType.BanditMarksman,
	this.Const.EntityType.BanditRaider,
	this.Const.EntityType.BanditVeteran,
	this.Const.EntityType.BanditWarlord,
	this.Const.EntityType.BanditLeader
];
gt.Const.LegendMod.FavoriteCaravan <- [
	this.Const.EntityType.Peasant,
	this.Const.EntityType.LegendPeasantButcher,
	this.Const.EntityType.LegendPeasantBlacksmith,
	this.Const.EntityType.LegendPeasantMonk,
	this.Const.EntityType.LegendPeasantFarmhand,
	this.Const.EntityType.LegendPeasantMinstrel,
	this.Const.EntityType.LegendPeasantPoacher,
	this.Const.EntityType.LegendPeasantMiner,
	this.Const.EntityType.LegendPeasantSquire,
	this.Const.EntityType.LegendPeasantWitchHunter,
	this.Const.EntityType.CaravanHand,
	this.Const.EntityType.CaravanGuard,
	this.Const.EntityType.Militia,
	this.Const.EntityType.MilitiaVeteran,
	this.Const.EntityType.MilitiaCaptain,
	this.Const.EntityType.MilitiaRanged,
	this.Const.EntityType.Slave,
	this.Const.EntityType.Engineer,
	this.Const.EntityType.PeasantSouthern
];
gt.Const.LegendMod.FavoriteNoble <- [
	this.Const.EntityType.Footman,
	this.Const.EntityType.Greatsword,
	this.Const.EntityType.Billman,
	this.Const.EntityType.Arbalester,
	this.Const.EntityType.StandardBearer,
	this.Const.EntityType.Sergeant,
	this.Const.EntityType.LegendFencer,
	this.Const.EntityType.LegendHalberdier,
	this.Const.EntityType.LegendSlinger,
	this.Const.EntityType.Knight
];
gt.Const.LegendMod.FavoriteMercenary <- [
	this.Const.EntityType.Wardog,
	this.Const.EntityType.ArmoredWardog,
	this.Const.EntityType.Mercenary,
	this.Const.EntityType.MercenaryRanged,
	this.Const.EntityType.BountyHunter,
	this.Const.EntityType.Swordmaster,
	this.Const.EntityType.HedgeKnight,
	this.Const.EntityType.MasterArcher
];
gt.Const.LegendMod.FavoriteSoutherners <- [
	this.Const.EntityType.Conscript,
	this.Const.EntityType.Gunner,
	this.Const.EntityType.Officer,
	this.Const.EntityType.Engineer,
	this.Const.EntityType.Assassin,
	this.Const.EntityType.SatoManhunter,
	this.Const.EntityType.SatoManhunterVeteran,
	this.Const.EntityType.Gladiator,
	this.Const.EntityType.PeasantSouthern
];
gt.Const.LegendMod.FavoriteNomad <- [
	this.Const.EntityType.Slave,
	this.Const.EntityType.Gladiator,
	this.Const.EntityType.NomadCutthroat,
	this.Const.EntityType.NomadOutlaw,
	this.Const.EntityType.NomadSlinger,
	this.Const.EntityType.NomadArcher,
	this.Const.EntityType.NomadLeader,
	this.Const.EntityType.DesertStalker,
	this.Const.EntityType.Executioner,
	this.Const.EntityType.DesertDevil,
	this.Const.EntityType.PeasantSouthern
];
gt.Const.LegendMod.GetFavoriteEnemyValue <- function ( _type )
{
	switch(_type)
	{
	case "this.Const.EntityType.Lindwurm":
		this.value = 1;
		break;

	case "this.Const.EntityType.Serpent":
		this.value = 4;
		break;

	case "this.Const.EntityType.LegendStollwurm":
		this.value = 0.3;
		break;

	case "this.Const.EntityType.Alp":
		this.value = 3;
		break;

	case "this.Const.EntityType.LegendDemonAlp":
		this.value = 0.3;
		break;

	case "this.Const.EntityType.LegendGreenwoodSchrat":
		this.value = 0.3;
		break;

	case "this.Const.EntityType.LegendGreenwoodSchratSmall":
		this.value = 5;
		break;

	case "this.Const.EntityType.SandGolem":
		this.value = 1;
		break;

	case "this.Const.EntityType.Schrat":
		this.value = 1;
		break;

	case "this.Const.EntityType.LegendRockUnhold":
		this.value = 0.5;
		break;

	case "this.Const.EntityType.Unhold":
		this.value = 2;
		break;

	case "this.Const.EntityType.UnholdBog":
		this.value = 2;
		break;

	case "this.Const.EntityType.UnholdFrost":
		this.value = 2;
		break;

	case "this.Const.EntityType.Hexe":
		this.value = 2;
		break;

	case "this.Const.EntityType.LegendHexeLeader":
		this.value = 0.5;
		break;

	case "this.Const.EntityType.Spider":
		this.value = 8;
		break;

	case "this.Const.EntityType.SpiderBodyguard":
		this.value = 8;
		break;

	case "this.Const.EntityType.LegendRedbackSpider":
		this.value = 1;
		break;

	case "this.Const.EntityType.Ghoul":
		this.value = 6;
		break;

	case "this.Const.EntityType.LegendSkinGhoul":
		this.value = 2;
		break;

	case "this.Const.EntityType.Hyena":
		this.value = 4;
		break;

	case "this.Const.EntityType.Direwolf":
		this.value = 6;
		break;

	case "this.Const.EntityType.LegendWhiteDirewolf":
		this.value = 0.5;
		break;

	case "this.Const.EntityType.Vampire":
		this.value = 2;
		break;

	case "this.Const.EntityType.LegendVampireLord":
		this.value = 1;
		break;

	case "this.Const.EntityType.SkeletonPriest":
		this.value = 2;
		break;

	case "this.Const.EntityType.SkeletonHeavy":
		this.value = 3;
		break;

	case "this.Const.EntityType.SkeletonMedium":
		this.value = 5;
		break;

	case "this.Const.EntityType.SkeletonLight":
		this.value = 7;
		break;

	case "this.Const.EntityType.Ghost":
		this.value = 4;
		break;

	case "this.Const.EntityType.LegendBanshee":
		this.value = 3;
		break;

	case "this.Const.EntityType.ZombieBoss":
		this.value = 1;
		break;

	case "this.Const.EntityType.ZombieBetrayer":
		this.value = 4;
		break;

	case "this.Const.EntityType.ZombieKnight":
		this.value = 5;
		break;

	case "this.Const.EntityType.ZombieYeoman":
		this.value = 10;
		break;

	case "this.Const.EntityType.Zombie":
		this.value = 20;
		break;

	case "this.Const.EntityType.Necromancer":
		this.value = 3;
		break;

	case "this.Const.EntityType.GoblinWolfrider":
		this.value = 5;
		break;

	case "this.Const.EntityType.GoblinShaman":
		this.value = 3;
		break;

	case "this.Const.EntityType.GoblinLeader":
		this.value = 3;
		break;

	case "this.Const.EntityType.GoblinFighter":
		this.value = 6;
		break;

	case "this.Const.EntityType.GoblinAmbusher":
		this.value = 5;
		break;

	case "this.Const.EntityType.OrcYoung":
		this.value = 6;
		break;

	case "this.Const.EntityType.OrcBerserker":
		this.value = 4;
		break;

	case "this.Const.EntityType.OrcElite":
		this.value = 2;
		break;

	case "this.Const.EntityType.OrcWarlord":
		this.value = 2;
		break;

	case "this.Const.EntityType.OrcBehemoth":
		this.value = 2;
		break;

	case "this.Const.EntityType.OrcWarrior":
		this.value = 3;
		break;

	case "this.Const.EntityType.Militia":
		this.value = 10;
		break;

	case "this.Const.EntityType.MilitiaRanged":
		this.value = 8;
		break;

	case "this.Const.EntityType.MilitiaCaptain":
		this.value = 5;
		break;

	case "this.Const.EntityType.MilitiaVeteran":
		this.value = 7;
		break;

	case "this.Const.EntityType.BountyHunter":
		this.value = 5;
		break;

	case "this.Const.EntityType.Peasant":
		this.value = 25;
		break;

	case "this.Const.EntityType.CaravanHand":
		this.value = 10;
		break;

	case "this.Const.EntityType.CaravanGaurd":
		this.value = 7;
		break;

	case "this.Const.EntityType.Wardog":
		this.value = 12;
		break;

	case "this.Const.EntityType.Mercenary":
	case "this.Const.EntityType.MercenaryRanged":
		this.value = 4;
		break;

	case "this.Const.EntityType.HedgeKnight":
		this.value = 2;
		break;

	case "this.Const.EntityType.MasterArcher":
		this.value = 2;
		break;

	case "this.Const.EntityType.Footman":
		this.value = 5;
		break;

	case "this.Const.EntityType.Greatsword":
		this.value = 4;
		break;

	case "this.Const.EntityType.Swordmaster":
		this.value = 2;
		break;

	case "this.Const.EntityType.Billman":
		this.value = 5;
		break;

	case "this.Const.EntityType.Arbalester":
		this.value = 5;
		break;

	case "this.Const.EntityType.StandardBearer":
		this.value = 4;
		break;

	case "this.Const.EntityType.Sergeant":
		this.value = 3;
		break;

	case "this.Const.EntityType.Knight":
		this.value = 2;
		break;

	case "this.Const.EntityType.BanditRabble":
	case "this.Const.EntityType.BanditRabblePoacher":
		this.value = 30;
		break;

	case "this.Const.EntityType.BanditThug":
		this.value = 15;
		break;

	case "this.Const.EntityType.BanditPoacher":
		this.value = 12;
		break;

	case "this.Const.EntityType.BanditMarksman":
		this.value = 7;
		break;

	case "this.Const.EntityType.BanditRaider":
		this.value = 5;
		break;

	case "this.Const.EntityType.BanditLeader":
		this.value = 3;
		break;

	case "this.Const.EntityType.Warhound":
		this.value = 10;
		break;

	case "this.Const.EntityType.BarbarianThrall":
		this.value = 8;
		break;

	case "this.Const.EntityType.BarbarianMarauder":
		this.value = 4;
		break;

	case "this.Const.EntityType.BarbarianChampion":
		this.value = 3;
		break;

	case "this.Const.EntityType.BarbarianChosen":
		this.value = 2;
		break;

	case "this.Const.EntityType.BarbarianDrummer":
		this.value = 3;
		break;

	case "this.Const.EntityType.BarbarianUnhold":
		this.value = 2;
		break;

	case "this.Const.EntityType.BarbarianUnholdFrost":
		this.value = 2;
		break;

	case "this.Const.EntityType.BarbarianBeastmaster":
		this.value = 5;
		break;

	case "this.Const.EntityType.BarbarianMadman":
		this.value = 1;
		break;

	case "this.Const.EntityType.Conscript":
		this.value = 5;
		break;

	case "this.Const.EntityType.Gunner":
		this.value = 5;
		break;

	case "this.Const.EntityType.Officer":
		this.value = 3;
		break;

	case "this.Const.EntityType.Engineer":
		this.value = 15;
		break;

	case "this.Const.EntityType.Assassin":
		this.value = 3;
		break;

	case "this.Const.EntityType.Slave":
		this.value = 30;
		break;

	case "this.Const.EntityType.Gladiator":
		this.value = 3;
		break;

	case "this.Const.EntityType.NomadCutthroat":
		this.value = 15;
		break;

	case "this.Const.EntityType.NomadOutlaw":
		this.value = 5;
		break;

	case "this.Const.EntityType.NomadSlinger":
		this.value = 12;
		break;

	case "this.Const.EntityType.NomadArcher":
		this.value = 7;
		break;

	case "this.Const.EntityType.NomadLeader":
		this.value = 3;
		break;

	case "this.Const.EntityType.DesertStalker":
		this.value = 2;
		break;

	case "this.Const.EntityType.Executioner":
		this.value = 2;
		break;

	case "this.Const.EntityType.DesertDevil":
		this.value = 2;
		break;

	case "this.Const.EntityType.PeasantSouthern":
		this.value = 25;
		break;

	case "this.Const.EntityType.SatoManhunter":
		this.value = 5;
		break;

	case "this.Const.EntityType.SatoManhunterVeteran":
		this.value = 3;
		break;

	case "this.Const.EntityType.SatoManhunterRanged":
		this.value = 6;
		break;

	case "this.Const.EntityType.SatoManhunterVeteranRanged":
		this.value = 4;
		break;

	case "this.Const.EntityType.SkeletonLich":
		this.value = 0.3;
		break;

	case "this.Const.EntityType.SkeletonLichMirrorImage":
		this.value = 0.5;
		break;

	case "this.Const.EntityType.SkeletonPhylactery":
		this.value = 5;
		break;

	case "this.Const.EntityType.ZombieTreasureHunter":
		this.value = 2;
		break;

	case "this.Const.EntityType.FlyingSkull":
		this.value = 30;
		break;

	default:
		this.value = 10;
	}

	return this.value;
};
gt.Const.LegendMod.SetFavoriteEnemyKill <- function ( _actor, _target )
{
	local favKey = "Enemy" + _target.getType();
	_actor.getLifetimeStats().Tags.increment(favKey, 1);
};
gt.Const.LegendMod.GetFavoriteEnemyStats <- function ( _actor, _types )
{
	if (_actor == null)
	{
		this.Kills = 0;
		this.Strength = 0;
		this.HitChance = 0;
		this.HitMult = 0;
	}

	local kills = 0;
	local str = 0;

	foreach( t in _types )
	{
		local mKills = 0;
		local favKey = "Enemy" + t;
		mKills = _actor.getLifetimeStats().Tags.get(favKey);

		if (mKills && mKills > 0)
		{
			kills = kills + mKills;
			local troop = this.Const.World.Spawn.TroopsMap[t];
			str = str + mKills * troop.Strength;
		}
	}

	local hitChance = this.Math.floor(this.Math.pow(0.3 * str, 0.5));
	local hitMult = 1.0 + hitChance * 1.0 / 100.0;
	return {
		Kills = kills,
		Strength = str,
		HitChance = hitChance,
		HitMult = hitMult
	};
};
gt.Const.LegendMod.FavEnemyPerkMap <- {
	Enemy1 = [],
	function getPerks( _id )
	{
		local key = "Enemy" + _id;

		if (!(key in this))
		{
			return [];
		}

		return this[key];
	}

	function addPerk( _key, _perk )
	{
		local p = this[_key];

		foreach( perk in p )
		{
			if (_perk == perk)
			{
				return;
			}
		}

		p.push(_perk);
	}

	function addEnemies( _enemies, _perk )
	{
		foreach( _e in _enemies )
		{
			local key = "Enemy" + _e;

			if (!(key in this))
			{
				this[key] <- [];
			}

			this.addPerk(key, _perk);
		}
	}

};
gt.Const.LegendMod.GetFavEnemyBossChance <- function ( _id )
{
	if (!this.Const.DLC.Wildmen)
	{
		return 0;
	}

	local perks = this.Const.LegendMod.FavEnemyPerkMap.getPerks(_id);

	if (perks.len() == 0)
	{
		return 0;
	}

	local bonus = 0;
	local roster = this.World.getPlayerRoster().getAll();

	foreach( bro in roster )
	{
		foreach( perk in perks )
		{
			if (!bro.getSkills().hasSkill(perk))
			{
				continue;
			}

			local P = bro.getSkills().getSkillByID(perk);
			local stats = this.Const.LegendMod.GetFavoriteEnemyStats(bro, P.m.ValidTypes);
			bonus = bonus + this.Math.floor(stats.Kills * 1.0 / 10.0);
			break;
		}
	}

	return bonus;
};

