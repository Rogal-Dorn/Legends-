::mods_hookNewObject("ai/tactical/behaviors/ai_attack_splitshield", function(o) {
    local fn = o.onEvaluate
    o.onEvaluate = function ( _entity )
	{
		local item = _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
        if ( item != null && item.getID() == "weapon.legend_parrying_dagger" )
            return this.Const.AI.Behavior.Score.Zero;
        else
            return fn(_entity);
	}
});
