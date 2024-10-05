::mods_hookExactClass("skills/perks/perk_steadfast", function(o) {
	local ws_create = o.create;
	o.create = function ()
	{
		ws_create();
		this.m.Icon = "ui/perks/steadfast_circle.png";
		this.m.IconDisabled = "ui/perks/steadfast_circle_bw.png"
	}

	o.onUpdate = function ( _properties )
	{
		_properties.FatigueReceivedPerHitMult *= 0.1;
		_properties.FatigueLossOnBeingMissedMult *= 0.1;
	}
});