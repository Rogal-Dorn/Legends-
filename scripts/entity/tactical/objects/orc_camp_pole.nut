this.orc_camp_pole <- this.inherit("scripts/entity/tactical/entity", {
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
			"13",
			"14",
			"16"
		];
		local v = variants[this.Math.rand(0, variants.len() - 1)];
		local baseScale = 0.600000024 + this.Math.rand(0, 40) / 100.0;
		local rotation = this.Math.rand(-6, 6);
		local flip = this.Math.rand(0, 100) < 50;
		local bottom = this.addSprite("bottom");
		bottom.setBrush("orc_camp_" + v + "_bottom");
		bottom.setHorizontalFlipping(flip);
		bottom.Scale = baseScale;
		bottom.Rotation = rotation;
		local top = this.addSprite("top");
		top.setBrush("orc_camp_" + v + "_top");
		top.setHorizontalFlipping(flip);
		top.Scale = baseScale;
		top.Rotation = rotation;
		this.setSpriteOcclusion("top", 2, 2, -3);
		this.setBlockSight(true);
	}

});
