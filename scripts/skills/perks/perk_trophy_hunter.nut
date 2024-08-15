this.perk_trophy_hunter <- this.inherit("scripts/skills/skill", {
	m = {
		factionKills <- {
			Bandits = 0,
			Beasts = 0,
			Civilization = 0,
			Goblins = 0,
			Orcs = 0,
			Undead = 0
		}
	},
	function create()
	{
		this.m.ID = "perk.trophy_hunter";
		this.m.Name = this.Const.Strings.PerkName.TrophyHunter;
		this.m.Description = this.Const.Strings.PerkDescription.TrophyHunter;
		this.m.Icon = "skills/passive_03.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getTooltip()
	{
		local bonus = this.m.bonus;
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
				id = 6,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.factionKills.Bandits + "[/color] Fatigue from Outlaw trophies collected"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.factionKills.Goblins + "[/color] Initiative from Goblin trophies collected"
			},
			{
				id = 8,
				type = "text",
				icon = "ui/icons/health.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.factionKills.Orcs + "[/color] Hitpoints from Orc trophies collected"
			},
			{
				id = 9,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.factionKills.Undead + "[/color] Resolve from Undead trophies collected"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Reduces the Resolve of any opponent engaged in melee by [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.factionKills.Beasts + "[/color] from Beast trophies collected"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.factionKills.Civilization + "%[/color] Damage from Human trophies collected"
			}
		];
		foreach
	}

	function onTargetKilled( _targetEntity, _skill )
	{
		local faction = _targetEntity.getFaction();
		if (_skill != this)
		{
			return;
		}

		if (!this.isKindOf(_targetEntity, "player"))
		{
			return;
		}

		switch (true)
		{
			case this.m.factionKills.Bandits < 5;
			case faction == this.Const.FactionType.Bandits:
			case faction == this.Const.FactionType.Barbarians:
			case faction == this.Const.FactionType.OrientalBandits:
				this.m.factionKills.Bandits += 1;
				return;
			case this.m.factionKills.Beasts < 5;
			case faction == this.Const.FactionType.Beasts:
				this.m.factionKills.Beasts += 1;
				return;
			case this.m.factionKills.Goblins < 5;
			case faction == this.Const.FactionType.Goblins:
				this.m.factionKills.Goblins += 1;
				return;
			case this.m.factionKills.Orcs < 5;
			case faction == this.Const.FactionType.Orcs:
				this.m.factionKills.Orcs += 1;
				return;
			case this.m.factionKills.Undead < 5;
			case faction == this.Const.FactionType.Undead:
			case faction == this.Const.FactionType.Zombies:
				this.m.factionKills.Undead += 1;
				return;
			case this.m.factionKills.Civilization < 5;
			case faction == this.Const.FactionType.OrientalCityState:
			case faction == this.Const.FactionType.Settlement:
			case faction == this.Const.FactionType.NobleHouse:
			case faction == this.Const.FactionType.Generic:
				this.m.factionKills.Civilization += 1;
				return;
		
			default:
				return;
		}
	}

	function onUpdate( _properties )
	{
		_properties.Fatigue += this.m.factionKills.Bandits;
		_properties.Hitpoints += this.m.factionKills.Orcs;
		_properties.Bravery += this.m.factionKills.Undead;
		_properties.Initiative += this.m.factionKills.Goblins;
		_properties.Threat += this.m.factionKills.Beasts;
		_properties.DamageTotalMult *= (1.00 + 0.01 * this.m.factionKills.Civilization);
	}
});

