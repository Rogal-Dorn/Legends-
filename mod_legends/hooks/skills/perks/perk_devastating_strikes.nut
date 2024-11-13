::mods_hookExactClass("skills/perks/perk_devastating_strikes", function(o) {
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Icon = "ui/perks/devastating_strikes.png";
		this.m.IconDisabled = "ui/perks/devastating_strikes_bw.png";
	}

	o.onUpdate = function ( _properties )
	{
		_properties.DamageTotalMult *= 1.1;
	}
});
