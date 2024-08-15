local gt = this.getroottable();
if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

gt.Const.Perks.SpecialTrees <- {
Tree = [],
Perks = [],

function addSpecialPerk( _chance, _perk, _tier, _desc, _func = null )
{
	this.Perks.push({
		Perk = _perk,
		Chance = _chance,
		Desc = "[color=" + gt.Const.UI.Color.NegativeValue + "]" + _desc + "[/color]"
		Func = _func != null ? _func : @(a, b) _chance,
		Row = _tier - 1
	});
	
	local i = 0;
	while (true)
	{
		local name = "Special" + i;
		if (!(name in gt.Const.Perks))
		{
			gt.Const.Perks[name] <- {
				ID = name,
				Descriptions = [
					"has something special about him"
				],
				Name = "Special Perks",
				Tree = [
					[], [], [], [], [], [], []
				]
			};
	
			gt.Const.Perks.SpecialTrees.Tree.push(gt.Const.Perks[name]);
		}
	
		if (gt.Const.Perks[name].Tree[_tier-1].len() > 1)
		{
			local totalPerksInTree = 0;
			foreach (row in gt.Const.Perks[name].Tree)
			{
				totalPerksInTree += row.len();
			}
			if (totalPerksInTree >= 5)
			{
				i++;
				continue;
			}
		}
	
		gt.Const.Perks[name].Tree[_tier-1].push(_perk);
		break;
	}
}

function getRandom( _exclude )
{
	local L = [];

	foreach( i, t in this.Tree )
	{
		if (_exclude != null && _exclude.find(t.ID))
		{
			continue;
		}

		L.push(i);
	}

	local r = this.Math.rand(0, L.len() - 1);
	return this.Tree[L[r]];
}

function getRandomPerk()
{
	local tree = this.getRandom(null);
	local L = [];

	foreach( row in tree.Tree )
	{
		foreach( p in row )
		{
			L.push(p);
		}
	}

	local r = this.Math.rand(0, L.len() - 1);
	return L[r];
}
};

gt.Const.Perks.SpecialTrees.addSpecialPerk(1, gt.Const.Perks.PerkDefs.LegendBattleheart, 7, "Battleheart", function( _player, _chance ) {

	local talents = _player.getTalents();
	local tl = talents.len() == 0 ? 0 : talents[gt.Const.Attributes.MeleeDefense];
	if (tl == 0)
	{
		return 0;
	}
	_chance *= this.Math.pow(2, tl);

	return _chance;
});	

gt.Const.Perks.SpecialTrees.addSpecialPerk(1, gt.Const.Perks.PerkDefs.Slaughterer, 5, "Slaughterer", function( _player, _chance ) {

	local talents = _player.getTalents();
	local tl = talents.len() == 0 ? 0 : talents[gt.Const.Attributes.MeleeSkill];
	if (tl == 0)
	{
		return 0;
	}		
	_chance *= this.Math.pow(2, tl);		

	return _chance;
});	

gt.Const.Perks.SpecialTrees.addSpecialPerk(1, gt.Const.Perks.PerkDefs.LegendRelax, 3, "Relax", function( _player, _chance ) {

	local talents = _player.getTalents();
	local tl = talents.len() == 0 ? 0 : talents[gt.Const.Attributes.Bravery];
	if (tl == 0)
	{
		return 0;
	}		
	_chance *= this.Math.pow(2, tl);			

	return _chance;
});

gt.Const.Perks.SpecialTrees.addSpecialPerk(1, gt.Const.Perks.PerkDefs.LegendSpecPoison, 4, "Poison Mastery", function( _player, _chance ) {

	local talents = _player.getTalents();
	local tl = talents.len() == 0 ? 0 : talents[gt.Const.Attributes.Hitpoints];
	if (tl == 0)
	{
		return 0;
	}		
	_chance *= this.Math.pow(2, tl);			

	return _chance;
});

gt.Const.Perks.SpecialTrees.addSpecialPerk(1, gt.Const.Perks.PerkDefs.LegendGuideSteps, 5, "Guide Steps", function( _player, _chance ) {

	local talents = _player.getTalents();
	local tl = talents.len() == 0 ? 0 : talents[gt.Const.Attributes.Fatigue];
	if (tl == 0)
	{
		return 0;
	}		
	_chance *= this.Math.pow(2, tl);			

	return _chance;
});

gt.Const.Perks.SpecialTrees.addSpecialPerk(1, gt.Const.Perks.PerkDefs.LegendTasteThePain, 7, "Taste the Pain", function( _player, _chance ) {

	local talents = _player.getTalents();
	local tl = talents.len() == 0 ? 0 : talents[gt.Const.Attributes.Hitpoints];
	if (tl == 0)
	{
		return 0;
	}		
	_chance *= this.Math.pow(2, tl);			

	return _chance;
});

gt.Const.Perks.SpecialTrees.addSpecialPerk(1, gt.Const.Perks.PerkDefs.TrophyHunter, 7, "Trophy Hunter", function( _player, _chance ) {

	local talents = _player.getTalents();
	local tl = talents.len() == 0 ? 0 : this.Math.max(talents[gt.Const.Attributes.MeleeSkill], talents[gt.Const.Attributes.RangedSkill]);
	if (tl == 0)
	{
		return 0;
	}		
	_chance *= this.Math.pow(2, tl);			

	return _chance;
});

gt.Const.Perks.SpecialTrees.addSpecialPerk(1, gt.Const.Perks.PerkDefs.Ironside, 7, "Ironside", function( _player, _chance ) {

	local talents = _player.getTalents();
	local tl = talents.len() == 0 ? 0 : talents[gt.Const.Attributes.MeleeDefense];
	if (tl == 0)
	{
		return 0;
	}		
	_chance *= this.Math.pow(2, tl);			

	return _chance;
});
