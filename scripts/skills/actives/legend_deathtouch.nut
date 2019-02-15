this.legend_deathtouch <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_deathtouch";
		this.m.Name = "Death Touch";
		this.m.Description = "Your fingers turn ghostly and pass through steel and flesh, tearing at the soul of your victim ";
		this.m.KilledString = "Frightened to death";
		this.m.Icon = "skills/deathtouch_square.png";
		this.m.IconDisabled = "skills/deathtouch_square_bw.png";
		this.m.Overlay = "active_42";
		this.m.SoundOnUse = [
			"sounds/enemies/ghastly_touch_01.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.DirectDamageMult = 1.0;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 10;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

		function getTooltip()
	{
		local p = this.getContainer().getActor().getCurrentProperties();
		return [
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
				id = 3,
				type = "text",
				text = this.getCostString()
			},
			{
				id = 4,
				type = "text",
				icon = "/ui/tooltips/heart.png",
				text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + p.DamageRegularMin + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + p.DamageRegularMax + "[/color] damage, ignores armor"
			}
		];
	}



	function onUpdate( _properties )
	{
		_properties.DamageRegularMin += 15;
		_properties.DamageRegularMax += 25;
		_properties.IsIgnoringArmorOnAttack = true;
	}

	function onUse( _user, _targetTile )
	{
		return this.attackEntity(_user, _targetTile.getEntity());
	}

});
