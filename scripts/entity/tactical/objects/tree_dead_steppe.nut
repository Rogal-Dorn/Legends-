this.tree_dead_steppe <- this.inherit("scripts/entity/tactical/entity", {
	m = {},
	function getName()
	{
		return "Dead Tree";
	}

	function getDescription()
	{
		return "This tree has withered and is long dead. Blocks movement and line of sight.";
	}

	function onInit()
	{
		local body = this.addSprite("body");
		body.setBrush("steppe_dead_tree_0" + this.Math.rand(1, 2));
		body.setHorizontalFlipping(this.Math.rand(0, 100) < 50);
		body.varyColor(0.0299999993, 0.0299999993, 0.0299999993);
		body.Scale = 0.699999988 + this.Math.rand(0, 30) / 100.0;
		this.setSpriteOcclusion("body", 1, -1, -2);
		this.setBlockSight(true);
	}

});
