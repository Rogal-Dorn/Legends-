this.graveyard_crypt <- this.inherit("scripts/entity/tactical/objects/multi_tile_object", {
	m = {},
	function getName()
	{
		return "Crypt";
	}

	function getDescription()
	{
		return "TODO";
	}

	function onInit()
	{
		local offset = 140;
		this.getTile().Level = 0;
		local body = this.addSprite("body");
		body.setBrush("crypt_01");
		this.setSpriteOffset("body", this.createVec(0, offset));
		this.addMultiTileMirror("crypt_01", offset, 0, 0, 3);
		this.addMultiTileBlocker(0, 0, 2 - 1);
		this.addMultiTileMirror("crypt_02", offset, 1, -1, 3);
		this.addMultiTilePart("crypt_02", offset, 1, -1, 3 - 1);
		this.addMultiTileMirror("crypt_03", offset, 2, -1, 3);
		this.addMultiTilePart("crypt_03", offset, 2, -1, 3 - 1);
		this.addMultiTileMirror("crypt_04", offset, 3, -1, 3);
		this.addMultiTilePart("crypt_04", offset, 3, -1, 1 - 1);
	}

});
