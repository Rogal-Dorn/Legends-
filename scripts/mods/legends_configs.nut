this.legends_configs <- {
	m = {
        AISpeed = 1.0,
        EnemeyTooltips = false
    },

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

    function LegendTherianthropyEnabled()
    {
        return false;
    }

    function onSerialize(_out)
    {
        _out.writeF32(this.m.AISpeed);
        _out.writeBool(this.m.EnemeyTooltips);
    }

    function onDeserialize(_in)
    {
        this.m.AISpeed = _in.readF32()
        if (_in.getMetaData().getVersion() >= 66)
		{
			this.m.EnemeyTooltips = _in.readBool();
		}
    }
}

