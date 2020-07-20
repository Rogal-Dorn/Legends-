this.schrat_shield <- this.inherit("scripts/items/shields/shield", {
	m = {
		Remove = false
	},
	function create()
	{
		this.shield.create();
		this.m.ID = "shield.schrat_player";
		this.m.Name = "Schrat\'s Shield";
		this.m.Description = "The hardened bark from a schrat";
		this.m.AddGenericSkill = false;
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = false;
		this.m.Variant = 1;
		this.updateVariant();
		this.m.Value = 0;
		this.m.MeleeDefense = 20;
		this.m.RangedDefense = 20;
		this.m.StaminaModifier = 0;
		this.m.Condition = 32;
		this.m.ConditionMax = 32;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_schrat_shield_0" + this.m.Variant;
		this.m.SpriteDamaged = "bust_schrat_shield_0" + this.m.Variant + "_damaged";

		//3 below only mtter for inventory looks when u transform, doesn't affect actual schrats only druids
		this.m.ShieldDecal = "shield_heartwood_destroyed";
		this.m.IconLarge = "shields/inventory_heartwood_shield.png";
		this.m.Icon = "shields/icon_heartwood_shield.png";
	}

	function onUpdate()
	{
		if ( this.m.Remove )
		{

			this.logInfo("got here x2");
			// this.getContainer().unequip(this.getContainer().getItemAtSlot(this.Const.ItemSlot.Offhand));
			this.removeSelf();
		}
		else
		{
			this.logInfo("on update");
			this.shield.onUpdate();
		}
	}

});

