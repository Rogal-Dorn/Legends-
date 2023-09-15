// MSU Tooltips Features
// Documentation available at https://github.com/MSUTeam/MSU/wiki/Tooltips
// Setup custom tooltips to bind to UI elements

::Const.LegendMod.addTooltips <- function()
{

	::Legends.Mod.Tooltips.setTooltips({

		// Camping - Commander's Tent
		CampingPresets = {
			ButtonSavePreset = ::MSU.Class.BasicTooltip("Save Preset","Save the current camping assignments to the currently selected numbered preset slot"),
			ButtonLoadPreset = ::MSU.Class.BasicTooltip("Load Preset","Load the camping assignments from the currently selected numbered preset slot"),
			ButtonPresetName = ::MSU.Class.BasicTooltip("Customize Preset Name","Give a custom name to the currently selected numbered preset slot"),
			ButtonPresetSlot = ::MSU.Class.BasicTooltip(
				function(_data)
				{
					return "Preset Slot " + (_data.index + 1);
				},
				function(_data)
				{
					local name = ::World.Camp.getPresetName(_data.index);
					if (name)
					{
						return name;
					}
					else
					{
						return "";
					}
				}
			),
			PresetNameDialog = {
				ButtonDelete = ::MSU.Class.BasicTooltip("Delete Preset Name","Delete the current preset slot's custom name and close this pop-up"),
				ButtonCancel = ::MSU.Class.BasicTooltip("Cancel Changes","Discard any changes and close this pop-up"),
				ButtonOk = ::MSU.Class.BasicTooltip("Save Preset Name","Save the input name as the current preset slot's custom name and close this pop-up"),
			},
		}

		Camping = {
			ButtonAssignAll = ::MSU.Class.BasicTooltip("Assign All","Assign all mercenaries to the current tent"),
			ButtonConfigure = ::MSU.Class.BasicTooltip("Configure","Special configurations for the current tent"),
		}

		Placeholder = ::MSU.Class.BasicTooltip("Placeholder","Under development"),
		
	});
}