this.legend_vala_inscription_token <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.m.ID = "token.legend_vala_inscription";
		this.m.Name = "";
		this.m.Description = "";
		this.m.Icon = "";
		this.m.IconLarge = "";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Usable;
		this.m.IsDroppedAsLoot = true;
		this.m.IsAllowedInBag = false;
		this.m.IsUsable = true;
		this.m.Value = 1200;
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
			id = 3,
			type = "text",
			text = this.getValueString()
		});

		if (this.getIconLarge() != null)
		{
			result.push({
				id = 4,
				type = "image",
				image = this.getIconLarge(),
				isLarge = true
			});
		}
		else
		{
			result.push({
				id = 4,
				type = "image",
				image = this.getIcon()
			});
		}

		result.push({
			id = 65,
			type = "text",
			text = "Right-click to permanently attach this inscribed rock to the selected character\'s equipment. This item will be consumed in the process to give the following effect(s):"
		});
		result.push({
			id = 66,
			type = "text",
			icon = "ui/icons/special.png",
			text = this.getRuneSigilTooltip(this.m.RuneVariant, this.m.RuneMultiplier)
		});

		return result;
	}


	function onUse( _actor, _item = null )
	{
		if (this.m.RuneVariant >= 1 && this.m.RuneVariant <= 10)
		{
			local target = _actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

			if (target == null)
			{
				return false;
			}

			this.Sound.play("sounds/combat/legend_vala_inscribe.wav");
			target.setRuneVariant(this.m.RuneVariant);
			target.setRuneMultiplier(this.m.RuneMultiplier);
			target.updateRuneSigil();
			_actor.getItems().unequip(target);
			_actor.getItems().equip(target);
			return true;
		}
		else if (this.m.RuneVariant >= 11 && this.m.RuneVariant <= 20)
		{
			local target = _actor.getItems().getItemAtSlot(this.Const.ItemSlot.Head);

			if (target == null)
			{
				return false;
			}

			this.Sound.play("sounds/combat/legend_vala_inscribe.wav");
			target.setRuneVariant(this.m.RuneVariant);
			target.setRuneMultiplier(this.m.RuneMultiplier);
			target.updateRuneSigil();
			_actor.getItems().unequip(target);
			_actor.getItems().equip(target);
			return true;
		}
		else if (this.m.RuneVariant >= 21 && this.m.RuneVariant <= 30)
		{
			local target = _actor.getItems().getItemAtSlot(this.Const.ItemSlot.Body);

			if (target == null)
			{
				return false;
			}

			this.Sound.play("sounds/combat/legend_vala_inscribe.wav");
			target.setRuneVariant(this.m.RuneVariant);
			target.setRuneMultiplier(this.m.RuneMultiplier);
			target.updateRuneSigil();
			_actor.getItems().unequip(target);
			_actor.getItems().equip(target);
			return true;
		}
		else if (this.m.RuneVariant >= 31 && this.m.RuneVariant <= 40)
		{
			local target = _actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

			if (target == null)
			{
				return false;
			}
			if (target.getID().find("shield") == null)
			{
				return false;
			}

			this.Sound.play("sounds/combat/legend_vala_inscribe.wav");
			target.setRuneVariant(this.m.RuneVariant);
			target.setRuneMultiplier(this.m.RuneMultiplier);
			target.updateRuneSigil();
			_actor.getItems().unequip(target);
			_actor.getItems().equip(target);
			return true;
		}
		else
		{
			return false;
		}
	}
});
