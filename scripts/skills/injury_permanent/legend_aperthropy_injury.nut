this.legend_aperthropy_injury <- this.inherit("scripts/skills/injury_permanent/permanent_injury", {
	m = {},
	function create()
	{
		this.permanent_injury.create();
		this.m.ID = "injury.legend_aperthropy";
		this.m.Name = "Aperthrope";
		this.m.Description = "This character is cursed with aperthropy and will transform into a boar ";
		this.m.Icon = "ui/injury/injury_aperthropy.png";
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
				text = "Will transform into a wereboar"
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
				this.m.Container.add(this.new("scripts/skills/effects/legend_transformed_boar_effect"));
			}
		}
	}
	else
	{
		if (!this.m.Container.hasSkill("active.legend_transform_into_boar"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_transform_into_boar"));
		}
	}
	
	}

});

