this.legends_actor_interactions <- {
    m = {
        BattlesTogether = 0
    },
    function onDeserialize( _out )
    {
        _out.writeU16(this.m.BattlesTogether);
    }
    function onSerialize( _in )
    {
        this.m.BattlesTogether = _in.readU16();
    }
};