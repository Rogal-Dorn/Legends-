this.legend_transformed_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 5,
		OriginalBody = "",
		OriginalHead = "",
		OriginalInjury = null,
		OriginalFaction = 0,
		OriginalAgent = null,
		OriginalSocket = null,
		Items = [],
		Agent2 = "wardog_agent",
		Agent1 = "direwolf_agent",
		AgentID = "",
		Body = "",
		Head = "",
		Injury = null,
	},
	function create()
	{
		this.m.ID = "";
		this.m.Name = "";
		this.m.Description = "";
		this.m.Icon = "";
		this.m.IconMini = "";
		this.m.Type = this.Const.SkillType.Terrain | this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsHidden = false;
		this.m.IsSerialized = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		local actor = this.getContainer().getActor();
		local ret = this.getDefaultTooltip();

		if (actor.getSkills().hasSkill("perk.legend_surpress_urges"))
		{
			ret.push({
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "This character has gained some control of themselves and will only attack enemies."
			});
		}
		else
		{
			ret.push({
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "This character has lost control of themselves and may attack randomly. May still need your help to end their turn. "
			});
		}

		return ret;

	}

	function transformEffect()
	{
		if (!("State" in this.Tactical) || this.Tactical.State == null)
		{
			return;
		}

		if (!this.getContainer().getActor().getTile().IsVisibleForPlayer)
		{
			return;
		}

		for( local i = 0; i < this.Const.Tactical.TransformParticles.len(); i = ++i )
		{
			this.Tactical.spawnParticleEffect(false, this.Const.Tactical.TransformParticles[i].Brushes, this.getContainer().getActor().getTile(), this.Const.Tactical.TransformParticles[i].Delay, this.Const.Tactical.TransformParticles[i].Quantity, this.Const.Tactical.TransformParticles[i].LifeTimeQuantity, this.Const.Tactical.TransformParticles[i].SpawnRate, this.Const.Tactical.TransformParticles[i].Stages);
		}
	}

	function setAgents()
	{
		local actor = this.getContainer().getActor();

		if (!actor.isPlayerControlled())
		{
			return;
		}

		if (!actor.getSkills().hasSkill("perk.legend_control_instincts"))
		{
			return;
		}

		if (actor.getSkills().hasSkill("perk.legend_surpress_urges"))
		{
			this.logDebug(this.getName() + " AI set to " + this.m.Agent2);
			actor.setAIAgent(this.new("scripts/ai/tactical/agents/" + this.m.Agent2));
		}
		else
		{
			actor.setFaction(this.Const.Faction.Beasts);
			actor.getSprite("socket").setBrush("bust_base_beasts");
			actor.setDirty(true);
			local agent = this.new("scripts/ai/tactical/agents/" + this.m.Agent1);
			actor.setAIAgent(agent);
			this.m.AgentID = agent.getID();
		}

		actor.getAIAgent().setActor(actor);
		actor.getAIAgent().removeBehavior(this.Const.AI.Behavior.ID.Retreat);
	}

	function removeItemsOnTransform()
	{
		// remove items
		local items = this.getContainer().getActor().getItems();
		local item = items.getItemAtSlot(this.Const.ItemSlot.Body);
		if (item != null)
		{
			items.unequip(item);
			this.m.Items.push(item);
		}

		item = items.getItemAtSlot(this.Const.ItemSlot.Head);
		if (item != null)
		{
			items.unequip(item);
			this.m.Items.push(item);
		}

		if (!this.m.Container.hasSkill("perk.legend_surpress_urges"))
		{
			foreach (i in items.getAllItemsAtSlot(this.Const.ItemSlot.Bag))
			{
				items.unequip(i);
				this.m.Items.push(i);
			}
		}

		if (!this.m.Container.hasSkill("perk.legend_control_instincts"))
		{
			item = items.getItemAtSlot(this.Const.ItemSlot.Mainhand)
			if (item != null)
			{
				items.unequip(item);
				this.m.Items.push(item);
			}
		}

		if (this.m.Container.hasSkill("perk.legend_master_anger"))
		{
			item = items.getItemAtSlot(this.Const.ItemSlot.Offhand)
			if (item != null)
			{
				items.unequip(item);
				this.m.Items.push(item);
			}
		}


		foreach( i in this.m.Items )
			i.drop(this.getContainer().getActor().getTile());

		foreach( i in this.m.Items )
			i.clearSkills();
	}

	function onAdded()
	{
		//show the transformation
		this.transformEffect();


		local actor = this.getContainer().getActor();

		//change the AI
		this.m.OriginalAgent = actor.getAIAgent();
		this.m.OriginalFaction = actor.getFaction();
		this.m.OriginalSocket = actor.getSprite("socket").getBrush().Name;
		this.setAgents();

		//remove items
		this.removeItemsOnTransform();

		//set new sprites
		this.m.OriginalBody = actor.getSprite("body").getBrush().Name;
		this.m.OriginalHead = actor.getSprite("head").getBrush().Name;
		if (actor.getSprite("injury").HasBrush) {
			this.m.OriginalInjury = actor.getSprite("injury").getBrush().Name;
		}


		actor.getSprite("hair").Visible = false;
		actor.getSprite("beard").Visible = false;
		actor.getSprite("beard_top").Visible = false;
		if (actor.getSprite("tattoo_body").HasBrush)
		{
			actor.getSprite("tattoo_body").Visible = false;
		}
		if (actor.getSprite("tattoo_head").HasBrush)
		{
			actor.getSprite("tattoo_head").Visible = false;
		}

		local appearance = actor.getItems().getAppearance();
		appearance.HideBeard = true;
		appearance.HideHair = true;
		this.setSprites();

		this.m.TurnsLeft = 3;

		if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_true_form"))
		{
			this.m.TurnsLeft = 6;
		}

		this.setSkills();
	}

	function onRemoved()
	{
		this.removeEffect();
	}

	function onDeath()
	{
		this.onRemoved();
	}

	function onCombatFinished()
	{
		this.removeSelf();
		this.removeEffect();
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
			this.removeEffect();
			return;
		}

		local actor = this.getContainer().getActor();
		if (actor.isPlayerControlled())
		{
			return;
		}

		if (actor.getAIAgent().getID() != this.m.AgentID)
		{
			actor.setAIAgent(this.new("scripts/ai/tactical/agents/" + this.m.Agent1));
			actor.getAIAgent().setActor(actor);
		}
	}

	function removeEffect()
	{
		local actor = this.getContainer().getActor();

		//reset AI
		if (this.m.OriginalAgent != null)
		{
			actor.setAIAgent(this.m.OriginalAgent);
		}
		actor.setFaction(this.m.OriginalFaction);



		this.resetSprites();

		this.transformEffect();
		this.removeSkills();

		local items = actor.getItems();
		items.getData()[this.Const.ItemSlot.Offhand][0] = null;
		items.getData()[this.Const.ItemSlot.Mainhand][0] = null;

		//Todo, don't loose armor if Master?
	}

	// Set in the specific animal transformation effect
	function setSprites()
	{
		local actor = this.getContainer().getActor();
		actor.getSprite("body").setBrush(this.m.Body);
		actor.getSprite("head").setBrush(this.m.Head);
		if (this.m.Injury != null)
		{
			actor.getSprite("injury").setBrush(this.m.Injury);
		}

		if (!actor.isPlayerControlled())
		{
			actor.getSprite("body").setHorizontalFlipping(0);
			actor.getSprite("head").setHorizontalFlipping(0);
			actor.getSprite("injury").setHorizontalFlipping(0);
		}
		else
		{
			actor.getSprite("body").setHorizontalFlipping(1);
			actor.getSprite("head").setHorizontalFlipping(1);
			actor.getSprite("injury").setHorizontalFlipping(1);
		}
		actor.setBrushAlpha(10);
		actor.setDirty(true);
	}

	function resetSprites()
	{
		local actor = this.getContainer().getActor();
		actor.getSprite("socket").setBrush(this.m.OriginalSocket);
		actor.getSprite("body").setBrush(this.m.OriginalBody);
		actor.getSprite("head").setBrush(this.m.OriginalHead);
		if (this.m.OriginalInjury != null)
		{
			actor.getSprite("injury").setBrush(this.m.OriginalInjury);
		}
		else if (actor.getSprite("injury").HasBrush)
		{
			actor.getSprite("injury").setBrush("");
		}

		actor.setBrushAlpha(255);
		actor.getSprite("hair").Visible = true;
		actor.getSprite("beard").Visible = true;
		actor.getSprite("beard_top").Visible = false;

		if (actor.getSprite("tattoo_body").HasBrush)
		{
			actor.getSprite("tattoo_body").Visible = true;
		}
		if (actor.getSprite("tattoo_head").HasBrush)
		{
			actor.getSprite("tattoo_head").Visible = true;
		}

		local appearance = actor.getItems().getAppearance();
		appearance.HideBeard = false;
		appearance.HideHair = false;
		actor.setDirty(true);

		if (actor.isPlayerControlled())
		{
			actor.getSprite("body").setHorizontalFlipping(0);
			actor.getSprite("head").setHorizontalFlipping(0);
			actor.getSprite("injury").setHorizontalFlipping(0);
		}
		else
		{
			actor.getSprite("body").setHorizontalFlipping(1);
			actor.getSprite("head").setHorizontalFlipping(1);
			actor.getSprite("injury").setHorizontalFlipping(1);
		}

	}

	function setSkills()
	{
	}

	function removeSkills()
	{
	}

	function onUpdate(_properties)
	{
	}

});

