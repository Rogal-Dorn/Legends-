this.legends_configs <- {
	m = {
        IsArmor = false,
        IsMagic = false,
        IsGender = false,
        IsItemScaling = false,
        IsLocationScaling = false,
        IsCampUnlock = false,
        IsRecruitScaling = false,
        IsBleedKiller = false,
        IsBlueprintsVisible = false,
        IsRelationship = false,
        IsWorldEconomy = false,
<<<<<<< HEAD
        IsHelmets = 0
=======
        IsTherian = false
>>>>>>> LegendsModv14
    },

    function Update (_settings)
    {
		this.m.IsGender = _settings.LegendGenderEquality;
		this.m.IsMagic = _settings.LegendMagic;
		this.m.IsArmor = _settings.LegendArmor;
		this.m.IsItemScaling = _settings.LegendItemScaling;
		this.m.IsLocationScaling = _settings.LegendLocationScaling;
		this.m.IsCampUnlock = _settings.LegendCampUnlock;
		this.m.IsRecruitScaling = _settings.LegendRecruitScaling;
        this.m.IsBleedKiller = _settings.LegendBleedKiller;
        this.m.IsBlueprintsVisible = _settings.LegendAllBlueprints;
        this.m.IsRelationship = _settings.LegendRelationship;
        this.m.IsWorldEconomy = _settings.LegendWorldEconomy;
<<<<<<< HEAD
        this.m.IsHelmets = _settings.LegendIsHelmet;
=======
        this.m.IsTherian = _settings.LegendTherian
>>>>>>> LegendsModv14
    }

    function LegendArmorsEnabled()
    {
        return this.m.IsArmor
    }

    function LegendMagicEnabled()
    {
        return this.m.IsMagic
    }

    function LegendGenderEnabled()
    {
        return this.m.IsGender
    }

    function LegendItemScalingEnabled()
    {
        return this.m.IsItemScaling
    }

    function LegendLocationScalingEnabled()
    {
        return this.m.IsLocationScaling
    }

    function LegendCampUnlockEnabled()
    {
        return this.m.IsCampUnlock
    }

    function LegendRecruitScalingEnabled()
    {
        return this.m.IsRecruitScaling
    }

    function LegendBleedKillerEnabled()
    {
        return this.m.IsBleedKiller
    }

    function LegendAllBlueprintsEnabled()
    {
        return this.m.IsBlueprintsVisible
    }

    function RelationshipsEnabled()
    {
        return this.m.IsRelationship
    }

    function LegendWorldEconomyEnabled()
    {
        return this.m.IsWorldEconomy
    }

    function LegendHelmetEnabled()
    {
        return this.m.IsHelmets != 2;
    }

    function LegendTherianthropyEnabled()
    {
        return this.m.IsTherian
    }

    function onSerialize(_out)
    {
        _out.writeBool(this.m.IsArmor);
		_out.writeBool(this.m.IsMagic);
		_out.writeBool(this.m.IsGender);
		_out.writeBool(this.m.IsItemScaling);
		_out.writeBool(this.m.IsLocationScaling);
		_out.writeBool(this.m.IsCampUnlock);
		_out.writeBool(this.m.IsRecruitScaling);
        _out.writeBool(this.m.IsBleedKiller);
        _out.writeBool(this.m.IsBlueprintsVisible);
        _out.writeBool(this.m.IsRelationship);
        _out.writeBool(this.m.IsWorldEconomy);
        _out.writeU8(this.m.IsHelmets);
        _out.writeBool(this.m.IsTherian);
    }

    function onDeserialize(_in)
    {
		this.m.IsArmor = _in.readBool();
		this.m.IsMagic = _in.readBool();
		this.m.IsGender = _in.readBool();
        this.m.IsItemScaling = _in.readBool();
        this.m.IsLocationScaling = _in.readBool();
        this.m.IsCampUnlock = _in.readBool();
        this.m.IsRecruitScaling = _in.readBool();
        if (_in.getMetaData().getVersion() >= 63)
		{
			this.m.IsBleedKiller = _in.readBool();
		}

        if (_in.getMetaData().getVersion() >= 65)
		{
			this.m.IsBlueprintsVisible = _in.readBool();
		}

        if (_in.getMetaData().getVersion() == 65)
        {
            this.m.IsRelationship = true;
        }
        else if (_in.getMetaData().getVersion() >= 66)
        {
            this.m.IsRelationship = _in.readBool();
        }

        if (_in.getMetaData().getVersion() >= 67)
        {
            this.m.IsWorldEconomy = _in.readBool();
        }

        if (_in.getMetaData().getVersion() >= 72)
        {
            this.m.IsHelmets = _in.readU8();
        }

        this.m.IsTherian = true;
        if (_in.getMetaData().getVersion() >= 72)
        {
            this.m.IsTherian = _in.readBool();
        }

    }
}

