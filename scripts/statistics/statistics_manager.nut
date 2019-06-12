this.statistics_manager <- {
	m = {
		LastLocationDestroyedName = "",
		LastLocationDestroyedFaction = 0,
		LastLocationDestroyedForContract = false,
		LastEnemiesDefeatedCount = 0,
		LastCombatResult = 0,
		LastCombatFaction = 0,
		Flags = null,
		News = [],
		Fallen = []
	},
	function get()
	{
		return this.m;
	}

	function getFlags()
	{
		return this.m.Flags;
	}

	function getFallen()
	{
		return this.m.Fallen;
	}

	function getNews()
	{
		return this.m.News;
	}

	function isNewsReady()
	{
		return this.m.News.len() != 0;
	}

	function hasNews( _type )
	{
		foreach( i, n in this.m.News )
		{
			if (n.Type == _type)
			{
				return true;
			}
		}

		return false;
	}

	function popNews( _type )
	{
		foreach( i, n in this.m.News )
		{
			if (n.Type == _type)
			{
				this.m.News.remove(i);

				if (this.m.News.len() != 0)
				{
					this.World.Events.resetLastEventTime();
				}

				return n;
			}
		}
	}

	function addNews( _type, _news )
	{
		_news.Type <- _type;
		_news.Time <- this.Time.getVirtualTimeF();

		if (this.m.News.len() >= 10)
		{
			this.m.News.remove(0);
		}

		this.m.News.push(_news);
		this.World.Events.resetLastEventTime();
	}

	function clearNews()
	{
		this.m.News = [];
	}

	function createNews()
	{
		return this.new("scripts/tools/tag_collection");
	}

	function addFallen( _bro, _killedBy="Left to die")
	{
		local b = _bro.getBaseProperties();
		local bstats = [
			b.Hitpoints,
			b.Stamina,
			b.Bravery,
			b.Initiative,
			b.MeleeSkill,
			b.RangedSkill,
			b.MeleeDefense,
			b.RangedDefense
		];
		local _fallen = {
			Name = _bro.getName(),
			Time = this.World.getTime().Days,
			TimeWithCompany = this.Math.max(1, _bro.getDaysWithCompany()),
			Kills = _bro.getLifetimeStats().Kills,
			Battles = _bro.getLifetimeStats().Battles,
			KilledBy = _killedBy,
			level = _bro.getLevel(),
			traits = _bro.getDeadTraits(),
			stats = bstats,
			talents = _bro.getTalents()
		};		
		this.m.Fallen.insert(0, _fallen);
	}

	function create()
	{
		this.m.Flags = this.new("scripts/tools/tag_collection");
		this.m.Flags.set("GreaterEvilsDefeated", 0);
		this.m.Flags.set("ItemsCrafted", 0);
	}

	function clear()
	{
		this.m.News = [];
	}

	function onSerialize( _out )
	{
		_out.writeString(this.m.LastLocationDestroyedName);
		_out.writeU8(this.m.LastLocationDestroyedFaction);
		_out.writeBool(this.m.LastLocationDestroyedForContract);
		_out.writeU16(this.m.LastEnemiesDefeatedCount);
		_out.writeU8(this.m.LastCombatResult);
		_out.writeU8(this.m.LastCombatFaction);
		this.m.Flags.onSerialize(_out);
		_out.writeU8(this.m.News.len());

		foreach( n in this.m.News )
		{
			_out.writeString(n.Type);
			_out.writeF32(n.Time);
			n.onSerialize(_out);
		}

		_out.writeU32(this.m.Fallen.len());

		foreach( f in this.m.Fallen )
		{
			_out.writeString(f.Name);
			_out.writeU32(f.Time);
			_out.writeU32(f.TimeWithCompany);
			_out.writeU32(f.Kills);
			_out.writeU32(f.Battles);
			_out.writeString(f.KilledBy);

			if (f.len() > 6)
			{
				_out.writeU8(f.level);
				_out.writeU8(f.traits.len());

				foreach( trait in f.traits )
				{
					_out.writeString(trait);
				}

				_out.writeU8(f.stats.len());

				foreach( stat in f.stats )
				{
					_out.writeU32(stat);
				}

				_out.writeU8(f.talents.len());

				foreach( talent in f.talents )
				{
					_out.writeU8(talent);
				}
			}
			else
			{
				_out.writeU8(-99);
				_out.writeU8(4);

				for( local i = 0; i < 4; i++ )
				{
					_out.writeString("");
				}

				_out.writeU8(8);

				for( local i = 0; i < 8; i++ )
				{
					_out.writeU32(-99);
				}

				_out.writeU8(8);

				for( local i = 0; i < 8; i++ )
				{
					_out.writeU8(-99);
				}
			}

			_out.writeBool(false);
		}
	}

	function onDeserialize( _in )
	{
		this.m.LastLocationDestroyedName = _in.readString();
		this.m.LastLocationDestroyedFaction = _in.readU8();
		this.m.LastLocationDestroyedForContract = _in.readBool();
		this.m.LastEnemiesDefeatedCount = _in.readU16();

		if (_in.getMetaData().getVersion() >= 21)
		{
			this.m.LastCombatResult = _in.readU8();
		}

		if (_in.getMetaData().getVersion() >= 42)
		{
			this.m.LastCombatFaction = _in.readU8();
		}

		this.m.Flags.onDeserialize(_in);
		local numNews = _in.readU8();
		this.m.News.resize(numNews);

		for( local i = 0; i < numNews; i = i )
		{
			local news = this.new("scripts/tools/tag_collection");
			news.Type <- _in.readString();
			news.Time <- _in.readF32();
			news.onDeserialize(_in);
			this.m.News[i] = news;
			i = ++i;
			i = i;
		}

		local numFallen = _in.readU32();
		this.m.Fallen.resize(numFallen);

		for( local i = 0; i < numFallen; i = i )
		{
			local f = {};
			f.Name <- _in.readString();
			f.Time <- _in.readU32();
			f.TimeWithCompany <- _in.readU32();
			f.Kills <- _in.readU32();
			f.Battles <- _in.readU32();
			f.KilledBy <- _in.readString();

			if (_in.getMetaData().getVersion() >= 57)
			{
				f.level <- _in.readU8();
				f.traits <- [];
				local numtraits = _in.readU8();

				for( local i = 0; i != numtraits; i++ )
				{
					f.traits.push(_in.readString());
				}

				f.stats <- [];
				local numstats = _in.readU8();

				for( local i = 0; i != numstats; i++ )
				{
					f.stats.push(_in.readU32());
				}

				f.talents <- [];
				local numtalents = _in.readU8();

				for( local i = 0; i != numtalents; i++ )
				{
					f.talents.push(_in.readU8());
				}
			}

			_in.readBool();
			this.m.Fallen[i] = f;
			i = ++i;
			i = i;
		}
	}

};

