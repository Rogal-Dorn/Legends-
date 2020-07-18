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

    o.transferToList <- function( _stash )
	{
		for( local i = 0; i < this.Const.ItemSlot.COUNT; i = ++i )
		{
			for( local j = 0; j < this.m.Items[i].len(); j = ++j )
			{
				if (this.m.Items[i][j] == null || this.m.Items[i][j] == -1)
				{
                    continue
				}

                local item = this.m.Items[i][j];
                if (item.isEquipped())
                {
                    this.unequip(item);
                }
                else
                {
                    this.removeFromBag(item);
                }
                _stash.push(item);
                // this.logInfo("Transferred " + item.m.Name + " : " + item.getInstanceID())
                // local res = this.Stash.getItemByInstanceID(item.getInstanceID());
                // if (res == null) {
                //     this.logInfo("saveFormation::could not find item for " + item.getInstanceID());
                //     continue
                // }
                //toTransfer.push(item);
			}
		}

        // this.logInfo("TRANSFERED TO STASH COMPLETE. STASH SIZe = " + _stash.m.Items.len())

		// foreach( item in toTransfer )
		// {
		// 	if (_stash.add(item) == null)
		// 	{
        //         this.logInfo("STASH ADD ITEM IS NULL")
		// 		break;
		// 	}


		// }
	}

})