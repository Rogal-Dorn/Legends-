this.legend_armor_upgrade <- this.inherit("scripts/items/item", {
	m = {
		OverlayIcon = "",
		OverlayIconLarge = "",
		SpriteFront = null,
		SpriteBack = null,
		SpriteDamagedFront = null,
		SpriteDamagedBack = null,
		SpriteCorpseFront = null,
		SpriteCorpseBack = null,
		ArmorDescription = "",
		Armor = null,
		ConditionModifier = 0,
		StaminaModifier = 0,
		Type = -1,
		ImpactSound = this.Const.Sound.ArmorLeatherImpact
	},
	function getType()
	{
		return this.m.Type;
	}

	function getOverlayIcon()
	{
		return this.m.OverlayIcon;
	}

	function getOverlayIconLarge()
	{
		return this.m.OverlayIconLarge;
	}

	function isUsed()
	{
		return this.m.Armor != null;
	}

	function getArmor()
	{
		return this.m.Armor;
	}

	function setArmor( _a )
	{
		this.m.Armor = this.WeakTableRef(_a);
	}

	function getArmorDescription()
	{
		return this.m.ArmorDescription;
	}

	function create()
	{
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Usable;
		this.m.IsDroppedAsLoot = true;
		this.m.IsAllowedInBag = false;
		this.m.IsUsable = true;
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
				text = this.m.Name
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
			text = "Right-click or drag onto an armor carried by the currently selected character in order to attach the armor upgrade."
		});
		return result;
	}

	function getArmorTooltip( _result )
	{
		this.onArmorTooltip(_result);
		_result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/plus.png",
			text = this.getDescription()
		});
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play(this.m.ImpactSound[0], this.Const.Sound.Volume.Inventory);
	}

	function updateAppearance( _app )
	{
		
		local frontSprite = "";
		local backSprite = "";
		if (this.m.Condition / this.m.ConditionMax <= this.Const.Combat.ShowDamagedArmorThreshold)
		{
			frontSprite = this.m.SpriteDamagedFront != null ? this.m.SpriteDamagedFront : this.m.SpriteFront != null ? this.m.SpriteFront : "";
			backSprite = this.m.SpriteDamagedBack != null ? this.m.SpriteDamagedBack : this.m.SpriteBack != null ? this.m.SpriteBack : "";
		}
		else
		{
			frontSprite = this.m.SpriteFront != null ? this.m.SpriteFront : "";
			backSprite = this.m.SpriteBack != null ? this.m.SpriteBack : "";
		}

		switch(this.m.Type)
		{
			case this.Const.Items.ArmorUpgrades.Chain:
				_app.ArmorLayerChain = backSprite;
				_app.CorpseArmorLayerChain =  this.m.SpriteCorpseBack != null ? this.m.SpriteCorpseBack : "";
				break;
			case this.Const.Items.ArmorUpgrades.Plate:
				_app.ArmorLayerPlate = backSprite;
				_app.CorpseArmorLayerPlate =  this.m.SpriteCorpseBack != null ? this.m.SpriteCorpseBack : "";
				break;
			case this.Const.Items.ArmorUpgrades.Cloak:
				_app.ArmorLayerCloak= backSprite;
				_app.CorpseArmorLayerCloak =  this.m.SpriteCorpseBack != null ? this.m.SpriteCorpseBack : "";
				break;
			case this.Const.Items.ArmorUpgrades.Attachment:
				_app.ArmorUpgradeFront = frontSprite
				_app.ArmorUpgradeBack = this.m.SpriteBack != null ? this.m.SpriteBack : "";
				_app.CorpseArmorUpgradeFront = backSprite
				_app.CorpseArmorUpgradeBack = this.m.SpriteCorpseBack ? this.m.SpriteCorpseBack : "";
				break;
		}
	}

	function onAdded()
	{
	}

	function onRemoved()
	{
		this.Sound.play("sounds/inventory/armor_upgrade_use_01.wav", this.Const.Sound.Volume.Inventory);
		this.m.Armor = null;
	}

	function onUse( _actor, _item = null )
	{
		if (this.isUsed())
		{
			return false;
		}

		local armor = _item == null ? _actor.getItems().getItemAtSlot(this.Const.ItemSlot.Body) : _item;

		if (armor == null)
		{
			return false;
		}

		this.Sound.play("sounds/inventory/armor_upgrade_use_01.wav", this.Const.Sound.Volume.Inventory);
		armor.setUpgrade(this);
		return true;
	}

	function onDamageReceived( _damage, _fatalityType, _attacker )
	{
		//Destroyed, but damage left over
		if (_damage >= this.m.Condition)
		{
			this.m.Condition = 0.0;
			return _damage - this.m.Condition;
		}

		//Took all of the damage
		this.m.Condition = this.Math.max(0, this.m.Condition - _damage) * 1.0;
		return 0.0
	}
	
	function onArmorTooltip( _result )
	{
	}

	function onSerialize( _out )
	{
		this.item.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.item.onDeserialize(_in);
	}

});

