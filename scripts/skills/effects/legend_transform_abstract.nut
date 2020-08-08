this.legend_transform_abstract <- this.inherit("scripts/skills/skill", {
    m = {
        TurnsLeft = 5,
		Body = "",
		Head = "",
		Injury = "",
		OriginalFaction = 0,
		OriginalAgent = null,
		OriginalSocket = null,
		Items = [],
        Agent = null,
        DefaultTurns = 3,
        TrueFormTurns = 6
    },
    function create()
	{
		this.m.Type = this.Const.SkillType.Terrain | this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsHidden = false;
		this.m.IsSerialized = false;
		this.m.IsRemovedAfterBattle = true;
        this.m.Agent = this.new(this.m.Agent);
        this.m.Agent.setActor(this.getContainer().getActor());
	}

    //in inheriters add skills & make sure we overwrote setSprite() function
    function onAdded()
	{
		local actor = this.getContainer().getActor();
		if (("State" in this.Tactical) && this.Tactical.State != null) {
			if (actor.getTile().IsVisibleForPlayer)
			{
				if (this.Const.Tactical.TransformParticles.len() != 0)
				{
					for( local i = 0; i < this.Const.Tactical.TransformParticles.len(); i = ++i )
					{
						this.Tactical.spawnParticleEffect(false, this.Const.Tactical.TransformParticles[i].Brushes, actor.getTile(), this.Const.Tactical.TransformParticles[i].Delay, this.Const.Tactical.TransformParticles[i].Quantity, this.Const.Tactical.TransformParticles[i].LifeTimeQuantity, this.Const.Tactical.TransformParticles[i].SpawnRate, this.Const.Tactical.TransformParticles[i].Stages);
					}
				}
			}
		}

        this.m.Body = actor.getSprite("body").getBrush().Name;
		this.m.Head = actor.getSprite("head").getBrush().Name;
		
		this.setAIAgent();
        this.removeItems();
		this.setSprite();


		this.m.TurnsLeft = this.m.DefaultTurns;
		if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_true_form"))
			this.m.TurnsLeft = this.m.TrueFormTurns;
		
	}

    function onTurnEnd()
	{
        local actor = this.getContainer().getActor();
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
			this.removeEffect();
			return;
		}
		local actor = this.getContainer().getActor();
		if (actor.getAIAgent().getID() != this.m.Agent.getID())
		{
			this.setAIAgent(true);
		}
	}
    
    function onRemoved()
	{
		this.removeEffect();
	}
	
	function onCombatFinished()
	{
		this.removeSelf();
		this.removeEffect();
	}

    function revertAIAgent()
    {
        local actor = this.getContainer().getActor();
        actor.setAIAgent(this.m.OriginalAgent);
        actor.setFaction(this.m.OriginalFaction);
    }

    function setAIAgent( _force = false )
    {
        local actor = this.getContainer().getActor();
        this.m.OriginalAgent = actor.getAIAgent();
		this.m.OriginalFaction = actor.getFaction();
        if (actor.isPlayerControlled() || _force)
		{
			if (this.m.Container.hasSkill("perk.legend_surpress_urges") && !this.m.Container.hasSkill("perk.legend_control_instincts"))
			{
                actor.setAIAgent(this.m.Agent);
			}
			else if (this.m.Container.hasSkill("perk.legend_surpress_urges") && this.m.Container.hasSkill("perk.legend_control_instincts"))
			{}
			else	
			{
                actor.setFaction(this.Const.Faction.Beasts);		
                actor.setAIAgent(this.m.Agent);
			}
		}
    }

    function removeItems()
    {
        local actor = this.getContainer().getActor();
        local items = actor.getItems();
		if (items.getItemAtSlot(this.Const.ItemSlot.Mainhand))
		{
			local item = items.getItemAtSlot(this.Const.ItemSlot.Mainhand);
			items.unequip(item);
			this.m.Items.push(item);
		}
		if (items.getItemAtSlot(this.Const.ItemSlot.Offhand))
		{
			local item = items.getItemAtSlot(this.Const.ItemSlot.Offhand);
			items.unequip(item);
			this.m.Items.push(item);
		}
		if (items.getItemAtSlot(this.Const.ItemSlot.Body))
		{
			local item = items.getItemAtSlot(this.Const.ItemSlot.Body);
			items.unequip(item);
			this.m.Items.push(item);
		}
		if (items.getItemAtSlot(this.Const.ItemSlot.Head))
		{
			local item = items.getItemAtSlot(this.Const.ItemSlot.Head);
			items.unequip(item);
			this.m.Items.push(item);
		}
		foreach (i in items.getAllItemsAtSlot(this.Const.ItemSlot.Bag))
		{
			items.unequip(i);
			this.m.Items.push(i);
		}

		foreach( i in this.m.Items )
			i.drop(actor.getTile());
    }

    //just set the "body/head/injury" before this and we're golden
    function setSprite()
    {
        this.m.OriginalSocket = actor.getSprite("socket").getBrush().Name;
		actor.getSprite("socket").setBrush("bust_base_beasts");
		actor.setDirty(true);		

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
		actor.getSprite("armor").Alpha = 10;
		actor.getSprite("helmet").Alpha = 10;
		actor.getSprite("shield_icon").Alpha = 10;
		actor.getSprite("armor_layer_chain").Alpha = 10;
		actor.getSprite("armor_layer_plate").Alpha = 10;
		actor.getSprite("armor_layer_tabbard").Alpha = 10;
		actor.getSprite("armor_layer_tabbard").Alpha = 10;
		actor.getSprite("hair").Alpha = 10;
		actor.getSprite("beard").Alpha = 10;
		actor.getSprite("tattoo_head").Alpha = 10;
		actor.getSprite("tattoo_body").Alpha = 10;
		actor.getSprite("quiver").Alpha = 10;
		actor.getSprite("arms_icon").Alpha = 10;
		actor.getSprite("dirt").Alpha = 10;
		actor.getSprite("accessory").Alpha = 10;
		actor.getSprite("surcoat").Alpha = 10;
		actor.getSprite("armor_upgrade_back").Alpha = 10;
		actor.getSprite("armor_upgrade_front").Alpha = 10;
		actor.getSprite("socket").Alpha = 10;
    }

    function removeEffect()
    {
        local actor = this.getContainer().getActor();
		
		if (this.m.OriginalAgent != null)
		{
			actor.setAIAgent(this.m.OriginalAgent);
		}
		actor.setFaction(this.m.OriginalFaction);
		actor.getSprite("socket").setBrush(this.m.OriginalSocket);
		actor.setDirty(true);
		
		//change appearance 		
		actor.getSprite("body").setBrush(this.m.Body);
		actor.getSprite("head").setBrush(this.m.Head);
		actor.getSprite("armor").Alpha = 255;
		actor.getSprite("helmet").Alpha = 255;
		actor.getSprite("shield_icon").Alpha = 255;
		actor.getSprite("armor_layer_chain").Alpha = 255;
		actor.getSprite("armor_layer_plate").Alpha = 255;
		actor.getSprite("armor_layer_tabbard").Alpha = 255;
		actor.getSprite("armor_layer_cloak").Alpha = 255;
		actor.getSprite("hair").Alpha = 255;
		actor.getSprite("beard").Alpha = 255;
		actor.getSprite("tattoo_head").Alpha = 255;
		actor.getSprite("tattoo_body").Alpha = 255;
		actor.getSprite("quiver").Alpha = 255;
		actor.getSprite("arms_icon").Alpha = 255;
		actor.getSprite("dirt").Alpha = 255;
		actor.getSprite("accessory").Alpha = 255;
		actor.getSprite("surcoat").Alpha = 255;
		actor.getSprite("armor_upgrade_back").Alpha = 255;
		actor.getSprite("armor_upgrade_front").Alpha = 255;
		actor.getSprite("socket").Alpha = 255;
		if (actor.isPlayerControlled())
		{
			actor.getSprite("body").setHorizontalFlipping(0);
			actor.getSprite("head").setHorizontalFlipping(0);
			actor.getSprite("injury").setHorizontalFlipping(0);
		}

		if (("State" in this.Tactical) && this.Tactical.State != null) {
			if (actor.getTile().IsVisibleForPlayer)
			{
				if (this.Const.Tactical.TransformParticles.len() != 0)
				{
					for( local i = 0; i < this.Const.Tactical.TransformParticles.len(); i = ++i )
					{
						this.Tactical.spawnParticleEffect(false, this.Const.Tactical.TransformParticles[i].Brushes, actor.getTile(), this.Const.Tactical.TransformParticles[i].Delay, this.Const.Tactical.TransformParticles[i].Quantity, this.Const.Tactical.TransformParticles[i].LifeTimeQuantity, this.Const.Tactical.TransformParticles[i].SpawnRate, this.Const.Tactical.TransformParticles[i].Stages);
					}
				}
			}
		}

		local items = actor.getItems();
		items.getData()[this.Const.ItemSlot.Offhand][0] = null;
		items.getData()[this.Const.ItemSlot.Mainhand][0] = null;
    }

});