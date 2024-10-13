::mods_hookExactClass("items/accessory/falcon_item", function(o) {
	o.isAllowedInBag = function ( _actor )
	{
		return false;
	}
});