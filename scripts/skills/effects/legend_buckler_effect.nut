this.legend_buckler_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_buckler";
		this.m.Name = "Buckler defense";
		this.m.Description = "Bucklers work best against a single opponent, +20 defense divided by the number of opponents within 2 tiles";
		this.m.Icon = "ui/perks/perk_61.png";
		this.m.IconMini = "perk_61_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
	}

	function getTooltip()
	{

		local actor = this.getContainer().getActor();
		local myTile = actor.getTile();
		local myFaction = actor.getFaction();
		local nearbyEnemies = 0;
		local actors = this.Tactical.Entities.getAllInstances();
		local bonus = 5;
		local bonus = 5;
		foreach( i in actors )
		{
			foreach( a in i )
			{

				if (a.getFaction() != myFaction)
				{
					if (ally.getTile().getDistanceTo(myTile) <= 2)
						{
							++nearbyEnemies;
							break;
						}

				}
			}
		}
		if (nearbyEnemies > 0)
		{
		bonus = 20 / nearbyEnemies;
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
				id = 10,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + bonus + "[/color] Melee Defense"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + bonus + "[/color]  Ranged Defense"
			}
		];
	}

	function onUpdate( _properties )
	{
		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			this.m.IsHidden = true;
			return;
		}

		local actor = this.getContainer().getActor();
		local myTile = actor.getTile();
		local myFaction = actor.getFaction();
		local nearbyEnemies = 0;
		local actors = this.Tactical.Entities.getAllInstances();
		local bonus = 5;

		foreach( i in actors )
		{
			foreach( a in i )
			{

				if (a.getFaction() != myFaction)
				{
					if (a.getTile().getDistanceTo(myTile) <= 2)
						{
							++nearbyEnemies;
							break;
						}

				}
			}
		}
		if (nearbyEnemies > 0)
		{
		tbonus = 20 / nearbyEnemies;
		}

		_properties.MeleeSkill += bonus;
		_properties.RangedSkill += bonus;



	}


});
