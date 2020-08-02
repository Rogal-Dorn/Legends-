::mods_hookNewObject("ai/tactical/behaviors/ai_attack_splitshield", function(o) {
    local fn = o.onEvaluate
    o.onEvaluate = function ( _entity )
	{
        local score = fn(_entity);

        if (this.m.TargetTile == null)
            return score;

		local item = this.m.TargetTile.getEntity().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
        if ( item != null && item.getID() == "shield.legend_parrying_dagger" )
        {
            this.m.TargetTile = null;
            return this.Const.AI.Behavior.Score.Zero;
        }
        else
            return score;
	}
});
