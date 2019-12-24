this.legend_fleshless <- this.inherit("scripts/skills/injury_permanent/permanent_injury", {
	m = {},
	function create()
	{
		this.permanent_injury.create();
		this.m.ID = "injury.legend_fleshless";
		this.m.Name = "Fleshless";
		this.m.Description = "All skin is rotted or torn away, only bones remain";
		this.m.Icon = "ui/injury/injury_permanent_icon_05.png";
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/damaged_received.png",
				text = "Immune to Bleeding, poison and fresh injuries"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/days_wounded.png",
				text = "Heals at 10% normal rate. Requires no food."
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Effected by fatigue at 10% normal rate"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/morale.png",
				text = "Not affected by morale, or allies fleeing or dying"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "Not affected by night"
			}
		];
		this.addTooltipHint(ret);
		return ret;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		actor.m.MoraleState = this.Const.MoraleState.Ignore;

		_properties.IsImmuneToBleeding = true;
		_properties.IsImmuneToPoison = true;
		_properties.IsAffectedByNight = false;
		_properties.IsAffectedByFleeingAllies = false;
		_properties.IsAffectedByDyingAllies = false;
		_properties.IsAffectedByFreshInjuries = false;
		_properties.MoraleEffectMult = 0.1;
		_properties.FatigueEffectMult = 0.1;
		_properties.HitpointsRecoveryRateMult = 0.1;
		_properties.MovementFatigueCostMult = 0.1;
		_properties.DailyWageMult = 0;
		_properties.DailyFood = 0;
	}

	function onApplyAppearance()
	{
		local actor = this.getContainer().getActor();
		local hairColor = this.Const.HairColors.Zombie[this.Math.rand(0, this.Const.HairColors.Zombie.len() - 1)];
		local body = actor.getSprite("body");
		body.setBrush("bust_skeleton_body_0" + this.Math.rand(1, 2));
		body.Saturation = 0.8;
		body.varySaturation(0.2);
		body.varyColor(0.025, 0.025, 0.025);
		actor.getSprite("injury_body").setBrush("bust_skeleton_body_injured");
		local head = actor.getSprite("head");
		head.setBrush("bust_skeleton_head");
		head.Color = body.Color;
		head.Saturation = body.Saturation;

		local hair = actor.getSprite("hair");
		hair.setBrush("hair_" + hairColor + "_" + this.Const.Hair.ZombieOnly[this.Math.rand(0, this.Const.Hair.ZombieOnly.len() - 1)]);
		hair.varyColor(0.02, 0.02, 0.02);

		if (this.Math.rand(1, 100) <= 50)
		{
			local beard = actor.getSprite("beard");
			beard.setBrush("beard_" + hairColor + "_" + this.Const.Beards.ZombieOnly[this.Math.rand(0, this.Const.Beards.ZombieOnly.len() - 1)]);
			beard.Color = hair.Color;

			if (this.doesBrushExist(beard.getBrush().Name + "_top"))
			{
				local sprite = actor.getSprite("beard_top");
				sprite.setBrush(beard.getBrush().Name + "_top");
				sprite.Color = actor.getSprite("hair").Color;
			}
		}

	}

});

