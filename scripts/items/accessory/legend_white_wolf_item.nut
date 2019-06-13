this.legend_white_wolf_item <- this.inherit("scripts/items/accessory/accessory", {
	m = {
		Skill = null,
		Entity = null,
		Script = "scripts/entity/tactical/legend_white_warwolf",
		UnleashSounds = [
			"sounds/enemies/wolf_idle_00.wav",
			"sounds/enemies/wolf_idle_01.wav",
			"sounds/enemies/wolf_idle_02.wav",
			"sounds/enemies/wolf_idle_03.wav",
			"sounds/enemies/wolf_idle_04.wav",
			"sounds/enemies/wolf_idle_06.wav",
			"sounds/enemies/wolf_idle_07.wav",
			"sounds/enemies/wolf_idle_08.wav",
			"sounds/enemies/wolf_idle_09.wav"
		]
	},
	function isAllowedInBag()
	{
		return false;
	}

	function getScript()
	{
		return this.m.Script;
	}

	function isUnleashed()
	{
		return this.m.Entity != null;
	}

	function getName()
	{
		if (this.m.Entity == null)
		{
			return this.item.getName();
		}
		else
		{
			return "Wolf Collar";
		}
	}

	function getDescription()
	{
		if (this.m.Entity == null)
		{
			return this.item.getDescription();
		}
		else
		{
			return "The collar of a white wolf that has been unleashed onto the battlefield.";
		}
	}

	function create()
	{
		this.accessory.create();
		this.m.Variant = this.Math.rand(1, 4);
		this.updateVariant();
		this.m.ID = "accessory.legend_white_warwolf";
		this.m.Name = this.Const.Strings.WardogNames[this.Math.rand(0, this.Const.Strings.WardogNames.len() - 1)] + " the White Wolf";
		this.m.Description = "A legendary white wolf, tamed to be a loyal companion in battle. Can be unleashed in battle.";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = false;
		this.m.IsChangeableInBattle = false;
		this.m.Value = 6000;
	}

	function playInventorySound( _eventType )
	{
		if (this.Math.rand(1, 100) <= 50)
		{
			this.Sound.play("sounds/enemies/wolf_idle_08.wav", this.Const.Sound.Volume.Inventory);
		}
	}

	function updateVariant()
	{
		this.setEntity(this.m.Entity);
	}

	function setEntity( _e )
	{
		this.m.Entity = _e;

		if (this.m.Entity != null)
		{
			this.m.Icon = "tools/legend_white_wolf_leash_70x70.png";
		}
		else
		{
			this.m.Icon = "tools/legend_white_wolf_01_70x70.png";
		}
	}

	function onEquip()
	{
		this.accessory.onEquip();
		local unleash = this.new("scripts/skills/actives/legend_unleash_white_wolf");
		unleash.setItem(this);
		this.m.Skill = this.WeakTableRef(unleash);
		this.addSkill(unleash);
	}

	function onCombatFinished()
	{
		this.setEntity(null);
	}

	function onActorDied( _onTile )
	{
		if (!this.isUnleashed() && _onTile != null)
		{
			local entity = this.Tactical.spawnEntity(this.getScript(), _onTile.Coords.X, _onTile.Coords.Y);
			entity.setItem(this);
			entity.setName(this.getName());
			this.setEntity(entity);
			entity.setFaction(this.Const.Faction.PlayerAnimals);
			this.Sound.play(this.m.UnleashSounds[this.Math.rand(0, this.m.UnleashSounds.len() - 1)], this.Const.Sound.Volume.Skill, _onTile.Pos);
		}
	}

	function onCombatFinished()
	{
		this.setEntity(null);
	}

	function onSerialize( _out )
	{
		this.accessory.onSerialize(_out);
		_out.writeString(this.m.Name);
	}

	function onDeserialize( _in )
	{
		this.accessory.onDeserialize(_in);
		this.m.Name = _in.readString();
	}

});

