this.steel_brow_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.steel_brow";
		this.m.Name = "Steel Brow";
		this.m.Description = "Will turn any stun attacks made against you into dazes instead.";
		this.m.Icon = "ui/perks/perk_09.png";
		this.m.IconMini = "perk_61_mini"; //Needs new mini at some point
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "Any stun attack that hits you will turn into a daze instead"
			}
		];
	}

			//if (effect) -> remove and replace with diff. effect
    function onUse( _user, _targetTile )
    {
        local bonk = this.attackEntity(_user, _targetTile.getEntity());

        if (bonk)
        {
            local target = _targetTile.getEntity();

            if (target.getCurrentProperties().IsStunned)
            {
                // target.getSprite("status_stunned").Visible = false; //Not needed - is managed by dazed_effect.nut
                target.getSkills().removeByID("effects.stunned");
                target.getSkills().add(this.new("scripts/skills/effects/dazed_effect"));
            }
        }

        return success;
    }

	// function onUpdate( _properties )
	// {
	// 	if (!this.getContainer().getActor().isPlacedOnMap())
	// 	{
	// 		this.m.IsHidden = true;
	// 		return;
	// 	}

	// 	local actor = this.getContainer().getActor();
	// 	local myTile = actor.getTile();
	// 	local allies = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());
	// 	local isAlone = true;

	// 	foreach( ally in allies )
	// 	{
	// 		if (ally.getID() == actor.getID() || !ally.isPlacedOnMap())
	// 		{
	// 			continue;
	// 		}

	// 		if (ally.getTile().getDistanceTo(myTile) <= 2)
	// 		{
	// 			isAlone = false;
	// 			break;
	// 		}
	// 	}

	// 	if (isAlone)
	// 	{
	// 		this.m.IsHidden = false;
	// 		_properties.MeleeSkillMult *= 1.15;
	// 		_properties.RangedSkillMult *= 1.15;
	// 		_properties.MeleeDefenseMult *= 1.15;
	// 		_properties.RangedDefenseMult *= 1.15;
	// 		_properties.BraveryMult *= 1.15;
	// 	}
	// 	else
	// 	{
	// 		this.m.IsHidden = true;
	// 	}
	// }

	// function onCombatFinished()
	// {
	// 	this.m.IsHidden = true;
	// }

});

