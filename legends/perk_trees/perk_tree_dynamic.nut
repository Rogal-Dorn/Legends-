::Legends.Class.PerkTreeDynamic <- class extends ::Legends.Class.PerkTree
{
	DynamicPerkTreeMap = null;
	Player = null;
	Mins = null;
	LocalMap = null;
	Traits = null;
	OrderOfAssignment = ["Profession", "Enemy", "Traits", "Class", "Defense", "Weapon", "Styles"];

	constructor( _player, _map, _mins = null )
	{
		base.constructor();
		if (!::MSU.isKindOf(_player, "player")) throw ::MSU.Exception.InvalidType(_player);
		this.Player = ::MSU.asWeakTableRef(_player);
		this.DynamicPerkTreeMap = _map;
		if (_mins == null) this.Mins = {};
		else this.setMins(_mins);
	}

	function getMins()
	{
		return this.Mins;
	}

	function setMins( _mins )
	{
		this.Mins = _mins;
	}

	function build()
	{
		this.LocalMap = {};

		if (!("PerkGroupMultipliers" in this.Player.getBackground().m))
		{
			this.DynamicPerkTreeMap = {};
			this.Player.getBackground().m.PerkGroupMultipliers <- [];

			foreach (categoryName, perkGroups in this.DynamicPerkTreeMap)
			{
				local PTRCategory = [];
				foreach (perkGroup in perkGroups)
				{
					switch (perkGroup.ID)
					{
						case "InspirationalTree":
							PTRCategory.push(::Const.Perks.SergeantClassTree);
							break;

						case "MartyrTree":
							PTRCategory.push(::Const.Perks.ResilientTree);
							break;

						default:
							PTRCategory.push(perkGroup);
					}
				}

				this.DynamicPerkTreeMap[categoryName] <- PTRCategory;
			}
		}

		foreach (categoryName, perkGroupContainers in this.DynamicPerkTreeMap)
		{
			foreach (container in perkGroupContainers)
			{
				if (typeof treeContainer != "instance" || (!(treeContainer instanceof ::Legends.Class.PerkGroup) && !(treeContainer instanceof ::MSU.Class.WeightedContainer)))
				{
					::logError("Background " + this.Player.getBackground().getID() + " has wrongly formatted dynamic perk tree -- Category: " + categoryName);
				}
			}
		}

		this.Traits = this.Player == null ? null : this.Player.getSkills().getSkillsByFunction(@(skill) skill.m.Type == ::Const.SkillType.Trait);

		foreach (categoryName in this.OrderOfAssignment)
		{
			if (!(categoryName in this.LocalMap))
			{
				this.LocalMap[categoryName] <- [];
			}

			if (categoryName in this.DynamicPerkTreeMap)
			{
				local exclude = array(this.LocalMap[categoryName].len());
				foreach (i, tree in this.LocalMap[categoryName])
				{
					exclude[i] = tree.ID;
				}

				foreach (treeContainer in this.DynamicPerkTreeMap[categoryName])
				{
					local tree;

					if (treeContainer instanceof ::Legends.Class.PerkGroup)
					{
						tree = treeContainer;
					}
					else
					{
						if (treeContainer.len() == 1)
						{
							tree = treeContainer.rand();
						}
						else
						{
							this.__applyMultipliers(treeContainer);

							tree = treeContainer.roll();

							if (tree == ::Const.Perks.RandomTree)
							{
								tree = this.__getWeightedRandomTreeFromCategory(categoryName, exclude);
							}
							else if (tree == null) tree = ::Const.Perks.NoTree;
						}
					}

					this.LocalMap[categoryName].push(tree);
					if (tree.ID != ::Const.Perks.NoTree.ID) exclude.push(tree.ID);
				}
			}

			if (categoryName in this.Mins)
			{
				if (categoryName == "Styles")
				{
					local hasRangedWeaponTree = false;
					local hasMeleeWeaponTree = false;
					foreach (tree in this.LocalMap.Weapon)
					{
						if (!hasRangedWeaponTree && this.Const.Perks.RangedWeaponTrees.Tree.find(tree) != null)
						{
							hasRangedWeaponTree = true;
							continue;
						}
						if (!hasMeleeWeaponTree && this.Const.Perks.MeleeWeaponTrees.Tree.find(tree) != null)
						{
							hasMeleeWeaponTree = true;
						}
					}

					if (!hasRangedWeaponTree)
					{
						this.Player.getBackground().m.PerkGroupMultipliers.push([0, ::Const.Perks.RangedTree]);
					}
					if (!hasMeleeWeaponTree)
					{
						this.Player.getBackground().m.PerkGroupMultipliers.push([0, ::Const.Perks.OneHandedTree]);
						this.Player.getBackground().m.PerkGroupMultipliers.push([0, ::Const.Perks.TwoHandedTree]);
					}
				}

				local exclude = array(this.LocalMap[categoryName].len());
				foreach (i, tree in this.LocalMap[categoryName])
				{
					exclude[i] = tree.ID;
				}

				local r = ::Math.rand(0, 100);
				for (local i = this.LocalMap[_categoryName].len(); i < _mins[_categoryName]; i++)
				{
					if (_categoryName == "Enemy")
					{
						if ((i == 0 && r > ::Const.Perks.PerkTreeMinsChances.Enemy1) || (i == 1 && r > ::Const.Perks.PerkTreeMinsChances.Enemy2) || (i == 2 && r > ::Const.Perks.PerkTreeMinsChances.Enemy3))
						{
							continue;
						}
					}

					if (_categoryName == "Magic" && r > _mins.MagicChance * 100.0)
					{
						continue;
					}

					local t = this.__getWeightedRandomTreeFromCategory(_categoryName, exclude);
					this.LocalMap[categoryName].push(t);
					exclude.push(t.ID);
				}
			}
		}

		local dynamicTree = array(11);

		foreach (category in this.LocalMap)
		{
			foreach (tree in category)
			{
				foreach (rowNumber, perksInRow in tree.getTree())
				{
					dynamicTree[rowNumber] = array(perksInRow.len());
					foreach (i, perk in perksInRow)
					{
						dynamicTree[rowNumber][i] = perk;
					}
				}
			}
		}

		foreach (perk in ::Const.Perks.SpecialTrees.Perks)
		{
			local chance = perk.Func(this.Player, perk.Chance);

			if (chance == 0) continue;

			foreach (multiplier in this.Player.getBackground().m.SpecialPerkMultipliers)
			{
				if (multiplier[1] == perk.Perk)
				{
					chance *= multiplier[0];
					break;
				}
			}

			if (chance == 0) continue;

			foreach (trait in characterTraits)
			{
				foreach (multiplier in trait.m.SpecialPerkMultipliers)
				{
					if (multiplier[1] == perk.Perk)
					{
						chance *= multiplier[0];
						break;
					}
				}
			}

			if (chance == 0) continue;

			foreach (category in this.LocalMap)
			{
				foreach (tree in category)
				{
					if ("SpecialPerkMultipliers" in tree)
					{
						foreach (multiplier in tree.SpecialPerkMultipliers)
						{
							if (multiplier[1] == perk.Perk)
							{
								chance *= multiplier[0];
								break;
							}
						}
					}
				}
			}

			if (chance < 0 || ::Math.rand(1, 100) <= chance)
			{
				local hasRow = false;
				local direction = -1;
				local row = perk.Row;

				while (row >= 0 && row <= 6)
				{
					if (dynamicTree[row].len() < 13)
					{
						hasRow = true;
						break;
					}

					row += direction;

					if (row == -1)
					{
						row = perk.Row;
						direction = 1;
					}
				}

				row = hasRow ? this.Math.max(0, this.Math.min(row, 6)) : perk.Row;

				dynamicTree[row].push(perk.Perk);
			}
		}

		local attributes = ::Const.Perks.TraitsTrees.getBaseAttributes();
		foreach (tree in this.LocalMap.Traits)
		{
			if ("Attributes" in tree)
			{
				local c = tree.Attributes;
				attributes.Hitpoints[0] += c.Hitpoints[0];
				attributes.Hitpoints[1] += c.Hitpoints[1];
				attributes.Bravery[0] += c.Bravery[0];
				attributes.Bravery[1] += c.Bravery[1];
				attributes.Stamina[0] += c.Stamina[0];
				attributes.Stamina[1] += c.Stamina[1];
				attributes.MeleeSkill[0] += c.MeleeSkill[0];
				attributes.MeleeSkill[1] += c.MeleeSkill[1];
				attributes.MeleeDefense[0] += c.MeleeDefense[0];
				attributes.MeleeDefense[1] += c.MeleeDefense[1];
				attributes.RangedSkill[0] += c.RangedSkill[0];
				attributes.RangedSkill[1] += c.RangedSkill[1];
				attributes.RangedDefense[0] += c.RangedDefense[0];
				attributes.RangedDefense[1] += c.RangedDefense[1];
				attributes.Initiative[0] += c.Initiative[0];
				attributes.Initiative[1] += c.Initiative[1];
			}
		}

		this.LocalMap = null;

		this.__build(dynamicTree);

		return attributes;
	}

	function __applyMultipliers( _perkGroupContainer )
	{
		local multipliers = clone this.Player.getBackground().m.PerkGroupMultipliers;

		foreach (category in this.LocalMap)
		{
			foreach (perkGroup in category)
			{
				if ("PerkGroupMultipliers" in perkGroup)
				{
					multipliers.extend(perkGroup.PerkGroupMultipliers);
				}
			}
		}

		local weapon = this.Player.getMainhandItem();
		if (weapon != null)
		{
			local perkGroups = [];

			foreach (weaponTypeName, weaponType in ::Const.Items.WeaponType)
			{
				local perkGroupName = weaponTypeName + "Tree";
				if (weapon.isWeaponType(weaponType) && (perkGroupName in ::Const.Perks))
				{
					perkGroups.push(::Const.Perks[perkGroupName]);
				}
			}

			if (perkGroups.len() > 0)
			{
				multipliers.push([[-1, ::MSU.Array.rand(perkGroups)]]);
			}
		}

		if (this.Player.getTalents().len() > 0)
		{
			local talents = this.Player.getTalents();

			for (local attribute = 0; attribute < this.Const.Attributes.COUNT; attribute++)
			{
				if (talents[attribute] == 0) continue;

				foreach (mult in ::Const.Perks.TalentMultipliers[attribute])
				{
					multipliers.push(
						[mult[0] < 1 ? mult[0] / talents[attribute] : mult[0] * talents[attribute], mult[1]]
					);
				}
			}
		}

		if (this.Traits != null)
		{
			foreach (trait in this.Traits)
			{
				multipliers.extend(trait.m.PerkGroupMultipliers);
			}
		}

		foreach (multiplier in multipliers)
		{
			local perkGroup = multiplier[1];
			if (_perkGroupContainer.contains(perkGroup)) _perkGroupContainer.setWeight(perkGroup, _perkGroupContainer.getWeight(perkGroup) * multiplier[0]);
		}
	}

	function __getWeightedRandomTreeFromCategory ( _categoryName, _exclude = null )
	{
		local potentialTrees = ::MSU.Class.WeightedContainer();

		foreach (tree in gt.Const.Perks[_categoryName + "Trees"].Tree)
		{
			if (_exclude != null && _exclude.find(tree.ID) != null)	continue;

			local weight = 1;
			if ("SelfWeightMultiplier" in tree)
			{
				weight *= tree.SelfWeightMultiplier;
			}

			potentialTrees.add(tree, weight);
		}

		if (potentialTrees.len() != 0)
		{
			this.__applyMultipliers(potentialTrees);
		}

		local tree = potentialTrees.roll();
		return tree != null ? tree : ::Const.Perks.NoTree;
	}
}
