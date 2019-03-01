this.legend_steps_guided <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_steps_guided";
		this.m.Name = "Lay of the land";
		this.m.Description = "Point out terrain features and paths for your men, granting them pathfinder";
		this.m.Icon = "ui/perks/guided_steps_circle.png";
		this.m.IconMini = "status_effect_56_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}
	


	function onUpdate( _properties )
	{
	local actor = this.getContainer().getActor();
	actor.m.ActionPointCosts = this.Const.PathfinderMovementAPCost;
	actor.m.FatigueCosts = clone this.Const.PathfinderMovementFatigueCost;
	actor.m.LevelActionPointCost = 0;
	}


	function onTurnEnd()
	{
		this.removeSelf();
	}

});
