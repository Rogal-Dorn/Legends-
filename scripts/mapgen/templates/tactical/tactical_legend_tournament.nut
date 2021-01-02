this.tactical_legend_tournament <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.legend_tournament";
		this.m.MinX = 26;
		this.m.MinY = 26;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
	
		
		
		
		local r = this.Math.rand(1, 5);	
		switch(r){
		case 1:
			//steppe theme
			local Tile1 = this.MapGen.get("tactical.tile.steppe1");
			local Tile2 = this.MapGen.get("tactical.tile.steppe2");
			local Tile3 = this.MapGen.get("tactical.tile.steppe3");
			local Tile4 = this.MapGen.get("tactical.tile.steppe4");
			return;
		case 2:
			//autumn theme
			local Tile1 = this.MapGen.get("tactical.tile.autumn1");
			local Tile2 = this.MapGen.get("tactical.tile.autumn2");
			local Tile3 = this.MapGen.get("tactical.tile.autumn3");
			local Tile4 = this.MapGen.get("tactical.tile.autumn4");
			return;
		case 3:
			//forest theme
			local Tile1 = this.MapGen.get("tactical.tile.forest1");
			local Tile2 = this.MapGen.get("tactical.tile.forest2");
			local Tile3 = this.MapGen.get("tactical.tile.moss1");
			local Tile4 = this.MapGen.get("tactical.tile.moss2");
		case 4:
			//swamp theme
			local Tile1 = this.MapGen.get("tactical.tile.swamp1");
			local Tile2 = this.MapGen.get("tactical.tile.swamp2");
			local Tile3 = this.MapGen.get("tactical.tile.swamp3");
			local Tile4 = this.MapGen.get("tactical.tile.swamp4");	
			return;
		case 5:
			//desert theme
			local Tile1 = this.MapGen.get("tactical.tile.desert1");
			local Tile2 = this.MapGen.get("tactical.tile.desert2");
			local Tile3 = this.MapGen.get("tactical.tile.desert3");
			local Tile4 = this.MapGen.get("tactical.tile.desert4");	
			return;
		case 6:
			//snow theme
			local Tile1 = this.MapGen.get("tactical.tile.snow1");
			local Tile2 = this.MapGen.get("tactical.tile.snow2");
			local Tile3 = this.MapGen.get("tactical.tile.snow3");
			local Tile4 = this.MapGen.get("tactical.tile.snow4");	
			return;
		case 7:
			//grass theme
			local Tile1 = this.MapGen.get("tactical.tile.grass1");
			local Tile2 = this.MapGen.get("tactical.tile.grass2");
			local Tile3 = this.MapGen.get("tactical.tile.earth1");
			local Tile4 = this.MapGen.get("tactical.tile.earth2");	
			return;
		case 8:
			//moss theme
			local Tile1 = this.MapGen.get("tactical.tile.moss1");
			local Tile2 = this.MapGen.get("tactical.tile.moss2");
			local Tile3 = this.MapGen.get("tactical.tile.forest1");
			local Tile4 = this.MapGen.get("tactical.tile.forest2");	
			return;
		case 8:
			//stone theme
			local Tile1 = this.MapGen.get("tactical.tile.stone1");
			local Tile2 = this.MapGen.get("tactical.tile.stone2");
			local Tile3 = this.MapGen.get("tactical.tile.stone3");
			local Tile4 = this.MapGen.get("tactical.tile.earth1");	
			return;
		case 9:
			//tundra theme
			local Tile1 = this.MapGen.get("tactical.tile.tundra1");
			local Tile2 = this.MapGen.get("tactical.tile.tundra2");
			local Tile3 = this.MapGen.get("tactical.tile.tundra3");
			local Tile4 = this.MapGen.get("tactical.tile.tundra4");	
			return;
		case 10:
			//dirt theme
			local Tile1 = this.MapGen.get("tactical.tile.earth1");
			local Tile2 = this.MapGen.get("tactical.tile.earth2");
			local Tile3 = this.MapGen.get("tactical.tile.grass1");
			local Tile4 = this.MapGen.get("tactical.tile.grass2");	
			return;
		}
		
		this.addRoads(_rect, _properties);
		local templates = [];
		
		local r = this.Math.rand(1, 9);	
		switch(r){
			case 1:
				local StandardPatch = this.MapGen.get("tactical.patch.steppe");
				return;
			case 2:
				local StandardPatch = this.MapGen.get("tactical.patch.clearing");
				return;
			case 3:
				local StandardPatch = this.MapGen.get("tactical.patch.clearing_leveled");
				return;
			case 4:
				local StandardPatch = this.MapGen.get("tactical.patch.tundra");
				return;
			case 5:
				local StandardPatch = this.MapGen.get("tactical.patch.forest");
				return;
			case 6:
				local StandardPatch = this.MapGen.get("tactical.patch.swamp");
				return;
			case 7:
				local StandardPatch = this.MapGen.get("tactical.patch.tundra_grass");
				return;
			case 8:
				local StandardPatch = this.MapGen.get("tactical.patch.desert");
				return;
			case 9:
				local StandardPatch = this.MapGen.get("tactical.patch.autumn_grass");
				return;
			}		
		
		local r = this.Math.rand(1, 10);	
		switch(r){
			case 1:
				local DryPatch = this.MapGen.get("tactical.patch.stone_circle");
				return;
			case 2:
				local DryPatch = this.MapGen.get("tactical.patch.stone_sea");
				return;
			case 3:
				local DryPatch = this.MapGen.get("tactical.patch.dry");
				return;
			case 4:
				local DryPatch = this.MapGen.get("tactical.patch.bones");
				return;
			case 5:
				local DryPatch = this.MapGen.get("tactical.patch.forest_leaves");
				return;
			case 6:
				local DryPatch = this.MapGen.get("tactical.patch.arena");
				return;
			case 7:
				local DryPatch = this.MapGen.get("tactical.patch.tundra_stony");
				return;
			case 8:
				local DryPatch = this.MapGen.get("tactical.patch.autumn_stony");
				return;
			case 9:
				local DryPatch = this.MapGen.get("tactical.patch.snow_less");
				return;
			case 10:
				local DryPatch = this.MapGen.get("tactical.patch.forest_mushrooms");
				return;
			}	

		local r = this.Math.rand(1, 10);	
		switch(r){
			case 1:
				local WetPatch = this.MapGen.get("tactical.patch.autumn_brushes");
				return;
			case 2:
				local WetPatch = this.MapGen.get("tactical.patch.clover_sea");
				return;
			case 3:
				local WetPatch = this.MapGen.get("tactical.patch.flower_sea");
				return;
			case 4:
				local WetPatch = this.MapGen.get("tactical.patch.forest_fern_sea");
				return;
			case 5:
				local WetPatch = this.MapGen.get("tactical.patch.forest_leaves_thick");
				return;
			case 6:
				local WetPatch = this.MapGen.get("tactical.patch.forest_thick");
				return;
			case 7:
				local WetPatch = this.MapGen.get("tactical.patch.swamp_pond");
				return;
			case 8:
				local WetPatch = this.MapGen.get("tactical.patch.tundra_brushes");
				return;
			case 9:
				local WetPatch = this.MapGen.get("tactical.patch.snow");
				return;
			case 10:
				local WetPatch = this.MapGen.get("tactical.patch.oasis");
				return;
			}	
		

		local r = this.Math.rand(1, 9);	
		switch(r){
			case 1:
				local HillPatch = this.MapGen.get("tactical.patch.hill_steppe");
				return;
			case 2:
				local HillPatch = this.MapGen.get("tactical.patch.hill_snow");
				return;
			case 3:
				local HillPatch = this.MapGen.get("tactical.patch.hill_desert");
				return;
			case 4:
				local HillPatch = this.MapGen.get("tactical.patch.hill_tundra");
				return;
			case 5:
				local HillPatch = this.MapGen.get("tactical.patch.mountain");
				return;
			case 6:
				local HillPatch = this.MapGen.get("tactical.patch.mound");
				return;
			case 7:
				local HillPatch = this.MapGen.get("tactical.patch.hill");
				return;
			case 8:
				local HillPatch = this.MapGen.get("tactical.patch.ritual_site");
				return;
			case 9:
				local HillPatch = this.MapGen.get("tactical.patch.forest_snow");
				return;
			}			
		
		templates.push(StandardPatch);
		templates.push(StandardPatch);
		templates.push(StandardPatch);
		templates.push(HillPatch);
		templates.push(WetPatch);
		templates.push(DryPatch);


		local patches = 12;

		while (patches != 0)
		{
			patches = --patches;
			local selectedTemplate = templates[this.Math.rand(0, templates.len() - 1)];
			local sizeX = this.Math.rand(this.Math.max(selectedTemplate.getMinX(), this.Math.min(selectedTemplate.getMaxX(), 8)), this.Math.min(selectedTemplate.getMaxX(), 16));
			local sizeY = this.Math.rand(this.Math.max(selectedTemplate.getMinY(), this.Math.min(selectedTemplate.getMaxY(), 8)), this.Math.min(selectedTemplate.getMaxY(), 16));
			local rect = {
				X = 0,
				Y = 0,
				W = sizeX,
				H = sizeY,
				IsEmpty = true
			};
			rect.X = this.Math.rand(1, _rect.W - sizeX);
			rect.Y = this.Math.rand(1, _rect.H - sizeY);
			selectedTemplate.fill(rect, _properties);
		}

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);

				if (x <= _rect.X + 1 || y <= _rect.Y + 1 || x >= _rect.X + _rect.W - 2 || y >= _rect.Y + _rect.H - 2)
				{
					if (x <= _rect.X || y <= _rect.Y || x >= _rect.X + _rect.W - 1 || y >= _rect.Y + _rect.H - 1)
					{
						tile.Level = 3;
					}
					else
					{
						tile.Level = 2;
					}

					tile.Type = 0;
					Tile4.fill({
						X = x,
						Y = y,
						W = 1,
						H = 1,
						IsEmpty = true
					}, _properties, 1);
				}
				else
				{
					tile.Level = 0;

					if (tile.Type != 0)
					{
					}
					else
					{
						local r = this.Math.rand(1, 3);

						if (r == 1)
						{
							steppeTile1.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = true
							}, _properties, 1);
							Tile1.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = true
							}, _properties, 2);
						}
						else if (r == 2)
						{
							Tile2.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = true
							}, _properties, 1);
							Tile2.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = true
							}, _properties, 2);
						}
						else if (r == 3)
						{
							Tile3.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = true
							}, _properties, 1);
							Tile3.fill({
								X = x,
								Y = y,
								W = 1,
								H = 1,
								IsEmpty = true
							}, _properties, 2);
						}
					}
				}
			}
		}

		this.makeBordersImpassable(_rect);
	}

});

