this.legend_transform_into_bear <- this.inherit("scripts/skills/skill", {
	m = {
		IsSpent = false
	},
	function create()
	{
		this.m.ID = "actives.legend_transform_into_bear";
		this.m.Name = "Transform into Bear";
		this.m.Description = "Enables the character to turn into a bear, requires free hands";
		this.m.Icon = "skills/bear_square.png";
		this.m.IconDisabled = "skills/bear_square_bw.png";
		this.m.Overlay = "active_12";
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 30;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local p = this.getContainer().getActor().getCurrentProperties();
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			}
		];
	}

	function isUsable()
	{
		return !this.m.Container.hasSkill("effect.legend_transformed_bear") && this.skill.isUsable();
	}

	  function isHidden()
    {
        return this.m.IsHidden || !this.getContainer().getActor().getItems().hasEmptySlot(this.Const.ItemSlot.Mainhand);
    }


	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUse( _user, _targetTile )
	{
		if (!this.m.IsSpent)
		{
			this.m.Container.add(this.new("scripts/skills/effects/legend_transformed_bear_effect"));
			this.m.IsSpent = true;
		}
	}

	function onTurnStart()
	{
		this.m.IsSpent = false;
	}

	function onRemoved()
	{
		this.m.Container.removeByID("effects.legend_transformed_bear");
	}

});

