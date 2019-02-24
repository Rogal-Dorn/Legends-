this.spawn_item <- this.inherit("scripts/items/item", {
	m = {
		StaminaModifier = 0,
		AddGenericSkill = true,
		ShowOnCharacter = false,
		Sprite = null,
		SpriteCorpse = null,
		Entity = null,
		MedicinePerDay = 0,
		Decay = 0.0,
		DecayRate = 20
	},

	function isAllowedInBag()
	{
		return false;
	}

	function getStaminaModifier()
	{
		return this.m.StaminaModifier;
	}

	function create()
	{
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Misc;
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
		result.push({
			id = 65,
			type = "text",
			text = "Usable in Combat"
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

		if (this.m.StaminaModifier < 0)
		{
			result.push({
				id = 8,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Maximum Fatigue [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.StaminaModifier + "[/color]"
			});
		}

		if (this.m.Decay > 0)
		{
			result.push({
				id = 8,
				type = "hint",
				text = "Decayed [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.Decay + "%[/color]"
			});
		}

		return result;
	}

	function isUnleashed()
	{
		return this.m.Entity != null;
	}


	function getDescription()
	{
		return this.item.getDescription();
	}

	function updateVariant()
	{
		this.setEntity(this.m.Entity);
	}

	function setEntity( _e )
	{
		this.m.Entity = _e;
	}
	
	function updateVariant()
	{
		this.setEntity(this.m.Entity);
	}

	function onUpdateProperties( _properties )
	{
	}

	function onCombatFinished()
	{
		this.setEntity(null);
	}

	function onNewDay()
	{
		if (this.World.Assets.getMedicine() >= this.m.MedicinePerDay) {
			this.World.Assets.addMedicine(-this.m.MedicinePerDay);
			if (this.m.Decay > 0) 
			{
				this.m.Decay -= this.m.DecayRate;
			}
		} else {
			this.World.Assets.addMedicine(-this.World.Assets.getMedicine());
			this.m.Decay += this.m.DecayRate;
		}

		if (this.m.Decay >= 100) 
		{
			this.World.Assets.getStash().remove(this);
		}
		
	}

	function onSerialize( _out )
	{
		this.item.onSerialize(_out);
		_out.writeF32(this.m.Decay);
	}

	function onDeserialize( _in )
	{
		this.item.onDeserialize(_in);
		this.updateVariant();
		if (_in.getMetaData().getVersion() >= 50)
		{
			this.m.Decay = _in.readF32();
		}
	}

});
