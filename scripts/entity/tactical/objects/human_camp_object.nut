this.human_camp_object <- this.inherit("scripts/entity/tactical/entity", {
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
			"01",
			"02",
			"03",
			"04",
			"05",
			"06",
			"07",
			"08",
			"09",
			"10",
			"11",
			"12",
			"13",
			"14",
			"15",
			"16",
			"17"
		];
		local body = this.addSprite("body");
		body.setBrush("camp_" + variants[this.Math.rand(0, variants.len() - 1)]);
	}

});

