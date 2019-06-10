this.legend_skin_ghoul_high <- this.inherit("scripts/entity/tactical/enemies/legend_skin_ghoul", {
	m = {},
	function create()
	{
		this.ghoul.create();
	}

	function onInit()
	{
		this.ghoul.onInit();
		this.grow(true);
		this.grow(true);
	}

});

