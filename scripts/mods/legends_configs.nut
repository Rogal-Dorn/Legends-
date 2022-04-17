this.legends_configs <- {
	m = {
        IsHelmets = 0,
        IsTherian = false,
        AISpeed = 1.0,
        EnemeyTooltips = false
    },


    function Update (_settings)
    {
        this.m.IsHelmets = _settings.LegendIsHelmet;
        this.m.IsTherian = _settings.LegendTherian;
    }

    function AISpeed()
    {
        return this.m.AISpeed;
    }

    function setAISpeed(val)
    {
        this.m.AISpeed = val;
    }

    function EnemeyTooltips()
    {
        return this.m.EnemeyTooltips;
    }

    function setEnemeyTooltips(val)
    {
        this.m.EnemeyTooltips = val;
    }

    function LegendMagicEnabled()
    {
        return false;
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
        _out.writeU8(this.m.IsHelmets);
        _out.writeBool(this.m.IsTherian);
        _out.writeF32(this.m.AISpeed);
        _out.writeBool(this.m.EnemeyTooltips);
    }

    function onDeserialize(_in)
    {
        this.m.IsHelmets = _in.readU8();
        this.m.IsTherian = _in.readBool();
        this.m.AISpeed = _in.readF32()
        if (_in.getMetaData().getVersion() >= 66)
		{
			this.m.EnemeyTooltips = _in.readBool();
		}
    }
}

