this.legend_drums_of_life_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_drums_of_life";
		this.m.Name = "Song of Life";
		this.m.Description = "Push allies on with your music, restoring the health of all allies within 8 tiles by 4 hp. Must be holding a musical instrument or empty handed to use.";
		this.m.Icon = "ui/perks/drums_of_life_square.png";
		this.m.IconDisabled = "ui/perks/drums_of_life_square_bw.png";
		this.m.Overlay = "active_163";
		this.m.SoundOnUse = [
			"sounds/enemies/dlc4/wardrums_01.wav",
			"sounds/enemies/dlc4/wardrums_02.wav",
			"sounds/enemies/dlc4/wardrums_03.wav"
		];
		this.m.SoundVolume = 1.5;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = true;
		this.m.IsAttack = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
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
				id = 3,
				type = "text",
				text = this.getCostString()
			}
		];
		return ret;
	}
	
	function isUsable()
	{
		local mainhand = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		return (mainhand == null || mainhand.getID() == "weapon.lute" || mainhand.getID() == "weapon.named_lute" || mainhand.getID() == "weapon.legend_drum"  || mainhand.getID() == "weapon.legend_drum") && this.skill.isUsable();
	}

	function onUse( _user, _targetTile )
	{
		local myTile = _user.getTile();
		local actors = this.Tactical.Entities.getInstancesOfFaction(_user.getFaction());

		foreach( a in actors )
		{
			if (a.getID() == _user.getID())
			{
				continue;
			}

			// if (a.getFatigue() == 0)
			// {
			// 	continue;
			// }

			if (myTile.getDistanceTo(a.getTile()) > 8)
			{
				continue;
			}

			if (a.getFaction() == _user.getFaction())
			{
				a.getSkills().add(this.new("scripts/skills/effects/legend_drums_of_life_effect"));
			}
		}

		this.getContainer().add(this.new("scripts/skills/effects/legend_drums_of_life_effect"));
		return true;
	}

});

