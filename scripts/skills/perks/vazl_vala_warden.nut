this.vazl_vala_warden <- this.inherit("scripts/skills/skill", {
	m = {
		WardenSummonSpent = false,
		WardenEntity = null
	},
	function create()
	{
		this.m.ID = "perk.vazl_vala_warden";
		this.m.Name = "Warden";
		this.m.Description = "Manifestation of the Vala's warden.";
		this.m.Icon = "ui/perks/vazl_vala_warden.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsSerialized = true;
		this.m.IsActive = false;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}


	function isHidden()
	{
		if (this.m.WardenEntity == null)
		{
			return true;
		}
		else
		{
			return false;
		}
	}


	function getTooltip()
	{
		if (!this.isHidden())
		{
			local WardenHitpoints = this.Math.round(this.m.WardenEntity.m.CurrentProperties.Hitpoints);
			local WardenMeleeSkill = this.Math.round(this.m.WardenEntity.m.CurrentProperties.MeleeSkill);
			local WardenMeleeDefense = this.Math.round(this.m.WardenEntity.m.CurrentProperties.MeleeDefense);
			local WardenRangedSkill = this.Math.round(this.m.WardenEntity.m.CurrentProperties.RangedSkill);
			local WardenRangedDefense = this.Math.round(this.m.WardenEntity.m.CurrentProperties.RangedDefense);
			local WardenInitiative = this.Math.round(this.m.WardenEntity.m.CurrentProperties.Initiative);
			local SpiritualBondReduction = this.Math.round(10 + (this.getContainer().getActor().getCurrentProperties().Bravery / 4));

			if (SpiritualBondReduction >= 50)
			{
				SpiritualBondReduction = 50;
			}

			local tooltip =
			[
				{
					id = 1,
					type = "title",
					text = this.getName()
				}
			];

			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = this.getContainer().getActor().m.Name + "\'s Warden is present and has the following attributes:\n\nMaximum hitpoints " + WardenHitpoints + "\nMelee skill " + WardenMeleeSkill + "\nMelee defense " + WardenMeleeDefense + "\nRanged skill " + WardenRangedSkill + "\nRanged defense " + WardenRangedDefense + "\nInitiative " + WardenInitiative
			});

			tooltip.push({
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "The Warden has the Steel Brow and Anticipation perks."
			});

			if (this.getContainer().getActor().getSkills().hasSkill("perk.vazl_vala_spiritual_bond"))
			{
				if (this.getContainer().getActor().getSkills().hasSkill("effects.vazl_vala_spiritual_bond_effect"))
				{
					tooltip.push({
						id = 8,
						type = "text",
						icon = "ui/icons/special.png",
						text = "The strong bond between the Vala and her Warden makes the Warden absorb " + SpiritualBondReduction + "% of the Vala\'s incoming health damage."
					});
				}
			}

			return tooltip;
		}
	}


	function onDeath()
	{
		if (this.m.WardenEntity != null)
		{
			this.m.WardenEntity.killSilently();
			this.m.WardenEntity = null;
		}
	}


	function findTileToSpawnWarden()
	{
		local ActorTile = this.getContainer().getActor().getTile();
		local MapSize = this.Tactical.getMapSize();
		local EmptyTiles = [];

		for( local x = 0; x < MapSize.X; x = ++x )
		{
			for( local y = 0; y < MapSize.Y; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);

				if (tile.IsEmpty && tile.getDistanceTo(ActorTile) > 1 && tile.getDistanceTo(ActorTile) < 4 && (tile.Coords.X - ActorTile.SquareCoords.X) < -1)
				{
					EmptyTiles.push(tile);
				}
			}
		}

		if (EmptyTiles.len() != 0)
		{
			return EmptyTiles[this.Math.rand(0, EmptyTiles.len() - 1)];
		}

		return null;
	}


	function onTurnStart()
	{
		if (this.m.WardenSummonSpent == false)
		{
			local WardenSpawnTile = this.findTileToSpawnWarden();

			if (WardenSpawnTile != null)
			{
				local entity = this.Tactical.spawnEntity("scripts/entity/tactical/vazl_vala_warden_script", WardenSpawnTile.Coords.X, WardenSpawnTile.Coords.Y);
				entity.setName(this.getContainer().getActor().m.Name + "\'s Warden");
				entity.setFaction(this.Const.Faction.PlayerAnimals);
				entity.setItem(this);
				entity.setWardenStats(this.getContainer().getActor().getCurrentProperties());
				this.m.WardenSummonSpent = true;
				this.m.WardenEntity = entity;

				if (this.getContainer().getActor().getSkills().hasSkill("perk.vazl_vala_spiritual_bond"))
				{
					if (!this.getContainer().getActor().getSkills().hasSkill("effects.vazl_vala_spiritual_bond_effect"))
					{
						local bond = this.new("scripts/skills/effects/vazl_vala_spiritual_bond_effect");
						bond.setItem(this);
						this.getContainer().getActor().getSkills().add(bond);
					}
				}
			}
		}

		if (this.m.WardenEntity != null)
		{
			if (this.m.WardenEntity.m.Hitpoints <= 0)
			{
				this.m.WardenEntity.killSilently();
			}
		}
	}


	function onCombatFinished()
	{
		this.m.WardenSummonSpent = false;
		this.m.WardenEntity = null;

		if (this.getContainer().getActor().getSkills().hasSkill("perk.vazl_vala_spiritual_bond"))
		{
			if (this.getContainer().getActor().getSkills().hasSkill("effects.vazl_vala_spiritual_bond_effect"))
			{
				this.getContainer().getActor().getSkills().removeByID("effects.vazl_vala_spiritual_bond_effect");
			}
		}
	}
});
