local gt = this.getroottable();

local treeNameTable = {};
local getTreeName = function( _treeName )
{
    if (_treeName in treeNameTable) return treeNameTable[_treeName];

    local name = _treeName.slice(0,_treeName.len()-4);
    local result = "";
    foreach (c in name)
    {
        if (c < 91) result += " ";
        result += c.tochar();
    }
    result = result.slice(1);
    treeNameTable[_treeName] <- result;
    return result;
}

foreach (treeName, perkTree in gt.Const.Perks)
{
	if (!("Tree" in perkTree)) continue;

	local name = getTreeName(treeName);

	for (local i = 0; i < perkTree.Tree.len(); ++i) 
	{
		for (local j = 0; j < perkTree.Tree[i].len(); ++j) 
		{
			local c = gt.Const.Perks.TempIToConst[perkTree.Tree[i][j]];
			
		}
	}
}

delete gt.Const.Perks.TempIToConst;