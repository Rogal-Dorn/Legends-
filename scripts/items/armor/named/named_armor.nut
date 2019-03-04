this.named_armor <- this.inherit("scripts/items/armor/armor", {
	m = {
		NameList = []
	},
	function create()
	{
		this.armor.create();
		this.m.ItemType = this.m.ItemType | this.Const.Items.ItemType.Named;
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedWhenDamaged = true;
	}

	function getRandomCharacterName( _list )
	{
		local vars = [
			[
				"randomname",
				this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]
			],
			[
				"randomtown",
				this.Const.World.LocationNames.VillageWestern[this.Math.rand(0, this.Const.World.LocationNames.VillageWestern.len() - 1)]
			]
		];
		return this.buildTextFromTemplate(_list[this.Math.rand(0, _list.len() - 1)], vars);
	}

	function createRandomName()
	{
		local r = this.Math.rand(1, 100);

		if (r <= 60)
		{
			return this.Const.Strings.RandomArmorPrefix[this.Math.rand(0, this.Const.Strings.RandomArmorPrefix.len() - 1)] + " ";
		}
		else if (this.Math.rand(1, 2) == 1)
		{
			return this.getRandomCharacterName(this.Const.Strings.KnightNames) + "\'s ";
		}
		else
		{
			return this.getRandomCharacterName(this.Const.Strings.BanditLeaderNames) + "\'s ";
		}
	}

	function onEquip()
	{
		this.armor.onEquip();

		if (this.m.Name.len() == 0)
		{
			if (this.Math.rand(1, 100) <= 75)
			{
				this.setName(this.getContainer().getActor().getName() + "\'s ");
			}
			else
			{
				this.setName(this.createRandomName());
			}
		}
	}

	function onAddedToStash( _stashID )
	{
		if (this.m.Name.len() == 0)
		{
			this.setName(this.createRandomName());
		}
	}

	function setName( _prefix = "" )
	{
		this.m.Name = _prefix + this.m.NameList[this.Math.rand(0, this.m.NameList.len() - 1)];
	}

	function randomizeValues()
	{
		this.m.Condition = this.Math.round(this.m.Condition * this.Math.rand(110, 130) * 0.01) * 1.0;
		this.m.ConditionMax = this.m.Condition;
		this.m.StaminaModifier = this.Math.round(this.m.StaminaModifier * this.Math.rand(80, 105) * 0.01);
	}

	function onSerialize( _out )
	{
		_out.writeString(this.m.Name);
		_out.writeF32(this.m.ConditionMax);
		_out.writeI8(this.m.StaminaModifier);
		this.armor.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.m.Name = _in.readString();
		this.m.ConditionMax = _in.readF32();
		this.m.StaminaModifier = _in.readI8();
		this.armor.onDeserialize(_in);
		this.updateVariant();
	}

});

