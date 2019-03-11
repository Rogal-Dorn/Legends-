
this.camp_repair_dialog_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {},
	function create()
	{
		this.m.ID = "CampRepairDialogModule";
		this.ui_module.create();
	}
	
	function onLeaveButtonPressed()
	{
		this.m.Parent.onModuleClosed();
	}

});
