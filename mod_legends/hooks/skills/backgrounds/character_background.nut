::mods_hookExactClass("skills/backgrounds/character_background", function(o) 
{
	local create = o.create
	o.create = function(){
		create()
		this.convertToBackgroundType();
	}
})