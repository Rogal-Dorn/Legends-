this.zombie_item <- this.inherit("scripts/items/spawns/spawn_item", {
	m = {
		UnleashSounds = [
			"sounds/enemies/geist_idle_10.wav",
			"sounds/enemies/geist_idle_11.wav",
			"sounds/enemies/geist_idle_12.wav"
		]
	},

	function create()
	{
		this.spawn_item.create();
		this.m.Variant = 1
		this.updateVariant();
		this.m.ID = "spawns.zombie";
		this.m.Name = this.Const.Strings.WardogNames[this.Math.rand(0, this.Const.Strings.WardogNames.len() - 1)] + " the Zombie";
		this.m.Description = "An undead minion. Can be unleashed to do your bidding";
		this.m.IsDroppedAsLoot = false;
		this.m.ShowOnCharacter = false;
		this.m.IsChangeableInBattle = false;
		this.m.Icon = "tools/zombie_01_0" + this.m.Variant + "_70x70.png";
		this.m.Value = 1000;
	}

	function getName()
	{
		return this.item.getName();
	}

	function setName( _n )
	{
		this.m.Name = _n;
	}

	function playInventorySound( _eventType )
	{
		local index = this.Math.rand(1, 16)
		local variant = "" + index;
		if (index < 10){
			variant = "0" + index;
		}
		this.Sound.play("sounds/enemies/zombie_idle_" +  variant + ".wav", this.Const.Sound.Volume.Inventory);
	}

	function onCombatFinished()
	{
		if (this.m.Entity == null)
		{
			return
		}
		if this.m.Entity.
		this.setEntity(null);
	}

	function onSerialize( _out )
	{
		this.spawn_item.onSerialize(_out);
		_out.writeString(this.m.Name);
	}

	function onDeserialize( _in )
	{
		this.spawn_item.onDeserialize(_in);
		this.m.Name = _in.readString();
	}

});
