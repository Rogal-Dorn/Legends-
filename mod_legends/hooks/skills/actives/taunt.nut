::mods_hookExactClass("skills/actives/taunt", function(o)
{
	o.onUse = function ( _user, _targetTile )
	{
		local target = _targetTile.getEntity();
		target.getAIAgent().setForcedOpponent(_user);
		target.getSkills().add(this.new("scripts/skills/effects/taunted_effect"));
		return true;
		this.getContainer().add(this.new("scripts/skills/effects/taunt_effect"));
	}
});
