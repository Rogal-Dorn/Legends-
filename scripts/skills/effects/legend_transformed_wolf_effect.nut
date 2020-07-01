this.legend_transformed_wolf_effect <- this.inherit("scripts/skills/skill", {
	m = {
	TurnsLeft = 5,
	Body = "",
	Head = "",
	Injury = ""
	},
	function create()
	{
		this.m.ID = "effect.legend_transformed_wolf";
		this.m.Name = "Wolf Form";
		this.m.Description = "This character is currently a wolf";
		this.m.Icon = "ui/perks/wolf_circle.png";
		this.m.IconMini = "status_effect_08_mini";
		this.m.Type = this.Const.SkillType.Terrain | this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsHidden = false;
		this.m.IsSerialized = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		{
			ret.extend([
				{
					id = 11,
					type = "text",
					icon = "ui/icons/special.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]-1[/color] AP per tile moved"
				}
			]);
		}


	

		return ret;

	}


	function onAdded()
	{


		local actor = this.getContainer().getActor();
			if (actor.getTile().IsVisibleForPlayer)
			{
				if (this.Const.Tactical.HideParticles.len() != 0)
				{
					for( local i = 0; i < this.Const.Tactical.HideParticles.len(); i = ++i )
					{
						this.Tactical.spawnParticleEffect(false, this.Const.Tactical.HideParticles[i].Brushes, actor.getTile(), this.Const.Tactical.HideParticles[i].Delay, this.Const.Tactical.HideParticles[i].Quantity, this.Const.Tactical.HideParticles[i].LifeTimeQuantity, this.Const.Tactical.HideParticles[i].SpawnRate, this.Const.Tactical.HideParticles[i].Stages);
					}
				}
			}
		local items = actor.getItems();
		items.getData()[this.Const.ItemSlot.Offhand][0] = null;
		items.getData()[this.Const.ItemSlot.Mainhand][0] = null;

		this.m.Body = actor.getSprite("body").getBrush().Name;
		this.m.Head = actor.getSprite("head").getBrush().Name;

		actor.getSprite("body").setBrush("bust_direwolf_0" + this.Math.rand(1, 3));
		actor.getSprite("head").setBrush("bust_direwolf_0" + this.Math.rand(1, 3) + "_head");
		actor.getSprite("body").setHorizontalFlipping(1);
		actor.getSprite("head").setHorizontalFlipping(1);


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
		this.m.TurnsLeft = 5;

		if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_true_form"))
		{
		this.m.TurnsLeft = 8;
		}

		if (!this.m.Container.hasSkill("actives.werewolf_claws"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/werewolf_claws"));
		}
		if (!this.m.Container.hasSkill("actives.werewolf_bite"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/werewolf_bite"));
		}

	}

	function onRemoved()
	{	




		local actor = this.getContainer().getActor();
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
		actor.getSprite("body").setHorizontalFlipping(0);
		actor.getSprite("head").setHorizontalFlipping(0);
		actor.getSprite("injury").setHorizontalFlipping(0);
		if (("State" in this.Tactical) && this.Tactical.State != null) {
			if (actor.getTile().IsVisibleForPlayer)
			{
				if (this.Const.Tactical.HideParticles.len() != 0)
				{
					for( local i = 0; i < this.Const.Tactical.HideParticles.len(); i = ++i )
					{
						this.Tactical.spawnParticleEffect(false, this.Const.Tactical.HideParticles[i].Brushes, actor.getTile(), this.Const.Tactical.HideParticles[i].Delay, this.Const.Tactical.HideParticles[i].Quantity, this.Const.Tactical.HideParticles[i].LifeTimeQuantity, this.Const.Tactical.HideParticles[i].SpawnRate, this.Const.Tactical.HideParticles[i].Stages);
					}
				}
			}
		}

		actor.getSkills().removeByID("actives.werewolf_claws");
		actor.getSkills().removeByID("actives.werewolf_bite");
		local items = actor.getItems();
		items.getData()[this.Const.ItemSlot.Offhand][0] = null;
		items.getData()[this.Const.ItemSlot.Mainhand][0] = null;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();

		actor.getSprite("body").setBrush("bust_wolf_01");
		actor.getSprite("head").setBrush("bust_wolf_01_head");

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


		if (!this.m.Container.hasSkill("actives.werewolf_claws"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/werewolf_claws"));
		}
		if (!this.m.Container.hasSkill("actives.werewolf_bite"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/werewolf_bite"));
		}
		_properties.MovementAPCostAdditional += -1;
		_properties.MovementFatigueCostMult *= 0.5;

	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}
});

