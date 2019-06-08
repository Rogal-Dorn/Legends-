this.legend_fortify_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_fortify_skill";
		this.m.Name = "Fortify";
		this.m.Description = "The shield is raised to a protective stance until next turn, protecting surrounding allies.";
		this.m.Icon = "skills/fortify_square.png";
		this.m.IconDisabled = "skills/fortify_square_bw.png";
		this.m.Overlay = "active_15";
		this.m.SoundOnUse = [
			"sounds/combat/shieldwall_01.wav",
			"sounds/combat/shieldwall_02.wav",
			"sounds/combat/shieldwall_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 20;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local p = this.getContainer().getActor().getCurrentProperties();
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
		local mult = 1.0;

		if (this.getContainer().getActor().getCurrentProperties().IsSpecializedInShields)
		{
			mult = mult * 1.25;
		}

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
				icon = "ui/icons/melee_defense.png",
				text = "Grants [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.Math.floor(item.getMeleeDefense() * mult) + "[/color] Melee Defense for one turn"
			},
			{
				id = 5,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "Grants [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.Math.floor(item.getRangedDefense() * mult) + "[/color] Ranged Defense for one turn"
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "Grants an additional [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Defense against all attacks for yourself and each ally"
			}
		];
	}

	function isUsable()
	{
		return this.skill.isUsable() && !this.getContainer().hasSkill("effects.legend_fortify");
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUse( _user, _targetTile )
	{


		if (!_user.isHiddenToPlayer())
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " uses Fortify");
		}

		local actor = this.getContainer().getActor();

		actor.add(this.new("scripts/skills/effects/legend_fortify_effect"));

		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

		if (item != null && item.isItemType(this.Const.Items.ItemType.Shield))
		{
			item.onShieldUp();
		}

		if (!actor.isPlacedOnMap())
		{
			return 0;
		}

		local myTile = actor.getTile();
		local num = 0;

		for( local i = 0; i != 6; i = ++i )
		{
			if (!myTile.hasNextTile(i))
			{
			}
			else
			{
				local tile = myTile.getNextTile(i);

				if (!tile.IsEmpty && tile.IsOccupiedByActor && this.Math.abs(myTile.Level - tile.Level) <= 1)
				{
					local entity = tile.getEntity();

					if (actor.getFaction() == entity.getFaction())
					{

						entity.add(this.new("scripts/skills/effects/legend_fortify_effect"));
					}
				}
			}

		return true;
		return false;
	}

	function onRemoved()
	{
		this.m.Container.removeByID("effects.legend_fortify");
	}
	}
});

