::mods_hookNewObject("skills/racial/alp_racial", function(o) {

    local fn = o.onBeforeDamageReceived
	o.onBeforeDamageReceived = function( _attacker, _skill, _hitInfo, _properties )
	{
        if (_skill == null)
        {
            return;
        }
        fn( _attacker, _skill, _hitInfo, _properties )
	}
})