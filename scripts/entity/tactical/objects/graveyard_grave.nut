this.graveyard_grave <- this.inherit("scripts/entity/tactical/entity", {
	m = {},
	function getName()
	{
		return "TODO";
	}

	function getDescription()
	{
		return "TODO";
	}

	function onInit()
	{
		local variants = [
			"18",
			"17",
			"16",
			"15",
			"14",
			"08",
			"07",
			"02"
		];
		local body = this.addSprite("body");
		body.setBrush("graveyard_" + variants[this.Math.rand(0, variants.len() - 1)]);
	}

});

