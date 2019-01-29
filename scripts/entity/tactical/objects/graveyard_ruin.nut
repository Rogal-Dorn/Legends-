this.graveyard_ruin <- this.inherit("scripts/entity/tactical/entity", {
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
			"09",
			"10",
			"11"
		];
		local body = this.addSprite("body");
		body.setBrush("graveyard_" + variants[this.Math.rand(0, variants.len() - 1)]);
	}

});
