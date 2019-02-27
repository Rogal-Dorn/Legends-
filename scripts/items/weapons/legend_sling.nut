this.legend_sling <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_sling";
		this.m.Name = "sling";
		this.m.Description = "A very simple sling, for hurling rocks at your rivals";
		this.m.Categories = "Bow, One-Handed";
		this.m.IconLarge = "weapons/ranged/legend_sling_02.png";
		this.m.Icon = "weapons/ranged/legend_sling_02_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon;
		this.m.EquipSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = true;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_legend_sling_02";
		this.m.Value = 15;
		this.m.RangeMin = 2;
		this.m.RangeMax = 6;
		this.m.RangeIdeal = 6;
		this.m.StaminaModifier = -2;
		this.m.Condition = 30.0;
		this.m.ConditionMax = 30.0;
		this.m.RegularDamage = 10;
		this.m.RegularDamageMax = 30;
		this.m.ArmorDamageMult = 0.45;
		this.m.DirectDamageMult = 0.3;
	}

	function getAmmoID()
	{
		return "ammo.pebbles";
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local quick_shot = this.new("scripts/skills/actives/legend_quick_pebble");
		this.addSkill(quick_shot);
		local aimed_shot = this.new("scripts/skills/actives/legend_aimed_pebble");
		this.addSkill(aimed_shot);
	}

	function onSerialize( _out )
	{
		this.weapon.onSerialize(_out);
		_out.writeString(this.m.Name);
	}

	function onDeserialize( _in )
	{
		this.weapon.onDeserialize(_in);
		this.m.Name = _in.readString();
	}

});
