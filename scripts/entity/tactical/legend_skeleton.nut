this.legend_skeleton <- this.inherit("scripts/entity/tactical/skeleton", {
	m = {
		Item = null,
		SpawnType = null
	},

	function create()
	{
		this.m.IsControlledByPlayer = true;
		this.m.Type = this.Const.EntityType.SkeletonLight;
		this.skeleton.create();
		this.m.ResurrectWithScript = "";
		this.m.IsResurrectingOnFatality = false;
		this.m.AIAgent = this.new("scripts/ai/tactical/idle_agent");
		this.m.AIAgent.setActor(this);
		this.m.IsSummoned = true;
	}

	function isGuest()
	{
		return false;
	}

	function addXP(_xp)
    {
        
    }

	function onInit()
	{
		this.actor.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.m.SpawnType);
		b.IsAffectedByNight = false;
		b.IsAffectedByInjuries = false;
		b.IsImmuneToBleeding = true;
		b.IsImmuneToPoison = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;

		local hairColor = this.Const.HairColors.Zombie[this.Math.rand(0, this.Const.HairColors.Zombie.len() - 1)];
		this.addSprite("socket").setBrush("bust_base_undead");
		local body = this.addSprite("body");

		if (this.Math.rand(1, 2) == 1)
		{
			body.setBrush("bust_skeleton_body_0" + this.Math.rand(1, 2));
		}
		else
		{
			body.setBrush("bust_skeleton_body_01");
		}

		body.setHorizontalFlipping(true);
		body.Saturation = 0.8;

		if (this.Math.rand(0, 100) < 75)
		{
			body.varySaturation(0.2);
		}

		if (this.Math.rand(0, 100) < 90)
		{
			body.varyColor(0.025, 0.025, 0.025);
		}

		this.m.BloodColor = body.Color;
		this.m.BloodSaturation = body.Saturation;
		this.addSprite("body_injury").setBrush("bust_skeleton_body_injured");
		this.addSprite("armor");
		local head = this.addSprite("head");
		head.setBrush("bust_skeleton_head");
		head.Color = body.Color;
		head.Saturation = body.Saturation;
		local injury = this.addSprite("injury");
		injury.setBrush("bust_skeleton_head_injured");
		local beard = this.addSprite("beard");
		beard.varyColor(0.02, 0.02, 0.02);

		if (this.Math.rand(1, 100) <= 25)
		{
			beard.setBrush("beard_" + hairColor + "_" + this.Const.Beards.ZombieOnly[this.Math.rand(0, this.Const.Beards.ZombieOnly.len() - 1)]);
		}

		local face = this.addSprite("face");
		face.setBrush("bust_skeleton_face_0" + this.Math.rand(1, 6));
		local hair = this.addSprite("hair");
		hair.setHorizontalFlipping(true);
		hair.Color = beard.Color;

		if (this.Math.rand(1, 100) <= 50)
		{
			hair.setBrush("hair_" + hairColor + "_" + this.Const.Hair.ZombieOnly[this.Math.rand(0, this.Const.Hair.ZombieOnly.len() - 1)]);
		}

		this.setSpriteOffset("hair", this.createVec(0, -3));
		this.addSprite("helmet");
		this.addSprite("helmet_damage");
		local beard_top = this.addSprite("beard_top");

		if (beard.HasBrush && this.doesBrushExist(beard.getBrush().Name + "_top"))
		{
			beard_top.setBrush(beard.getBrush().Name + "_top");
			beard_top.Color = beard.Color;
		}

		local body_blood = this.addSprite("body_blood");
		body_blood.setBrush("bust_body_bloodied_02");
		body_blood.setHorizontalFlipping(true);
		body_blood.Visible = false;
		local body_dirt = this.addSprite("dirt");
		body_dirt.setBrush("bust_body_dirt_02");
		body_dirt.setHorizontalFlipping(true);
		body_dirt.Visible = this.Math.rand(1, 100) <= 33;
		this.addDefaultStatusSprites();
		this.getSprite("status_rooted").Scale = 0.55;
		this.m.Skills.add(this.new("scripts/skills/racial/skeleton_racial"));
		this.m.Skills.add(this.new("scripts/skills/special/double_grip"));
		this.m.Skills.add(this.new("scripts/skills/actives/hand_to_hand"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_pathfinder"));
	}

	function setItem( _i )
	{
		if (typeof _i == "instance")
		{
			this.m.Item = _i;
			return 
		}
		
		this.m.Item = this.WeakTableRef(_i);
	}

	function setVariant( _v )
	{
		
	}


    function isReallyKilled(_fatalityType)
	{
		return false;
	}


    function onActorKilled( _actor, _tile, _skill )
	{
		this.actor.onActorKilled(_actor, _tile, _skill);
		local XPkiller = this.Math.floor(_actor.getXPValue() * this.Const.XP.XPForKillerPct);
		local XPgroup = _actor.getXPValue() * (1.0 - this.Const.XP.XPForKillerPct);
        
        local summoner = getTags().get("Summoner");
        if (summoner != null)
        {
            summoner.addXP(this.Math.floor(XPkiller * 0.50));
        }
		
        local brothers = this.Tactical.Entities.getInstancesOfFaction(this.Const.Faction.Player);

		if (brothers.len() == 1)
		{
			this.addXP(XPgroup);
		}
		else
		{
			foreach( bro in brothers )
			{
				bro.addXP(this.Math.max(1, this.Math.floor(XPgroup / brothers.len())));
			}
		}
	}

});
