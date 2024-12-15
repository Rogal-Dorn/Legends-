::mods_hookNewObject("ui/screens/world/world_combat_dialog", function(q) {
	local show = q.show;
	q.show = function( _entities, _allyBanners, _enemyBanners, _allowDisengage, _allowFormationPicking, _text, _image, _disengageText = "Cancel" )
	{
		if (_entities.len() > 0 && ::Legends.Mod.ModSettings.getSetting("ExactEngageNumbers").getValue()) {
			local stackinfos, count = 1;
			while (stackinfos == null && count <= 20) { // there is no way there is more than 20 mod hook on that same function lol
				stackinfos = getstackinfos(count);

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

						new.push({
							Name = format("%i %s", stackinfos.locals.entityTypes[i], ::Const.Strings.EntityNamePlural[i]),
							Icon = ::Const.EntityIcon[i],
							Overlay = null
						});
					}

					_entities = new;
					break;
				}

				stackinfos = null;
				++count;
			}
		}
		

		show(_entities, _allyBanners, _enemyBanners, _allowDisengage, _allowFormationPicking, _text, _image, _disengageText);
	}
});
