
this.camp_workshop_dialog_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {},
	function create()
	{
		this.m.ID = "CampWorkshopDialogModule";
		this.ui_module.create();
	}
	
	function onLeaveButtonPressed()
	{
		this.m.Parent.onModuleClosed();
	}

});
