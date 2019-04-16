this.player_party <- this.inherit("scripts/entity/world/party", {
	m = {
		LastFireTime = 0
	},
	function updateStrength()
	{
		this.m.Strength = 0.0;
		local roster = clone this.World.getPlayerRoster().getAll();

		if (roster.len() > 27)
		{
			roster.sort(this.onLevelCompare);
		}

		local zombieSummonLevel = 0
		local skeletonSummonLevel = 0
		foreach( i, bro in roster )
		{
			if (i >= 27)
			{
				break;
			}

			if (bro.getSkills().hasSkill("perk.legend_spawn_zombie_high"))
			{
				zombieSummonLevel = 7;
			} 
			else if (bro.getSkills().hasSkill("perk.legend_spawn_zombie_med"))
			{
				zombieSummonLevel = 5;
			}
			else if (bro.getSkills().hasSkill("perk.legend_spawn_zombie_low"))
			{
				zombieSummonLevel = 2;
			}

			if (bro.getSkills().hasSkill("perk.legend_spawn_skeleton_high"))
			{
				skeletonSummonLevel = 7;
			} 
			else if (bro.getSkills().hasSkill("perk.legend_spawn_skeleton_med"))
			{
				skeletonSummonLevel = 5;
			}
			else if (bro.getSkills().hasSkill("perk.legend_spawn_skeleton_low"))
			{
				skeletonSummonLevel = 2;
			}

		if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Easy)
			{
			this.m.Strength +=  3 + ((bro.getLevel() / 4) + (bro.getLevel() - 1)) * 1.5;
			}

		else if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Normal)
			{
			this.m.Strength +=  10 + ((bro.getLevel() / 2) + (bro.getLevel() - 1)) * 2;
			}

		else if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Hard)
			{
			this.m.Strength +=  (i / 4) + ((bro.getLevel() / 2) + (pow(bro.getLevel(),1.2)));
			}
		else if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			this.m.Strength +=  (i / 2) + pow(bro.getLevel(),1.2);
			}
		}

		if  (zombieSummonLevel == 0 && skeletonSummonLevel == 0)
		{
			return
		}


		//When playing a warlock build, we need to account for the summons he can add
		local stash = this.World.Assets.getStash().getItems();
	
		local zCount = 0
		local sCount = 0
		foreach (item in stash)
		{
			if (item == null)
			{
				continue;
			}

			switch( item.getID())
			{
				case "spawns.zombie":
					if (zombieSummonLevel == 0)
					{
						continue
					}
					++zCount;
					
					break;
				case "spawns.skeleton":
					if (skeletonSummonLevel == 0)
					{
						continue
					}
					++sCount;
					break;
			}
		}

		if (zCount > 1)
		{
			zCount = this.Math.floor(zCount / 2.0);
			for (local i = 0; i < zCount; i = ++i)
			{
				this.m.Strength += 3 + (((zombieSummonLevel / 2) + (zombieSummonLevel - 1)) * 2.0);
			}
		}
		if (sCount > 1)
		{
			sCount = this.Math.floor(sCount / 2.0);
			for (local i = 0; i < sCount; i = ++i)
			{
				this.m.Strength += 3 + (((skeletonSummonLevel / 2) + (skeletonSummonLevel - 1)) * 2.0);
			}
		}
	}

	function onLevelCompare( _bro1, _bro2 )
	{
		if (_bro1.getLevel() > _bro2.getLevel())
		{
			return -1;
		}
		else if (_bro1.getLevel() < _bro2.getLevel())
		{
			return 1;
		}

		return 0;
	}

	function getStrength()
	{
		return this.m.Strength;
	}

	function setCamping( _c )
	{
		if (_c)
		{
			this.getSprite("body").setBrush("world_player_camp_01");
			this.getSprite("banner").Visible = false;
			this.getSprite("lighting").Visible = true;
		}
		else
		{
			this.World.Assets.updateLook();
			this.getSprite("banner").Visible = true;
			this.getSprite("lighting").Visible = false;
		}
	}

	function spawnFire()
	{
		local smoke = this.Const.World.CampSmokeParticles;

		for( local i = 0; i < smoke.len(); i = i )
		{
			this.World.spawnParticleEffect(smoke[i].Brushes, smoke[i].Delay, smoke[i].Quantity, smoke[i].LifeTime, smoke[i].SpawnRate, smoke[i].Stages, this.createVec(this.getPos().X, this.getPos().Y - 30), -200 + this.Const.World.ZLevel.Particles, true);
			i = ++i;
		}

		local fire = this.Const.World.CampFireParticles;

		for( local i = 0; i < fire.len(); i = i )
		{
			this.World.spawnParticleEffect(fire[i].Brushes, fire[i].Delay, fire[i].Quantity, fire[i].LifeTime, fire[i].SpawnRate, fire[i].Stages, this.createVec(this.getPos().X, this.getPos().Y - 30), -200 + this.Const.World.ZLevel.Particles - 3, true);
			i = ++i;
		}
	}

	function getVisionRadius()
	{
		if (this.World.Assets.isCamping())
		{
			local tent = this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Scout)
			return tent.getVisionRadius();
		}
		return this.m.VisionRadius * this.World.getGlobalVisibilityMult() * this.Const.World.TerrainTypeVisionRadiusMult[this.getTile().Type] * (this.World.Assets.isCamping() ? 0.75 : 1.0);
	}

	function getVisibilityMult()
	{
		return this.World.Assets.isCamping() ? this.m.VisibilityMult * (this.World.getTime().IsDaytime ? 2.0 : 4.0) : this.m.VisibilityMult;
	}

	function create()
	{
		this.m.IsPlayer = true;
		this.m.IsAttackable = true;
		this.m.IsLeavingFootprints = false;
		this.party.create();
		this.m.BaseMovementSpeed = 105;
	}

	function onUpdate()
	{
		this.party.onUpdate();
		this.World.setPlayerPos(this.getPos());
		this.World.setPlayerVisionRadius(this.getVisionRadius());

		if (this.World.Assets.isCamping())
		{
			local lighting = this.getSprite("lighting");

			if (lighting.IsFadingDone)
			{
				if (lighting.Alpha == 0 && this.World.getTime().TimeOfDay >= 4 && this.World.getTime().TimeOfDay <= 7)
				{
					lighting.Color = this.createColor("ffffff00");
					lighting.fadeIn(4000);
				}
				else if (lighting.Alpha != 0 && this.World.getTime().TimeOfDay >= 0 && this.World.getTime().TimeOfDay <= 3)
				{
					lighting.fadeOut(2000);
				}
			}

			if (this.Time.getRealTimeF() - this.m.LastFireTime >= 10.0)
			{
				this.spawnFire();
				this.m.LastFireTime = this.Time.getRealTimeF();
			}
		}

		local brothers = this.World.getPlayerRoster().getAll();
		foreach (bro in brothers)
		{
			if (bro.getSkills().hasSkill("perk.legend_vala_inscribe_weapon") || bro.getSkills().hasSkill("perk.legend_vala_inscribe_helmet") || bro.getSkills().hasSkill("perk.legend_vala_inscribe_armor") || bro.getSkills().hasSkill("perk.legend_vala_inscribe_shield"))
			{
				bro.getSkills().update();
			}
		}
	}


	function onContact()
	{
	}

	function setBaseImage( _version = -1)
	{
		local image = "figure_player_01";
		if (_version > 1)
		{
			image = "figure_player_0" + _version;
		}
		else if (this.World.Tags.get("IsLegendsNoble"))
		{
			image = "figure_player_noble";
		} 
		else if (this.World.Tags.get("IsLegendsCrusader"))
		{
			image = "figure_player_crusader";
		} 
		else if (this.World.Tags.get("IsLegendsHunter"))
		{
			image = "figure_player_ranger";
		} 
		else if (this.World.Tags.get("IsLegendsNecro"))
		{
			image = "figure_player_warlock";
		} 
		else if (this.World.Tags.get("IsLegendsWitch"))
		{
			image = "figure_player_seer";
		} 
		else if (this.World.Tags.get("IsLegendsBerserker"))
		{
			image = "figure_player_berserker";
		} 
		else if (this.World.Tags.get("IsLegendsTrader"))
		{
			image = "figure_player_trader";
		} 
		else if (this.World.Tags.get("IsLegendsParty"))
		{
			image = "figure_player_party";
		} 
		else if (this.World.Tags.get("IsLegendsVala"))
		{
			image = "figure_player_vala";
		} 
		this.logInfo("Setting base image to " + image);
		this.getSprite("body").setBrush(image);
	}

	function onInit()
	{
		this.setFaction(this.Const.FactionType.Player);
		this.party.onInit();
		this.m.VisionRadius = this.Const.World.Settings.Vision;
		this.getSprite("base").setBrush("world_base_01");
		this.getSprite("banner").setBrush(this.World.Assets.getBanner());
		this.setBaseImage();
		local lighting = this.addSprite("lighting");
		this.setSpriteColorization("lighting", false);
		lighting.setBrush("world_player_camp_01_fire");
		lighting.Visible = false;
		lighting.Alpha = 0;
		lighting.IgnoreAmbientColor = true;
		local zoom_banner = this.addSprite("zoom_banner");
		zoom_banner.setBrush(this.World.Assets.getBanner());
		zoom_banner.Alpha = 0;
		this.setSpriteScaling("zoom_banner", false);
	}

	function onFinish()
	{
		this.party.onFinish();
	}

	function onSerialize( _out )
	{
		this.party.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.party.onDeserialize(_in);
		this.getSprite("lighting").Color = this.createColor("ffffff00");
		this.m.LastUpdateTime = this.Time.getVirtualTimeF();
	}

});
