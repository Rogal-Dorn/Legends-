::mods_hookNewObject("ui/screens/world/world_combat_dialog", function(o) {
	local show = o.show;
	o.show = function( _entities, _allyBanners, _enemyBanners, _allowDisengage, _allowFormationPicking, _text, _image, _disengageText = "Cancel" )
	{
		if (_entities.len() > 0 && ::Legends.Mod.ModSettings.getSetting("ExactEngageNumbers").getValue()) {
			local stackinfos, count = 0;
			while (stackinfos == null && count <= 20) { // there is no way there is more than 20 mod hook on that same function lol
				stackinfos = getstackinfos(++count);

				if (stackinfos == null) break;

				if (stackinfos.func == "showCombatDialog"
					&& stackinfos.locals.rawin("entities")
					&& stackinfos.locals.rawin("entityTypes")
					&& typeof stackinfos.locals.entityTypes == "array"
				) {
					local new = [];

					foreach (entry in _entities)
					{
						if (entry.Overlay != null)
							new.push(entry);
					}

					for( local i = 0; i < stackinfos.locals.entityTypes.len(); ++i )
					{
						if (stackinfos.locals.entityTypes[i] <= 0)
							continue;
						else if (stackinfos.locals.entityTypes[i] > 1)
							new.push({
								Name = format("%i %s", stackinfos.locals.entityTypes[i], ::Const.Strings.EntityNamePlural[i]),
								Icon = ::Const.EntityIcon[i],
								Overlay = null
							});

						else {
							local start = this.isFirstCharacter(::Const.Strings.EntityName[i], [
								"A",
								"E",
								"I",
								"O",
								"U"
							]) ? "An " : "A ";
							new.push({
								Name = start + this.removeFromBeginningOfText("The ", ::Const.Strings.EntityName[i]),
								Icon = ::Const.EntityIcon[i],
								Overlay = null
							});
						}
					}

					if (_entities.len() != new.len()) {
						::logError("Mismatch length between _entities array and new array");
						break;
					}

					_entities = new;
					break;
				}

				stackinfos = null;
			}
		}


		show(_entities, _allyBanners, _enemyBanners, _allowDisengage, _allowFormationPicking, _text, _image, _disengageText);
	}
});
