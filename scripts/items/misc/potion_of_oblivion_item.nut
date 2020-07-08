this.potion_of_oblivion_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.m.ID = "misc.potion_of_oblivion";
		this.m.Name = "Potion of Oblivion";
		this.m.Description = "Better not ask how this concoction of the rarest and most bizarre ingredients tastes! Anybody who drinks this is said to be able to relive his life, changing the decisions he made along the way.";
		this.m.Icon = "consumables/potion_08.png";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Usable;
		this.m.IsDroppedAsLoot = true;
		this.m.IsAllowedInBag = false;
		this.m.IsUsable = true;
		this.m.Value = 2500;
	}

	function getTooltip()
	{
		local result = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
		result.push({
			id = 66,
			type = "text",
			text = this.getValueString()
		});

		if (this.getIconLarge() != null)
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIconLarge(),
				isLarge = true
			});
		}
		else
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIcon()
			});
		}

		result.push({
			id = 65,
			type = "text",
			text = "Right-click or drag onto the currently selected character in order to drink. This item will be consumed in the process."
		});
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
	}

	function onUse( _actor, _item = null )
	{
		this.Sound.play("sounds/combat/drink_03.wav", this.Const.Sound.Volume.Inventory);
		
		local perks =  0;
		local skills = _actor.getSkills();
		
		foreach( skill in skills.m.Skills)
		{
			if (!skill.isGarbage() && skill.isType(this.Const.SkillType.Perk) && !skill.isType(this.Const.SkillType.Racial))
			{
				perks += 1;
			}
		}
		
		perks = perks+_actor.m.PerkPoints;
		this.logDebug("perks before: "+ perks);
		local hasStudent = false;
		local hasGifted = false;

		if (_actor.getSkills().hasSkill("perk.student") && _actor.getLevel() >= 11)
		{
			perks = perks - 1;
			hasStudent = true;
		}
		if (_actor.getSkills().hasSkill("perk.gifted"))
		{
			perks = perks - 1;
			hasGifted = true;
		}


		_actor.m.PerkPoints = perks;
		_actor.m.PerkPointsSpent = 0;
		_actor.getSkills().removeByType(this.Const.SkillType.Perk);
		
		if (this.World.Assets.getOrigin().getID() == "scenario.legends_rangers")
		{
			if (_actor.getBackground().getID() == "background.legend_commander_ranger")
			{
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_pathfinder"));
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_footwork"));
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_roster_2"));
				perks = perks - 3;
			}
			else
			{
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_pathfinder"));
				perks = perks - 1;
			}
		}
		else if (this.World.Assets.getOrigin().getID() == "scenario.legends_assassin")
		{
			if (_actor.getBackground().getID() == "background.legend_commander_assassin")
			{
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_backstabber"));
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_hidden"));
				perks = perks - 2;
			}
			else
			{
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_hidden"));
				perks = perks - 1;
			}
		}
		else if (this.World.Assets.getOrigin().getID() == "scenario.legends_berserker")
		{
			if (_actor.getBackground().getID() == "background.legend_commander_berserker")
			{
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_berserk"));
				perks = perks - 1;
			}
			else
			{
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_berserk"));
				perks = perks - 1;
			}
		}
		else if (this.World.Assets.getOrigin().getID() == "scenario.legends_crusader")
		{
			if (_actor.getBackground().getID() == "background.legend_commander_crusader")
			{
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_fortified_mind"));
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_rebound"));
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_roster_1"));
				perks = perks - 3;
			}
			else
			{
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_fortified_mind"));
				perks = perks - 1;
			}
		}
		else if (this.World.Assets.getOrigin().getID() == "scenario.legends_necro")
		{
			if (_actor.getBackground().getID() == "background.legend_commander_necro")
			{
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_roster_1"));

				if (this.Const.LegendMod.Configs.LegendMagicEnabled())
				{
					_actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_brink_of_death"));
					_actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_siphon"));
					perks = perks - 2;
				}
				perks = perks - 1;
			}
			else
			{
				if (_actor.getSkills().hasSkill("injury.legend_rotten_flesh"))
				{
					_actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_zombie_bite"));
					perks = perks - 1;
				}
			}
		}
		else if (this.World.Assets.getOrigin().getID() == "scenario.legends_noble")
		{
			if (_actor.getBackground().getID() == "background.legend_commander_noble")
			{
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_rotation"));
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_roster_2"));
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_roster_4"));
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_rally_the_troops"));
				perks = perks - 4;
			}
			else
			{
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_rotation"));
				perks = perks - 1;
			}
		}
		else if (this.World.Assets.getOrigin().getID() == "scenario.legends_seer")
		{
			if (_actor.getBackground().getID() == "background.legend_commander_witch")
			{
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_daze"));
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_roster_1"));

				if (this.Const.LegendMod.Configs.LegendMagicEnabled())
				{
					_actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_magic_missile"));
					perks = perks - 1;
				}
				perks = perks - 2;
			}
			if (_actor.getLevel() < 11)
			{
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_student"));
				perks = perks - 1;
			}
		}
		else if (this.World.Assets.getOrigin().getID() == "scenario.legends_sisterhood")
		{
			if (_actor.getBackground().getID() == "background.legend_commander_vala")
			{
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_roster_1"));
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_hold_out"));
				perks = perks - 2;
			}
			else
			{
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_hold_out"));
				perks = perks - 1;
			}
		}
		else if (this.World.Assets.getOrigin().getID() == "scenario.trader")
		{
			 if (!_actor.getBackground().isCombatBackground())
			{
				_actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_pacifist"));
				perks = perks - 1;
			}
		}
		if (_actor.getBackground().getID() == "background.legend_witch" && this.Const.LegendMod.Configs.LegendMagicEnabled())
		{
			_actor.getSkills().add(this.new("scripts/skills/perks/perk_legend_magic_missile"));
			perks = perks - 1;
		}
		
		_actor.m.PerkPoints = perks;
		
		if (hasStudent)
		{
			_actor.m.PerkPointsSpent += 1;
			_actor.getSkills().add(this.new("scripts/skills/perks/perk_student"));
		}
		if (hasGifted)
		{
			_actor.m.PerkPointsSpent += 1;
			_actor.getSkills().add(this.new("scripts/skills/perks/perk_gifted"));
		}

		this.Const.Tactical.Common.checkDrugEffect(_actor);
		this.updateAchievement("MemoryLoss", 1, 1);
		return true;
	}

});

