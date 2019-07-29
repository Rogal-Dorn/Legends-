this.legend_armor <- this.inherit("scripts/items/armor/armor", {
	m = {
		Upgrades = null
	},
	function getArmor()
	{
		local value = this.m.Condition
		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue;
			}
			value += u.getCondition();
		}
		
		return value;
	}

	function getArmorMax()
	{
		local value = this.m.ConditionMax
		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue;
			}
			value += u.getConditionMax();
		}
		return value;
	}

	function setArmor( _a )
	{
		this.m.Condition = _a;
		this.updateAppearance();
	}

	function isAmountShown()
	{
		return this.getArmor() != this.getArmorMax();
	}

	function getAmountString()
	{
		return "" + this.Math.floor(this.getArmor() / (this.getArmorMax() * 1.0) * 100) + "%";
	}

	function getAmountColor()
	{
		return this.Const.Items.ConditionColor[this.Math.max(0, this.Math.floor(this.getArmor() / (this.getArmorMax() * 1.0) * (this.Const.Items.ConditionColor.len() - 1)))];
	}

	function getUpgrade( _slot = -1)
	{
		if (_slot != -1)
		{
			return this.m.Upgrades[_slot];
		}
		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue
			}
			return u
		}
		return null;
	}

	function getIconOverlay()
	{
		local L = [];
		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue
			}
			L.push(u.getOverlayIcon())
		}
		if (L.len() == 0)
		{
			return [""];
		}
		return L;
	}

	function getIconLargeOverlay()
	{
		local L = [];
		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue
			}
			L.push(u.getOverlayIconLarge())
		}
		if (L.len() == 0)
		{
			return [""];
		}
		return L;
	}

	function getStaminaModifier()
	{
		local value = this.m.StaminaModifier
		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue;
			}
			value += u.getStaminaModifier();
		}
		return value;
	}

	function getValue()
	{
		local value = this.m.Value * (this.m.Condition / this.m.ConditionMax)
		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue;
			}
			value += u.getValue();
		}
		return this.Math.floor(value);
	}

	function setUpgrade( _upgrade )
	{
		if (!this.Const.DLC.Unhold && !this.Const.DLC.Wildmen)
		{
			return false;
		}

		if (this.m.Upgrades[_upgrade.getType()] != null)
		{
			this.m.Upgrades[_upgrade.getType()].onRemoved();
		}

		this.m.Upgrades[_upgrade.getType()] = _upgrade;
		if ( _upgrade == null)
		{
			return true;
		}

		this.m.Upgrades[_upgrade.getType()].setArmor(this);
		this.m.Upgrades[_upgrade.getType()].onAdded();
		this.updateAppearance();
		return true
	}

	function create()
	{
		this.armor.create()
		this.m.Upgrades = [];
		for (local i = 0; i < this.Const.Items.ArmorUpgrades.COUNT; i = ++i)
		{
			this.m.Upgrades.push(null);
		}
	}

	function getTooltip()
	{
		local description =  this.getDescription();
		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue
			}
			description += " " + u.getArmorDescription()
		}
		local result = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = description
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

		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue;
			}

			if (u.getIconLarge() != null)
			{
				result.push({
					id = 3,
					type = "image",
					image = u.getIconLarge(),
					isLarge = true
				});
			}
			else
			{
				result.push({
					id = 3,
					type = "image",
					image = u.getIcon()
				});
			}

		}

		result.push({
			id = 4,
			type = "progressbar",
			icon = "ui/icons/armor_body.png",
			value = this.Math.floor(this.getArmor()),
			valueMax = this.Math.floor(this.getArmorMax()),
			text = "" + this.Math.floor(this.getArmor()) + " / " + this.Math.floor(this.getArmorMax()) + "",
			style = "armor-body-slim"
		});

		if (this.getStaminaModifier() < 0)
		{
			result.push({
				id = 5,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Maximum Fatigue [color=" + this.Const.UI.Color.NegativeValue + "]" + this.getStaminaModifier() + "[/color]"
			});
		}

		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue;
			}
			u.getArmorTooltip(result);
		}

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

	function isDroppedAsLoot()
	{
		if (!this.item.isDroppedAsLoot())
		{
			return false;
		}

		local isPlayer = this.m.LastEquippedByFaction == this.Const.Faction.Player || this.getContainer() != null && this.getContainer().getActor() != null && !this.getContainer().getActor().isNull() && this.isKindOf(this.getContainer().getActor().get(), "player");
		local isLucky = !this.Tactical.State.isScenarioMode() && this.World.Assets.getOrigin().isDroppedAsLoot(this);
		if (this.m.Condition > 10 && isPlayer || this.m.Condition > 30 && this.m.Condition / this.m.ConditionMax >= 0.25 || this.isItemType(this.Const.Items.ItemType.Named) || this.isItemType(this.Const.Items.ItemType.Legendary) || isLucky)
		{
			return true;
		}

		return false;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play(this.m.InventorySound[this.Math.rand(0, this.m.InventorySound.len() - 1)], this.Const.Sound.Volume.Inventory);
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_body_" + variant;
		this.m.SpriteDamaged = "bust_body_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_body_" + variant + "_dead";
		this.m.IconLarge = "armor/inventory_body_armor_" + variant + ".png";
		this.m.Icon = "armor/icon_body_armor_" + variant + ".png";
	}

	function updateAppearance()
	{
		if (this.getContainer() == null || !this.isEquipped())
		{
			return;
		}

		if (!this.m.ShowOnCharacter)
		{
			return;
		}

		local app = this.getContainer().getAppearance();
		app.CorpseArmor = this.m.SpriteCorpse;
		app.HideBody = this.m.HideBody;

		local sound =  this.m.ImpactSound
		if (this.m.Upgrades[this.Const.Items.ArmorUpgrades.Plate] != null) {
			sound = this.m.Upgrades[this.Const.Items.ArmorUpgrades.Plate].m.ImpactSound;
		} else if (this.m.Upgrades[this.Const.Items.ArmorUpgrades.Chain] != null)
		{
			sound = this.m.Upgrades[this.Const.Items.ArmorUpgrades.Chain].m.ImpactSound;
		}
		app.ImpactSound[this.Const.BodyPart.Body] = sound;

		if (this.m.Condition / this.m.ConditionMax <= this.Const.Combat.ShowDamagedArmorThreshold)
		{
			if (this.m.SpriteDamaged != null)
			{
				app.Armor = this.m.SpriteDamaged;
			}
		}
		else if (this.m.Sprite != null)
		{
			app.Armor = this.m.Sprite;
		}

		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue;
			}
			u.updateAppearance(app);
		}

		this.getContainer().updateAppearance();
	}

	function onEquip()
	{
		this.item.onEquip();

		if (this.m.AddGenericSkill)
		{
			this.addGenericItemSkill();
		}

		this.updateAppearance();

		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue;
			}
			u.onEquip();
		}
	}

	function onUnequip()
	{
		this.item.onUnequip();

		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue;
			}
			u.onUnequip();
		}

		if (this.m.ShowOnCharacter)
		{
			local app = this.getContainer().getAppearance();
			app.Armor = "";
			app.ArmorLayerChain = "",
			app.ArmorLayerPlate= "",
			app.ArmorLayerCloak= "",
			app.ArmorUpgradeFront = "";
			app.ArmorUpgradeBack = "";
			app.CorpseArmor = "";
			app.CorpseArmorLayerChain = "",
			app.CorpseArmorLayerPlate= "",
			app.CorpseArmorLayerCloak= "",
			app.CorpseArmorUpgradeFront = "";
			app.CorpseArmorUpgradeBack = "";
			app.HideBody = false;
			app.ImpactSound[this.Const.BodyPart.Body] = [];
			this.getContainer().updateAppearance();

			if (this.getContainer().getActor() != null && !this.getContainer().getActor().isNull())
			{
				this.getContainer().getActor().resetBloodied();
			}
		}
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue;
			}
			u.onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties );
		}
	}

	function onDamageReceived( _damage, _fatalityType, _attacker )
	{
		local totalDamage = _damage;
		for (local i = this.Const.Items.ArmorUpgrades.COUNT - 1; i >= 0; i = --i)
		{
			local u = this.m.Upgrades[i];
			if (u == null)
			{
				continue;
			}
			totalDamage = u.onDamageReceived( totalDamage, _fatalityType, _attacker);
		}

		this.updateAppearance();

		if (this.m.Condition == 0)
		{
			return;
		}

		this.m.Condition = this.Math.max(0, this.m.Condition - totalDamage) * 1.0;

		if (this.m.Condition == 0 && !this.m.IsIndestructible)
		{
			this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(this.getContainer().getActor()) + "\'s " + this.getName() + " is hit for [b]" + this.Math.floor(_damage) + "[/b] damage and has been destroyed!");
		}
		else
		{
			this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(this.getContainer().getActor()) + "\'s " + this.getName() + " is hit for [b]" + this.Math.floor(_damage) + "[/b] damage");
		}

	}

	function onUpdateProperties( _properties )
	{
		if (this.getContainer().getActor() == null)
		{
			return;
		}

		local staminaMult = 1.0;

		if (this.getContainer().getActor().getSkills().hasSkill("perk.brawny"))
		{
			staminaMult = 0.75;
		}

		_properties.Armor[this.Const.BodyPart.Body] += this.getArmor();
		_properties.ArmorMax[this.Const.BodyPart.Body] += this.getArmorMax();
		_properties.Stamina += this.Math.ceil(this.getStaminaModifier() * staminaMult);

		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue;
			}
			u.onUpdateProperties( _properties);
		}
	}

	function onTurnStart()
	{
		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue;
			}
			u.onTurnStart();
		}
	}

	function onUse( _skill )
	{
		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue;
			}
			u.onUse( _skill);
		}
	}

	function onTotalArmorChanged()
	{
		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue;
			}
			u.onTotalArmorChanged();
		}
	}

	function onCombatFinished()
	{
		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue;
			}
			u.onCombatFinished();
		}
	}

	function onActorDied( _onTile )
	{
		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				continue;
			}
			u.onActorDied(_onTile);
		}
	}

	function onSerialize( _out )
	{
		this.armor.onSerialize(_out)
		_out.writeU8(this.m.Upgrades.len());
		foreach (u in this.m.Upgrades)
		{
			if (u == null)
			{
				_out.writeI32(0);
				continue
			}
			u.onSerialize(_out);
		}
	}

	function onDeserialize( _in )
	{
		this.armor.onDeserialize(_in);
		local count = _in.readU8();
		this.m.Upgrades = [];
		for ( local i = 0; i < count; i = ++i)
		{
			local upgrade = _in.readI32();
			if ( upgrade == 0)
			{
				this.m.Upgrades.push(null);
				continue;
			}
			local item = this.new(this.IO.scriptFilenameByHash(upgrade));
			item.onDeserialize(_in);
			this.m.Upgrades[item.getType()] = item;
			this.m.Upgrades[item.getType()].setArmor(this);
		}
	}

});

