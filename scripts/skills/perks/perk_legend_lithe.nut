this.perk_legend_lithe <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_lithe";
		this.m.Name = this.Const.Strings.PerkName.LegendLithe;
		this.m.Icon = "ui/perks/lithe.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		local fm = this.getChance();
		return fm <= 0;
	}

	function getDescription()
	{
		return "Lithe like a lizard! This character is able to partially evade or deflect attacks at the last moment, turning them into glancing hits. ";
	}

	function getTooltip()
	{
		local fm = this.getChance();
		local tooltip = this.skill.getTooltip();

		if (fm > 0)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Gain a [color=" + this.Const.UI.Color.PositiveValue + "]" + fm + "%[/color] chance of a defense reroll"
			});
		}
		else //This part doesn't show up due to the "isHidden()" function further up. 
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]This character\'s body and head armor are too heavy as to gain any benefit from being lithe[/color]"
			});
		}

		return tooltip;
	}

	function getChance()
	{
		local fat = 0;
		local body = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Body);
		local head = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Head);

		if (body != null)
		{
			fat = fat + body.getStaminaModifier();
		}

		if (head != null)
		{
			fat = fat + head.getStaminaModifier();
		}
		//30 here is max armor fat before dropoff starts
		fat = this.Math.min(0, fat + 30);
		//30 here is what the bonus starts at. Graph of the function can be found here.
		//http://fooplot.com/#W3sidHlwZSI6MCwiZXEiOiIzMC0oKG1heCgwLHgtMzApXjEuMSkpIiwiY29sb3IiOiIjMDAwMDAwIn0seyJ0eXBlIjoxMDAwLCJ3aW5kb3ciOlsiLTIyLjU3NjkyMzA3NjkyMzA3MyIsIjEwMi40MjMwNzY5MjMwNzY5MyIsIi0xNy4zMTI1IiwiMTA3LjY4NzUiXX1d
		local ret = this.Math.floor(this.Math.max(0, 30 - this.Math.pow(this.Math.abs(fat), 1.1)));
		return ret;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker != null && _attacker.getID() == this.getContainer().getActor().getID() || _skill == null || !_skill.isAttack() || !_skill.isUsingHitchance())
		{
			return;
		}
		local actor = this.getContainer().getActor();
		local chance = this.getChance();
		_properties.RerollDefenseChance += chance;
	}

});

