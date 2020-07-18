this.entity <- {
	m = {
		Tags = null,
		ContentID = this.Math.rand(),
		IsAlive = true,
		IsDirty = false,
		IsAttackable = false,
		IsRock = false,
		IsTree = false,
		IsSticks = false,
		IsBush = false,
		IsSummoned = false,
		IsHidden = false
	},
	function getName()
	{
		return "UNKNOWN";
	}

	function getNameOnly()
	{
		return this.getName();
	}

	function getDescription()
	{
		return "UNKNOWN";
	}

	function getTags()
	{
		return this.m.Tags;
	}

	function getFlags()
	{
		return this.m.Tags;
	}

	function setDirty( _value )
	{
		this.m.IsDirty = _value;
	}

	function setName( _value )
	{
	}

	function isAlive()
	{
		return this.m.IsAlive;
	}

	function isDirty()
	{
		return this.m.IsDirty;
	}

	function isAttackable()
	{
		return this.m.IsAttackable;
	}

	function isTree()
	{
		return this.m.IsTree;
	}

	function isSticks()
	{
		return this.m.IsSticks;
	}

	function isStump()
	{
		return this.m.IsStump;
	}

	function isRock()
	{
		return this.m.IsRock;
	}

	function isBush()
	{
		return this.m.IsBush;
	}

	function setIsAlive( _f )
	{
		this.m.IsAlive = _f;
	}

	function getImagePath()
	{
		return "tacticalentity(" + this.m.ContentID + "," + this.getID() + ",socket,miniboss)";
	}

	function getTooltip( _targetedWidthSkill = null )
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName(),
				icon = "ui/tooltips/height_" + this.getTile().Level + ".png"
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
	}

	function getOverlayImage()
	{
		return this.Const.Tactical.EntityUIOverlay.Default;
	}

	function create()
	{
		this.m.Tags = this.new("scripts/tools/tag_collection");
	}

	function onInit()
	{
		this.m.IsDirty = true;
	}

	function onAfterInit()
	{
	}

	function onFinish()
	{
		this.m.IsAlive = false;
	}

	function isSummoned()
	{
		return this.m.IsSummoned;
	}

	function isHidden()
	{
		return this.m.IsHidden;
	}

	function setHidden ( _val )
	{
		this.m.IsHidden = _val;
	}
	
	function onSerialize( _out )
	{
		this.m.Tags.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.m.Tags.onDeserialize(_in, false);
	}

};

