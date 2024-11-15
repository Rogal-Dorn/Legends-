::mods_hookExactClass("items/shields/shield", function(o) {
	o.m.Variants <- [];
	o.m.IsIndestructible <- false;

	o.getIconOverlay <- function ()
	{
		if (this.isRuned())
		{
			return [
				"layers/glow_runed_icon.png"
			];
		}

		return [
			""
		];
	}

	o.getIconLargeOverlay <- function ()
	{
		if (this.isRuned())
		{
			return [
				"layers/glow_runed_inventory.png"
			];
		}

		return [
			""
		];
	}

	local getTooltip = o.getTooltip;
	o.getTooltip = function ()
	{
		local result = getTooltip();
		if (this.isRuned())
		{
			result.push({
				id = 20,
				type = "text",
				icon = "ui/icons/special.png",
				text = this.getRuneSigilTooltip()
			});
		}

		return result;
	}

	local isDroppedAsLoot = o.isDroppedAsLoot;
	o.isDroppedAsLoot = function ()
	{
		if (this.item.isDroppedAsLoot() && this.isNamed())
		{
			return true;
		}

		return isDroppedAsLoot();
	}

	o.applyShieldDamage = function ( _damage, _playHitSound = true )
	{
		if (this.m.Condition == 0)
		{
			return;
		}

		if (this.getContainer().getActor().getCurrentProperties().IsSpecializedInShields)
		{
			_damage = this.Math.max(1, this.Math.ceil(_damage * 0.5));
		}

		local Condition = this.m.Condition;
		Condition = this.Math.maxf(0.0, this.m.Condition - _damage);

		if (Condition == 0)
		{
			if (this.m.SoundOnDestroyed.len() != 0)
			{
				this.Sound.play(this.m.SoundOnDestroyed[this.Math.rand(0, this.m.SoundOnDestroyed.len() - 1)], this.Const.Sound.Volume.Skill, this.getContainer().getActor().getPos());
			}

			if (this.m.ShieldDecal.len() > 0)
			{
				local ourTile = this.getContainer().getActor().getTile();
				local candidates = [];

				for( local i = 0; i < this.Const.Direction.COUNT; i = i )
				{
					if (!ourTile.hasNextTile(i))
					{
					}
					else
					{
						local tile = ourTile.getNextTile(i);

						if (tile.IsEmpty && !tile.Properties.has("IsItemSpawned") && !tile.IsCorpseSpawned && tile.Level <= ourTile.Level + 1)
						{
							candidates.push(tile);
						}
					}

					i = ++i;
				}

				if (candidates.len() != 0)
				{
					local tileToSpawnAt = candidates[this.Math.rand(0, candidates.len() - 1)];
					tileToSpawnAt.spawnDetail(this.m.ShieldDecal);
					tileToSpawnAt.Properties.add("IsItemSpawned");
					tileToSpawnAt.Properties.add("IsShieldItemSpawned");
				}
				else if (!ourTile.Properties.has("IsItemSpawned") && !ourTile.IsCorpseSpawned)
				{
					ourTile.spawnDetail(this.m.ShieldDecal);
					ourTile.Properties.add("IsItemSpawned");
					ourTile.Properties.add("IsShieldItemSpawned");
				}
			}

			local actor = this.getContainer().getActor();
			local isPlayer = this.m.LastEquippedByFaction == this.Const.Faction.Player || actor != null && !actor.isNull() && this.isKindOf(actor.get(), "player");
			local isBlacksmithed = isPlayer && !this.Tactical.State.isScenarioMode() && (this.isNamed() || this.World.Assets.m.IsBlacksmithed);
			this.m.Container.unequip(this);
			this.m.Condition = Condition;

			if (isBlacksmithed)
			{
				this.drop(actor.getTile());
			}
		}
		else
		{
			this.m.Condition = Condition;

			if (_playHitSound && this.m.SoundOnHit.len() != 0)
			{
				this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, this.getContainer().getActor().getPos());
				this.Sound.play(this.m.SoundOnDestroyed[this.Math.rand(0, this.m.SoundOnDestroyed.len() - 1)], this.Const.Sound.Volume.Skill * 0.33, this.getContainer().getActor().getPos());
			}

			if (this.m.ShowOnCharacter)
			{
				local app = this.getContainer().getAppearance();

				if (this.m.Condition == 0)
				{
					app.Shield = "";
				}
				else if (this.m.Condition / (this.m.ConditionMax * 1.0) <= this.Const.Combat.ShowDamagedShieldThreshold)
				{
					app.Shield = this.m.SpriteDamaged;
				}
				else
				{
					app.Shield = this.m.Sprite;
				}

				this.getContainer().updateAppearance();
			}
		}
	}

	o.onDeserialize = function ( _in )
	{
		this.item.onDeserialize(_in);
		this.m.Condition = this.Math.minf(this.m.ConditionMax, this.m.Condition);

		if (this.isRuned())
		{
			this.updateRuneSigil();
		}
	}
});
