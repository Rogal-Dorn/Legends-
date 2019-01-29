this.steppe_boulder2 <- this.inherit("scripts/entity/tactical/entity", {
	m = {},
	function getName()
	{
		return this.Const.Strings.Tactical.EntityName.Boulder;
	}

	function getDescription()
	{
		return this.Const.Strings.Tactical.EntityDescription.Boulder;
	}

	function onInit()
	{
		local body = this.addSprite("body");
		body.setBrush("steppe_stone_02");
		body.setHorizontalFlipping(this.Math.rand(0, 100) < 50);
		body.varyColor(0.0299999993, 0.0299999993, 0.0299999993);
		body.Scale = 0.800000012 + this.Math.rand(0, 20) / 100.0;
		this.setBlockSight(true);
	}

});
