this.vazl_runed_weapon <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.IsDroppedAsLoot = true;
		this.m.IsDroppedWhenDamaged = true;
	}

	function onSerialize( _out )
	{
		_out.writeString(this.m.Name);
		_out.writeF32(this.m.ConditionMax);
		_out.writeI8(this.m.StaminaModifier);
		_out.writeU16(this.m.RegularDamage);
		_out.writeU16(this.m.RegularDamageMax);
		_out.writeF32(this.m.ArmorDamageMult);
		_out.writeU8(this.m.ChanceToHitHead);
		_out.writeU16(this.m.ShieldDamage);
		_out.writeU16(this.m.AdditionalAccuracy);
		_out.writeF32(this.m.DirectDamageAdd);
		_out.writeF32(0);
		_out.writeF32(0);
		this.weapon.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.m.Name = _in.readString();
		this.m.ConditionMax = _in.readF32();
		this.m.StaminaModifier = _in.readI8();
		this.m.RegularDamage = _in.readU16();
		this.m.RegularDamageMax = _in.readU16();
		this.m.ArmorDamageMult = _in.readF32();
		this.m.ChanceToHitHead = _in.readU8();
		this.m.ShieldDamage = _in.readU16();
		this.m.AdditionalAccuracy = _in.readU16();
		this.m.DirectDamageAdd = _in.readF32();
		_in.readF32();
		_in.readF32();
		this.weapon.onDeserialize(_in);
	}
});
