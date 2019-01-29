this.orc_camp_wall <- this.inherit("scripts/entity/tactical/entity", {
	m = {},
	function getName()
	{
		return "TODO";
	}

	function getDescription()
	{
		return "TODO";
	}

	function setDirBasedOnCenter( _centerTile, _dist )
	{
		local b = this.getSprite("body");
		local myTile = this.getTile();

		if (myTile.SquareCoords.X < _centerTile.SquareCoords.X)
		{
			if (myTile.SquareCoords.Y < _centerTile.SquareCoords.Y + _dist * 0.5 && myTile.SquareCoords.Y > _centerTile.SquareCoords.Y - _dist * 0.5)
			{
				b.setBrush("orc_camp_17_07");
			}
			else if (myTile.SquareCoords.Y > _centerTile.SquareCoords.Y)
			{
				b.setBrush("orc_camp_17_01");
			}
			else
			{
				b.setBrush("orc_camp_17_02");
			}
		}
		else if (myTile.SquareCoords.X > _centerTile.SquareCoords.X)
		{
			if (myTile.SquareCoords.Y < _centerTile.SquareCoords.Y + _dist * 0.5 && myTile.SquareCoords.Y > _centerTile.SquareCoords.Y - _dist * 0.5)
			{
				b.setBrush("orc_camp_17_06");
			}
			else if (myTile.SquareCoords.Y > _centerTile.SquareCoords.Y)
			{
				b.setBrush("orc_camp_17_02");
			}
			else
			{
				b.setBrush("orc_camp_17_01");
			}
		}
		else if (myTile.SquareCoords.Y < _centerTile.SquareCoords.Y)
		{
			b.setBrush("orc_camp_17_03");
		}
		else
		{
			b.setBrush("orc_camp_17_05");
		}
	}

	function onInit()
	{
		local body = this.addSprite("body");
		body.setBrush("orc_camp_17_0" + this.Math.rand(1, 7));
		body.IgnoreCameraFlip = true;
	}

});
