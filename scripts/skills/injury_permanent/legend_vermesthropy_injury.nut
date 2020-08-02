this.legend_vermesthropy_injury <- this.inherit("scripts/skills/injury_permanent/permanent_injury", {
	m = {},
	function create()
	{
		this.permanent_injury.create();
		this.m.ID = "injury.legend_vermesthropy";
		this.m.Name = "Lycanthrope";
		this.m.Description = "This character is cursed with lycanthropy and will transform into a wolf ";
		this.m.Icon = "ui/injury/injury_lycanthropy.png";
	}

	function getTooltip()
	{
	// 	local day = this.World.getTime().Days;
	//	local month = day / 28;
	//	local monthfloor = this.Math.floor(month);
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
				text = "Will transform into a wererat"
			}
		];
		this.addTooltipHint(ret);
		
	//	if (month == monthfloor)
	//	{
	//		ret.push({
	//			id = 16,
	//			type = "text",
	//			icon = "ui/icons/special.png",
	//			text = "it is currently a full moon, the transformation will happen during any battle today"
	//		});
	//	}			
		
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
	
		function onTurnStart()
	{
		local actor = this.getContainer().getActor();
		if (!actor.getSkills().hasSkill("perk.legend_master_anger"))
		{
			local r = this.Math.rand(1,10);
			local day = this.World.getTime().Days;
			local month = day / 28;
			local monthfloor = this.Math.floor(month);
			
			if (r == 1 && this.World.getTime().IsDaytime)
			{
					
				if (!actor.getSkills().hasSkill("effect.legend_transformed_rat") && month != monthfloor)
				{
					actor.getSkills().add(this.new("scripts/skills/effects/legend_transformed_rat_effect"));
				}
			}
			
			if (r <= 2 && !this.World.getTime().IsDaytime && month != monthfloor)
			{
				if (!actor.getSkills().hasSkill("effect.legend_transformed_rat"))
				{
					actor.getSkills().add(this.new("scripts/skills/effects/legend_transformed_rat_effect"));
				}
			}	
			
			if (month == monthfloor && !this.World.getTime().IsDaytime)	
			{
				if (!actor.getSkills().hasSkill("effect.legend_transformed_rat"))
				{
					actor.getSkills().add(this.new("scripts/skills/effects/legend_transformed_rat_effect"));
				}
			}	
		}
		else
		{
			if (!actor.getSkills().hasSkill("active.legend_transform_into_rat"))
			{
				actor.getSkills().add(this.new("scripts/skills/actives/legend_transform_into_rat"));
			}
		}
	
	}

});

