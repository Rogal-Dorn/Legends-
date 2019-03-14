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

	o.dropAllNoLoot <- function ( _tile, _killer, _flip = false )
	{
		local IsDroppingLoot = false;

		if (_tile == null)
		{
			if (this.m.Actor.isPlacedOnMap())
			{
				_tile = this.m.Actor.getTile();
			}
            else 
            {
                return;
            }

		}

		for( local i = 0; i < this.Const.ItemSlot.COUNT; i = ++i )
		{
			for( local j = 0; j < this.m.Items[i].len(); j = ++j )
			{
				if (this.m.Items[i][j] == null || this.m.Items[i][j] == -1)
				{
                    continue
				}
				
                if (this.m.Items[i][j].isChangeableInBattle())
				{
					if (IsDroppingLoot)
					{
						if (isPlayer || this.m.Items[i][j].isDroppedAsLoot())
						{
							this.m.Items[i][j].drop(_tile);
						}
						else
						{
							this.m.Items[i][j].m.IsDroppedAsLoot = false;
						}
					}
					else
					{
						this.m.Items[i][j].m.IsDroppedAsLoot = false;
					}
				}
				else if (!IsDroppingLoot && !this.m.Items[i][j].isItemType(this.Const.Items.ItemType.Legendary))
				{
					this.m.Items[i][j].m.IsDroppedAsLoot = false;
				}
			}
		}

		_tile.IsContainingItemsFlipped = _flip;
	}

})