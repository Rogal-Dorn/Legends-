this.legend_drain <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_drain";
		this.m.Name = "Drain Life";
		this.m.Description = "Pull the essence from your foe, and draw it into yourself ";
		this.m.KilledString = "Drained";
		this.m.Icon = "skills/blooddrop_square.png";
		this.m.IconDisabled = "skills/blooddrop_square_bw.png";
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
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local actor = this.getContainer().getActor();
		local CurrentInit = actor.getInitiative();
		local maxHP = actor.getHitpointsMax();
		local heal = maxHP / 10;
		local MinDam =  CurrentInit - 100;
		local MaxDam =  CurrentInit - 90;
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
				text = "Inflicts initiative -100 as damage. Does [color=" + this.Const.UI.Color.DamageValue + "]" + MinDam + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + MaxDam + "[/color] damage. Heals for" + heal + " as 10% of your max health"
			}
		];
	}



	function onUpdate( _properties )
	{
		
		local CurrentInit = this.getContainer().getActor().getInitiative();
		_properties.DamageRegularMin += this.Math.floor(CurrentInit - 100);
		_properties.DamageRegularMax += this.Math.floor(CurrentInit - 90);
	}

	function onUse( _user, _targetTile )
	{

		local actor = this.getContainer().getActor();
		local maxHP = actor.getHitpointsMax();
		local heal = maxHP / 10;
		actor.setHitpoints(this.Math.min(actor.getHitpoints() + heal, maxHP));
		return this.attackEntity(_user, _targetTile.getEntity());
	}

});
