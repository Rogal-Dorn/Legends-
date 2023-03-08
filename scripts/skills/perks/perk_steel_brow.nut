this.perk_steel_brow <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.steel_brow";
		this.m.Name = this.Const.Strings.PerkName.SteelBrow;
		this.m.Description = this.Const.Strings.PerkDescription.SteelBrow;
		this.m.Icon = "ui/perks/perk_09.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
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

});

