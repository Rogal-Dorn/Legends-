::mods_hookExactClass("skills/perks/perk_nimble", function(o) {
	o.onUpdate <- function ( _properties )
	{
		_properties.ThresholdToReceiveInjuryMult *= 1.10; //10%
	}
});