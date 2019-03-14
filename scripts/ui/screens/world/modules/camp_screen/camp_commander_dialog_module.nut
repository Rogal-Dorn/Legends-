
this.camp_commander_dialog_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {},
	function create()
	{
		this.m.ID = "CampCommanderDialogModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.ui_module.destroy();
	}

	function queryLoad()
	{
		local result = {
			brothers = this.queryRosterInformation(),
			buildings = this.onQueryBuildingsList(),
			assets = this.m.Parent.queryAssetsInformation()
		};
		return result;
	}

	function queryRosterInformation()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local roster = [];

		foreach( b in brothers )
		{
			local background = b.getBackground();
			local e = {
				ID = b.getID(),
				Name = b.getName(),
				ImagePath = b.getImagePath(),
				ImageOffsetX = b.getImageOffsetX(),
				ImageOffsetY = b.getImageOffsetY(),
				BackgroundImagePath = background.getIconColored(),
				BackgroundText = background.getDescription(),
				CampAssignment = b.getCampAssignment()
			};
			roster.push(e);
		}

		return roster
	}

	function onQueryBrothersList()
	{
		local roster = this.World.Assets.getFormation();

		for( local i = 0; i != roster.len(); i = ++i )
		{
			if (roster[i] != null)
			{
				roster[i] = this.UIDataHelper.convertEntityToUIData(roster[i], null);
			}
		}

		return roster;
	}

	function onQueryBuildingsList()
	{
		local buildings = this.World.Camp.getBuildings();
		local result = [];
		foreach (b in buildings)
		{
			if (b == null)
			{
				continue;
			}

			if (!b.inCommanderTent())
			{
				continue;
			}
			result.push(this.UIDataHelper.convertCampBuildingToUIData(b));
		}
		return result;
	}

	function onLeaveButtonPressed()
	{
		this.m.Parent.onModuleClosed();
	}

});
