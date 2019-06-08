this.legend_buckler_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_buckler";
		this.m.Name = "Buckler defense";
		this.m.Description = "Bucklers work best against a single opponent, +15 Melee and +5 Range defense when only one opponent within 1 tile";
		this.m.Icon = "ui/perks/perk_02.png";
		//this.m.IconMini = "perk_02_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
	}

	function isHidden()
	{
		return this.getBonus() == 0
	}

	function getBonus()
	{
		local actor = this.getContainer().getActor();
		local myTile = actor.getTile();
		local myFaction = actor.getFaction();
		local nearbyEnemies = 0;
		if (!("Entities" in this.Tactical))
		{
			return 15;
		}
		local actors = this.Tactical.Entities.getAllInstances();
		local bonus = 0;
		foreach( i in actors )
		{
			foreach( a in i )
			{
				if (a.getFaction() == myFaction)
				{
					continue
				}

				if (a.getTile().getDistanceTo(myTile) > 1)
				{
					continue;
				}
				++nearbyEnemies;
			}
		}

		if (nearbyEnemies > 1)
		{
			return 0;
		}

		return 15;
	}

	function getTooltip()
	{
		local bonus = this.getBonus();
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
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Melee Defense"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus / 3 + "[/color]  Ranged Defense"
			}
		];
	}

	function onUpdate( _properties )
	{
		local bonus = this.getBonus();
		_properties.MeleeSkill += bonus;
		_properties.RangedSkill += bonus / 3;
	}


});
