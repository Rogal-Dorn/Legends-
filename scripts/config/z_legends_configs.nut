local gt = this.getroottable();

if (!("LegendMod" in gt.Const))
{
	gt.Const.LegendMod <- {};
}

gt.Const.LegendMod.Configs <- {
    IsArmor = false,
    IsMagic = false,
    IsGender = false,

    Update = function (_settings)
    {
		this.IsGender = _settings.LegendGenderEquality;
		this.IsMagic = _settings.LegendMagic;
		this.IsArmor = _settings.LegendArmor;
    }

    LegendArmorsEnabled = function ()
    {
        return this.IsArmor
    }

    LegendMagicEnabled = function ()
    {
        return this.IsMagic
    }

    LegendGenderEnabled = function ()
    {
        return this.IsGender
    }

    onSerialize = function (_out)
    {
        _out.writeBool(this.IsArmor);
		_out.writeBool(this.IsMagic);
		_out.writeBool(this.IsGender);
    }

    onDeserialize = function (_in)
    {
		this.IsArmor = _in.readBool();
		this.IsMagic = _in.readBool();
		this.IsGender = _in.readBool();
    }

}

