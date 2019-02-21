::mods_hookNewObject("items/item_container", function(o) {
    o.drop <- function( item )
	{
        if (!this.m.Actor.isPlacedOnMap())
        {
            return;
        }

        local _tile = this.m.Actor.getTile();
        item.m.IsDroppedAsLoot = true;
        item.drop(_tile);
		_tile.IsContainingItemsFlipped = true;
	}
})