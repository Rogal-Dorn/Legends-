this.legend_nightvision <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_nightvision";
		this.m.Name = "Nightvision";
		this.m.Description = "Use your superior vision to pick out enemies in the dark and point them out to your mercenaries";
		this.m.Icon = "skills/nightvision_square.png";
		this.m.IconDisabled = "skills/nightvision_square_bw.png";
		this.m.Overlay = "nightvision_square";
		this.m.SoundOnUse = [
			"sounds/enemies/shaman_skill_nightvision_01.wav",
			"sounds/enemies/shaman_skill_nightvision_02.wav",
			"sounds/enemies/shaman_skill_nightvision_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.BeforeLast;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 20;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
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
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text =  "Removes night penalties from all allies within [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] tiles"
			}
		];
	}

	function onUse( _user, _targetTile )
	{
		local myTile = _user.getTile();
		local actors = this.Tactical.Entities.getInstancesOfFaction(_user.getFaction());
		local target = _targetTile.getEntity();

		foreach( a in actors)
		{

			if (a.getID() == _user.getID())
			{
				continue;
			}

			if (myTile.getDistanceTo(a.getTile()) > 2)
			{
				continue;
			}

			if (a.getFaction() != _user.getFaction())
			{
				continue
			}

			if (!target.getCurrentProperties().IsAffectedByNight || !target.getSkills().hasSkill("special.night"))
		 	{
				this.spawnIcon("status_effect_98", target.getTile());
				target.getSkills().removeByID("special.night");
		 	}
			
		}

		return true;
	}
});
