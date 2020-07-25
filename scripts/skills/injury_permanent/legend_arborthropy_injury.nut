this.legend_arborthropy_injury <- this.inherit("scripts/skills/injury_permanent/permanent_injury", {
	m = {},
	function create()
	{
		this.permanent_injury.create();
		this.m.ID = "injury.legend_arborthropy";
		this.m.Name = "Arborthrope";
		this.m.Description = "This character is cursed with arborthropy and will transform into a schrat ";
		this.m.Icon = "ui/injury/injury_arborthropy.png";
	}

	function getTooltip()
	{
		local ret = [
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
				id = 16,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Will transform into a schrat"
			}
		];
		this.addTooltipHint(ret);
		return ret;
	}

	function onUpdate( _properties )
	{
	}

	function onApplyAppearance()
	{
	}

	function onTurnStart()
	{
	
	if (!this.m.Container.hasSkill("effect.perk_master_anger")
	{
		local r = thisMath.rand(1,10);
		if (r == 1)
		{
			if (!this.m.Container.hasSkill("effect.legend_transformed_boar"))
			{
				this.m.Container.add(this.new("scripts/skills/effects/legend_transformed_tree_effect"));
			}
		}
	}
	else
	{
		if (!this.m.Container.hasSkill("active.legend_transform_into_tree"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_transform_into_tree"));
		}
	}
	
	}

});

