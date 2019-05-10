this.legend_evasion <- this.inherit("scripts/skills/skill", {
	m = {
		IsSpent = false
	},
	function create()
	{
		this.m.ID = "actives.legend_evasion";
		this.m.Name = "Evasion";
		this.m.Description = "Enables the character for one turn to move swiftly and safely through any Zone of Control without incurring any free attacks.";
		this.m.Icon = "skills/evasion.png";
		this.m.IconDisabled = "skills/evasion_bw.png";
		this.m.Overlay = "evasion";
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OtherTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 20;
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
		return this.skill.isUsable() && !this.getContainer().hasSkill("effects.evasion");
	}

	function isHidden()
	{
		return this.m.IsHidden || !this.getContainer().getActor().getItems().hasEmptySlot(this.Const.ItemSlot.Offhand);
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUse( _user, _targetTile )
	{
		if (!this.getContainer().hasSkill("effects.evasion"))
		{
			this.m.Container.add(this.new("scripts/skills/effects/evasion_effect"));
			return true;
		}

		return false;
	}

	function onTurnStart()
	{
		this.m.IsSpent = false;
	}

	function onRemoved()
	{
		this.m.Container.removeByID("effects.evasion");
	}

});
