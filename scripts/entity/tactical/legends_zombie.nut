this.legends_zombie <- this.inherit("scripts/entity/tactical/enemies/zombie", {
	m = {
		Item = null,
		ResurrectWithScript = "scripts/entity/tactical/legends_zombie"
	},
	function setItem( _i )
	{
		if (typeof _i == "instance")
		{
			this.m.Item = _i;
		}
		else
		{
			this.m.Item = this.WeakTableRef(_i);
		}
	}

	function setVariant( _v )
	{
		// this.m.Items.getAppearance().Body = "bust_dog_01_body_0" + _v;
		// this.getSprite("body").setBrush("bust_dog_01_body_0" + _v);
		// this.getSprite("head").setBrush("bust_dog_01_head_0" + _v);
		// this.setDirty(true);
	}

});
