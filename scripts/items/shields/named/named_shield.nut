this.named_shield <- this.inherit("scripts/items/shields/shield", {
	m = {
		NameList = []
	},
	function create()
	{
		this.shield.create();
		this.m.ItemType = this.m.ItemType | this.Const.Items.ItemType.Named;
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
			return this.Const.Strings.RandomShieldPrefix[this.Math.rand(0, this.Const.Strings.RandomShieldPrefix.len() - 1)] + " ";
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

	function setName( _prefix = "" )
	{
		this.m.Name = _prefix + this.m.NameList[this.Math.rand(0, this.m.NameList.len() - 1)];
	}

	function randomizeValues()
	{
		if (this.Math.rand(1, 100) <= 50)
		{
			this.m.StaminaModifier = this.Math.round(this.m.StaminaModifier * this.Math.rand(70, 100) * 0.00999999978);
		}

		local r = this.Math.rand(1, 3);

		if (r == 1)
		{
			this.m.MeleeDefense = this.Math.round(this.m.MeleeDefense * this.Math.rand(120, 140) * 0.00999999978);
		}
		else if (r == 2)
		{
			this.m.RangedDefense = this.Math.round(this.m.RangedDefense * this.Math.rand(120, 140) * 0.00999999978);
		}
		else if (r == 3)
		{
			this.m.Condition = this.Math.round(this.m.Condition * this.Math.rand(120, 150) * 0.00999999978) * 1.0;
			this.m.ConditionMax = this.m.Condition;
		}
	}

	function onEquip()
	{
		this.shield.onEquip();

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

	function onSerialize( _out )
	{
		_out.writeF32(this.m.ConditionMax);
		this.shield.onSerialize(_out);
		_out.writeString(this.m.Name);
		_out.writeI8(this.m.StaminaModifier);
		_out.writeU16(this.m.MeleeDefense);
		_out.writeU16(this.m.RangedDefense);
	}

	function onDeserialize( _in )
	{
		this.m.ConditionMax = _in.readF32();
		this.shield.onDeserialize(_in);
		this.m.Name = _in.readString();
		this.m.StaminaModifier = _in.readI8();
		this.m.MeleeDefense = _in.readU16();
		this.m.RangedDefense = _in.readU16();
	}

});
